Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8C629CDF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 06:21:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLcP42fsfzDqS0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 16:21:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLcMP2vT5zDqCG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 16:19:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pEGGL58T; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CLcMN2vl1z9sWL;
 Wed, 28 Oct 2020 16:19:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603862385;
 bh=HsQ+BMZS4Im1PO5FHVBGT6a0Wzm4f131MXdYTkoyax4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pEGGL58TwZOn5qcYDnG7NyRDXlbjMEPuH4GtsZZHG+WrweEKY7c7MBd+AHh7Zk/D6
 LO4fSRjHdKaZ6C8QcOkq9MixLG1GF2SCPpGGg7O6zpsIO7TUkqktYjqmsPu8nvU8rX
 D7sPVRF3NA5e2ofpEDWQo/08kXcYNGxjbkPMaJp1CYWPMzaL/dGoRskOAZd1px5m8C
 PuHotvoTgLfC7aatvbA37Fnnwe+JqpDa/GPyE3i/IN4KVzItJuSgoXu80x4k11FCy0
 jEgQCzajGg75gy7jpVPnnzNAzkY+XwcgRJN1tELLk84xQp+oMODFRbPoD5B12GaGCb
 gt3j13u/TyV3g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andreas Schwab <schwab@linux-m68k.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] powerpc/uaccess: Switch __put_user_size_allowed() to
 __put_user_asm_goto()
In-Reply-To: <87imav9r64.fsf@igel.home>
References: <94ba5a5138f99522e1562dbcdb38d31aa790dc89.1599216721.git.christophe.leroy__44535.5968013004$1599217383$gmane$org@csgroup.eu>
 <87mu079ron.fsf@igel.home> <87imav9r64.fsf@igel.home>
Date: Wed, 28 Oct 2020 16:19:42 +1100
Message-ID: <87pn53vsep.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andreas Schwab <schwab@linux-m68k.org> writes:
> On Okt 28 2020, Andreas Schwab wrote:
>
>> On Sep 04 2020, Christophe Leroy wrote:
>>
>>> __put_user_asm_goto() provides more flexibility to GCC and avoids using
>>> a local variable to tell if the write succeeded or not.
>>> GCC can then avoid implementing a cmp in the fast path.
>>
>> That breaks CLONE_CHILD_SETTID.  I'm getting an assertion failure in
>> __libc_fork (THREAD_GETMEM (self, tid) != ppid).
>
> This is what schedule_tail now looks like.  As you can see, put_user has
> become a nop:
>
> 000000000000455c <.schedule_tail>:
>     455c:       7c 08 02 a6     mflr    r0
>     4560:       f8 01 00 10     std     r0,16(r1)
>     4564:       f8 21 ff 91     stdu    r1,-112(r1)
>     4568:       4b ff cd 4d     bl      12b4 <.finish_task_switch>
>     456c:       4b ff c0 99     bl      604 <.balance_callback>
>     4570:       e8 6d 01 88     ld      r3,392(r13)
>     4574:       e9 23 06 b0     ld      r9,1712(r3)
>     4578:       2f a9 00 00     cmpdi   cr7,r9,0
>     457c:       41 9e 00 14     beq     cr7,4590 <.schedule_tail+0x34>
>     4580:       38 80 00 00     li      r4,0
>     4584:       38 a0 00 00     li      r5,0
>     4588:       48 00 00 01     bl      4588 <.schedule_tail+0x2c>
>                         4588: R_PPC64_REL24     .__task_pid_nr_ns
>     458c:       60 00 00 00     nop
>     4590:       48 00 00 01     bl      4590 <.schedule_tail+0x34>
>                         4590: R_PPC64_REL24     .calculate_sigpending
>     4594:       60 00 00 00     nop
>     4598:       38 21 00 70     addi    r1,r1,112
>     459c:       e8 01 00 10     ld      r0,16(r1)
>     45a0:       7c 08 03 a6     mtlr    r0
>     45a4:       4e 80 00 20     blr

Not for me, see below.

What config and compiler are you using?

cheers



