Return-Path: <linuxppc-dev+bounces-4777-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 033EFA03FAC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 13:48:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS9ny1fDRz3bSr;
	Tue,  7 Jan 2025 23:48:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1031"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736254102;
	cv=none; b=OlW0A2Z4hD4gMURYqFgAjT+ByH7bxkCiJVt6sD1l0298dYpetLMI1AD8LU5Sjv5lLfNZfq1yW8kWnE+ZBTw/nzSRobrQ+bOztfrEIF74CpDOEDVyY4XVGnmZfJDZC6j+FAY6gqL+xZmMJE7wepSH9eEsCckO4t9vbSeT6MOVP39QwEqGXg8a7VoiL1Br5fO+mkBc23mmVwye6/o8JY2oXALadoMd1ouwoFR+DcxnxiSrX3vpUmVg2ggmzPUeLPz5U843LCKLoOtovNj1g9EM7N1WlsO758hUT0isG/p4F22oRXeP4EwsLMK+NBKRFhEaA3+rL1kggvJjchWO4srmyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736254102; c=relaxed/relaxed;
	bh=d5w0df8A0RGvduNGo/n7gECMAUl7ttjM0kfw51R7kHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNe67DgKQgse7RQVd41U3Ly6/rV/wJL87Lqsq0kvlrHoxk4e0dyCOl+/14PPyO6tHv+ey4iJKUt6qJNPC1C4ivtgak3ouxi83g0E9T97jI08cE72ynuKZjfdmcEm+O8qOGgVKLs5adCTXcxv61QBHpqY6E+CU1MLSZzII8kFQFvsnVUI5nmx21QyQEX5U4mIZu6VZc+SjRwJZEezjBchiW4iLYG+naeDTWmMW/aIoqbdauKZEoPKqW8ul2IPSFo7KwFQDF7AMDhlVg5C8TtEzo+kRU9/lvUhNeKmXId4nXCqdVmwTZk5HrqqHZchDq1rLlLFzZIqr28PW/rGGvO2uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tbFw+hvP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tbFw+hvP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS9nx1j40z30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 23:48:21 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so18415837a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 04:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736254099; x=1736858899; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5w0df8A0RGvduNGo/n7gECMAUl7ttjM0kfw51R7kHo=;
        b=tbFw+hvP6/06jvLUsX4ZvYQOo+y/kMuMmC5Mq5NxDD0xA+fShmKSBtYdVAhO7U+429
         JZ/7PGmTsUhmNMXUTFrqH+Dp7wgLPJWHUHCDV5mUhHsLjW7bC9ycZn+6hiL+03KUto04
         uNV4b0jNjxNYbnQDo7/UpDGcWsQS6FQQcP+oSlwzJgMESJrXWz1fUpwajVNHzy0C7tPU
         j1BdXy/NABoDOcdVUsMTCzass0gtd/mQZvAutyig6dhtxKZQC+fngs9QHYQYHI26GPxz
         xu0SF9jvEIq1R8MB2XJzqRJlHsjzbfG2z5ubwBPTzv3v0++clfO1fMzqCbTilnyHMgMa
         +2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254099; x=1736858899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5w0df8A0RGvduNGo/n7gECMAUl7ttjM0kfw51R7kHo=;
        b=I5v1bQLFpbEN40N64wBKh4DHm+dItSoyMiWl77pqgJ+xQdB7FLiE0b8KSv6UgyfktR
         w9yAY/e9fQBEuWkHRgaXm38FK1Ed+qwLKNiT5PVWAx+ofMt+pMtQUNfYqOMRDgOUqycG
         WyQnOu8eiur438HPEUFX+JZ9vinkkivtKOf8zdgSJbgZcwlqP/WYmnoNWSsnDk43XS9I
         S+mDyt3DD5BwLj3hSnzzo31+2ildydU3d3IgEnU+IoJhp+oit/kyeWLPm6f2EX/36D/m
         4o9OrfRSVghLTZwfyAe2rqQDoaIOJrLluZ8HtpQvcXM1+HDFvM2vqzYuZ4YdrJxH9Hnf
         PzMA==
X-Forwarded-Encrypted: i=1; AJvYcCVMvMnq4zKIybCNNI1rdFnnGCcTprXGK3EKfhOjyeaGwXGwM96wRpqL93nwcN9s8uo8ujk8zURLQ760bw8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwiDut8Uynv6JlebbqWRqvx3tZZ7kywPor2Bql8G8NEwXc0tV8B
	R2CUYvjnaIphZX6lOLYrpmAMdOeMkjpj4O9chIiL5WxNjrNxkrzz+VC+bFULP1I=
X-Gm-Gg: ASbGnctCK/8BBc8cwAu5MN0qS3UECBGafUSwGsYIDUomP8LDKKAO8JokpgRxQ6r3g7U
	nLri8WxxtnXSU2eVvW9TxDtfQmpeQ5DoymX8FSINAKzmpK6HqGpBGuaCw23eMkYG9gqqAkDRKr1
	hHoyOhuKWV2wrd3dlvBBR8P/goDEYZ8vKhfzhF8tBFNLB7SlN6a0+WHhg0SYK+h3a2y27k/EdRu
	ozClIubzPOnGfhWKJ/+beUHbsTX/i+txmkPcqFrCjKfRxcSpSIKoAKNqvM=
