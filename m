Return-Path: <linuxppc-dev+bounces-5070-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E77A0A118
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 06:49:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVSJR6h0qz3clL;
	Sat, 11 Jan 2025 16:49:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736574551;
	cv=none; b=F6pUAGqpGka4NEjDeJ1te/vGHwWjqh9XAXPZDXKsL6wW7xVploXQ/daIAIbv5+ludfGLmr2m5jyMOKjalL/mlL64pdzYhhUE5pGiKo/0annnqNAaDg8Nfd67YR1Tsgxs9m0e84vV1vv1UtrJ5Prw08oBUKPpOGu72W0ruI5VgsSbBTumfKEixqcXy4mACEaE2lcsAm9/ugM4LkvvQXVTiDX4U4flxIOVnt14q41DtvWIbvDhX/RUALa+5mlycBC6mAliDrUBfKndEmNXa8rLQikLOz7twdkP/jmkyY1ZpPRVJdWRIFgpZObeZWfvbN8Mn1MGYaCq5x0ZurBXbS1LMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736574551; c=relaxed/relaxed;
	bh=To6WceQOVEAdrv9VIwdrgLUfIkfIZojfYpt2+tcFAZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=esEgrZfT2GAq2JEJjcOhQBPGMZN7V2m0Joh2j3Ct5aRsc1Av2TcdeMOYPxAAWuTJY52RcyDRfX6BkVvf0EOSDugCIpfynXIm5KB6uP/5cQY44jTmDIRw9SWbMss1p0wvR1j9a6UQZud9hbO1jecxnPQpj0EHWl9R+BgWEKUbihzYe0jVsDxGmLeL08GY+wq6eki/AT2B0y7gpv8jQxyeTvH//o3T3v4y1whxZruOalIma3s2mYTgOmVmuNx1aowmDyZQxsO7ZCuyJPsxag61tXU+Lbep/XnkAwFLI7FuxHcLGZHzW1eKpmo9lZRQTw6UnE9adACXmgphlblt9nyuEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=JkkhYG0K; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=JkkhYG0K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVSJQ3yQxz3cTg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 16:49:10 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21654fdd5daso45194635ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 21:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736574548; x=1737179348; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=To6WceQOVEAdrv9VIwdrgLUfIkfIZojfYpt2+tcFAZE=;
        b=JkkhYG0KweFLSqEO6SOSUxUown6OOb1sIM0eqncc27fiB0zcUadqdSQPChd25mKv6s
         y/K9ElzSJbYbSJynb45zBm02RURIFIju7WiG5jAE39voZW69j+ldfHJ/kZ/uEDT8xn0b
         YnUAwhd7anHRfbuQy7GXqKtgFSm+67NoCrGlSokQ2tiy2tgybx5XPIl/v/v85i9SuFOF
         68o29Sqe+i83odEQ1UKhsNjN04IEc3hA7kYIXv4H6URA3lNNMQk4YGbKzfIutfA/4HCg
         FzB/WOti2F8yYSBfl1fO0nupqPTsbDbxQd/D5D8feym5q3ZycCzuBgjfBzV8VkktawJe
         4AYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736574548; x=1737179348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=To6WceQOVEAdrv9VIwdrgLUfIkfIZojfYpt2+tcFAZE=;
        b=HzvBFRGeK9sSx38yBYxHxgCa5eZNwfOpNvCbnZLloIGKnMiQuv7tUwUsFn4ytQTfpw
         CtPzV90Oh9dNY8AG5b5L1AEfc8QcvqsfVbF/48j6np7cjlEjGEEz+wwYxukprGTpy68e
         eVgHEwHIr0Rb/pltH8Rfq5D2aXf/RYjdL1EZF+IBD9BFa5JixTv4N8X0sqslezZFdOet
         jkdxnJyMFumdc5A+29sngzo/i1T+7v2bXNeMFDP+nsjbC4OommEjbC+3+stFo3z9ZOGi
         hTuCZcYFH8qW/9yjQIk7pl67eNsH/qM+bJTgCEJPFeE7EENLe05kgRlJGbAvomGkOwNW
         nvcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxIYDJsoO3xK6CC/yKwGZ9IpJ9f17TiJcVuhao3vm3cz3LNmKu55GFd79gyZOx8rJ0l/3WBArMi49IRDY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxTVwW4eYdJDAxH6AoYo96Nf2iFGtazET6t+sAoxWGKAog3LUEw
	3FQv+wkZlcETnG//ooAFfpqOwzErql6A4RImqjQFoiDHvKCGPrEldAwRc3iG2Ws=
