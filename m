Return-Path: <linuxppc-dev+bounces-5279-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F28E2A11940
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 06:49:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXw6V57Kqz3bXH;
	Wed, 15 Jan 2025 16:49:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736920146;
	cv=none; b=Ynx1WfkyWXPZMNkSAtzK4hVXIujrzqIf499Gnp5DDw5Ys2QNW4a/ePErGqR9nd17jpiYj+6qXTNW5QR6k1XvkgqRLxplMXtLPkEP54cRh3CrdOaA/7aXg0yVUQuxOJuNQPjtiLKSzvb87HkjEjBRCj3HX1hsORn4/1Nlg77NQ3yHjiEIhdJFEIdGxfvo3WUxbBMGFOM6JifYyrC6tl/rcRoMPjTZReOxRCi4bXb4T06bnoBoPblJmw7RRwCn3+XTWy84Nuw4Jmw+VoGydozDLzyxeVA51l7Hra/gvHDmiHp5Lw1yhfqmoY6U8farpfTeCNYd7c+17Ofx2kkuUOfIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736920146; c=relaxed/relaxed;
	bh=D7R1Z0m4AmDiEDGrwLKGXNpW3g69MQHysWRaDTZFxP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jc5YEbfQMRPXB6HJSpzcAIzWi8HzQJNjugnXuA3/LOw+e3gIvqrD2XHD1ZIybSyYky85grpQ48GN9kchsY4zbomlA3PWFVH84wkDR8zo/dGxIczW+XQ/+VTuyb9SqKqJHoKy4CYyHvUNNSqwe2r40Pai1oj5you6RsiIFTsx1LmU4L66XAXylGmCQr/5NpvMrerf4bv7fU5w31vrKzUNmJAOlrRgqFqxWLoiSOtBFQL7Edxr8oNb0lOJcK5A9uvVAXtoJa7KitFAJAGwxKFmCkXgPdmvnBdpj08oCfie29XKCsYA55lVefP+sJtxt3DS+IQxB4TR8ADZ5MKAN4c85A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=p5jeki1Y; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=p5jeki1Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXw6V04nhz3bVS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 16:49:06 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so7914632a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 21:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736920144; x=1737524944; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7R1Z0m4AmDiEDGrwLKGXNpW3g69MQHysWRaDTZFxP4=;
        b=p5jeki1Y/AZ/RmCS2ZY85LtO2YF/FeB/grUQn7pyTvV/EdMchxahLQPL1GdgcWt9iF
         me4fIGoPyJpFhB96EF4wkIwF2D5MqXyJ0eyYjgPqDWKUUkKeQMZCV3Qj2QKJtA+z6mHL
         /mmmxd9W2kdCNaNObn5YRWz94irYULRpF9rnQYtzHUjsD8651/o6IVgmapSenKHN4uCI
         9DBhgT14MDQBcPcA7hyExfBhSs9IBG4LYILHS9cW0ppbHLzjfaIRKek4dudS7tNT8BjQ
         WCmKXl+BOw1r5cepKbFxQf5SmyKD42RqEOju9mIRyI/3PLHTJEctM7CNjmx0oAlVasCy
         P+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736920144; x=1737524944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7R1Z0m4AmDiEDGrwLKGXNpW3g69MQHysWRaDTZFxP4=;
        b=eoLXLzN3WUYzIGTtLyvqVu/ZQfrle8RzFtxrho49/b9gMrErnq5iw+5LCNt9GPx2L5
         uGxdfO8BambkljbWwmgGXBfmaVbImKLo+0I+bjnaH0ZV7nWFiG1EgD9CVr77HfZyn5c8
         JtWd5D+65NPittimH4wKd70U/ReN5IyCagF0wgAS6w26EdXo5g7Y1aWTf/q9eT9g5q4R
         6bcliwlxBXAJ2JL9LKXrYEdZhtpYZnzlHgNmjRbG+vUtckT+9PZqfBh4rArPmjyJrOM2
         FwTDZPAejbvTNPRFb/iUQPm/GuHCXYt8yMTRH5Kyzx3z2zc1eG/2N0EjEg5P3q16wLVU
         TS9A==
X-Forwarded-Encrypted: i=1; AJvYcCWVpjaO6AzvOA95Xf8T2n2KeS5m7v7vRq0Egla+aqy4TzM6EWYNoMi120+Qb72V9UvKBV4NyVm53u5JJqk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx8FhLgYnu1RrfpPwjfYnyL0Te0tKf/gdrBFYGtI9Lesny+CIp5
	djIyqs81ZaRvsPtbOuAs7u2IY3vrhz/y8dy810zxqwKrjCJUTqA8EUz8xl4uF1c=
X-Gm-Gg: ASbGncu0f9wRVfO1+frZ3j5SltMPXhJQh7mex3toOcVjhxMmg7g2NW+ShK7wPi5YQHM
	4aU5MjLp2HBZRiPhNOHCm1JHvS3IuYRyIGOhNeindFICqqOUkTMRiILdDIgZY33p3hrCmXHSIAC
	rpyzmPI+3o+o7tS3Z2rk+RmBf3D71rsPUiUBop2NybCgzPGkDQ2PQid0hyrdsvx7N+nfkkO1vBo
	yAN9B0fkYG7qegGpwCwuHgpbn11O3SQ6DXfM395E6AqxBHfn9vMUzjnFEQ=
X-Google-Smtp-Source: AGHT+IF72SLq1My1g7dtb+6XlMl4Y+R7t/efbYmDZTCYwSHPEhtpwytSLWotlhp9pmcuYRJ5nSVCuw==
X-Received: by 2002:a17:90a:dfcc:b0:2ee:ad18:b30d with SMTP id 98e67ed59e1d1-2f548e98f31mr36439035a91.6.1736920144269;
        Tue, 14 Jan 2025 21:49:04 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f7085261dcsm1516002a91.0.2025.01.14.21.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 21:49:03 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 15 Jan 2025 14:48:01 +0900
Subject: [PATCH v5 4/6] crash: Use note name macros
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
Message-Id: <20250115-elf-v5-4-0f9e55bbb2fc@daynix.com>
References: <20250115-elf-v5-0-0f9e55bbb2fc@daynix.com>
In-Reply-To: <20250115-elf-v5-0-0f9e55bbb2fc@daynix.com>
To: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Dave Martin <Dave.Martin@arm.com>, Baoquan He <bhe@redhat.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, 
 LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
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
Reviewed-by: Dave Martin <Dave.Martin@arm.com>
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


