Return-Path: <linuxppc-dev+bounces-5178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30807A0BE71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 18:10:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWzL864tvz3cmV;
	Tue, 14 Jan 2025 04:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736788256;
	cv=none; b=TpxxfEzkyVL6dWfm9/p/C6gDiJvOzuGj9IMPPBxkQJYj1aiXFQ9Q4zbjXNO4+AsakaO/AZtHdtsi5PK6TrOE/ON81Ssq4cTGcUeSxUuIMy6KV/rgpLk+4IJBt0ZFRrcytGHL5tqY0pPbvkuOblJe9Hw8XXLk98oxe7Omfj47smrptnp0gvUDRScG6wx7ksH5RevGdU8HYVoF+DMZO3rB8YtG9mSUBOPZl+39T60zjH6hDNGJ7+9/hDLQkNs3RcHIjESVpuAnrxXmQchk7zeNB7Wya4KxicEsRHzLNbGz2g0LogfKHZAvUUid2GrJm4v378d6lrjvt2VQQq8B7nPwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736788256; c=relaxed/relaxed;
	bh=L2jpNdRlSu2kZgJqIveeGQbslvJgQMtiriX0N3K+DzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=isg8j8kaFKdJq25oWcah3+shyBmqXzCGyd6dwL93tTQmAWNUEevLUL2sfDkmlgCbQqZyHV2AM//Wo/8apsyhS/cX4T1AozmBB2fbawLcCxTyFf8Akm31/+uzW+8w4K6Iom4QA3ZEkWHXcAI0cI6rYp/l8bntwM+R4zNdjJwwHpOVrtOQnwlDY3eQ+TnCyhxacL4gGwEX+HeBQ9dhxxZxQ7NhuwfiKRgIQF3WL79LBG3sf0/YZq2X6UBecofELMTsLGAFTqz0JKZgeQN33VeQeRQ9YB1ijzKTP4TKkOecufMxGmEK0T/Ywo/xXDh8A/yF5tT/GUv4p/xe+lRObaL6xQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWzL76Dcvz3clw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 04:10:55 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 5D76072C8CC;
	Mon, 13 Jan 2025 20:10:54 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 52A327CCB3A; Mon, 13 Jan 2025 19:10:54 +0200 (IST)
Date: Mon, 13 Jan 2025 19:10:54 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Oleg Nesterov <oleg@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
Message-ID: <20250113171054.GA589@strace.io>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113170925.GA392@strace.io>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Bring syscall_set_return_value() in sync with syscall_get_error(),
and let upcoming ptrace/set_syscall_info selftest pass on powerpc.

This reverts commit 1b1a3702a65c ("powerpc: Don't negate error in
syscall_set_return_value()").

Signed-off-by: Dmitry V. Levin <ldv@strace.io>
---
 arch/powerpc/include/asm/syscall.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
index 3dd36c5e334a..422d7735ace6 100644
--- a/arch/powerpc/include/asm/syscall.h
+++ b/arch/powerpc/include/asm/syscall.h
@@ -82,7 +82,11 @@ static inline void syscall_set_return_value(struct task_struct *task,
 		 */
 		if (error) {
 			regs->ccr |= 0x10000000L;
-			regs->gpr[3] = error;
+			/*
+			 * In case of an error regs->gpr[3] contains
+			 * a positive ERRORCODE.
+			 */
+			regs->gpr[3] = -error;
 		} else {
 			regs->ccr &= ~0x10000000L;
 			regs->gpr[3] = val;
-- 
ldv

