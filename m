Return-Path: <linuxppc-dev+bounces-4778-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3EEA03FAF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 13:48:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS9p53FjRz3bVm;
	Tue,  7 Jan 2025 23:48:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736254109;
	cv=none; b=MBZIWDYf4/0ovdn6WGLMtDAdQiLYuuBOxEYaMjYBrR1qXe3ZltMKjpivRDqM3d47OSquDKQirgOiFO+/kncvx2qXwXeD8CwjCa/aewovXvii6iOhG6TKRTtUbbqXGhVc+V5e/DhFxRWU9CfZYWEDHQWjWg3BDk9pKROfSUDTcZb9xNTRV0VBxjv9saXTDGkNUyoYU+OtoCaMR1RDBn9xa/MQ+RYHr7pdmoFPB05ElzM3MXsMrOACpzUPi20EdJZJC6ts/aR+xUdnrp9yfxmUTw1vsFvXLzk8qVr7LMWi0CK1B4ah9Pyl5K/xcOdGecOQrm8b+w9hrLO3iofmnFqyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736254109; c=relaxed/relaxed;
	bh=8B/uoyeuY57p4F5WrCZvdn0Td4esItXL4IJBDCfsGf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkoep1xf72DGCM7jeZ+Lb6Rrp2iRFPA4w5y7NU6/9Aj3QcFzIVbS0IIrPKLyc2vRtAeFgWFE83D8qXCQcyFHOqYZrpDAtKT3FYpxc50qwIVeXx7N7RW3vMPP0QerB1l021RK63zqBQzVyfn7sQJ5dRs6kg9GSZCcWeLRSXuD51Y8Cq+Szlmn7ShifJkTTn/hmj/MW6LFdWvfx8dWj9AzAbgVnt1Jb5Je9rkgfYA9ARSO5cOXjwXcilM7koTc75Wskny1D/3glEpaard+Grcz4E6QnTl/rNgXQS2LirDC4/JQu/yevZVQwRMLG8lWy9Xo/PyqppYZ2XLuuXKLeYMOIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=n+sal+Wr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=n+sal+Wr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS9p43FPHz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 23:48:28 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so22635774a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 04:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736254105; x=1736858905; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8B/uoyeuY57p4F5WrCZvdn0Td4esItXL4IJBDCfsGf4=;
        b=n+sal+WrCXwe6B5IwfQALqhpMSdIE9RDAHE6qSjNIx5JF/P7AqZj0KBOsC2vKzRUgE
         9+2leaAKYFp6+eeJ+LdwmoSRbkdlbH5NDF/NmhMvE0/XsW/a++4agXYegEaCv2DCqEne
         GQzHUImadWWpAToqvWlplLcKsteLfXtvR2gvmpZXzW3H7EFB/9eWYr5BtGFlFGScn2A6
         ugiI7usI3yLDEL8ucxPMIkAK7VS/IBXp9eT3qVxAjuOqDrHWCKJJdWag9K4kcDyLeANn
         1Bo0o+dzrfEF2Bvw7RKztFg360+uEbjc0BsmqDugG9zynV+c+5RX10wd52WMGVrL7uM5
         7qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254105; x=1736858905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8B/uoyeuY57p4F5WrCZvdn0Td4esItXL4IJBDCfsGf4=;
        b=IXkDDPnt+rgGl5R3TM8I3im9JlbjhDb6tQpFUhDMMd6a/85l+UJlmfxlUqCVDxvYIe
         9gkYQ5kIjs7UxYRawW75G/B7Kcdb4fcC2/ae0XdyXQl4uyrGJ0LYM8QlYxUk0bwDDrAV
         KdsS1dmTtKOH+BijewfIWKHMicSHKvtFQ6MALeU8l+WSZYzJieX2YnLUb5U6Zqu/GAl8
         I8kRg7kpssb356PEGKm0IChywzG73JoJOnPH05tVPTF742UP2OcTySZzA7qOOi/NxDRq
         2GqU5kJfmqybCmjnYYD6xpzBXy9SOzNYKHuzNTUTIE6dGcNb8IFEkzswRahCgxZrAZUf
         pWcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDtBGSGGPM5Lwexik4c4QtoQ5Y1excF+4ziuTIkvmHdsw3vbR2OF6BzkAqvaDfB8FpLeHzlE/U4vEO1eM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YztN6Es/LHzF+jDpSMSjKyM5BBSMRsrOCHc4H6b+n4qr73T0Bw9
	V4PARolqsGsLIfxX5Evt8AhHxTcIy+GOGhVp7vGtEbEgQz+klpVaiMynUETGZHQ=
