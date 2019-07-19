Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C00BD6E4DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 13:14:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qpLg6kvfzDqwH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 21:14:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qpJw4cx6zDqlZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 21:13:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45qpJt0NJrz9s00;
 Fri, 19 Jul 2019 21:13:17 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Brauner <christian@brauner.io>
Subject: Re: [PATCH 1/2] arch: mark syscall number 435 reserved for clone3
In-Reply-To: <20190719102503.tm3ahvkh4rwykmws@brauner.io>
References: <20190714192205.27190-1-christian@brauner.io>
 <20190714192205.27190-2-christian@brauner.io>
 <e14eb2f9-43cb-0b9d-dec4-b7e7dcd62091@de.ibm.com>
 <20190716130631.tohj4ub54md25dys@brauner.io>
 <874l3i8h0l.fsf@concordia.ellerman.id.au>
 <20190719102503.tm3ahvkh4rwykmws@brauner.io>
Date: Fri, 19 Jul 2019 21:13:16 +1000
Message-ID: <871rym8egj.fsf@concordia.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de,
 linux-sh@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Vasily Gorbik <gor@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian Brauner <christian@brauner.io> writes:
> On Fri, Jul 19, 2019 at 08:18:02PM +1000, Michael Ellerman wrote:
>> Christian Brauner <christian@brauner.io> writes:
>> > On Mon, Jul 15, 2019 at 03:56:04PM +0200, Christian Borntraeger wrote:
>> >> I think Vasily already has a clone3 patch for s390x with 435. 
>> >
>> > A quick follow-up on this. Helge and Michael have asked whether there
>> > are any tests for clone3. Yes, there will be and I try to have them
>> > ready by the end of the this or next week for review. In the meantime I
>> > hope the following minimalistic test program that just verifies very
>> > very basic functionality (It's not pretty.) will help you test:
>> 
>> Hi Christian,
>> 
>> Thanks for the test.
>> 
>> This actually oopses on powerpc, it hits the BUG_ON in CHECK_FULL_REGS
>> in process.c around line 1633:
>> 
>> 	} else {
>> 		/* user thread */
>> 		struct pt_regs *regs = current_pt_regs();
>> 		CHECK_FULL_REGS(regs);
>> 		*childregs = *regs;
>> 		if (usp)
>> 
>> 
>> So I'll have to dig into how we fix that before we wire up clone3.
>> 
>> Turns out testing is good! :)
>
> Indeed. I have a test-suite for clone3 in mind and I hope to have it
> ready by the end of next week. It's just always the finding the time
> part that is annoying. :)

I know the feeling!

> Thanks for digging into this, Michael!

No worries, happy to help where I can.

In the intervening five minutes I remembered how we handle this, we just
need a little wrapper to save the non-volatile regs:

_GLOBAL(ppc_clone3)
	bl	save_nvgprs
	bl	sys_clone3
	b	.Lsyscall_exit


A while back I meant to make it generate those automatically based on a
flag in the syscall.tbl but of course haven't got around to it :)

So with the above it seems all good:

$ ./clone3 ; echo $?
Parent process received child's pid 4204 as return value
Parent process received child's pidfd 3
Parent process received child's pid 4204 as return argument
Child process with pid 4204
0

I'll send a patch to wire it up on Monday.

cheers
