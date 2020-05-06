Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A89F11C6593
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 03:38:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GzkY5CDgzDqVr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 11:38:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Gzgj1MNbzDqVp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 11:35:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=GTHAsXCU; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Gzgg6gf5z9sSr;
 Wed,  6 May 2020 11:35:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588728944;
 bh=KUYO+PR8+oJRVW9bjsUzpPhTlm5eKF6/oKJKp8Jeo0g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GTHAsXCUiXz5gZz3YepcK5hmp0cRbu6B1DOYuP4H0C577S3a6m8KBhhKu1Gpq/cJn
 DeWjzEeke2mr2CutozGTmoG98bACusrP5pMOowZTpqCxSD06ganBizqL1J2HHKl7rZ
 0OOAfZyx5T+dwBG32Qar+O6gH/1QJ6EXezRf1wCsYbBIIsI5qaAhvKG+b9eXcgjrjs
 RkFBVRebIORbX84qfdQ4Cl3bgJXhiDSuj9XhZW9sIuwCxvWvrFZeGq2PUzqdCjzlLw
 KvjIuVsYvopt8AEH+SWbBipwDB9zPkLnWsQ9htr8IAf7zVJ4QL/q7Vy0bdPoCI0rrW
 h7Y2ZZ7I8E8Sw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 1/2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
In-Reply-To: <20200505155944.GO31009@gate.crashing.org>
References: <23e680624680a9a5405f4b88740d2596d4b17c26.1587143308.git.christophe.leroy@c-s.fr>
 <87sggecv81.fsf@mpe.ellerman.id.au>
 <1c6379b2-7e0a-91fe-34f0-51f5adca7929@csgroup.eu>
 <20200505155944.GO31009@gate.crashing.org>
Date: Wed, 06 May 2020 11:36:00 +1000
Message-ID: <87lfm5dev3.fsf@mpe.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Tue, May 05, 2020 at 05:40:21PM +0200, Christophe Leroy wrote:
>> >>+#define __put_user_asm_goto(x, addr, label, op)			\
>> >>+	asm volatile goto(					\
>> >>+		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
>> >>+		EX_TABLE(1b, %l2)				\
>> >>+		:						\
>> >>+		: "r" (x), "m<>" (*addr)				\
>> >
>> >The "m<>" here is breaking GCC 4.6.3, which we allegedly still support.
>> >
>> >Plain "m" works, how much does the "<>" affect code gen in practice?
>> >
>> >A quick diff here shows no difference from removing "<>".
>> 
>> It was recommended by Segher, there has been some discussion about it on 
>> v1 of this patch, see 
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/4fdc2aba6f5e51887d1cd0fee94be0989eada2cd.1586942312.git.christophe.leroy@c-s.fr/
>> 
>> As far as I understood that's mandatory on recent gcc to get the 
>> pre-update form of the instruction. With older versions "m" was doing 
>> the same, but not anymore.
>
> Yes.  How much that matters depends on the asm.  On older CPUs (6xx/7xx,
> say) the update form was just as fast as the non-update form.  On newer
> or bigger CPUs it is usually executed just the same as an add followed
> by the memory access, so it just saves a bit of code size.

The update-forms are stdux, sthux etc. right?

I don't see any change in the number of those with or without the
constraint. That's using GCC 9.3.0.

>> Should we ifdef the "m<>" or "m" based on GCC 
>> version ?
>
> That will be a lot of churn.  Just make 4.8 minimum?

As I said in my other mail that's not really up to us. We could mandate
a higher minimum for powerpc, but I'd rather not.

I think for now I'm inclined to just drop the "<>", and we can revisit
in a release or two when hopefully GCC 4.8 has become the minimum.

cheers
