Return-Path: <linuxppc-dev+bounces-3041-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F469C19A4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 10:58:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlDsb0VSTz3brt;
	Fri,  8 Nov 2024 20:58:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731059907;
	cv=none; b=NJbCpbR5HBRg7lAOW5mAsiGFT2jBc5Gn5lNJRmiWFonujKuMbaXEFKTOUg+leScVOkOPEHltz023exO+nZRhhGorR+EFyatGk/gGJwbpjTGnLrkC6BQp/1jhM5fUg0YQhjez4erNYiNT0SQ07RWXdTu0dI+Z3L2kmQ8FEm6G0E2uahGBvksso1Y6ax8i3PuikOINPaeXeLCckxuAGRGdVGTkZQuj1VO1tboe2AxG+Xvrli5j52Hu0KIY6kQKE6fanrwiiOS3sCKsXMU3ggOrC8ZMAyxTPb5rn6IxZSvjMyMIrim73jtd19BsUPn0acZvjlGaMq7RJZ67Y2sqjAdJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731059907; c=relaxed/relaxed;
	bh=5H92Szh7zfoJ1X3k0f3O/M8Kef9HnGfDZM9F62PdTF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBREFPKfSTdMXPLi+1Np3fcUuY+wJsHm3rte0uKQ0Y50H3qo5KhCLDO4VTuHZf2RGwKoX+SrHSz40N3gSsPdwGe4XqDqwxX/ZXLyIWmJ2SkHeNhe7uz15QUMFxFPxVhiwDwgAFzGDvgco1VWKQMHK85k07h3WHIm4qljmWX2ChXMIW4C23IyJl1wXchrqC+xJNFSeVbzuN25AvW7TGvOpNklMtry42Mj/I85EizOKDDKilAjMVZafhOjwlGYwza/g/jmT3aeUkl2l/7R8BBA8ceG9q6Fl5aGZUXTMXxegGBkBMx7bKtqA2SqPLKqhybu8dp1fUaXuiC/qL8+8gwoYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Dq0vJnRc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=srinivas.kandagatla@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Dq0vJnRc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=srinivas.kandagatla@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlDsZ02Mjz2xtp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 20:58:25 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso1921997e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2024 01:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731059901; x=1731664701; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5H92Szh7zfoJ1X3k0f3O/M8Kef9HnGfDZM9F62PdTF8=;
        b=Dq0vJnRcdU8Sk4AsRA2+aY+yFd63QDm5aI2c/+/boe/Gl+7PeDwyQ0NexHW0fCEM4O
         N4u2Q1OE+k/y+5IiG68Gd+i73/WtI0rUdRNppdSKJZi52ZiskBruvePDZSlSGhPKcDv6
         XkI6YJH1UYQH1+reL+PWzWiz6qXgrW38i9oU+vtl9M0dW8YCW6aNXHO319XFuWfVbi7U
         I3Uzy2NfPqPCUUZl6JLB6GFN/YbNW6+IsnAOGmfZAOnNv5+Ue1KwFkXtz9wefovujv/M
         iJ/wgWR0XLKS7o1pGxt4XLBUmX/Eb0ZAtwPUiPt8PfT5iSsovGqCVRvMG+euY8zrxEcI
         V8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731059901; x=1731664701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5H92Szh7zfoJ1X3k0f3O/M8Kef9HnGfDZM9F62PdTF8=;
        b=Gh1ds/up0XC4NshgQLfnfVkTvpS6zNr3BF07y/N2V6RPcAXgA3dCUieFijXMoAcRDU
         opoRuSLG35X5/t9Ia5kz+XKdo0oeypcyLAH6xewBgHnujZTt5KfNzGkv5vC8oE2f02Xh
         esSBQk/QKUg+TIFZlQpbCl2s2PK+E3OwTGYjehccvRH4V+k0Wvd8aTQjZ/ve5UL8YN2v
         jGwNMdTTHJSYQScguLE4de3YuhkxmWGn5lqi8wMZf13IHSv7BPJ9U4Bgzz9tOVqbpPoj
         HQ0vDFQkJlI7fjeLwurTsVBFCVnE3Kak7OQFMIJw8V+osGY4FvJURDmWGMRhHcG+JwAQ
         fEeg==
X-Forwarded-Encrypted: i=1; AJvYcCVmwhFs4nt3c8yKzvxkDLMzOs3ZMHVft3hgswac3bhQ1kB0hhM3X1Xw6kcWa/CVoqF4SWVx9d2Sa0bD5TA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwtMpWVt7YPQmyLG99lhJIF3Q8tJ6vGZ2mASPgtjaS6MUZwiHrx
	BQf+lCZD4jHQ5f9GNJTsYiUCbAlBCNdTw0nKRl+Ac5ymZGj5C/1EogGw62ytYPc=
X-Google-Smtp-Source: AGHT+IFRdqMG06HtkdzkHICdIIWrY7d6GXyCPZ8Qa2uAHGCAECQ9+blFxeuQwDqlNWgVG3erwh8s3g==
X-Received: by 2002:a05:6512:2256:b0:539:905c:15ab with SMTP id 2adb3069b0e04-53d862e3e86mr1089619e87.32.1731059901467;
        Fri, 08 Nov 2024 01:58:21 -0800 (PST)
Received: from [172.20.143.194] ([154.14.63.34])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432b05e6042sm57204805e9.44.2024.11.08.01.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 01:58:21 -0800 (PST)
Message-ID: <fe2f0356-ef90-4fc4-85c1-6a42da209b88@linaro.org>
Date: Fri, 8 Nov 2024 09:58:16 +0000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/10] nvmem: core: calculate bin_attribute size
 through bin_size()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Logan Gunthorpe <logang@deltatee.com>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-4-71110628844c@weissschuh.net>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-4-71110628844c@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 03/11/2024 17:03, Thomas Weißschuh wrote:
> Stop abusing the is_bin_visible() callback to calculate the attribute
> size. Instead use the new, dedicated bin_size() one.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
Thanks for the patch,

LGTM.

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

>   drivers/nvmem/core.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 33ffa2aa4c1152398ec66b8dd7b30384c5346a6e..63370c76394ee9b8d514da074779617cef67c311 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -303,11 +303,19 @@ static umode_t nvmem_bin_attr_is_visible(struct kobject *kobj,
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct nvmem_device *nvmem = to_nvmem_device(dev);
>   
> -	attr->size = nvmem->size;
> -
>   	return nvmem_bin_attr_get_umode(nvmem);
>   }
>   
> +static size_t nvmem_bin_attr_size(struct kobject *kobj,
> +				  const struct bin_attribute *attr,
> +				  int i)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct nvmem_device *nvmem = to_nvmem_device(dev);
> +
> +	return nvmem->size;
> +}
> +
>   static umode_t nvmem_attr_is_visible(struct kobject *kobj,
>   				     struct attribute *attr, int i)
>   {
> @@ -383,6 +391,7 @@ static const struct attribute_group nvmem_bin_group = {
>   	.bin_attrs	= nvmem_bin_attributes,
>   	.attrs		= nvmem_attrs,
>   	.is_bin_visible = nvmem_bin_attr_is_visible,
> +	.bin_size	= nvmem_bin_attr_size,
>   	.is_visible	= nvmem_attr_is_visible,
>   };
>   
> 

