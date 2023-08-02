Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FEB76CC7B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 14:20:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T4tXubGe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RG9zY6lKKz3cPR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 22:20:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T4tXubGe;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RG9yl1C7Lz2yh6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 22:19:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1690978783;
	bh=hx293ly0ztTmbWHyDE9+yBFWdbMzXc86QGVk6E13LeQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T4tXubGeRV4uyhwNbNMEMUyP8RuTy9mqvwAZND3SiLeHhlNby08bNIXToLZ2Szv5C
	 YoxtqE5VLcMVvaoTRXZEkacOL3UfXl1Yd7jcOldgq0TKdx1wPGMM5Y9g4cCrVr7faV
	 yQjFI9vHUVlnX0yIoi3udL65YoCgZZWpb9vRdeBfrc0zCrbkvmgmKSUsK/XuGoo8o2
	 QI9HsdF1JIyAPTxyIzM0khvr9CQBtcyv3LSLCqSDhRG+Glbhwxh0vSan8MTrCY/HT1
	 yZcfk+auGp2zTeI4O+aKo0hzu4zH6aj4YVcBvt2YQVq+4UUEybOkfJDAOg85rRvNOB
	 ARVa6QjhLnpNA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RG9yk3ZJlz4xJx;
	Wed,  2 Aug 2023 22:19:42 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: Re: [PATCH] powerpc: Use shared font data
In-Reply-To: <ZMOaz9EqqeaPGokA@gallifrey>
References: <20230725000141.165985-1-linux@treblig.org>
 <878rb0em3s.fsf@mail.lhotse> <ZMOaz9EqqeaPGokA@gallifrey>
Date: Wed, 02 Aug 2023 22:19:41 +1000
Message-ID: <871qgl1vs2.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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

"Dr. David Alan Gilbert" <linux@treblig.org> writes:
> * Michael Ellerman (mpe@ellerman.id.au) wrote:
>> linux@treblig.org writes:
>> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
>> >
>> > PowerPC has a 'btext' font used for the console which is almost identical
>> > to the shared font_sun8x16, so use it rather than duplicating the data.
>> >
>> > They were actually identical until about a decade ago when
>> >    commit bcfbeecea11c ("drivers: console: font_: Change a glyph from
>> >                         "broken bar" to "vertical line"")
>> >
>> > which changed the | in the shared font to be a solid
>> > bar rather than a broken bar.  That's the only difference.
>> >
>> > This was originally spotted by PMD which noticed that sparc does
>> 
>> PMD means "Page Middle Directory" to most Linux folks, I assume that's
>> not what you meant :)
>
> Ah, any good TLA is ripe for reuse:
>    https://pmd.github.io/pmd/pmd_userdocs_cpd.html

Thanks.

Unfortunately this patch causes a warning:

  WARNING: unmet direct dependencies detected for FONT_SUN8x16
    Depends on [n]: FONT_SUPPORT [=y] && FRAMEBUFFER_CONSOLE [=y] && (!SPARC && FONTS [=n] || SPARC)
    Selected by [y]:
    - BOOTX_TEXT [=y] && PPC_BOOK3S [=y]

And breaks allmodconfig with:

  ld: arch/powerpc/kernel/btext.o:(.toc+0x0): undefined reference to `font_sun_8x16'
  make[3]: *** [../scripts/Makefile.vmlinux:36: vmlinux] Error 1

I guess the Kconfig logic needs some more work.

cheers