X-Google-Smtp-Source: AGHT+IF4unLvSG3ozl/K+xZg50qJ9RhkOXYw+z5VR9QTjd55CxK7F8LQeDMLqnNt5CS4t8mxmL2QoA==
X-Received: by 2002:a17:90b:534b:b0:2ee:a127:ba96 with SMTP id 98e67ed59e1d1-2f452ec6d35mr81063623a91.23.1736254098937;
        Tue, 07 Jan 2025 04:48:18 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f2ee06dd46sm41574100a91.36.2025.01.07.04.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:48:18 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 07 Jan 2025 21:45:55 +0900
Subject: [PATCH v3 4/6] crash: Use note name macros
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-elf-v3-4-99cb505b1ab2@daynix.com>
References: <20250107-elf-v3-0-99cb505b1ab2@daynix.com>
In-Reply-To: <20250107-elf-v3-0-99cb505b1ab2@daynix.com>
To: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Dave Martin <Dave.Martin@arm.com>, Baoquan He <bhe@redhat.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 kexec@lists.infradead.org, binutils@sourceware.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use note name macros to match with the userspace's expectation.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Baoquan He <bhe@redhat.com>
---
 fs/proc/kcore.c             | 12 ++++++------
 include/linux/vmcore_info.h |  2 +-
 kernel/crash_core.c         |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index e376f48c4b8b..e5612313b8b4 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -34,8 +34,6 @@
 #include <asm/sections.h>
 #include "internal.h"
 
-#define CORE_STR "CORE"
-
 #ifndef ELF_CORE_EFLAGS
 #define ELF_CORE_EFLAGS	0
 #endif
@@ -119,7 +117,9 @@ static size_t get_kcore_size(int *nphdr, size_t *phdrs_len, size_t *notes_len,
 
 	*phdrs_len = *nphdr * sizeof(struct elf_phdr);
 	*notes_len = (4 * sizeof(struct elf_note) +
-		      3 * ALIGN(sizeof(CORE_STR), 4) +
+		      ALIGN(sizeof(NN_PRSTATUS), 4) +
+		      ALIGN(sizeof(NN_PRPSINFO), 4) +
+		      ALIGN(sizeof(NN_TASKSTRUCT), 4) +
 		      VMCOREINFO_NOTE_NAME_BYTES +
 		      ALIGN(sizeof(struct elf_prstatus), 4) +
 		      ALIGN(sizeof(struct elf_prpsinfo), 4) +
@@ -444,11 +444,11 @@ static ssize_t read_kcore_iter(struct kiocb *iocb, struct iov_iter *iter)
 			goto out;
 		}
 
-		append_kcore_note(notes, &i, CORE_STR, NT_PRSTATUS, &prstatus,
+		append_kcore_note(notes, &i, NN_PRSTATUS, NT_PRSTATUS, &prstatus,
 				  sizeof(prstatus));
-		append_kcore_note(notes, &i, CORE_STR, NT_PRPSINFO, &prpsinfo,
+		append_kcore_note(notes, &i, NN_PRPSINFO, NT_PRPSINFO, &prpsinfo,
 				  sizeof(prpsinfo));
-		append_kcore_note(notes, &i, CORE_STR, NT_TASKSTRUCT, current,
+		append_kcore_note(notes, &i, NN_TASKSTRUCT, NT_TASKSTRUCT, current,
 				  arch_task_struct_size);
 		/*
 		 * vmcoreinfo_size is mostly constant after init time, but it
diff --git a/include/linux/vmcore_info.h b/include/linux/vmcore_info.h
index e1dec1a6a749..1672801fd98c 100644
--- a/include/linux/vmcore_info.h
+++ b/include/linux/vmcore_info.h
@@ -8,7 +8,7 @@
 
 #define CRASH_CORE_NOTE_NAME	   "CORE"
 #define CRASH_CORE_NOTE_HEAD_BYTES ALIGN(sizeof(struct elf_note), 4)
-#define CRASH_CORE_NOTE_NAME_BYTES ALIGN(sizeof(CRASH_CORE_NOTE_NAME), 4)
+#define CRASH_CORE_NOTE_NAME_BYTES ALIGN(sizeof(NN_PRSTATUS), 4)
 #define CRASH_CORE_NOTE_DESC_BYTES ALIGN(sizeof(struct elf_prstatus), 4)
 
 /*
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 078fe5bc5a74..335b8425dd4b 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -436,7 +436,7 @@ void crash_save_cpu(struct pt_regs *regs, int cpu)
 	memset(&prstatus, 0, sizeof(prstatus));
 	prstatus.common.pr_pid = current->pid;
 	elf_core_copy_regs(&prstatus.pr_reg, regs);
-	buf = append_elf_note(buf, KEXEC_CORE_NOTE_NAME, NT_PRSTATUS,
+	buf = append_elf_note(buf, NN_PRSTATUS, NT_PRSTATUS,
 			      &prstatus, sizeof(prstatus));
 	final_note(buf);
 }

-- 
2.47.1


