Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEF92A0217
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 11:06:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMyct0rWtzDqq8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 21:06:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=srinivas.kandagatla@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=B9rJTdT0; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMyZx5NvqzDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 21:04:21 +1100 (AEDT)
Received: by mail-wr1-x442.google.com with SMTP id x7so5797758wrl.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gQH8tfnS5gABqR+rI2vYNKDqWdjjH0cmP3e9KTBgftU=;
 b=B9rJTdT06fBjkoaC4E33GsRL6XklEaCtgE6RSNGKr1R6NIN6tshFsvlrm73+qDotTs
 TgtMR2VLSrECST5bfnSTgKL7Wgi9dLvx0b+wOp98ZwTdU4Ui8lhbwxRwAvAFaXlLlBUv
 kIF79xh7rAnLeAmFUb7OH8iS2qmajJB6f90j1t67g5Zqi8ZvFcvZqslE0Nw79PSToAvD
 N9OdQRnS+ec6wQ18zcvo4xYOB+MrwDVlSeHj5ODLObBC4OqIgDsKYG4VpZ7Zwf1s+0XG
 E8uv8pTzD1YjF2GLDWWylcwx+GDZ++SmMtTJoKDLvlekOLEjOvRKbLbn1NSmNnF0g7r5
 ocZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gQH8tfnS5gABqR+rI2vYNKDqWdjjH0cmP3e9KTBgftU=;
 b=tFXmKU0kQJBZkMMwgogGaRZoyZ/0NiQzcaOjt9M4t8g88RkHJyxcso+Ndzy9M2fJl/
 q9hL0B2fvpuLcKnCatJdbzV+gtKXuxw8v+TsN+g1WT2FX8hQorQKpaxjUq/sAmtQQqPC
 t6+h5xVaCFOAT96zT2sf0CKFPPMs+Wy4Q6fhI1M2Hz1E+n+qppcpAtoWM5T5a7ASHG+U
 tGqPqLeKfPLwQ38Vs6BYK9XikZxw80Q7EOeYapHpBX9aU6SFNNt6/tFlWJslIEZFX871
 PiPZ2D5+tigfSRA7SEDk8hzFuRZM17Q7zHpaoAgTsJYz3A90AZfAiZVfmQc6ntBUaKA0
 j4wA==
X-Gm-Message-State: AOAM532uh/64n4885pAqCr4spvjBkHAcRW3So/sikZfg36pceEah72f8
 08CfnajH59UfpU6Q75pzOf8R/Q==
X-Google-Smtp-Source: ABdhPJyiqwsuWF8oCOJ2p5mgrL1UOBEF3qjVNKqZ9hb80Q/uxO4LXY5WvIi3i2M6psl12Cn+2MTVIQ==
X-Received: by 2002:a5d:40c3:: with SMTP id b3mr2187416wrq.157.1604052256376; 
 Fri, 30 Oct 2020 03:04:16 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id h8sm7699531wro.14.2020.10.30.03.04.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Oct 2020 03:04:15 -0700 (PDT)
Subject: Re: [PATCH v2 19/39] docs: ABI: stable: make files ReST compatible
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <467a0dfbcdf00db710a629d3fe4a2563750339d8.1604042072.git.mchehab+huawei@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bc393307-d7dc-1666-f25c-6d756ebf5993@linaro.org>
Date: Fri, 30 Oct 2020 10:04:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <467a0dfbcdf00db710a629d3fe4a2563750339d8.1604042072.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Tom Rix <trix@redhat.com>, Jerry Snitselaar <jsnitsel@redhat.com>,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 Oded Gabbay <oded.gabbay@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 30/10/2020 07:40, Mauro Carvalho Chehab wrote:
> Several entries at the stable ABI files won't parse if we pass
> them directly to the ReST output.
> 
> Adjust them, in order to allow adding their contents as-is at
> the stable ABI book.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   Documentation/ABI/stable/firewire-cdev        |  4 +
>   Documentation/ABI/stable/sysfs-acpi-pmprofile | 22 +++--
>   Documentation/ABI/stable/sysfs-bus-firewire   |  3 +
>   Documentation/ABI/stable/sysfs-bus-nvmem      | 19 ++--

for nvmem parts:

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

>   Documentation/ABI/stable/sysfs-bus-usb        |  6 +-
>   .../ABI/stable/sysfs-class-backlight          |  1 +
>   .../ABI/stable/sysfs-class-infiniband         | 93 +++++++++++++------
>   Documentation/ABI/stable/sysfs-class-rfkill   | 13 ++-
>   Documentation/ABI/stable/sysfs-class-tpm      | 90 +++++++++---------
>   Documentation/ABI/stable/sysfs-devices        |  5 +-
>   Documentation/ABI/stable/sysfs-driver-ib_srp  |  1 +
>   .../ABI/stable/sysfs-firmware-efi-vars        |  4 +
>   .../ABI/stable/sysfs-firmware-opal-dump       |  5 +
>   .../ABI/stable/sysfs-firmware-opal-elog       |  2 +
>   Documentation/ABI/stable/sysfs-hypervisor-xen |  3 +
>   Documentation/ABI/stable/vdso                 |  5 +-
>   16 files changed, 176 insertions(+), 100 deletions(-)
> 
