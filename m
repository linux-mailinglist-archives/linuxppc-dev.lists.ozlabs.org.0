Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE441905B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 07:27:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mh9k2TrqzDqhb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 17:27:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mh5V5rZ2zDqgp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 17:23:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qrweyHTw; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48mh5T3XFyz9sNg;
 Tue, 24 Mar 2020 17:23:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585031005;
 bh=pyXXTSOM4rJiyzQjZhPpy8qmKgXBedErkVyMHCYOl80=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qrweyHTwsbAvl7ERrTWZk38mrgANw/NQhKqMufsiiCAth3EoXC5Ob9kEwnV5jOedS
 iNxbRgJ35iK0SrppQiB7CzsHb9YS/VmMB0LP27lVQMpBKe32Ohzfuj5AA+88nOksyq
 J9Xq//SDVLs6wMYJP3Qb5i/cOPCV2OuZoJc0XIqlOIIHMuLx6bqI3UGdMXvT78cxa7
 8VmstvqGa6jL29bJ+QHhSArN7ATzJcXc3gCHSlLY9GTWU1TjddRJfLy2GfR2ZT6bqK
 hEi7jRWFO68/gqFSH32r1dnWgAxU1ozpsad4171Sd6ut2q7772RSPXC1paQoPNUM9b
 6ff411U9oiBPw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, mikey@neuling.org
Subject: Re: [PATCH v5 10/13] powerpc/ptrace: split out ADV_DEBUG_REGS related
 functions.
In-Reply-To: <25a7f050-f241-6035-e778-16b1ca9928f3@c-s.fr>
References: <cover.1582848567.git.christophe.leroy@c-s.fr>
 <e2bd7d275bd5933d848aad4fee3ca652a14d039b.1582848567.git.christophe.leroy@c-s.fr>
 <87imizdbaz.fsf@mpe.ellerman.id.au>
 <25a7f050-f241-6035-e778-16b1ca9928f3@c-s.fr>
Date: Tue, 24 Mar 2020 17:23:29 +1100
Message-ID: <87k13axoda.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> On 03/20/2020 02:12 AM, Michael Ellerman wrote:
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>> Move ADV_DEBUG_REGS functions out of ptrace.c, into
>>> ptrace-adv.c and ptrace-noadv.c
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>> ---
>>> v4: Leave hw_breakpoint.h for ptrace.c
>>> ---
>>>   arch/powerpc/kernel/ptrace/Makefile       |   4 +
>>>   arch/powerpc/kernel/ptrace/ptrace-adv.c   | 468 ++++++++++++++++
>>>   arch/powerpc/kernel/ptrace/ptrace-decl.h  |   5 +
>>>   arch/powerpc/kernel/ptrace/ptrace-noadv.c | 236 ++++++++
>>>   arch/powerpc/kernel/ptrace/ptrace.c       | 650 ----------------------
>>>   5 files changed, 713 insertions(+), 650 deletions(-)
>>>   create mode 100644 arch/powerpc/kernel/ptrace/ptrace-adv.c
>>>   create mode 100644 arch/powerpc/kernel/ptrace/ptrace-noadv.c
>> 
>> This is somehow breaking the ptrace-hwbreak selftest on Power8:
>> 
>>    test: ptrace-hwbreak
>>    tags: git_version:v5.6-rc6-892-g7a285a6067d6
>>    PTRACE_SET_DEBUGREG, WO, len: 1: Ok
>>    PTRACE_SET_DEBUGREG, WO, len: 2: Ok
>>    PTRACE_SET_DEBUGREG, WO, len: 4: Ok
>>    PTRACE_SET_DEBUGREG, WO, len: 8: Ok
>>    PTRACE_SET_DEBUGREG, RO, len: 1: Ok
>>    PTRACE_SET_DEBUGREG, RO, len: 2: Ok
>>    PTRACE_SET_DEBUGREG, RO, len: 4: Ok
>>    PTRACE_SET_DEBUGREG, RO, len: 8: Ok
>>    PTRACE_SET_DEBUGREG, RW, len: 1: Ok
>>    PTRACE_SET_DEBUGREG, RW, len: 2: Ok
>>    PTRACE_SET_DEBUGREG, RW, len: 4: Ok
>>    PTRACE_SET_DEBUGREG, RW, len: 8: Ok
>>    PPC_PTRACE_SETHWDEBUG, MODE_EXACT, WO, len: 1: Ok
>>    PPC_PTRACE_SETHWDEBUG, MODE_EXACT, RO, len: 1: Ok
>>    PPC_PTRACE_SETHWDEBUG, MODE_EXACT, RW, len: 1: Ok
>>    PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, WO, len: 6: Ok
>>    PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, RO, len: 6: Ok
>>    PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, RW, len: 6: Ok
>>    PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW UNALIGNED, WO, len: 6: Ok
>>    PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW UNALIGNED, RO, len: 6: Fail
>>    failure: ptrace-hwbreak
>> 
>> I haven't had time to work out why yet.
>> 
>
> A (big) part of commit c3f68b0478e7 ("powerpc/watchpoint: Fix ptrace 
> code that muck around with address/len") was lost during rebase.
>
> I'll send a fix, up to you to squash it in or commit it as is.

Thanks.

cheers
