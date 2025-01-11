Return-Path: <linuxppc-dev+bounces-5072-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8F1A0A11D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 06:49:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVSJl37tPz3cnZ;
	Sat, 11 Jan 2025 16:49:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736574567;
	cv=none; b=N7Q5F6tpSYPe1Fb2jszBFMzmrbQwR2lYL3gpZEFggPiwy0DjcuytVH2GPeB8xsVGIwePwFbw1qdMFKOxYWOV0Z16i/jBeFciU/lxi9xHcjd9FlZG23+Lzg6zfnSv4EozCIFsjI1SoiNv9cZJzxfcRPZ0ZJ1utqrw1G+uZe7wX7a01LUJmYycjpfkVxYr+2JwhknS1MtDA9mOLdU6cnh+a3jXCKfaozPlFF97gDkAqH9AWkjyeHAczW1ll4xTQLhYyb/iHhxNqi3rtDdypWJNaSG+2lrjIsrSpY0m9egGFvz3s8x/z4DPUBqGzzbqwr0W4mvU3GWv9YbER+Bpqld51g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736574567; c=relaxed/relaxed;
	bh=d5w0df8A0RGvduNGo/n7gECMAUl7ttjM0kfw51R7kHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mb3394tZ9FAoDMNH3ZsiNdfsRGJPAoF7e1YjQls5Ek4SmP5i8/5mXkoYIhkLtsFchhmNCqePRplDX/WZKAAc6LcgqSi2p8TQhhVVgGXkdimeHlVGjHXxpL6GRrvmmZg7+TWgyog32q74amitxzuF4cJAvX7tq184lQcPLG68Hx7+rJdFXrKvzmHse4C8dc1w4bjI2jbFUqutoahaHEZ6ypr95LTlYSTQAKzwSzmyVGR/uEWxifrRiev1mCUWUzBxB72hApKBREQUdy4eY4PUPeTQXu9RMWUQSd8EvOvgLiC6dauM9fCqZY4n+BnW0YY6TYKqzQqeW4HTspHs2YMJLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=w3GB72ke; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=w3GB72ke;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVSJk34KXz3cmr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 16:49:26 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2163dc5155fso49762795ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 21:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736574563; x=1737179363; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5w0df8A0RGvduNGo/n7gECMAUl7ttjM0kfw51R7kHo=;
        b=w3GB72keG+UgvZg889/Eq8f3gQn/wtVsvtxp2GSkZhIVIM+0VEvykOfjbo7wIPMfV8
         IPSuzt6z7xwSSJXt5LqKrVUgbNIG71bSrO/r6vdgrlezd3KUcHa0NOpS1ijlicftCmSS
         zDjasLSQbpxWDeAvXRmrlAeH1y51jX37aZdr/YBycJmjylljHClLyYX1yD09mETrxmZY
         k3yeupsE7ws0dcqJwWY0QzauK8HUQisvg+sBEkVpIEni1omwCLxwvuecwRIGyUIlWvdo
         GThxoHCmC6kGnX3upvznybdSBmhbbe73qsYo+i6+lJ4wEFqnO8xlTajmmBpOJwiOKkuc
         otnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736574563; x=1737179363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5w0df8A0RGvduNGo/n7gECMAUl7ttjM0kfw51R7kHo=;
        b=rRaPhDuXcSRH7tz0H2KXBPSxkA7rCtsxKxbzFwwKwhdBkJ9XfqeSQN7mTV1uYPD9j3
         Zj1BnB3AMWM7F353I/mFZdnDovehR0/ll9VkEi+McALqwTbx/l48ERBPpRQXDDEVpYUv
         oeZsxsptgqDp40L+4pcgbcqv6At7Ohdt0LA0PBtPWzUWTS6ZTOt/KcPD7PWjczBuOrrg
         9KqcdePmejOQjoJX/XKR36QS7j4A8wDLv5W2sazapx2eIbrmm4o6Pue8Aw6oiehk5cCS
         rJylk9tb5jhttFNARCQdJSo/uYdxrt1J8QxmhIh2KFSVNRYsGx9FIXe269jGtsWLHq4j
         grFg==
X-Forwarded-Encrypted: i=1; AJvYcCV7nxI4HhOnnsXS7kManrnzmjc5Vmc11jpcbs1Ga4VfQbcN853DIEeQMppIZA/rPBPIUgtqIq7LTHKoBbw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyt/BjWedzCLDmuz+e4CkSRuLK5ARhUm/O5YvyQezxtGqVpsB0y
	pXpAkdUmNqTlVbwzbzlQ8ER1LqL8U+yUihjNpgpDKUWOoGmniccrTWhlVGuwDSU=
X-Gm-Gg: ASbGncs2F40VSqsnpCeuXvkQjQd6QNonGrKsAtF+9pbrlVVZ/+jPCvUeJ5zS121tCev
	hptfoofFpYhy1V+gDaEqsi23pJgfv7TPjxoPtVrl7xTiTIAifaScDQKP4mDLrrkA00+/y0l1GRW
	bKkrnotizEezvvaY9Qus3mvO8aKMW+vsLC2z2+hmoPB+KcHc8TKXnLgmWm7YcdiSPPBSNADMHur
	M91ubSxu2i9t4Uj4nce1yuEtoBN6fMH910ZF20sRyqbTJ+4+kOvQgWwJMU=
X-Google-Smtp-Source: AGHT+IEOaK6BOPAe/MUGiXyl+EyGiYmhbaq4qeXiFxMDU90Px7X9OtnxNRV5Ifu8FHX6K2PPpo86xQ==
X-Received: by 2002:a17:902:d4cf:b0:216:3466:7414 with SMTP id d9443c01a7336-21a83fcaafdmr208931985ad.44.1736574563492;
        Fri, 10 Jan 2025 21:49:23 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21a9f22d0fcsm21166295ad.161.2025.01.10.21.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 21:49:23 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 11 Jan 2025 14:48:47 +0900
Subject: [PATCH v4 4/6] crash: Use note name macros
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
Message-Id: <20250111-elf-v4-4-b3841fa0dcd9@daynix.com>
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


