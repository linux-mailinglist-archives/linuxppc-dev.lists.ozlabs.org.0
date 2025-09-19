Return-Path: <linuxppc-dev+bounces-12422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93265B8A0A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 16:42:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSwFV3f4Zz3cc0;
	Sat, 20 Sep 2025 00:42:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758292926;
	cv=none; b=dk1sJLn74RpdHKiTEIlNFiimNW2w3M3ElCb89vjrp+LWfGinJh1rck/xvFImdgZ68wmhNEAUSFTNOQK4WJZqQfksU6QL6AK1jEOWgHDCNEaOKjTkQFBttlGAyzIrpI7w91hKObTcn6RplEK49JcVJooPEfOLO3MoqAZi1SPYHc+Ra2QvEtWdJOUvBPwFR2wyMJsCVamoutQN3/WqQIdf0XTJJWNK0Bwyw+guFMJilqfY5hji0DqBy097ayYzhawHFJSiYbJLV7sIcLkAobvIC5ypMGoVhHsUSygzWG0GnW6UFpvhGNBxzSCwsfhUFsm6LgBEfiu6IYy0GmGnDaTKPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758292926; c=relaxed/relaxed;
	bh=G8ldK24AiwNDLcBYNMI6Cuki6eZBDjdQT8mYCvvECmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=B7Onnx3h5flnvKwhufTV3jdw/WhQwJXjen1/mIAr2JNBE+CfbwUfT2kyRmJu2FwDsLSeg46dYXhTFDHAYdHRU0cDKkfkzaUBkPm0DyxgI330OgPZ+GUNnxuuBdZLJWK8aWpmKWWyPNVsTfv56z67wwXW9W2q3De1cqGdb7m6xXsd7hbA+UEfodqwJ5EH/9lSL9TTtwgiCAQgDTgAxbMWEAjC+UlPgNhjIsNHawOr5wp4MjIfwVprE1cJkxAe6Dygqda16mqrT8oNO1BDA3D1M7oO/kqzRSXxWarx3ElvQiysOvYQKMWnrcQCGdK330/vLDeLJB6xwlVJFYiB0LhyOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=BQ+X0tm2; dkim-atps=neutral; spf=pass (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=prvs=350b08d43=nicolas.ferre@microchip.com; receiver=lists.ozlabs.org) smtp.mailfrom=microchip.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=BQ+X0tm2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=prvs=350b08d43=nicolas.ferre@microchip.com; receiver=lists.ozlabs.org)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSwFT2jStz3cZ9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 00:42:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758292925; x=1789828925;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BUXNR1hckyrk8jBBQv+MEaTsb/Yxf7QPZcopTVXtsc0=;
  b=BQ+X0tm2RDCFZ+VlXf26kMLU7G5wVBPlNOrZHR3CG98+t8wY9+7jL14F
   1zDFmaho8rBXaXvmR2c0US5vjXicTLmmS7YE1Ui+Iow7ug9d2QyTX9MlQ
   xSRU+Mxk9EAzuy1iDShLbGJJJmrdejlWox9kIzYLSCIJVupe/EhUWX+Tg
   tqCE41YTR4x2I6YqsvbrLb3nzB1E2Zid85ic9DlFkVUT6RG1aBdl33Kel
   rcFdZKIz64ScEPdgRjkwzzS1P3LmgdayjkFg18WWMEaes/f2OGv8DQ9Hk
   9rgsGfFHWR9Lb7Y46tH6e2SL1lmKpXvA9PyHKWaswxodKWAZQRwu4VUSF
   A==;
X-CSE-ConnectionGUID: rCtXrXuCRuWl+rA3xsHEKA==
X-CSE-MsgGUID: EJ/u+s4TQLuYDQ4Fe3Jepw==
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="52617186"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Sep 2025 07:42:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 19 Sep 2025 07:41:32 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 19 Sep 2025 07:41:27 -0700
Message-ID: <cc027fae-8d34-41ca-bd35-569c415fc657@microchip.com>
Date: Fri, 19 Sep 2025 16:41:26 +0200
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
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
CC: Jason Gunthorpe <jgg@nvidia.com>, <ksummit@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mips@vger.kernel.org>,
	<linux-mm@kvack.org>, <imx@lists.linux.dev>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, Lucas
 Stach <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora
	<ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, Mike
 Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira
 Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Alexander Sverdlin
	<alexander.sverdlin@gmail.com>, "Chester A. Unal"
	<chester.a.unal@arinc9.com>, Sergio Paracuellos
	<sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Geert,

On 19/09/2025 at 09:17, Geert Uytterhoeven wrote:
> Hi Arnd,
> 
> On Thu, 18 Sept 2025 at 15:13, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Wed, Sep 17, 2025, at 14:59, Jason Gunthorpe wrote:
>>> On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
>>>
>>>> I'm still collecting information about which of the remaining highmem
>>>> users plan to keep updating their kernels and for what reason.
>>>
>>> On this topic of removing some parts of highmem, can we say goodbye to
>>> kmap_high_get()? Only ARM uses it and only for
>>> !cache_is_vipt_nonaliasing() systems.
>>
>> Good idea. I think we are almost there, just need to verify that
>> there is actually no impact for existing users. I already knew
>> that there is very little highmem usage on ARMv6 and earlier, but
>> I tried to recheck all platforms that might be affected:
> 
>> * Microchip SAM9x7 is the newest ARMv5 chip, clearly does
>>    get kernel updates, and the only one I can think of with
>>    DDR3 support, but seems to be limited to 256MB total memory.
> 
> Are they limited to DDR3?

For sam9x75:
- DDR2
- DDR3  (DLL Off/On mode)
- DDR3L (DLL Off/On mode)

For (older) sam9x60:
- LPDDR1
- DDR2
- SDRAM & Mobile SDRAM
> IIRC, someone (you? ;-) told me at ELCE that Microchip keeps on spinning
> new variants of old SoCs, to accommodate the changing DDR landscape
> and market.  So perhaps they also accept larger RAM sizes?
No, in fact we address 256 M Bytes max on sam9x60 and sam9x75 as well.

Regards,
   Nicolas

