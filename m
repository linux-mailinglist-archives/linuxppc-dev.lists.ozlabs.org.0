Return-Path: <linuxppc-dev+bounces-4669-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41282A01782
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jan 2025 01:28:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YQdTY02R9z301Y;
	Sun,  5 Jan 2025 11:28:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736001551;
	cv=none; b=MOxt3Ec93zqHa3jcrLxh4LzD8hzCuOQ1CZ9vyNcD7EaoVtHJ0KmULWNHkjE2SZ4gy7jgBoFDIovEba6aJBZhJ8srsvyWV3qQvvu5wMU+d97xXD7Dsnj2VNopV11nXliqBvoN/N3cgLu3PRbFo/D6juRsdCKFx/lm8FXxXS9l6+uWJe25bpcm/HhskTOL8W8FVo0pW7jRB/whLma/ZjwgU4HxjtrUPWCF2ZJqhz7JEP1Ti9lE5Xl7t2nKaXlTOaDNjsXKGYC8b3BxQoB8NxFIk8z+woL6cZkM3tQ95L4tJbpY/zJpIgzqsXy9Szv/lVG8OfgO21V0rqfriPo0IqGaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736001551; c=relaxed/relaxed;
	bh=SYIrxPsAVLm9525H8KmJlUUcKlEHI39WEeyICf7u0AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgMH52q92GBsIC685AOD7wQGeQFIEg5x098JOU4FVYqOX+ZL1gIxxqg++IJiB1QIGXFHoCm144rJnq72TEpoKhtPFzxhQoq0l38wZ+U88DsBb9/VQJpKs59tI/VVX7bF5r6CxXenyNGJ1CMFSvctxPHkWJo24zVKiVQNNEPc/EZqIsyp7LCF4VWNT0W8ehPNA+NN49+3vIayRaSxVd9WgEUCV00wKBYuphXzvEdMtbAFRLJYvvZ1FdkXDC/Uw2sJthY5bFbGY0tm0waXBguVja9VWdWVhcaAaeq2fCeMnajgZTRRLJ6Dp86JVWCAeLNNvLxHVIkVihjOFUYLiihESA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=a61Cfk4W; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=a61Cfk4W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YQNPB4HnNz2y8c
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2025 01:39:10 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21675fd60feso242682865ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Jan 2025 06:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736001549; x=1736606349; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYIrxPsAVLm9525H8KmJlUUcKlEHI39WEeyICf7u0AY=;
        b=a61Cfk4WNyi2B0pJmVyajL6VriUGXytPHYv5DmO52PQUEsN2H+FE/IpMZbc7CObQis
         UCMqZzWK9aZk8l8RcO2dLI9yahQO/2jowqmKzbplSHL2CLyBynScljgTHC8djv04jFto
         4cxUzVTkDtOeNGEmAYWO7SmizCmtbX8N/pqJoMXnOKR5QrlzzXzg2dMdfmMq2il7TgEb
         ja98QeEhhkEgu3cHnh2lRb13Nm3sm3lnkU4Jfua/mGNLEnqpGhRX5DNHSFLm16/Z9u9n
         BAUYeVC4S9PoInxLAbRvHc57BSC8G0nqqnLTRlwZONO6Etv+zjZgglZCNZygwOPffD+u
         mEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736001549; x=1736606349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYIrxPsAVLm9525H8KmJlUUcKlEHI39WEeyICf7u0AY=;
        b=W/vEfr/XSQEniIUmxkCGaQtuVRGQCRtI3WoTDOfRSz9TGZpE5OjOBZhLnsdclFWRV5
         sUvyP0gr+q3sxqCie0bTzjJ4PdrJghzT3gQHzbF5CiBgBAPzZfjGmzkc3r9FXja+ilB8
         lb0ZVmAbgbdhdirmVpNgCwJUa3p6i72qKW5EuTBOySKCu2T7OU6ty1njveKMktKzb19d
         P0MEmLsTbtNA/gIMh35JeP700FwIxXn3AWl0aCzLHImZ8KKZ9iOytQjEGVyJRyndJ/a8
         6DeOFAyQNi4Akrdl868yPlzYdnxQFBGL79RtRpNdSSGPwVc6A4t8B61+2dG07odEK4ap
         e4ng==
X-Forwarded-Encrypted: i=1; AJvYcCVx00DtTgDVhUZH14QYndp7TLZcYOpzoGXxIDCGMlylXIWGH2ug4AeE9LzITeREvq/36aSxnvoH/EAiY+w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz5MPI4V/UI3m9Veo6BkDvC2Z9RieGF6S4BQAv0pZ1tQDkn92tt
	HAUiongH8mwxl4rtXnePoq/EhvROGU5xVzFwqw0h4psmpWjPAUgKI4bsX7oHdxY=
X-Gm-Gg: ASbGncvsUWCSZOYWWLao+Mc9ut+/p1EdkQ6BSggckfSdjgMcsbbjuRriX+h3KrtTsqv
	/OlncU+/EklhbT+x6chWIf6ncoCUiNV0v5TiFTfxTpUJhfAG8GO1BGzPQjZpMerT0Lh2M+TlBtt
	hczPBxzzo/18ktC7wCVp67Hu0zQLmG5W4qXV1OuVBCpI8Orx5XiRAOUCeuCbyp8SevBzFK4cHYv
	tt12KEpTXyiSZ9w8bMF3Bx6GgziUdPx6KYTPXA6wzwyRCtnR7FyaYkb6gKw9Bc=
X-Google-Smtp-Source: AGHT+IEy84cJ3h5ytJvCxSHHyFyZN9d/gzxb3RlphGjioGS1LvEPzNOYZA2OsynrQSHDV4AjG+98tg==
X-Received: by 2002:a17:902:db0f:b0:215:4362:bc76 with SMTP id d9443c01a7336-219e6f29827mr814402335ad.54.1736001548953;
        Sat, 04 Jan 2025 06:39:08 -0800 (PST)
Received: from localhost ([2400:4050:b783:b00:4952:3c52:120a:27e9])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc963103sm262510765ad.52.2025.01.04.06.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 06:39:08 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 04 Jan 2025 23:38:37 +0900
Subject: [PATCH v2 4/5] crash: Use note name macros
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
Message-Id: <20250104-elf-v2-4-77dc2e06db4e@daynix.com>
References: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
In-Reply-To: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
To: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Dave Martin <Dave.Martin@arm.com>, Baoquan He <bhe@redhat.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 kexec@lists.infradead.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use note name macros to match with the userspace's expectation.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
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