X-Gm-Gg: ASbGncv6VYrEF4LW2puh/rm+NDpqqe71dBbUi3UucfpmOuW8M6prlQU8uJFg9z/sqoU
	vA4KVwbmaLkmF0LI7ITFTv0Oaxx/EpRptvOQPLF9GZGLemoH/5c++TUf50iXubCa3u6cTSwFZBE
	AWj4PQ7VNw9dV7TdQabPGJRCD7OOLlUZrbFDt8MiOSD8UdEGlphwZmHHhErvf7iZZMS9FiJTVIA
	+6VobGbf1KDaexoQvKg0eGxmpxwIWFIu5jeSyuz3NRRCRWmKcY2DcgWQ6Y=
X-Google-Smtp-Source: AGHT+IHn65rwbd4gKdhst/GRdULarDOSLx1cuK1RthFbVp937QpJuhXkw/qwAunKCMjt+dsCYzpTGw==
X-Received: by 2002:a17:902:ecc7:b0:216:760c:3879 with SMTP id d9443c01a7336-21a83fdf2d0mr185892965ad.46.1736574548582;
        Fri, 10 Jan 2025 21:49:08 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21a9f22d293sm21144365ad.185.2025.01.10.21.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 21:49:08 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 11 Jan 2025 14:48:45 +0900
Subject: [PATCH v4 2/6] binfmt_elf: Use note name macros
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
Message-Id: <20250111-elf-v4-2-b3841fa0dcd9@daynix.com>
References: <20250111-elf-v4-0-b3841fa0dcd9@daynix.com>
In-Reply-To: <20250111-elf-v4-0-b3841fa0dcd9@daynix.com>
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
---
 fs/binfmt_elf.c       | 21 ++++++++++-----------
 fs/binfmt_elf_fdpic.c |  8 ++++----
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 106f0e8af177..5b4a92e5e508 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -762,8 +762,7 @@ static int parse_elf_property(const char *data, size_t *off, size_t datasz,
 }
 
 #define NOTE_DATA_SZ SZ_1K
-#define GNU_PROPERTY_TYPE_0_NAME "GNU"
-#define NOTE_NAME_SZ (sizeof(GNU_PROPERTY_TYPE_0_NAME))
+#define NOTE_NAME_SZ (sizeof(NN_GNU_PROPERTY_TYPE_0))
 
 static int parse_elf_properties(struct file *f, const struct elf_phdr *phdr,
 				struct arch_elf_state *arch)
