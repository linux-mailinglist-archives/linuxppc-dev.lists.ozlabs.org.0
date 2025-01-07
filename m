Return-Path: <linuxppc-dev+bounces-4776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BC9A03FAB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 13:48:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS9nr1b7cz3bTn;
	Tue,  7 Jan 2025 23:48:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1032"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736254096;
	cv=none; b=AsC8RVyTIcxjPizYYchqepAGwQKAkBtXDOWUqERRTbg1fBCIV3lSfCkzV3aZO0wwbg6DxtYikl+XfieZFP25WVwfQ6oNEacTZP3baC402t9zFO2G/pQxtoBYNr5/UDC6Byk+cm1zCShpA8vdjawoK9gt9pubUPK0riNiEOE/NxK1BYFHkkaMMgm3bVpG+cIa11yQnOsTHGyyTM1xp9qeXMhUsNKcPZmgk+CjfKfSWiJB92dSSyDemgE19qLGm4tWFb7MVGs0BWoR3Ra3rey1GdPs0h+/BZqjQRwWXA0ev+1n5KZ4JalH5dZ+Plx3PBdHwJ8eG5kUbLoPeFyTpR+yAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736254096; c=relaxed/relaxed;
	bh=NDoGkIZOBZADHox4rebBhOBkiub95NT2vaNCAf0u1/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QeLng5ZoGe8+5x63sg3D0QXf333OOE6j1L48kibYKgqGf+b206x2JWPeZ2tmbDx+2aGjcirgMXxZ80vdxiXFhEyql8LgVderPp6TiPbkoG0/nnV/H+CKtfPwYrXN0k/p1R5bZ0deu/R/h+th0/cNP87NGZgzNx/q4krTlC+UI6ju4MwKringHGu4Jm7xzJ7sifKdIT6eTS/w1MRGvuuo6LMF83EbnbvNZ+cZTt4Zpdb0BVH4iCbGCOe93N9alAGJeC//kb1+z+7Z0rRZx+Qqf9Jka/xWEEZBCwFzgNfIZf/pWo7xdmgY/1qPpNDD+J7uecpQqHMDL64Nb7xOMuIfrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=sRI4Z+lS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=sRI4Z+lS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS9nq2Kycz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 23:48:15 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2eeb4d643a5so22990186a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 04:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736254092; x=1736858892; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDoGkIZOBZADHox4rebBhOBkiub95NT2vaNCAf0u1/w=;
        b=sRI4Z+lShYi57tDAFXZpKVTvXXyBsgpqKl/a2koY0ZF9pwx8Q/uOP6eGSdVctzeUuR
         Os8FfebIeJbH4U6MIOSMM4avFBq+fbQ23+DYLqGQL+VeJqKvrhYdiHJn1IHr+h7WkDJe
         w6nMFAlc9qHhLeim8xQhe993pHOaMHEvCvCT3eI4gKtAqTbWO5sk5NDiHD0BSV7MB1ih
         ZZhAM/JPJYZOAXGnK2ql5Qk9gTbcO9Id/VxWXSy4DqR6hfxhM3gh0ZLSdGxIqER7UNI1
         NmZWCQXBQ8ZQ61pwifLIkE7AmKIsbYfoIx18DxIArkPR8YQonZUCDgF1HfZJNkzbxIOz
         fH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254092; x=1736858892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDoGkIZOBZADHox4rebBhOBkiub95NT2vaNCAf0u1/w=;
        b=GxSIRXULiVl0TybN+Vo0dghg55yVjBkt2QjNee9ucVivYgtyKqiIFqks3t4Yqznudu
         gmEVnOwKyX/cwog21hiVs5Yx3Q/2BrpI5n9fhWrg4AbZXZ1/Ha+NR8UEb0Pu2dOARUW9
         zKxauJojUWu4Opp8vsr1O8KOr2FdOA1+g9Dxpi4QzohFNDFlAghSIKGc11hk6soYTVgx
         T6cVErvHEhaMJqu/P2KgOYuMjy6FJYt8uRCJB6XRMISZkOaqmh5EmtwRblVxeGhSr1GY
         +R37C/6QzoQlHAQvPFIZ3mqrZI53nyf2VuDKLGo3SjcP94LNL6FG0evX2Rbg0sGUL9Q7
         my/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUU0X2Ljnz3Oe8+/r9o1loN7QDuasZxPP3BNUuDz+1tJcm0EKUkWdXvDeEel5L8f5DU8ORupSqHEULtzgo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyu66C/0Xo9i+UCs/r/neqSBpZZrRjbkbGcVZXjU3JG3fJpZIzf
	irmPuqaz4nGCVdI7/kHhKP1JYsce1xasVJbE9f7GM/GGq/f5nwtca9UHvIqxh6E=
