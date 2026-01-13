Return-Path: <linuxppc-dev+bounces-15620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E0AD17F2A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 11:18:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr4vY25pWz2xWP;
	Tue, 13 Jan 2026 21:18:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768299497;
	cv=none; b=n+ElE2suXelGM2rR3orounKdQQ4mO00IqwTTR8O3GnbGPGSITwpr35kU12u2L4xEWmDhajwnH67lzhSli9ln9sR0XcsgVgNKkszckyikBvQEBvf373nOaDfl5uS8Zt6cf0kpN4RNbzy56rkrI9qQsCwWeeZ2tIuf0iPF1r+MIR7jltByQZvpkpRNVftTOoP8rGJcjMVYdIfg2R4rKhlzVNEbuxMJf+uQuBTypmr6xg9/wO/b0PMh7lxelWkHWyrxpezRzXzKlhw42G+lvTnmim9wi9PaJFUlu/a/s7r17gtkg2+3NuWJesZZFVjr5AUotkSblPwJ77+WGJjNNqr11w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768299497; c=relaxed/relaxed;
	bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KkFoVnwgRP+pZxMVt8+Zs+kbclWnEP7INq4u3X8YlKqNSvAqN2C1PR/EYe6TvvodouiOkzmMLfnRb+4gZjG1808vWh3TXImeApUcPNJ2L2wX7PjpmNKc9dXGdakC9IJKdlpmn5Aq54e7N2GiO5QoUAFH+S3pBu540Cq7bO2rf/JBmVnEFIQsBRyzmNBP3Bxa6l14eRq2KkXWxADUNxGgLrohgDNAVscmCdIW6UTBG/Xw2gNWIiBX8P0yIse4TF0c7Cjrqy/gGsCqh09ut3poIm8zfu1ypQmzsfOdijZg5jJ9qOe2nZb1Jt07mhn09485PeBwf6CQKezH49ilFnxqJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U86/vW8p; dkim-atps=neutral; spf=pass (client-ip=209.85.208.173; helo=mail-lj1-f173.google.com; envelope-from=kaleposti@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U86/vW8p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.173; helo=mail-lj1-f173.google.com; envelope-from=kaleposti@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr4vW3gPnz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 21:18:15 +1100 (AEDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-382f4aa8dd1so57032431fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 02:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768299432; x=1768904232; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=U86/vW8pZEHV61EYZLOPjVR4cWnULT3uOELcuedyX09vsROMpIPgsT/+KtarPkYAIm
         QqNZsnJHrQ+9FJCU9adl8vb2e/t5sIEaEgHHxSFOF/YMCt3KMtfls2oSH5VrR4X8Pc31
         8ae4DxeQ9Luvdx4fxWI789dApBvw0cjpkmSWe3WgAELV69BMVBUmSNPmsQ2WtewD9Z+C
         rLJ6JffFDAIAAecM9QmYfx9OQv0N8LsEQBSjd4yw1jBy1gwygXFl9SKzKTL2hpDj+CrG
         /Tdnx2kHKcpJpiBcQk6kzDtkzSW728nZ2AYH7WJYWkk2dOEfjjKdnJMzVNaLXkfVin75
         kM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768299432; x=1768904232;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=Vg0pzMleviyevQtN4DjJVbycvvNISYw5CBqoz+enXsxBDlBDKPtct0djgnoEZk8ZAt
         /0ERnSvgZQTC7iOYK8OUI8QlGfM0wWeDPrsWeVCTw06b395W336n6WERq88SoyQdMd/h
         0Lfo0NwtD/o15tTXAItPYxkXc17lZ5kDlrQMegQk69MXRiy2tWhG1L6vE6hy/bknZIeD
         53Uq8WDq00UUttaqgwqfLaM8m802dzFQGJ5VsCM2bAYNtP0S5JKXnSkkumYRoHIIvWBs
         t1qGAIvncLrR3gQWiUtol4ENsil64BGrjvK2YkheDE8h9mB4gj82ZAfaSGQH9uzKcjpE
         5WLg==
X-Forwarded-Encrypted: i=1; AJvYcCWoPu93GanrHmFANQRI/ywXKk+aporJvfiGa1XmZy/wCD4Lt73qeZ0kmckOXr12Q3Tske6GfiCvAAfCzX8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywq0nn7Gf2G2Sdsrrb9wtmmY1qcL2XTMOPDPval5k+MSCzlo4cf
	rOpippXXtmPlXcnpNyuoI1h014meIWfc5SdBMLODFkBtI/cUHLPRhqjlO81idA==
X-Gm-Gg: AY/fxX6BMnu9YLrHKstHEk8do9CTCNPqjFERADI0J0qtIF9nASZA5DgK3lLY9Kbu+pU
	0NyblVQQGnxLtHAvNnqb3+RaPRrwRWoF7gjpzr+S/qtwcpPBD09zev+g+zQr5hp7eNFFB9O8Zad
	fB8iUZ1Q7a34B9vGoXSN17DInEKE50P5XunU9OwsQhS4otQYQobgt2WhLnFTLwlTDNSQEybZSx4
	7YOsDydwZ8AiBQBo+hOt0GF5kzeT0B6jDUy1hTB9Qp9cBGu/woqbk9WR/2pc0bz35DDrGXlm9q8
	m2ZVMT657loQJJ46tG+aNdrgd/C8bUplVGAXrS3jY6FxzPSotTW18Nb+5wv6jTS3R2OYUz2qyao
	3NNIx9CWiAIszCC1BtvrptuE6NHPlwChRKlp6IuKThibz9pJ2jF+RfVEekfizu8tP4gYrWk+N2Q
	5zjXysvZCSgVFZb6qw3wAfPj59JiE5+VrWH7or2LhCsj2tuzZzsoO/aT1/mQ==
X-Google-Smtp-Source: AGHT+IEOoK2sWcGzQ5k4NJjsFR/RmdeWAB9vvZrFfNJ0u+S6dsEFK74/fdYnqiqEV2XmHMt6sJ390w==
X-Received: by 2002:a05:6512:138b:b0:598:e851:1db3 with SMTP id 2adb3069b0e04-59b6ef05760mr8236951e87.11.1768293628066;
        Tue, 13 Jan 2026 00:40:28 -0800 (PST)
Received: from [172.20.10.9] (mobile-access-c1d2ca-216.dhcp.inet.fi. [193.210.202.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72f3ae82sm4416299e87.71.2026.01.13.00.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:40:27 -0800 (PST)
Message-ID: <f861a1c6-7ec7-477c-bc42-f9aaf6724bed@gmail.com>
Date: Tue, 13 Jan 2026 10:40:22 +0200
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
Subject: Re: [PATCH v3 00/29] arch, mm: consolidate hugetlb early reservation
From: Kalle Niemi <kaleposti@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Ritesh Harjani <ritesh.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260112142323.495fc43e662e7d276b0fa371@linux-foundation.org>
 <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Content-Language: en-US
In-Reply-To: <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/13/26 08:50, Kalle Niemi wrote:
> On 1/13/26 00:23, Andrew Morton wrote:
>> On Sun, 11 Jan 2026 10:20:34 +0200 Mike Rapoport <rppt@kernel.org> wrote:
>>
>>> v3 changes:
>>> * fix empty_zero_page initialization on arm
>>> * fix ZONE_DMA limit calculation on powerpc
>>> * add Acks
>>
>> updated, thanks.  I'll suppress the ensuing email flood.
>>
>> Kalle, can you please retest sometime, see if the BeagleBone Black boot
>> failure was fixed?
>>
>> Seems we haven't heard back from rmk regarding
>> https://lkml.kernel.org/r/aVrUDeSkqqY9ZCtS@shell.armlinux.org.uk.
> 
> Hello!
> 
> I will test this v3 patch ASAP and reply results here.
> Collective sorry for the delay; I have been busy!
> 
> BR
> Kalle

Hello!

I tried this patch by cloning 
https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=hugetlb-init/v3

Boots succesfully on BeagleBone Black!

BR
Kalle