@@ -800,7 +799,7 @@ static int parse_elf_properties(struct file *f, const struct elf_phdr *phdr,
 	if (note.nhdr.n_type != NT_GNU_PROPERTY_TYPE_0 ||
 	    note.nhdr.n_namesz != NOTE_NAME_SZ ||
 	    strncmp(note.data + sizeof(note.nhdr),
-		    GNU_PROPERTY_TYPE_0_NAME, n - sizeof(note.nhdr)))
+		    NN_GNU_PROPERTY_TYPE_0, n - sizeof(note.nhdr)))
 		return -ENOEXEC;
 
 	off = round_up(sizeof(note.nhdr) + NOTE_NAME_SZ,
@@ -1603,14 +1602,14 @@ static void fill_auxv_note(struct memelfnote *note, struct mm_struct *mm)
 	do
 		i += 2;
 	while (auxv[i - 2] != AT_NULL);
-	fill_note(note, "CORE", NT_AUXV, i * sizeof(elf_addr_t), auxv);
+	fill_note(note, NN_AUXV, NT_AUXV, i * sizeof(elf_addr_t), auxv);
 }
 
 static void fill_siginfo_note(struct memelfnote *note, user_siginfo_t *csigdata,
 		const kernel_siginfo_t *siginfo)
 {
 	copy_siginfo_to_external(csigdata, siginfo);
-	fill_note(note, "CORE", NT_SIGINFO, sizeof(*csigdata), csigdata);
+	fill_note(note, NN_SIGINFO, NT_SIGINFO, sizeof(*csigdata), csigdata);
 }
 
 /*
@@ -1706,7 +1705,7 @@ static int fill_files_note(struct memelfnote *note, struct coredump_params *cprm
 	}
 
 	size = name_curpos - (char *)data;
-	fill_note(note, "CORE", NT_FILE, size, data);
+	fill_note(note, NN_FILE, NT_FILE, size, data);
 	return 0;
 }
 
@@ -1767,7 +1766,7 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 	regset_get(t->task, &view->regsets[0],
 		   sizeof(t->prstatus.pr_reg), &t->prstatus.pr_reg);
 
-	fill_note(&t->notes[0], "CORE", NT_PRSTATUS,
+	fill_note(&t->notes[0], NN_PRSTATUS, NT_PRSTATUS,
 		  PRSTATUS_SIZE, &t->prstatus);
 	info->size += notesize(&t->notes[0]);
 
@@ -1801,7 +1800,7 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 		if (is_fpreg)
 			SET_PR_FPVALID(&t->prstatus);
 
-		fill_note(&t->notes[note_iter], is_fpreg ? "CORE" : "LINUX",
+		fill_note(&t->notes[note_iter], is_fpreg ? NN_PRFPREG : "LINUX",
 			  note_type, ret, data);
 
 		info->size += notesize(&t->notes[note_iter]);
@@ -1821,7 +1820,7 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 	fill_prstatus(&t->prstatus.common, p, signr);
 	elf_core_copy_task_regs(p, &t->prstatus.pr_reg);
 
-	fill_note(&t->notes[0], "CORE", NT_PRSTATUS, sizeof(t->prstatus),
+	fill_note(&t->notes[0], NN_PRSTATUS, NT_PRSTATUS, sizeof(t->prstatus),
 		  &(t->prstatus));
 	info->size += notesize(&t->notes[0]);
 
@@ -1832,7 +1831,7 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 	}
 
 	t->prstatus.pr_fpvalid = 1;
-	fill_note(&t->notes[1], "CORE", NT_PRFPREG, sizeof(*fpu), fpu);
+	fill_note(&t->notes[1], NN_PRFPREG, NT_PRFPREG, sizeof(*fpu), fpu);
 	info->size += notesize(&t->notes[1]);
 
 	return 1;
@@ -1852,7 +1851,7 @@ static int fill_note_info(struct elfhdr *elf, int phdrs,
 	psinfo = kmalloc(sizeof(*psinfo), GFP_KERNEL);
 	if (!psinfo)
 		return 0;
-	fill_note(&info->psinfo, "CORE", NT_PRPSINFO, sizeof(*psinfo), psinfo);
+	fill_note(&info->psinfo, NN_PRPSINFO, NT_PRPSINFO, sizeof(*psinfo), psinfo);
 
 #ifdef CORE_DUMP_USE_REGSET
 	view = task_user_regset_view(dump_task);
diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
index f1a7c4875c4a..96bd9d2f23d7 100644
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@ -1397,7 +1397,7 @@ static struct elf_thread_status *elf_dump_thread_status(long signr, struct task_
 	regset_get(p, &view->regsets[0],
 		   sizeof(t->prstatus.pr_reg), &t->prstatus.pr_reg);
 
-	fill_note(&t->notes[0], "CORE", NT_PRSTATUS, sizeof(t->prstatus),
+	fill_note(&t->notes[0], NN_PRSTATUS, NT_PRSTATUS, sizeof(t->prstatus),
 		  &t->prstatus);
 	t->num_notes++;
 	*sz += notesize(&t->notes[0]);
@@ -1415,7 +1415,7 @@ static struct elf_thread_status *elf_dump_thread_status(long signr, struct task_
 	}
 
 	if (t->prstatus.pr_fpvalid) {
-		fill_note(&t->notes[1], "CORE", NT_PRFPREG, sizeof(t->fpu),
+		fill_note(&t->notes[1], NN_PRFPREG, NT_PRFPREG, sizeof(t->fpu),
 			  &t->fpu);
 		t->num_notes++;
 		*sz += notesize(&t->notes[1]);
@@ -1530,7 +1530,7 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
 	 */
 
 	fill_psinfo(psinfo, current->group_leader, current->mm);
-	fill_note(&psinfo_note, "CORE", NT_PRPSINFO, sizeof(*psinfo), psinfo);
+	fill_note(&psinfo_note, NN_PRPSINFO, NT_PRPSINFO, sizeof(*psinfo), psinfo);
 	thread_status_size += notesize(&psinfo_note);
 
 	auxv = (elf_addr_t *) current->mm->saved_auxv;
@@ -1538,7 +1538,7 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
 	do
 		i += 2;
 	while (auxv[i - 2] != AT_NULL);
-	fill_note(&auxv_note, "CORE", NT_AUXV, i * sizeof(elf_addr_t), auxv);
+	fill_note(&auxv_note, NN_AUXV, NT_AUXV, i * sizeof(elf_addr_t), auxv);
 	thread_status_size += notesize(&auxv_note);
 
 	offset = sizeof(*elf);				/* ELF header */

-- 
2.47.1


