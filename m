Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFAB6C7AD5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 10:09:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pjbxs0nyyz3fRF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 20:09:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KF7vhgGU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KF7vhgGU;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pjbwy6H4Bz3f8t
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 20:08:48 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id o40-20020a05600c512800b003eddedc47aeso2697318wms.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 02:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679648924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tl24kxujrDRhD/Pw1VxqIQuGTyFCOtjGuHoJAXogeUQ=;
        b=KF7vhgGUy9iSCVz/2JMV95cnXXiwuET9tU7Rc7Ha4nCWlEtjrRR52AkRL3JFzV31N8
         FvBvjTemrQpnvLLevT/7WRHrnq6vQTjJaal/zyxaU9lnhkPgeE4ZxxrwnrSeYP5XXpBc
         4V7jndgKaulVRlh2NX+8aC2vQ132DHHauBUvo9d076iWPZ097+573LyCG57UyqnF/weQ
         Wl0cANOGoKc/C+uNjEJ93bVBXPTZ7IkGYmTVHGwGkHxXXK4MlPEb6KAWoXYRQNmd8+4H
         wQFnUqtZsqyWz/Sra/sxWYXnULQ6q5z/LE5eyV19WnrETSaXYW26jzEB3xzi7XfnA3JF
         5cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679648924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tl24kxujrDRhD/Pw1VxqIQuGTyFCOtjGuHoJAXogeUQ=;
        b=aWiA00diBvBQFyKg8fJC67j3CCQj8eqU19DK/57soCRq8FvrcQmY1QgKAxfRanPIrx
         opQFIBf5twOxcVhRksJn+ILalAo1S3WIh7mLEKirLzim52S31AVdU/fgo129Swa+K5sq
         aiLIF2dCwwmH3u4ohC+uUAqKiWU6b0vaYyBwtZ/BW7VU9ZllGYmHv9nrg51GxN1/OBvQ
         fmDbk9XuNidk0vZ1GydifEscCHFVhyO4wxqhg7uwDwaUUP3VQy888pHe0c67RmfR5bhd
         zJTOKv6nJvB5RDnYMNHYcrjtkYhjG+oNNf/3yuseg6+bnkMxE//HaMvZN18tPdjdVSIJ
         gEdQ==
X-Gm-Message-State: AO0yUKUNHhJEoJ9J/bJcYytlP/BKzUw5cjHMHyZaHD3X/NcriCHQsbDW
	cI83TPLDZoDR6LEL3G7ztXgBiQ==
X-Google-Smtp-Source: AK7set/vvjAUaOTR5nW6O5SRtNoHqTNaeTjKsckBwHxq1C38GOKprexc3eF5NaIoYwtOC0bG/ZduEw==
X-Received: by 2002:a05:600c:c4:b0:3ed:b048:73f4 with SMTP id u4-20020a05600c00c400b003edb04873f4mr1903820wmm.5.1679648924434;
        Fri, 24 Mar 2023 02:08:44 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.149])
        by smtp.gmail.com with ESMTPSA id z5-20020a7bc7c5000000b003ee1b2ab9a0sm4306039wmk.11.2023.03.24.02.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 02:08:43 -0700 (PDT)
Message-ID: <1722e75c-bc06-4a34-5e12-fa3622ed86a3@linaro.org>
Date: Fri, 24 Mar 2023 10:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v7 6/6] PCI: Make use of pci_resource_n()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
 <20230323173610.60442-7-andriy.shevchenko@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230323173610.60442-7-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Gregory Clement <gregory.clement@bootlin.com>, Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Rich Felker <dalias@libc.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Miguel Ojeda <ojeda@kernel.org>, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, "David S. Miller" <davem@davemloft.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/3/23 18:36, Andy Shevchenko wrote:
> Replace open-coded implementations of pci_resource_n() in pci.h.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   include/linux/pci.h | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 70a4684d5f26..9539cf63fe5e 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2006,14 +2006,12 @@ int pci_iobar_pfn(struct pci_dev *pdev, int bar, struct vm_area_struct *vma);
>    * for accessing popular PCI BAR info
>    */
>   #define pci_resource_n(dev, bar)	(&(dev)->resource[(bar)])
> -#define pci_resource_start(dev, bar)	((dev)->resource[(bar)].start)
> -#define pci_resource_end(dev, bar)	((dev)->resource[(bar)].end)
> -#define pci_resource_flags(dev, bar)	((dev)->resource[(bar)].flags)
> -#define pci_resource_len(dev,bar) \
> -	((pci_resource_end((dev), (bar)) == 0) ? 0 :	\
> -							\
> -	 (pci_resource_end((dev), (bar)) -		\
> -	  pci_resource_start((dev), (bar)) + 1))
> +#define pci_resource_start(dev, bar)	(pci_resource_n(dev, bar)->start)
> +#define pci_resource_end(dev, bar)	(pci_resource_n(dev, bar)->end)
> +#define pci_resource_flags(dev, bar)	(pci_resource_n(dev, bar)->flags)
> +#define pci_resource_len(dev,bar)					\
> +	(pci_resource_end((dev), (bar)) ? 				\
> +	 resource_size(pci_resource_n((dev), (bar))) : 0)

Seems (to me) more logical to have this patch as "PCI: Introduce 
pci_resource_n()" ordered before your patch #2 "PCI: Introduce 
pci_dev_for_each_resource()".

Here as #6 or as #2:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
