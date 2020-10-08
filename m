Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC10287314
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 13:03:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6SxR38yWzDqHp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 22:03:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6SjV4qrzzDqVS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 21:53:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RAJ40CTv; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4C6SjT5dFkz9sTK; Thu,  8 Oct 2020 21:53:17 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6SjT43wpz9sT6;
 Thu,  8 Oct 2020 21:53:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1602154397;
 bh=DUSIIAX+AyTbEuvZPKfjuxMD+xreDdVLaFeXV4vkKHY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RAJ40CTvxxslpMxWqiKEMBL9OzDlQFWDDmM1pjMt2Dp73q7143pw4mJVPhxCJjPGB
 1D+Zf84Boowm4tnFR4ToObnjLSEwNlv8LWmUD5e2zlq4pd7Xp/GfymQAIiZthl5kNy
 k/OvEG5B5qyQqFBNlc4UErGk0j32oSdFHHxtNN9YRkyDG/TqWr6EPR4YChmhSh6eyA
 4vUf2TaxZjGxYmAsZnBT69tavmmZvfQyeVO7+OM1mg8PipF8AcwGwYbcyC42/ZSENI
 OHC6YVPYZCx/xewKPOlltOO3E36BcilQXHikV0kL8wUOa/58xU3UmgJx2/aGJvlBl5
 uVJeLDLeK7m4w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/64: Make VDSO32 track COMPAT on 64-bit
In-Reply-To: <20200922075507.3fgitavbbupmi53m@linux.vnet.ibm.com>
References: <20200908125850.407939-1-mpe@ellerman.id.au>
 <160034211494.3342081.16977957933269532766.b4-ty@ellerman.id.au>
 <20200922075507.3fgitavbbupmi53m@linux.vnet.ibm.com>
Date: Thu, 08 Oct 2020 21:53:17 +1100
Message-ID: <87lfgh0z1e.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, msuchanek@suse.de, srikar@linux.vnet.ibm.com,
 Stephen Rothwell <sfr@canb.auug.org.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> * Michael Ellerman <patch-notifications@ellerman.id.au> [2020-09-17 21:28:46]:
>
>> On Tue, 8 Sep 2020 22:58:50 +1000, Michael Ellerman wrote:
>> > When we added the VDSO32 kconfig symbol, which controls building of
>> > the 32-bit VDSO, we made it depend on CPU_BIG_ENDIAN (for 64-bit).
>> > 
>> > That was because back then COMPAT was always enabled for 64-bit, so
>> > depending on it would have left the 32-bit VDSO always enabled, which
>> > we didn't want.
>> > 
>> > [...]
>> 
>> Applied to powerpc/next.
>> 
>> [1/1] powerpc/64: Make VDSO32 track COMPAT on 64-bit
>>       https://git.kernel.org/powerpc/c/231b232df8f67e7d37af01259c21f2a131c3911e
>> 
>> cheers
>
> With this commit which is part of powerpc/next and with
> /opt/at12.0/bin/gcc --version
> gcc (GCC) 8.4.1 20191125 (Advance-Toolchain 12.0-3) [e25f27eea473]
> throws up a compile error on a witherspoon/PowerNV with CONFIG_COMPAT.
> CONFIG_COMPAT got carried from the distro config. (And looks like most
> distros seem to be having this config)

This distro config will have it because previously it couldn't be
disabled. But now that it's selectable all LE distros should disable it.

> cc1: error: _-m32_ not supported in this configuration
> make[4]: *** [arch/powerpc/kernel/vdso32/sigtramp.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> cc1: error: _-m32_ not supported in this configuration
> make[4]: *** [arch/powerpc/kernel/vdso32/gettimeofday.o] Error 1
> make[3]: *** [arch/powerpc/kernel/vdso32] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [arch/powerpc/kernel] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [arch/powerpc] Error 2
> make[1]: *** Waiting for unfinished jobs....
> make: *** [__sub-make] Error 2
>
> I don't seem to be facing with other compilers like "gcc (Ubuntu
> 7.4.0-1ubuntu1~18.04.1) 7.4.0" and I was able to disable CONFIG_COMPAT and
> proceed with the build.

It seems your compiler doesn't support building 32-bit binaries. I'm
pretty sure the kernel.org ones do, or you can just turn off COMPAT.

cheers
