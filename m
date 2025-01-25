Return-Path: <linuxppc-dev+bounces-5560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57710A1C30D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2025 13:18:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YgDGn72Rpz2yys;
	Sat, 25 Jan 2025 23:18:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737807489;
	cv=none; b=YBAcVMxXPBErp+dyAafwnxX1CmzKYBysQVGB+7veR7ThPccx7vNVm6o0vlDYL98A7cAssaAq+LksMHRZmDU4j5pKAuyPdYTZ8PbVuw5uDCU3HVtV5IrKBDEqFsDPQIM52uvnmvN3ila6Cm8mKWhAK7Iqhh+paeaBW/7hIqDlkDOJJgtaa4ePKMurPkNnaxmkLJhaNzfdM6kvQlORCbzXg7vKSXSSWOdLdi1XiGSHK83R5/spxkEIbZGIXjyxzUtyYLczP1zyTSk6oW5Xt0gtR7u+EL2keJKAV2O3RFZdW8Zrio7jwk9ZHN/X0kYm+6kx64RCZtxjjksf6uCXeD3QRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737807489; c=relaxed/relaxed;
	bh=ERLlPVG1lEJ+5piv0IiigUiUvltp7ufaJJs6c3as2xE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P4ObYXFi7xnooW5bF1N+IRpHL1j0YOEvuc6mgcKxqU0D/7pbBQYmCi2IzwAci0YJHyT6OFEMRJBhNIyT+jRlg6juk8oDlpXZexAwvIHG1m5FzOfS5sh/+3y0MlQncRKfOkA1RVcIiiWMEYbSODRcHKhnIGYEymrsWZSjEi0KbycdokfPjJHrv3cdThk3tVwuwgzgfvsWHMdIxMvjvH4gwsbKcmsn67F3lJo0JlVPF2R8pymI1cIuYuXUUL7OSOPSF6gP+8HcC6AWSK8kMTNtS8U9XeYUKH8ZFYvy/Hss5MWpma6Iexk8gHz1Q4AE0dScjMPr0G2wr/MNmhTYnfuMyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m4kRzeqX; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m4kRzeqX;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YgDGn3ckNz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2025 23:18:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1737807481;
	bh=ERLlPVG1lEJ+5piv0IiigUiUvltp7ufaJJs6c3as2xE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m4kRzeqXgS6be31WXpCMul2w16MNgDr7qFDtkDEIiwi0AO892C8XIYehHpwIA2m9P
	 tXJCEavqytSRyTgvnT2rCdpxISOSfqUkikjPHYPbkcEWADhfYG7d2NVVsWGtTARhlM
	 7paoJustxpjLfxKLzMhHFbBVqMGzyu6MueP02hkwyowAjCADPcdn9uKeBxjpZC3Sk0
	 KYluLrSFiaxClKykfkbaDM/utbgbpd1baCplWR5nq/eh47vuAg78BYVd22NiqiZQRj
	 yiVQnLEpyci8wdKmV3waqffXq7V2l7uE5JJjJdZGt34XSghDzLouO72ljnBH2aTSOa
	 0dOdySLMjdjHg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YgDGd0BwNz4wvc;
	Sat, 25 Jan 2025 23:18:01 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Gladkov <legion@kernel.org>, "Dmitry V. Levin" <ldv@strace.io>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Oleg Nesterov
 <oleg@redhat.com>, Eugene Syromyatnikov <evgsyr@gmail.com>, Mike Frysinger
 <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>, Davide Berardi
 <berardi.dav@gmail.com>, strace-devel@lists.strace.io, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao
 <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
In-Reply-To: <Z5OvMgjMd3xzx4mS@example.org>
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250123182815.GA20994@strace.io> <20250123234321.GA23582@strace.io>
 <Z5OvMgjMd3xzx4mS@example.org>
Date: Sat, 25 Jan 2025 23:18:06 +1100
Message-ID: <87ikq3jddt.fsf@mpe.ellerman.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Alexey Gladkov <legion@kernel.org> writes:
>
...
> I'm not a powerpc expert but shouldn't be used regs->gpr[3] via a
> regs_return_value() in system_call_exception() ?

Yes I agree.

> notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
> {
> ...
> 		r0 = do_syscall_trace_enter(regs);
> 		if (unlikely(r0 >= NR_syscalls))
> 			return regs->gpr[3];

This is the case where we're expecting the r3 value to be a negative
error code, to match the in-kernel semantics. But after this change it
would be a positive error value. It is probably harmless with the
current code structure, but that's just luck.

cheers

