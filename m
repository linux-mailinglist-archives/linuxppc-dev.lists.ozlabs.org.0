Return-Path: <linuxppc-dev+bounces-14928-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B80CD422D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Dec 2025 16:31:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZ4wy1RtKz2yFW;
	Mon, 22 Dec 2025 02:30:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766331058;
	cv=none; b=H+YLRB/+qZu8s9/znbQ8OYJQtaKaD2cAMrVH7F0OrvHgPFNlTlM79QpbZ6On4SJaLUnbLwiF4+Q5Tu45PBi3rZ4ZL7whpRnxNIDskPtM4Zr2PX4mNaCxjhgUYTAGEU7qrHRuO2nuNJ1dZAGdL+1XTmAA9qhbWcnZl5FRFUe3ud+SS+g8z3DbwrqpyYr1MIDAhI92xJL3wsADk+oW2H7WO693yPT8tIYF3wwYLnqVdE6gBpYuGAjG9Iz3vu3t8/ZyuOpB295vVsobxSUMkzYa1dU1+aXAB9ObjZyJqJ7WowCc8nhqDqgaZG756abxnLMLbfrq6vLg6LM2bnYFOIs6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766331058; c=relaxed/relaxed;
	bh=jlKsAFeaIV2hMkoHG30hkHGQj8Sy9Pccwd7CmoKW274=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=EONQJ0S5N3vrMGFQ6NqthpZTXHLtUSzDwpcUScJnTKtjLq3eND8bYogoQ2SPR1y+NSG4jy5CaVp0Eakfidcr+OdZHCUEfbUtXQMDBe12yvJR8lSbXy80acoxgctAAFGoZYRBK0rb89sOTCsuPiElNqLx7TC8mU+aqfTx3P4o7gMhtGB4vmuuMIO4ZtNmSTSQFtPwjyI8ykPk6C6LFrB934SRX92sGu+3bOPqbeYDNahPIdTXFTiznSUiBsksVi0+2NLCne/XgwjaUZJmhTpW70ak7GpQpgjSWYPhQpYyHbcY5MzNY4au1VEVqSGJd5DfToxUGEKkdgXrXB0RVa8PwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com; dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2025112201 header.b=d4LBr66A; dkim-atps=neutral; spf=pass (client-ip=198.137.202.136; helo=terminus.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org) smtp.mailfrom=zytor.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2025112201 header.b=d4LBr66A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=198.137.202.136; helo=terminus.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Mon, 22 Dec 2025 02:30:56 AEDT
Received: from terminus.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZ4ww0z4rz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Dec 2025 02:30:55 +1100 (AEDT)
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5BLFQAQb2906325
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 21 Dec 2025 07:26:11 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5BLFQAQb2906325
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025112201; t=1766330779;
	bh=jlKsAFeaIV2hMkoHG30hkHGQj8Sy9Pccwd7CmoKW274=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=d4LBr66A/lMYsQQUrfpraHzgjeSyK6794g+KDFvXyLiRZzLUKCZVKw68GdUqnufZZ
	 +NAvFJ1Tc1JY5HEDmF0egLxtTnk8IAec4qisamrjj52wF9Zyd4QozYprO+iiGUZQJU
	 c2fm+Em7HTcQi1P/wvEzvyQwP9GZuEEsuyscS4GLVm8IDRc8zdqM36lHHl3R5uLzaZ
	 l6bZyDuDsP+7ONg1mrdK0BrGIdBfrsgOE07sYDDOHVvHchBTA+qa7DJxFrF2DMYbxm
	 Nho6yO0DvkfLBbFDJfdtimxRjHn09lg7IcBD3DPpHB3/L17Ujb74vSiGQta0IdSzu5
	 LQhxq3/8OdW4Q==
Date: Sun, 21 Dec 2025 07:26:10 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
        Dave Hansen <dave.hansen@intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
CC: Andrew Morton <akpm@linux-foundation.org>,
        Andreas Larsson <andreas@gaisler.com>,
        Christophe Leroy <chleroy@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthew Wilcox <willy@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Michal Simek <monstr@monstr.eu>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Nishanth Menon <nm@ti.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 1/4] arch/*: increase lowmem size to avoid highmem use
User-Agent: K-9 Mail for Android
In-Reply-To: <4aecb94f-e283-4720-96e5-1837352c3329@kernel.org>
References: <20251219161559.556737-1-arnd@kernel.org> <20251219161559.556737-2-arnd@kernel.org> <a3f22579-13ee-4479-a5fd-81c29145c3f3@intel.com> <bad18ad8-93e8-4150-a85e-a2852e243363@app.fastmail.com> <a2ce2849-e572-404c-9713-9283a43c09fe@intel.com> <4aecb94f-e283-4720-96e5-1837352c3329@kernel.org>
Message-ID: <D1726374-3075-47CF-B2FF-FBAC11BC962C@zytor.com>
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
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On December 21, 2025 1:30:15 AM PST, "David Hildenbrand (Red Hat)" <david@k=
ernel=2Eorg> wrote:
>On 12/19/25 21:52, Dave Hansen wrote:
>> On 12/19/25 12:20, Arnd Bergmann wrote:
>>>> For simplicity, I think this can just be:
>>>>=20
>>>> -	default VMSPLIT_3G
>>>> +	default VMSPLIT_2G
>>>>=20
>>>> I doubt the 2G vs=2E 2G_OPT matters in very many cases=2E If it does,=
 folks
>>>> can just set it in their config manually=2E
>>>>=20
>>>> But, in the end, I don't this this matters all that much=2E If you th=
ink
>>>> having x86 be consistent with ARM, for example, is more important and
>>>> ARM really wants this complexity, I can live with it=2E
>>> Yes, I think we do want the default of VMSPLIT_3G_OPT for
>>> configs that have neither highmem nor lpae, otherwise the most
>>> common embedded configs go from 3072 MiB to 1792 MiB of virtual
>>> addressing, and that is much more likely to cause regressions
>>> than the 2816 MiB default=2E
>>>=20
>>> It would be nice to not need the VMSPLIT_2G default for PAE/LPAE,
>>> but that seems like a larger change=2E
>>=20
>> The only thing we'd "regress" would be someone who is repeatedly
>> starting from scratch with a defconfig and expecting defconfig to be th=
e
>> same all the time=2E I honestly think that's highly unlikely=2E
>>=20
>> If folks are upgrading and _actually_ exposed to regressions, they've
>> got an existing config and won't be hit by these defaults at *all*=2E T=
hey
>> won't actually regress=2E
>>=20
>> In other words, I think we can be a lot more aggressive about defaults
>> than with the feature set we support=2E I'd much rather add complexity =
in
>> here for solving a real problem, like if we have armies of 32-bit x86
>> users constantly starting new projects from scratch and using defconfig=
s=2E
>>=20
>> I'd _really_ like to keep the defaults as simple as possible=2E
>
>I agree with that=2E In particular in areas where there is the chance tha=
t we could count the number of people that actually care about that with on=
e hand (in binary ;) )=2E
>

So, maximum 31? ;)