X-Gm-Gg: ASbGncv21E2VNIF37Zw3h6dNfpUO3ijQ4jD3/bkKyH2gPmCZSUDyrBC5d3eDcalyTA6
	sq2qAd2okh/eusAJKDk/AffdNjB/P036EEy63xBWunGJv0kbwL6ipPZxvbuMY9Ob6IVAd/Xn2PA
	KZlDyADWmIcTxObZ8jg7iwrDpUop+juDoCnsmOabkKqRB1ZePN2WbCP4u3AT5DRmae/w/r8sQFj
	a6cZUSIJUzKphVL0tYAZMP33jpqTDf4b78LiQUqJnOR67RZGZF3ZCNAMCw=
X-Google-Smtp-Source: AGHT+IFrm4rj/MLEj5on8APad3buiaiqCoLZIEAZ2AeMT04ViEKVqkKOmnPzjy3rlA6C6aSb7vkHeg==
X-Received: by 2002:a05:6a00:f96:b0:724:ed8f:4d35 with SMTP id d2e1a72fcca58-72abdedda5fmr91700514b3a.26.1736254105569;
        Tue, 07 Jan 2025 04:48:25 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72aad8fd7b0sm22424647b3a.139.2025.01.07.04.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:48:25 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 07 Jan 2025 21:45:56 +0900
Subject: [PATCH v3 5/6] s390/crash: Use note name macros
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
Message-Id: <20250107-elf-v3-5-99cb505b1ab2@daynix.com>
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
---
 arch/s390/kernel/crash_dump.c | 62 ++++++++++++++++---------------------------
 1 file changed, 23 insertions(+), 39 deletions(-)

diff --git a/arch/s390/kernel/crash_dump.c b/arch/s390/kernel/crash_dump.c
index cd0c93a8fb8b..6359ce645756 100644
--- a/arch/s390/kernel/crash_dump.c
+++ b/arch/s390/kernel/crash_dump.c
@@ -248,15 +248,6 @@ bool is_kdump_kernel(void)
 }
 EXPORT_SYMBOL_GPL(is_kdump_kernel);
 
-static const char *nt_name(Elf64_Word type)
-{
-	const char *name = "LINUX";
-
-	if (type == NT_PRPSINFO || type == NT_PRSTATUS || type == NT_PRFPREG)
-		name = KEXEC_CORE_NOTE_NAME;
-	return name;
-}
-
 /*
  * Initialize ELF note
  */
@@ -281,10 +272,8 @@ static void *nt_init_name(void *buf, Elf64_Word type, void *desc, int d_len,
 	return PTR_ADD(buf, len);
 }
 
