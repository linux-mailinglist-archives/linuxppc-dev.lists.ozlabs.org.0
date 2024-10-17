Return-Path: <linuxppc-dev+bounces-2360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4E09A3025
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 23:56:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XV1qC5JGZz3bmC;
	Fri, 18 Oct 2024 08:55:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729202135;
	cv=none; b=MiKbadhQFLb3TzJjFK638S/qQXPphZfcsOOuNsni0V5G/CZFnXouKcq97Ql+Q7Cc1ECYf1VJpBd48dMuSHLl2MbCz449oSA58gQLv80C3pJrMDSdRlBV6xrO9xU90dcoMCOzaTKRom1tD2xJQ0RC+l190rkyW3Nvm8JHfQoa6RcohCk2JyfF1gxJHsJx0RKUCrJ2JCy1qjUgw92bCqFkf//s0snGBsGhthZortTTi42xWaKTF6JvJ+rbAqvzQPTHSgA264Yi+SBGIov3VuenFIQnJxeu/tmPF2k/UnX1S4W5KeBHmBwxUlT99/ceNEKRKnU3MU0gmkkinDpGX/9Kgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729202135; c=relaxed/relaxed;
	bh=t+fp9HkqB7t9T4kXp25tzRMFvZmMzZx5AUMGMn2tzpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=El4JZfkATKg7gs7ohLDkwwnmLlxUpnM3sM7fa0fUFr90r9uFzElpdLGZzTa9epoEfTdxxWa9jroUHKVkM6UO0eJiK6QWyTL9TjjrKb6aVRBJDi3TAmhNs6+IdidpuK/4j2ZEu4Bz8oU1Lz7F0WBApRtE63f6shNSkbJXQ7qLmyry1Hz+uV7VmkHaB1+kXfShxij0NR4HIaIg7SZSycXNkwznILbcldl3r0WCKI+j7YDK79yH/YzAed4lf+wt2HCqFzcIwzx6ZB36Hx4yGQwF8ku3cfCp8+7iYu6O0mGsmQ4XA3yRdI9/u4i6vali1TbzBu6YcrngDq/q8jeqMq2l6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TxSb0QpA; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TxSb0QpA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XV1q964ngz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 08:55:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49435A444B3;
	Thu, 17 Oct 2024 21:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17A8C4CEC3;
	Thu, 17 Oct 2024 21:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729202131;
	bh=opTfvoucneR4FnsToYqJIQ2vAsIrtZ9GVWhav979RCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TxSb0QpAIMqiN4HI9o5K6GW+rkBMV2URDlO14dMxDoDJzEWfPvquUxVQ5hm8pQmkx
	 43qcYbZDzeLJqryctoK0nWFeX51ZT5JQwsA3zcUlKHjW/V3/WYXNA5dHkSBiMDmR7r
	 FNs/BZvZOhDnougKtZALz8ZZxadM48pBr24W2appoYcj7pUuIr1FDlDmmJO89CXqs6
	 6CuDXUronT/fSOE0ULA/lFjCU6Ot0QmXBgvr9vPWd+isX+b8RkNv6gPKtPgq6GKI8h
	 KiFV2651yGF27415Tjt3LZ2FXdVzMG11jflBg3CcVtQcyqZWDr3K2Lwl4y4ABsU9bV
	 VX+CnZpzvHY4A==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>
Subject: [PATCH v2 6/6] x86/uaccess: Add user pointer masking to clear_user()
Date: Thu, 17 Oct 2024 14:55:25 -0700
Message-ID: <7db4ec5c9444e4b76d45a189fdd37f6483c06bef.1729201904.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729201904.git.jpoimboe@kernel.org>
References: <cover.1729201904.git.jpoimboe@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add user pointer masking to clear_user() to mitigate Spectre v1.

A write in a mispredicted access_ok() branch to a user-controlled kernel
address can populate the rest of the affected cache line with kernel
data.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/include/asm/uaccess_64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
index 0587830a47e1..8027db7f68c2 100644
--- a/arch/x86/include/asm/uaccess_64.h
+++ b/arch/x86/include/asm/uaccess_64.h
@@ -199,7 +199,7 @@ static __always_inline __must_check unsigned long __clear_user(void __user *addr
 static __always_inline unsigned long clear_user(void __user *to, unsigned long n)
 {
 	if (__access_ok(to, n))
-		return __clear_user(to, n);
+		return __clear_user(mask_user_address(to), n);
 	return n;
 }
 #endif /* _ASM_X86_UACCESS_64_H */
-- 
2.47.0


