Return-Path: <linuxppc-dev+bounces-2359-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4D09A3023
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 23:56:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XV1qC1cD8z3blc;
	Fri, 18 Oct 2024 08:55:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729202135;
	cv=none; b=jb30RSHwv2kL04UsZ6jYLHBFD8rBRYeNPB0s8+EyAFr+7JYgmXQY5FfRdG/F1X6ayIyttxGQzE+kvYmIjsJTEKL9ebLJoew66sKyWrnkaDBORzLClHIMp8rxW9uaqkXdc0MlRrSPoGn5ta3tgLRHIr74azNRpCjiVnB/rftyx2r+e5++bK49/J4EXw+5BoMJX3u005MX9ukvMD1abz7JkH+7BCs9jgwlSF4nu43KN3VdxmlOJYGgdIEYwVPhG6Sz4iTVWPRoo0vxalxMpdJgoLbwpbQKRBGHr+GjlS7+Wz3INBTT828RABLj440IQSjn7WpLZ7jeEDyKZfyZY5v9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729202135; c=relaxed/relaxed;
	bh=Z2uuxEKJxpJdB/cl/bli/5bMWlpijsXLHtGSalHPI34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pt03adONWP9fCPEpE5bKjSdJPEQszSDc/AXu4Fq/DPgLxi9v7N11E1Hi5KRky9bvmTnolumlYUtKUD1+eoeOHgZikY9/Eoj0u6TNelFnzx5H+IttanZlo1jZJYsVIRrjx7IKN4x/U0wm8oLSfRpntJ1yhDEnnTQ5+Y9UvnHy0X2f0OPr9bD0ebRd1YtwZRTRIvskzMwHQKgwc90BJVtmeheg/aaLBxUogS3vvTluqjj1qQZx7jQESqCu9PPNimtXzB6Tp3QmKU0eqmMDiEXwPWzOUJ29X48f3+ZNg9yeKHDBm3Wr8a2enl+Z3F6QvVRMAarJkGeXKzuo3VeK0M652Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QScC8JXg; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QScC8JXg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XV1q93Kkcz30CD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 08:55:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A27F0A444AA;
	Thu, 17 Oct 2024 21:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15429C4CED0;
	Thu, 17 Oct 2024 21:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729202130;
	bh=3+6cqjky5SJ8pbbT1W6aRTHDrkhRTtSUbUYAfyoehbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QScC8JXg1nhIsJfvLMXZp0T/67JQHRKuGALw/DEQDyZqG5bhTI5VunzUliAmaDCTy
	 c/IGDphRQwyP6so/z6M/bZGusu6oMxqktvU2B/PxIyBH09VpBrFCizxBN/yNOraMcH
	 LPv7C82XvgQjd7Cw0C7dkk81Qv4RG68Udm1ukCLHRDJEctcSNXt1xTWyxp9Smy6ggB
	 irDMBk+hdz68zwzRFKTky05dws961rQB+l/+CuG5u5sysjQN0L6VF+X+Xe6jAzw8Zr
	 96AOyOlz/q0+wljnFl74MsTItpZfzA1wWN+6rVInJrwOm+isaX+aJ/EEDqOw+Ww0XL
	 9jOJGvTtKjZ3Q==
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
Subject: [PATCH v2 5/6] x86/uaccess: Add user pointer masking to copy_to_user()
Date: Thu, 17 Oct 2024 14:55:24 -0700
Message-ID: <6500dcd8e7700b4dfe5de4f82ed2da19edc23c58.1729201904.git.jpoimboe@kernel.org>
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

Add user pointer masking to copy_to_user() to mitigate Spectre v1.

A write in a mispredicted access_ok() branch to a user-controlled kernel
address can populate the rest of the affected cache line with kernel
data.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/include/asm/uaccess_64.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
index 61693028ea2b..0587830a47e1 100644
--- a/arch/x86/include/asm/uaccess_64.h
+++ b/arch/x86/include/asm/uaccess_64.h
@@ -140,6 +140,7 @@ raw_copy_from_user(void *dst, const void __user *src, unsigned long size)
 static __always_inline __must_check unsigned long
 raw_copy_to_user(void __user *dst, const void *src, unsigned long size)
 {
+	dst = mask_user_address(dst);
 	return copy_user_generic((__force void *)dst, src, size);
 }
 
-- 
2.47.0


