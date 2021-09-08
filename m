Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF2C403A28
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 14:55:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4MYn3Kyyz2ybC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 22:55:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gEVMZpdR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=gEVMZpdR; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4MYB20GXz2xYN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 22:54:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1631105693;
 bh=4buVmdCJbEKwDN6MFakAZzhTTxIW6wubQ+3i9kPXOts=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=gEVMZpdRhlwQOSGgyJJI7sPi/rU19QB2E1o+KDobnaU9qaVAM7DDA9Gn41YJznqnH
 /SEgQMNdyxZ39n2j8MPNzgAW57Get+ZbH+VSeUvhuQWN/673orENMSaonoMFzBTaAo
 9quyE77gwvpSxYcY/42CV1kJAw8x3Iy2PRV470iPNJ1CDXD8F+XUGPRaoGUCiWoiFX
 4TK6p3NPQ4uhmU0PFB7mum9IY2o44H8YWtRxYVLjfiCDjnExk+MsM/6isANVi4+fNh
 2+CCVrBgNqeWJZts/myf/qad7yxCmYzZmjpEklcvSjTwd/h+w7pClONNwT+KRgNVvC
 egb58+IIKWeZQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H4MY90tbjz9sQt;
 Wed,  8 Sep 2021 22:54:53 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Bug 213837] "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
In-Reply-To: <bug-213837-206035-BEt4KJvSST@https.bugzilla.kernel.org/>
References: <bug-213837-206035@https.bugzilla.kernel.org/>
 <bug-213837-206035-BEt4KJvSST@https.bugzilla.kernel.org/>
Date: Wed, 08 Sep 2021 22:54:43 +1000
Message-ID: <87ee9zmdm4.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

bugzilla-daemon@bugzilla.kernel.org writes:
> https://bugzilla.kernel.org/show_bug.cgi?id=213837
>
> Erhard F. (erhard_f@mailbox.org) changed:
>
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>            See Also|https://bugzilla.kernel.org |
>                    |/show_bug.cgi?id=213079     |
>
> --- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
> Checked out whether this has really something to do with bug #213079 or not by
> copying this root partition to a regular HDD and use that one instead. As the
> issue still happens it seems these are two seperate bugs.
>
> [...]
> Kernel panic - not syncing: corrupted stack end detected inside scheduler

Can you try this patch, it might help us work out what is corrupting the
stack.

cheers

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c4462c454ab9..07bfa25c1b48 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5490,8 +5490,14 @@ static noinline void __schedule_bug(struct task_struct *prev)
 static inline void schedule_debug(struct task_struct *prev, bool preempt)
 {
 #ifdef CONFIG_SCHED_STACK_END_CHECK
-	if (task_stack_end_corrupted(prev))
+	if (task_stack_end_corrupted(prev)) {
+		char *start = (char *)end_of_stack(prev);
+		pr_err("stack corrupted? stack end = 0x%px\n", end_of_stack(prev));
+		print_hex_dump(KERN_ERR, "stack: ", DUMP_PREFIX_ADDRESS, 16, 4,
+			       start - SZ_1K, THREAD_SIZE + SZ_1K, true);
+
 		panic("corrupted stack end detected inside scheduler\n");
+	}
 
 	if (task_scs_end_corrupted(prev))
 		panic("corrupted shadow stack detected inside scheduler\n");
