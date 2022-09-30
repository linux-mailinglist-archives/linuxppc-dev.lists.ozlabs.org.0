Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4959C5F0C50
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 15:20:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf9pT5t8hz3cdR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 23:20:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=I/P976NE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf9nw5mCsz2xGh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 23:20:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=I/P976NE;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mf9nw4TWDz4xG6;
	Fri, 30 Sep 2022 23:20:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664544020;
	bh=8ABY5yndKr2wVHdMws2LKtr/TrNuf9ZMmFHpJKckonk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I/P976NE5P0mUxFIUNtUxaugme1KhTBF+Cd3t+t/bfILJAlJ9sN4E1thCRzWXz1Ae
	 KJJn7639hci/ay5Uxe1LKhMqXiZBaSz3UjPNL+QepZgmwxLKWKVPfgX8b7U3oSokBJ
	 NTZYbeCglEe88JPSpb9zZfO1lOSg3pmbVQtFZOhRbDSlOvS3ybehgQcmFxKsA2lfKZ
	 KOFS24Go8qeOiG+GlJfMamKx2hUb2P0cU2fuKeekI2Rq37e8eBSSVQfYeSuyfCDFu4
	 268+y/6V8Zwde9zgTco4xAFz5RxBoTq4hopZk+gn53NVWYEYCfGmewwzjhzAMhOty1
	 lHsIrYFRGo8wQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Rohan McLure <rmclure@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 13/25] powerpc: Remove direct call to mmap2 syscall
 handlers
In-Reply-To: <2be2c0f2-9b4b-46e7-a10e-1c17026e8f79@www.fastmail.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
 <20220921065605.1051927-14-rmclure@linux.ibm.com>
 <87k05ng0fq.fsf@mpe.ellerman.id.au>
 <2be2c0f2-9b4b-46e7-a10e-1c17026e8f79@www.fastmail.com>
Date: Fri, 30 Sep 2022 23:19:46 +1000
Message-ID: <87h70pov7x.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Arnd Bergmann" <arnd@arndb.de> writes:
> On Wed, Sep 28, 2022, at 2:15 PM, Michael Ellerman wrote:
>
>> But I think it makes more sense to do the same as mmap2() and pass the
>> 4K offset through, and pass shift = PAGE_SHIFT - 12. I also borrowed the
>> "off_4k" name from arm64. End result:
>>
>> #ifdef CONFIG_COMPAT
>> COMPAT_SYSCALL_DEFINE6(mmap2,
>> 		       unsigned long, addr, size_t, len,
>> 		       unsigned long, prot, unsigned long, flags,
>> 		       unsigned long, fd, unsigned long, off_4k)
>> {
>> 	return do_mmap2(addr, len, prot, flags, fd, off_4k, PAGE_SHIFT-12);
>> }
>> #endif
>>
>> With that my G5 boots again :)
>
> Any chance we can instead add a working compat_sys_mmap2/sys_mmap2
> in mm/mmap.c alongside the sys_mmap_pgoff implementation?

I've merged this, but happy to clean things up in a subsequent patch :)

> While sys_mmap_pgoff() was meant to replace the various sys_mmap2()
> implementations, I think it was ultimately a mistake, and we later
> converged on the sys_mmap2() calling conventions with 12 bits
> offset for almost all 32-bit architectures.

I only see 3 compat mmap2s:

  $ gg "COMPAT_SYSCALL.*mmap2"
  arch/arm64/kernel/sys32.c:COMPAT_SYSCALL_DEFINE6(aarch32_mmap2, unsigned long, addr, unsigned long, len,
  arch/powerpc/kernel/syscalls.c:COMPAT_SYSCALL_DEFINE6(mmap2, unsigned long, addr, size_t, len,
  arch/s390/kernel/compat_linux.c:COMPAT_SYSCALL_DEFINE1(s390_mmap2, struct mmap_arg_struct_emu31 __user *, arg)

s390 is weird.

The arm64 one and ours are similar, but we have the additional call to
arch_validate_prot(prot, addr). arm64 does implement arch_validate_prot().

Similar with mmap2, we call arch_validate_prot() but no one else does (why not?).

cheers
