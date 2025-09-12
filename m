Return-Path: <linuxppc-dev+bounces-12096-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61582B55508
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 18:50:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNgRM3hDDz3dLT;
	Sat, 13 Sep 2025 02:50:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757695855;
	cv=none; b=Jw+kwniLnrO65lIrrUMnwzDpsoC0qPwDAPzxw91GKkk5b0pydzviOmM2qFsqLWXXfNS/0yk7ZKulgEjUop+J6PJUevmKDhD7IZZr1/hlHyiw4DcupzT/6Otoyesj9mD57/v0EBoCJBkRk45W+qehseOKqrivnP+2eb8svXBt48K7g3rqEAkzqULqaX7ZhHBfsZls/XEYnfdL6nM2IJ8/tZp1DKZbQRQ5x3WavIHx7+vaGXxlStPSL5X5UBeZxxUInwylCcimS6mfOrBvAflaT7us/7HmW/XqN2OAppX/cw5xJt/ZFxbU+jDsg8xKw945BoLcyNYulcgKY/iqm2h1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757695855; c=relaxed/relaxed;
	bh=cnmFDlEOsmIEfqMrpAweTNFX9QftyJSBrntOrKfce2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b9Kx3r5oNgmFak5JJceRgV7Umsv0FHkv6vv6oZKS3VYpKSdYYeZcNSPo12RHvnXUidRBaeJSzvsgIfaEnyy89ME4OLIfVSdXvcAPq/dSOCSqE71d3vVMiLBWRHvxfa02WnzNYoeFDOSUpIcdy8gas6taby8XsqNWx8rKYEXXRsQrf4EmF/9R/gFnmlg76m14MlYjNYXzXnzbgqkCzgenSH27zw8XwqLtbo5sqj4xJJAm4kMR+4uhZgsL/5bIWidmLfEro26n+0+yy5qfZBRkAxSPY9mXcMtQNA2lX35HNCh6LrcKEcfa0y0cZ1QjbyLSFiIGKVLL5EmtOr1km4Uwdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=zRduiRNU; dkim-atps=neutral; spf=pass (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=prvs=3431635e0=nicolas.ferre@microchip.com; receiver=lists.ozlabs.org) smtp.mailfrom=microchip.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=zRduiRNU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=prvs=3431635e0=nicolas.ferre@microchip.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Sat, 13 Sep 2025 02:50:50 AEST
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNgRG4tPTz3dBV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 02:50:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757695851; x=1789231851;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=u1apkPsXybe68Jt3zrIWLyQZ7H3ZjR0gWhhluRQrN3k=;
  b=zRduiRNUjLjbKjgI+TUj6mhi2eigswbqXq5v6tKwvIJ34nCzdnlKMxDZ
   HH26F2RKMWKiHyrTdjAdXUZ+E32JJHEWidTt9cGl0I1zdBDsm9BrKkPxt
   L8L+HcvcARlcVT87VNJ9GGDtUrfHj+oCLGJ2xeNri8PKBlySr6Li9iWJ/
   7I5AGxOcwgxXaqdeIaNvI/iMnAFfgUxzwBRYLzpaqGKF3u2hoyC0r7cWW
   UU/zLtpHFKaRbX3bB/AFLZcN4KpHV1yflb1JdrZpmFT84j43pI2CoVuAi
   jxs8VvbfIe6KZcwi1clqHgPlYmPU8vZx0gY/5Jz4IgpBpIdyMzFUlcrxk
   A==;
X-CSE-ConnectionGUID: s3gPgfU6QPiurXqxeBySFg==
X-CSE-MsgGUID: 0XiE5fKtQqWtnhAnsP3idA==
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="46433595"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2025 09:49:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 12 Sep 2025 09:49:38 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Sep 2025 09:49:32 -0700
Message-ID: <f931da29-5f10-494a-acc0-309bd805d41a@microchip.com>
Date: Fri, 12 Sep 2025 18:49:31 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>, <ksummit@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mips@vger.kernel.org>,
	<linux-mm@kvack.org>, <imx@lists.linux.dev>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, "Lucas
 Stach" <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora
	<ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, "Mike
 Rapoport" <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
	"Ira Weiny" <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Alexander Sverdlin
	<alexander.sverdlin@gmail.com>, "Chester A. Unal"
	<chester.a.unal@arinc9.com>, Sergio Paracuellos
	<sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>, "Mihai
 Sain" <Mihai.Sain@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Arnd,

On 09/09/2025 at 23:23, Arnd Bergmann wrote:
> I'm still collecting information about which of the remaining highmem
> users plan to keep updating their kernels and for what reason.

We have 1GB of memory on our latest Cortex-A7 SAMA7D65 evaluation boards 
[1] (full production announced beg. 2025). The wide range of DDR types 
supported make some of these types interesting to use at such density.
Both our Cortex-A7 SoCs don't have IOMMU; core and DMAs can address the 
full range of the 32 bit address space, so we're quite 
standard/simplistic in this area. We use CMA with large chunks as our 
camera or display interfaces address "modern-ish" resolutions (~1080p).

We use CONFIG_HIGHMEM and activated it for simplicity, conformance to 
usual user-space workloads and planned to add it to our sama7_defconfig 
[2]. I understand that we might reconsider this "by default" choice and 
move to one of the solutions you highlighted in your message, lwn.net 
article or recent talk at ELC-E.

Of course we plan to maintain these boards and keep updating our kernel 
"offer" once a year for those associated SoCs (with maintaining 
upstream, as usual). As you said, being ARMv7, we're quite confident for 
now.

As you mentioned, we've recently released one ARMv5te arm926ejs-based 
soc: the SAM9x75 family. But we don't have the intention to use too big 
memory sizes on them, even if they do address large screens, with LVDS 
and MIPI or modern camera interfaces...

I don't have too much info about our customer's use cases as they are 
very, very diverse, but don't hesitate to reach out to me if you have 
questions about a particular combination of use.
Thanks for your regular update on these topics.

Best regards,
   Nicolas

[1]: for instance: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts#n29

[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/configs/sama7_defconfig

