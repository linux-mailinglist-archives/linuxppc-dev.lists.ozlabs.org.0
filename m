Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 277C576D06B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 16:46:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Cs9hCSs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGFCd6tWnz3bTC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 00:46:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGFBg3GkMz2xVP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 00:45:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=BO8Ij+6E7OiVZbyL3pQYd1kEkHL5/xtBrMMcnoXeckM=; b=0Cs9hCSs06dj+eUXJC/+Clv05T
	jn0e/O9hJ8BExdiiA2TvU/dUBzCN8Vx4cEOWtmZoX+h5v/pjCKKzFIJjXC0yo4ueXteW2xOmrbQvk
	kPNdjvLJx3OEXejAxnSUcid3sIjhN5pnudjcuDZ5Y8Fq0DkDUYbqni3XR2zKS4XWj32bkhAFnwBER
	8EZshTE84YW1rwYDXDiAb4QaswyuLI4YKgVDSaZjWZhsyyadFDrCmziiqaCqxgbTPtdVUDcHX/Y7P
	TKMX/BROcnle/BOgSQ8uOoiRJ/wqEHXJU3Wd8tMn1mwayAUBoEsUvvdOxpc+81ARDfHzFXBFgfvgZ
	Qrqn3Qng==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qRD5w-00571R-0j;
	Wed, 02 Aug 2023 14:45:00 +0000
Message-ID: <182b08ea-04f3-3282-e3c3-9448bab6568a@infradead.org>
Date: Wed, 2 Aug 2023 07:44:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] powerpc: Use shared font data
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Dr. David Alan Gilbert" <linux@treblig.org>
References: <20230725000141.165985-1-linux@treblig.org>
 <878rb0em3s.fsf@mail.lhotse> <ZMOaz9EqqeaPGokA@gallifrey>
 <871qgl1vs2.fsf@mail.lhotse>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <871qgl1vs2.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
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
Cc: sam@ravnborg.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/2/23 05:19, Michael Ellerman wrote:
> "Dr. David Alan Gilbert" <linux@treblig.org> writes:
>> * Michael Ellerman (mpe@ellerman.id.au) wrote:
>>> linux@treblig.org writes:
>>>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>>>>
>>>> PowerPC has a 'btext' font used for the console which is almost identical
>>>> to the shared font_sun8x16, so use it rather than duplicating the data.
>>>>
>>>> They were actually identical until about a decade ago when
>>>>    commit bcfbeecea11c ("drivers: console: font_: Change a glyph from
>>>>                         "broken bar" to "vertical line"")
>>>>
>>>> which changed the | in the shared font to be a solid
>>>> bar rather than a broken bar.  That's the only difference.
>>>>
>>>> This was originally spotted by PMD which noticed that sparc does
>>>
>>> PMD means "Page Middle Directory" to most Linux folks, I assume that's
>>> not what you meant :)
>>
>> Ah, any good TLA is ripe for reuse:
>>    https://pmd.github.io/pmd/pmd_userdocs_cpd.html
> 
> Thanks.
> 
> Unfortunately this patch causes a warning:
> 
>   WARNING: unmet direct dependencies detected for FONT_SUN8x16
>     Depends on [n]: FONT_SUPPORT [=y] && FRAMEBUFFER_CONSOLE [=y] && (!SPARC && FONTS [=n] || SPARC)
>     Selected by [y]:
>     - BOOTX_TEXT [=y] && PPC_BOOK3S [=y]
> 
> And breaks allmodconfig with:
> 
>   ld: arch/powerpc/kernel/btext.o:(.toc+0x0): undefined reference to `font_sun_8x16'
>   make[3]: *** [../scripts/Makefile.vmlinux:36: vmlinux] Error 1
> 
> I guess the Kconfig logic needs some more work.

Also please see:
  https://lore.kernel.org/all/dd29e5f5-d9f7-0103-e602-b98f26c88fb1@infradead.org/
for a similar problem on UML.

-- 
~Randy