X-Gm-Gg: ASbGncs0DWzO1lPc4CQHeuYIOrpMh330L9yzZxKqvq4mBIOL6QLwViOquFwggMUYUSB
	QZpSj071j82r67+SHkOQ6sdIhQMGJswlk7p/Xa5fu38K6ZSLV2aecTLtyo9Cls3Sy7SDLGbDRlZ
	A4XXK7DO7G9/pnFSoxiIEKJ0r7Hs4A4Ut5h2CqHhIaI1HCmQICFMDTITWuGQF8iBgppLLleYO1c
	RRe4TLggDlPAHcmlCbYuG2vjEPLqvpZgKT6UHld/d7/uQAQ194TO3UcpzU=
X-Google-Smtp-Source: AGHT+IEVKBP005EvKmW5Tl+CNM3WgQ4gF7V3wiTUcNw/Hf4GbFW1YRz6KtZiTE3d5Nc2ByQmLcCTzA==
X-Received: by 2002:a05:6a00:240d:b0:71e:6b8:2f4a with SMTP id d2e1a72fcca58-72abde04f6fmr85408908b3a.12.1736254092437;
        Tue, 07 Jan 2025 04:48:12 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72aad90c133sm34268685b3a.183.2025.01.07.04.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:48:12 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 07 Jan 2025 21:45:54 +0900
Subject: [PATCH v3 3/6] powwerpc: Use note name macros
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
Message-Id: <20250107-elf-v3-3-99cb505b1ab2@daynix.com>
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

Acked-by: Baoquan He <bhe@redhat.com>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/powerpc/kernel/fadump.c               | 2 +-
 arch/powerpc/platforms/powernv/opal-core.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4b371c738213..d44349fe8e2b 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -751,7 +751,7 @@ u32 *__init fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs)
 	 * prstatus.pr_pid = ????
 	 */
 	elf_core_copy_regs(&prstatus.pr_reg, regs);
-	buf = append_elf_note(buf, CRASH_CORE_NOTE_NAME, NT_PRSTATUS,
+	buf = append_elf_note(buf, NN_PRSTATUS, NT_PRSTATUS,
 			      &prstatus, sizeof(prstatus));
 	return buf;
 }
diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index c9a9b759cc92..a379ff86c120 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -149,7 +149,7 @@ static Elf64_Word *__init auxv_to_elf64_notes(Elf64_Word *buf,
 	/* end of vector */
 	bufp[idx++] = cpu_to_be64(AT_NULL);
 
-	buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME, NT_AUXV,
+	buf = append_elf64_note(buf, NN_AUXV, NT_AUXV,
 				oc_conf->auxv_buf, AUXV_DESC_SZ);
 	return buf;
 }
@@ -252,7 +252,7 @@ static Elf64_Word * __init opalcore_append_cpu_notes(Elf64_Word *buf)
 	 * crashing CPU's prstatus.
 	 */
 	first_cpu_note = buf;
-	buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME, NT_PRSTATUS,
+	buf = append_elf64_note(buf, NN_PRSTATUS, NT_PRSTATUS,
 				&prstatus, sizeof(prstatus));
 
 	for (i = 0; i < oc_conf->num_cpus; i++, bufp += size_per_thread) {
@@ -279,7 +279,7 @@ static Elf64_Word * __init opalcore_append_cpu_notes(Elf64_Word *buf)
 		fill_prstatus(&prstatus, thread_pir, &regs);
 
 		if (thread_pir != oc_conf->crashing_cpu) {
-			buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME,
+			buf = append_elf64_note(buf, NN_PRSTATUS,
 						NT_PRSTATUS, &prstatus,
 						sizeof(prstatus));
 		} else {
@@ -287,7 +287,7 @@ static Elf64_Word * __init opalcore_append_cpu_notes(Elf64_Word *buf)
 			 * Add crashing CPU as the first NT_PRSTATUS note for
 			 * GDB to process the core file appropriately.
 			 */
-			append_elf64_note(first_cpu_note, CRASH_CORE_NOTE_NAME,
+			append_elf64_note(first_cpu_note, NN_PRSTATUS,
 					  NT_PRSTATUS, &prstatus,
 					  sizeof(prstatus));
 		}

-- 
2.47.1


