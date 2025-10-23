Return-Path: <linuxppc-dev+bounces-13181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E70BFF2C5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 06:51:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csYWz1l4Rz3bd0;
	Thu, 23 Oct 2025 15:51:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::54a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761177942;
	cv=none; b=SL7niOg5o6ozxsNjBbNcxjwZmPrJo28Er0mlmCRcsFz1QfJOGBLEuj9n8ekFEQIBAk2XyJX3ZYHV20H2MJoHkfv+FiWWPBgU/chuUbVZIKCU/bmSoYsnR9kUse/NP0J5+7qeNNOJLHJVgJ84Kk+VC+rAXDykVi1cDIYhXfDlvrDec0MXLNiomzIgHIfVqbZzQjtxwa+1J5g9+J3AfeTBdMKNZbDqpHIuFGZIQ0aJcGovqUazcgHBkhabozgwLPPJK/jJniBLWsQ+4BT4IZM4TCn+/1I7XKwCLf3SNPe3RF3EeNQGw/rCRnPW2A5w1PEHIV1hgMCsaeOvX8Yc3h12zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761177942; c=relaxed/relaxed;
	bh=W/MB8s8c3Ez/o0yr7eHWLvYpTDaL3lC15NeH1OZAOxs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SdRoFpDK7r9M7oP3y5LV/mRDWJfWJL2Z0OdOtK0rxP7XRfxAHz7PsV27ItWBgG3Mon9KIWDUDJAs7jVG6yENmAL1TYkkoqwO4KZv5O7Vd/SpobuK+ivuft2UjfrgDE6x2/f2gAENt/pZ+fi/aXF78yG5360IrVjayIyn6IMt/thvaH97E5kMMNEw151ek5CweKedE3sc1VVwcu7wJYLse7sbtRu+m+/8w7ymIRwMJzGQEu5EzrM5ZIE7JBGQAIrPXNxNLp9rKr7AyHIJFcpsbrLbKb1NPAGTe0Nq4P9KweRce7j7jJho3HlZCpP8s5HHKqBu4Hn8zz5vBd2QG0xj4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=V1LclMhG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3u3h5aaykdgoscvqgcowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--kuniyu.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=V1LclMhG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kuniyu.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3u3h5aaykdgoscvqgcowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--kuniyu.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csRBY3Hd3z306d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 11:05:41 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6cf50cbd2cso84440a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 17:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761177939; x=1761782739; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W/MB8s8c3Ez/o0yr7eHWLvYpTDaL3lC15NeH1OZAOxs=;
        b=V1LclMhGySXTAohJkdx/TpRT19GeHMaR8RrJOUQX0PUUbCMfYloLsS2S/fZHHyoimo
         DsJvawrEulcBSGymAOP01lPwqUweTBjtGrddddVga5Gh5dplNx3J1K7CIdBCufYnJqUu
         KR7kDmSlXNbRgjc9YrzgAAgOdgQOPh4jCxATuWzM2FJ/mONyBUkS84frO/aRcfOr94zB
         h3GeKKCf1q0XqkTLgmjtfgQDKaSoBEHc/fEVOvBduKv7uGLR7ROWxvQ+iNWwh4aUzSJ1
         86FECUskPcjhQnFeX+8kFOowRPeV1Bk7olDuM3ttVvnvsCaRoKKZVQ84VeoS9zj/owd/
         lQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761177939; x=1761782739;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/MB8s8c3Ez/o0yr7eHWLvYpTDaL3lC15NeH1OZAOxs=;
        b=YzqkDuKgx0Dt80/NeUT3lT8yQhYndX2tHkS9KV+qNL4MFKNkbzZGNlJC6BttWYRFFW
         Y7ysi/1ov4CIMwhVrcIrtF8+fHlEhRSi6K0SjvbiPZxzzEIeKgLNqBqYqdHI9B8yUUK6
         CmRuyR0ym2gxkUK4hypcjqDTAd8yE9DI3lv9a3ENgK9IT2j9Y851fW5amxqLLgfwmRyY
         LBkMQ3GoqsBbt2ZeqSe+9p4i5MC2WJVjjjRClGdnAP/1On1dmmsVCiyNnsLOYBVcn2LQ
         XvI+gOCcA42qlHWmnj/7TDbPMGgGXBrVpXPbXI+oOHoNVEpWbpAg7IK9BempgiM/60Ty
         ohfw==
X-Forwarded-Encrypted: i=1; AJvYcCWyGOsx9GrghBspr5fnrNVL2lFXS3YYsdKbtu8t9tbPoHuDXtskPAkUAhnQvUhxVowiY7Gd/STBxGpov5M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzQbLqFiwlzaRJzsI0FKEeiB5uLRjkvhU05ApxbVC23s0nWToiG
	J29EtuuuerciHkgGtIg1S3AEJzBjflsx49l1SNG1zPgM4KGGj+9qSj5pR4g4lePDwqYaVAkk2xl
	HU0IDJA==