-static inline void *nt_init(void *buf, Elf64_Word type, void *desc, int d_len)
-{
-	return nt_init_name(buf, type, desc, d_len, nt_name(type));
-}
+#define NT_INIT(buf, type, desc) \
+	(nt_init_name((buf), NT_ ## type, &(desc), sizeof(desc), NN_ ## type))
 
 /*
  * Calculate the size of ELF note
@@ -300,10 +289,7 @@ static size_t nt_size_name(int d_len, const char *name)
 	return size;
 }
 
-static inline size_t nt_size(Elf64_Word type, int d_len)
-{
-	return nt_size_name(d_len, nt_name(type));
-}
+#define NT_SIZE(type, desc) (nt_size_name(sizeof(desc), NN_ ## type))
 
 /*
  * Fill ELF notes for one CPU with save area registers
@@ -324,18 +310,16 @@ static void *fill_cpu_elf_notes(void *ptr, int cpu, struct save_area *sa)
 	memcpy(&nt_fpregset.fpc, &sa->fpc, sizeof(sa->fpc));
 	memcpy(&nt_fpregset.fprs, &sa->fprs, sizeof(sa->fprs));
 	/* Create ELF notes for the CPU */
-	ptr = nt_init(ptr, NT_PRSTATUS, &nt_prstatus, sizeof(nt_prstatus));
-	ptr = nt_init(ptr, NT_PRFPREG, &nt_fpregset, sizeof(nt_fpregset));
-	ptr = nt_init(ptr, NT_S390_TIMER, &sa->timer, sizeof(sa->timer));
-	ptr = nt_init(ptr, NT_S390_TODCMP, &sa->todcmp, sizeof(sa->todcmp));
-	ptr = nt_init(ptr, NT_S390_TODPREG, &sa->todpreg, sizeof(sa->todpreg));
-	ptr = nt_init(ptr, NT_S390_CTRS, &sa->ctrs, sizeof(sa->ctrs));
-	ptr = nt_init(ptr, NT_S390_PREFIX, &sa->prefix, sizeof(sa->prefix));
+	ptr = NT_INIT(ptr, PRSTATUS, nt_prstatus);
+	ptr = NT_INIT(ptr, PRFPREG, nt_fpregset);
+	ptr = NT_INIT(ptr, S390_TIMER, sa->timer);
+	ptr = NT_INIT(ptr, S390_TODCMP, sa->todcmp);
+	ptr = NT_INIT(ptr, S390_TODPREG, sa->todpreg);
+	ptr = NT_INIT(ptr, S390_CTRS, sa->ctrs);
+	ptr = NT_INIT(ptr, S390_PREFIX, sa->prefix);
 	if (cpu_has_vx()) {
-		ptr = nt_init(ptr, NT_S390_VXRS_HIGH,
-			      &sa->vxrs_high, sizeof(sa->vxrs_high));
-		ptr = nt_init(ptr, NT_S390_VXRS_LOW,
-			      &sa->vxrs_low, sizeof(sa->vxrs_low));
+		ptr = NT_INIT(ptr, S390_VXRS_HIGH, sa->vxrs_high);
+		ptr = NT_INIT(ptr, S390_VXRS_LOW, sa->vxrs_low);
 	}
 	return ptr;
 }
@@ -348,16 +332,16 @@ static size_t get_cpu_elf_notes_size(void)
 	struct save_area *sa = NULL;
 	size_t size;
 
-	size =	nt_size(NT_PRSTATUS, sizeof(struct elf_prstatus));
-	size +=  nt_size(NT_PRFPREG, sizeof(elf_fpregset_t));
-	size +=  nt_size(NT_S390_TIMER, sizeof(sa->timer));
-	size +=  nt_size(NT_S390_TODCMP, sizeof(sa->todcmp));
-	size +=  nt_size(NT_S390_TODPREG, sizeof(sa->todpreg));
-	size +=  nt_size(NT_S390_CTRS, sizeof(sa->ctrs));
-	size +=  nt_size(NT_S390_PREFIX, sizeof(sa->prefix));
+	size =	NT_SIZE(PRSTATUS, struct elf_prstatus);
+	size +=  NT_SIZE(PRFPREG, elf_fpregset_t);
+	size +=  NT_SIZE(S390_TIMER, sa->timer);
+	size +=  NT_SIZE(S390_TODCMP, sa->todcmp);
+	size +=  NT_SIZE(S390_TODPREG, sa->todpreg);
+	size +=  NT_SIZE(S390_CTRS, sa->ctrs);
+	size +=  NT_SIZE(S390_PREFIX, sa->prefix);
 	if (cpu_has_vx()) {
-		size += nt_size(NT_S390_VXRS_HIGH, sizeof(sa->vxrs_high));
-		size += nt_size(NT_S390_VXRS_LOW, sizeof(sa->vxrs_low));
+		size += NT_SIZE(S390_VXRS_HIGH, sa->vxrs_high);
+		size += NT_SIZE(S390_VXRS_LOW, sa->vxrs_low);
 	}
 
 	return size;
@@ -373,7 +357,7 @@ static void *nt_prpsinfo(void *ptr)
 	memset(&prpsinfo, 0, sizeof(prpsinfo));
 	prpsinfo.pr_sname = 'R';
 	strcpy(prpsinfo.pr_fname, "vmlinux");
-	return nt_init(ptr, NT_PRPSINFO, &prpsinfo, sizeof(prpsinfo));
+	return NT_INIT(ptr, PRPSINFO, prpsinfo);
 }
 
 /*
@@ -589,7 +573,7 @@ static size_t get_elfcorehdr_size(int phdr_count)
 	/* PT_NOTES */
 	size += sizeof(Elf64_Phdr);
 	/* nt_prpsinfo */
-	size += nt_size(NT_PRPSINFO, sizeof(struct elf_prpsinfo));
+	size += NT_SIZE(PRPSINFO, struct elf_prpsinfo);
 	/* regsets */
 	size += get_cpu_cnt() * get_cpu_elf_notes_size();
 	/* nt_vmcoreinfo */

-- 
2.47.1