c000000000181aa0 <schedule_tail>:
c000000000181aa0:       82 01 4c 3c     addis   r2,r12,386
c000000000181aa4:       60 1b 42 38     addi    r2,r2,7008
c000000000181aa8:       a6 02 08 7c     mflr    r0
c000000000181aac:       cd b5 ee 4b     bl      c00000000006d078 <_mcount>
c000000000181ab0:       a6 02 08 7c     mflr    r0
c000000000181ab4:       f8 ff e1 fb     std     r31,-8(r1)
c000000000181ab8:       10 00 01 f8     std     r0,16(r1)
c000000000181abc:       d1 ff 21 f8     stdu    r1,-48(r1)
c000000000181ac0:       c9 7d ff 4b     bl      c000000000179888 <finish_task_switch+0x8>
c000000000181ac4:       40 0a 23 e9     ld      r9,2624(r3)
c000000000181ac8:       00 00 a9 2f     cmpdi   cr7,r9,0
c000000000181acc:       b4 00 9e 40     bne     cr7,c000000000181b80 <schedule_tail+0xe0>
c000000000181ad0:       68 09 6d e8     ld      r3,2408(r13)
c000000000181ad4:       48 07 e3 eb     ld      r31,1864(r3)
c000000000181ad8:       00 00 bf 2f     cmpdi   cr7,r31,0
c000000000181adc:       88 00 9e 41     beq     cr7,c000000000181b64 <schedule_tail+0xc4>
c000000000181ae0:       00 00 a0 38     li      r5,0
c000000000181ae4:       00 00 80 38     li      r4,0
c000000000181ae8:       21 4b fe 4b     bl      c000000000166608 <__task_pid_nr_ns+0x8>
c000000000181aec:       00 00 00 60     nop
c000000000181af0:       ff ff 20 39     li      r9,-1
c000000000181af4:       00 03 29 79     clrldi  r9,r9,12
c000000000181af8:       40 48 bf 7f     cmpld   cr7,r31,r9
c000000000181afc:       68 00 9d 41     bgt     cr7,c000000000181b64 <schedule_tail+0xc4>
c000000000181b00:       01 00 29 39     addi    r9,r9,1
c000000000181b04:       50 48 3f 7d     subf    r9,r31,r9
c000000000181b08:       03 00 a9 2b     cmpldi  cr7,r9,3
c000000000181b0c:       58 00 9d 40     ble     cr7,c000000000181b64 <schedule_tail+0xc4>
c000000000181b10:       02 00 42 3d     addis   r10,r2,2
c000000000181b14:       18 25 4a 39     addi    r10,r10,9496
c000000000181b18:       00 00 2a e9     ld      r9,0(r10)
c000000000181b1c:       22 00 29 e9     lwa     r9,32(r9)
c000000000181b20:       00 00 89 2f     cmpwi   cr7,r9,0
c000000000181b24:       24 00 9c 40     bge     cr7,c000000000181b48 <schedule_tail+0xa8>
c000000000181b28:       2c 01 00 4c     isync
c000000000181b2c:       00 40 20 3d     lis     r9,16384
c000000000181b30:       c6 07 29 79     rldicr  r9,r9,32,31

c000000000181b34:       a6 03 3d 7d     mtspr   29,r9		# put_user() begins here
c000000000181b38:       2c 01 00 4c     isync
c000000000181b3c:       00 00 2a e9     ld      r9,0(r10)
c000000000181b40:       22 00 29 e9     lwa     r9,32(r9)
c000000000181b44:       00 00 89 2f     cmpwi   cr7,r9,0
c000000000181b48:       00 00 7f 90     stw     r3,0(r31)
c000000000181b4c:       18 00 9c 40     bge     cr7,c000000000181b64 <schedule_tail+0xc4>
c000000000181b50:       2c 01 00 4c     isync
c000000000181b54:       ff ff 20 39     li      r9,-1
c000000000181b58:       44 00 29 79     rldicr  r9,r9,0,1
c000000000181b5c:       a6 03 3d 7d     mtspr   29,r9
c000000000181b60:       2c 01 00 4c     isync

c000000000181b64:       b5 c9 fc 4b     bl      c00000000014e518 <calculate_sigpending+0x8>
c000000000181b68:       00 00 00 60     nop
c000000000181b6c:       30 00 21 38     addi    r1,r1,48
c000000000181b70:       10 00 01 e8     ld      r0,16(r1)
c000000000181b74:       f8 ff e1 eb     ld      r31,-8(r1)
c000000000181b78:       a6 03 08 7c     mtlr    r0
c000000000181b7c:       20 00 80 4e     blr
c000000000181b80:       39 40 ff 4b     bl      c000000000175bb8 <__balance_callback+0x8>
c000000000181b84:       4c ff ff 4b     b       c000000000181ad0 <schedule_tail+0x30>
