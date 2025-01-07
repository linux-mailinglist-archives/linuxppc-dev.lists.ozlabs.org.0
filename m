Return-Path: <linuxppc-dev+bounces-4775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B61DEA03FA7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 13:48:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS9nj2KPtz3bVS;
	Tue,  7 Jan 2025 23:48:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736254089;
	cv=none; b=l9fdwbyi9pv5lR3S24YizhGAMRTOyX+6ou/0qv08tBSJfL5M6JMUt0qsqJcYS+rMSpoHOuY4IYh3hRG/bDFqjLTEMF8Nli39vrOfWyTW2SunpUF43cMF6msbhnG5AVcvaBcB7eiunVLvQx1O3IzSdsz9DskbEKTPV6SA9i0SgMXc6vDOOBkUOgB0Et11+RxoOxPaakmzYpeLRw5cxsrlEzA8EnoeCCgKKFtO7Gs+YLBquB47/VI96rA3xbZ+0EK3ho79KoYpwfGqGqoBaokwj0QdxG8yYe3Oh3MgXnki95i4VoeNNdZNmiDCVcZ2/B0n+8v8LQ5PGpPoa+uzIGIsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736254089; c=relaxed/relaxed;
	bh=To6WceQOVEAdrv9VIwdrgLUfIkfIZojfYpt2+tcFAZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KGC3asnhqneDB9UZOo6tRFHmXhe10Q9nV0qN9BzrITkPZkD4js4kMeP7Tty5tYPAevN8STsEl8NVu6c86m5HEj1s54d7Mss32Gs4TIgOndHgoKNiwZ6mkYQIpAxDvyqN+egOYhQNxD03VpXzaFJNcRF1BxKC2nGzlNNOabgjIM6jlvnSLUMZBkRiAORxkDwY4mt/rF4mZcxIev1EbPEahAVa0wpu8eMoeqEVxErvF+Cp/mWkgJ+39R3wSPBQ9a9IhrD/ta2qu0MN08OvqXwY01z0ElMtJ44wGc15og3UXmK+JPj/JaF3jdrVuMcnSqizD7W2pNAAGTFnc2QpSoDw+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=RTuxtl/R; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=RTuxtl/R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS9nh33Jcz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 23:48:08 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so23006413a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 04:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736254086; x=1736858886; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=To6WceQOVEAdrv9VIwdrgLUfIkfIZojfYpt2+tcFAZE=;
        b=RTuxtl/RkHKG6bEGS97aDgDbuuInEvgr2wEnmPYHyWy5LQGw3gIzMace1N84y4Qaye
         raP88BPkvU1uYIALwPoqpCMeIkZ3jzw97ZfTk3Dp8LNM0wye/D/wY6Q8PtyLMQ4sCooc
         inmkcQdTKe6UgMcwIYKLVVcCR580lAi93JcvfnNLbMAcWy4voQrsdoAFuV/EIDfSaQMz
         pNURmf+ZYj+BIApmkX8su5sGy9Wik/sm2IJsgLsNgRmfjm//VQcrScjsguJ2486gNuH/
         12OkTwqyROfFS3fawj915CJrfIEn5IJm5RrdbDisSX2Fx5+6TWngPoqsc9YPDLVrRQlZ
         4itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254086; x=1736858886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=To6WceQOVEAdrv9VIwdrgLUfIkfIZojfYpt2+tcFAZE=;
        b=hmCHDPE889bII7iNRGlQW8OPmaIyJ/NcFdqLlVs6I7o8Ut2aSjXjVBGFQ2fTVS0O06
         jksSHIPQHNbQPz30QRvlVQU/GVZh9ij2Ycz82g8j64XU7UAofMsTnD0D0lLl5SPuXSZN
         pIpXpMX41n0zntTqmKoX0NH2f9SM2JUHhnYNqulj2t6+h1lBlFmwDvoKHF8on1SbRfLO
         +1WSwDp+AKmXO8SBE8GncQPpTb7LAreeQeZaL+PKnAwAdA5KNLBpRzSbXlkLA3hmwHlL
         INW95NxTbqfE4BdIfFlYbSuX6gzyIzQMY3mj364xGMERc+lFQdDb5mdfxqqwNXWOniS+
         6hgw==
X-Forwarded-Encrypted: i=1; AJvYcCVEE9VDgkxgXoo6rwJvn8xx1dKtF63aUlXq0ruhUTNVXndBN1mG/E403VoLLbxTGu1kYJ1An2w/QHxK/LQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz3CzdSVDwmBPieAKzZBb95D2qE3fF/pqU+6wcZ56yLClPFwjsE
	+dnzNFFtm5sKU8IrJTO1JXl38pZcM3Bx4kcY6vv1UHIFENz2t7XLn8D4rMkqvP4=
X-Gm-Gg: ASbGnctBlv4KbbV9KMv39l2OfYSIt+NrngVoI0Vhz7GDZwSzif5STn/sMQFqxAFLdmw
	vrWWpAA90tEdLzbWaOwpqvLb5YLxxKgJKnWWtF+ah95tFTw84KShpVKWorDDsvBGwSb1rG+VeOi
	5z+85JpCZxN4Q/xeKHWnjzkYWyUgB9jbgBKVUD4XSeK0czc0Ls8AcBP/evaOEI8OI5goPcBnpo5
	zx/YHgEK01Tij403wYEJYV9nEn9ofPdvgp8bvMZ8g1bXkZHYOb+qJeifU0=
X-Google-Smtp-Source: AGHT+IHmQrtd6DArE28HS9MI+ljcSHS0URGz6WZZfYPdopYVfnKvqXeHpkFOcVWEZed1yb1h138/0Q==
X-Received: by 2002:a05:6a00:22c2:b0:725:ef4b:de33 with SMTP id d2e1a72fcca58-72abdbe4de8mr79321688b3a.0.1736254085564;
        Tue, 07 Jan 2025 04:48:05 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72aad90b338sm33355957b3a.174.2025.01.07.04.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:48:05 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 07 Jan 2025 21:45:53 +0900
Subject: [PATCH v3 2/6] binfmt_elf: Use note name macros
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
Message-Id: <20250107-elf-v3-2-99cb505b1ab2@daynix.com>
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


