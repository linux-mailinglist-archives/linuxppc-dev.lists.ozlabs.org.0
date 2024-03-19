Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6508587F914
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:12:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FNWLF8QV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPbT150Pz3vpj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:12:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FNWLF8QV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPKk5jzRz3vZ7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:00:42 +1100 (AEDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2297d0d6013so307220fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835240; x=1711440040; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtLN1scLK9iq8iGSlvZdRb8xYUKfqrTfHAWG3UXIB58=;
        b=FNWLF8QVkaMRIZrTSQK9PuYvEBk2msk9lqwKYnOYLHN3iBLM9YSPcuGNJ8F9jcyzeX
         rjmCmIkApV7bbRQazV3rDo2QlFE/eVJ5cqVgPt1/RJ3mh2rCWIQzSVDVLCqwEkoGMR1h
         HhPkmg8b/fsJSkmAQt5OmzWz2W0vCRGZ5BYSzrKPy0llL0MZg7cuQElfdE2mBbHmDrap
         q9G7G3u+SjlznxGZ5HFpV5OxVzV/0dicvRIYgeQP7Dn217diIgnxTrCkeXnn42a6XQsk
         uA0IC91YAdhJksbURWJNXwrI56Gdf54LiAOommaIMiYYl+kR2roh9HXc+gvsLSoliSqP
         j48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835240; x=1711440040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtLN1scLK9iq8iGSlvZdRb8xYUKfqrTfHAWG3UXIB58=;
        b=Y1sToqtzjALHskqKsvDTWKwtOZ6CY3v5WcMmulhaANqgukFRNaTqs8IqOf0ShZq93v
         D855nnrgr7+pFPpvSWp9qfJ24bIfCDMS3oWrR8B63TqjtRY8zS3zFaChdzKIivP0Zzqc
         RwDVgiZVRYohISkUuXbB/OjGSnGD6vV7lmE36PuxOpHfz+APoQdF6pqsgvoK4ClqK4pS
         eCDOjsZvhjQkUhyGobeHJMech9eiMYoHdmTz6HfiTtFrc3YrIkxq8PEtuhlkw3RsYKOz
         Fk4N9Khyi+RL64qnSPPJwCtfcA3H3FewbyRbPr4I0bIlVo9VkNRyLfXc1i6Hvm+pdftF
         nZKg==
X-Forwarded-Encrypted: i=1; AJvYcCVWz4qTzOda/8bjhO3NtKCF0lqD7hpQheWnspjB1TVu0PUNAlzL3LLZ6qeILVZjl/TjxzmVgNwknH3S6u4jpT2ZmgzDpVY9KvyJYXzurg==
X-Gm-Message-State: AOJu0YxZWK5pkospcvsBjgM7Oca/IjHpAGC2tVswpXa4bUmqFf3ccHw7
	HeIOXyN/sWp/lO7cffHAAPk1XR66uliuhB9GjeU7lzyRKJXJ8CCJ8aSUx8iAG6M=
X-Google-Smtp-Source: AGHT+IGlWKOKRt3F1gQ7vnh1VTi5A2f1z4cQOP1avw4yFBk9YAoWjGjQRXOfv6o6wGXqph9/37jrtA==
X-Received: by 2002:a05:6870:13c9:b0:220:d5cb:1450 with SMTP id 9-20020a05687013c900b00220d5cb1450mr10380882oat.10.1710835238705;
        Tue, 19 Mar 2024 01:00:38 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:00:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 17/35] powerpc: Fix emulator illegal instruction test for powernv
Date: Tue, 19 Mar 2024 17:59:08 +1000
Message-ID: <20240319075926.2422707-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Illegal instructions cause 0xe40 (HEAI) interrupts rather
than program interrupts.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/processor.h |  1 +
 lib/powerpc/setup.c         | 13 +++++++++++++
 powerpc/emulator.c          | 16 ++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index 9d8061962..cf1b9d8ff 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -11,6 +11,7 @@ void do_handle_exception(struct pt_regs *regs);
 #endif /* __ASSEMBLY__ */
 
 extern bool cpu_has_hv;
+extern bool cpu_has_heai;
 
 static inline uint64_t mfspr(int nr)
 {
diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index 89e5157f2..3c81aee9e 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -87,6 +87,7 @@ static void cpu_set(int fdtnode, u64 regval, void *info)
 }
 
 bool cpu_has_hv;
+bool cpu_has_heai;
 
 static void cpu_init(void)
 {
@@ -108,6 +109,18 @@ static void cpu_init(void)
 		hcall(H_SET_MODE, 0, 4, 0, 0);
 #endif
 	}
+
+	switch (mfspr(SPR_PVR) & PVR_VERSION_MASK) {
+	case PVR_VER_POWER10:
+	case PVR_VER_POWER9:
+	case PVR_VER_POWER8E:
+	case PVR_VER_POWER8NVL:
+	case PVR_VER_POWER8:
+		cpu_has_heai = true;
+		break;
+	default:
+		break;
+	}
 }
 
 static void mem_init(phys_addr_t freemem_start)
diff --git a/powerpc/emulator.c b/powerpc/emulator.c
index 39dd59645..af5174944 100644
--- a/powerpc/emulator.c
+++ b/powerpc/emulator.c
@@ -31,6 +31,20 @@ static void program_check_handler(struct pt_regs *regs, void *opaque)
 	regs->nip += 4;
 }
 
+static void heai_handler(struct pt_regs *regs, void *opaque)
+{
+	int *data = opaque;
+
+	if (verbose) {
+		printf("Detected invalid instruction %#018lx: %08x\n",
+		       regs->nip, *(uint32_t*)regs->nip);
+	}
+
+	*data = 8; /* Illegal instruction */
+
+	regs->nip += 4;
+}
+
 static void alignment_handler(struct pt_regs *regs, void *opaque)
 {
 	int *data = opaque;
@@ -363,6 +377,8 @@ int main(int argc, char **argv)
 	int i;
 
 	handle_exception(0x700, program_check_handler, (void *)&is_invalid);
+	if (cpu_has_heai)
+		handle_exception(0xe40, heai_handler, (void *)&is_invalid);
 	handle_exception(0x600, alignment_handler, (void *)&alignment);
 
 	for (i = 1; i < argc; i++) {
-- 
2.42.0