X-Google-Smtp-Source: AGHT+IHd943MEU/q3sfmeNkNkm5n04WovhTQk4e5Fqu5kHZgqjXBaWuFFpabxZxMuUt+TzoW6CCUrGaxrt8=
X-Received: from pjbgk8.prod.google.com ([2002:a17:90b:1188:b0:32e:a549:83e3])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b0d:b0:250:643e:c947
 with SMTP id d9443c01a7336-290ca30e401mr284211495ad.28.1761177939351; Wed, 22
 Oct 2025 17:05:39 -0700 (PDT)
Date: Thu, 23 Oct 2025 00:04:43 +0000
In-Reply-To: <20251023000535.2897002-1-kuniyu@google.com>
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
Precedence: list
Mime-Version: 1.0
References: <20251023000535.2897002-1-kuniyu@google.com>
X-Mailer: git-send-email 2.51.1.814.gb8fa24458f-goog
Message-ID: <20251023000535.2897002-2-kuniyu@google.com>
Subject: [PATCH v1 1/2] uaccess: Add __user_write_access_begin().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Christian Brauner <brauner@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Kuniyuki Iwashima <kuni1840@gmail.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In epoll_wait(2), ep_check_params() performs a bulk check for
the passed user address:

  if (!access_ok(evs, maxevents * sizeof(struct epoll_event)))

And later, epoll_put_uevent() uses __put_user() twice to copy
2 data into the region.

unsafe_put_user() can be used to save a stac/clac pair, but
masked_user_access_begin() or user_access_begin() introduces
an unnecessary address masking or access_ok().

Add a low-level helper for such a use case.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 arch/arm64/include/asm/uaccess.h   |  1 +
 arch/powerpc/include/asm/uaccess.h | 13 ++++++++++---
 arch/riscv/include/asm/uaccess.h   |  1 +
 arch/x86/include/asm/uaccess.h     |  1 +
 include/linux/uaccess.h            |  1 +
 5 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 1aa4ecb73429..30726ce182cb 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -422,6 +422,7 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
 }
 #define user_access_begin(a,b)	user_access_begin(a,b)
 #define user_access_end()	uaccess_ttbr0_disable()
+#define __user_write_access_begin(a,b)	uaccess_ttbr0_enable()
 #define unsafe_put_user(x, ptr, label) \
 	__raw_put_mem("sttr", x, uaccess_mask_ptr(ptr), label, U)
 #define unsafe_get_user(x, ptr, label) \
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 4f5a46a77fa2..910bf469128d 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -437,15 +437,22 @@ user_read_access_begin(const void __user *ptr, size_t len)
 #define user_read_access_begin	user_read_access_begin
 #define user_read_access_end		prevent_current_read_from_user
 
+static __always_inline void
+__user_write_access_begin(const void __user *ptr, size_t len)
+{
+	might_fault();
+
+	allow_write_to_user((void __user *)ptr, len);
+}
+#define __user_write_access_begin	__user_write_access_begin
+
 static __must_check __always_inline bool
 user_write_access_begin(const void __user *ptr, size_t len)
 {
 	if (unlikely(!access_ok(ptr, len)))
 		return false;
 
-	might_fault();
-
-	allow_write_to_user((void __user *)ptr, len);
+	__user_write_access_begin(ptr, len);
 	return true;
 }
 #define user_write_access_begin	user_write_access_begin
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index f5f4f7f85543..9adc8f0dd1c8 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -452,6 +452,7 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
 }
 #define user_access_begin user_access_begin
 #define user_access_end __disable_user_access
+#define __user_write_access_begin(a,b) __enable_user_access()
 
 static inline unsigned long user_access_save(void) { return 0UL; }
 static inline void user_access_restore(unsigned long enabled) { }
diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 91a3fb8ae7ff..23edbaef9f71 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -524,6 +524,7 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
 }
 #define user_access_begin(a,b)	user_access_begin(a,b)
 #define user_access_end()	__uaccess_end()
+#define __user_write_access_begin(a,b)	__uaccess_begin()
 
 #define user_access_save()	smap_save()
 #define user_access_restore(x)	smap_restore(x)
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 1beb5b395d81..a6e32784e6cd 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -552,6 +552,7 @@ do {							\
 #ifndef user_access_begin
 #define user_access_begin(ptr,len) access_ok(ptr, len)
 #define user_access_end() do { } while (0)
+#define __user_write_access_begin(ptr,len) do { } while (0)
 #define unsafe_op_wrap(op, err) do { if (unlikely(op)) goto err; } while (0)
 #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
 #define unsafe_put_user(x,p,e) unsafe_op_wrap(__put_user(x,p),e)
-- 
2.51.1.814.gb8fa24458f-goog


