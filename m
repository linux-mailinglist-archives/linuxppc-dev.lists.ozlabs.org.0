Return-Path: <linuxppc-dev+bounces-5073-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D040A0A11F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 06:49:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVSJs5Pcdz3cl9;
	Sat, 11 Jan 2025 16:49:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736574573;
	cv=none; b=BGPeincMpC7UQLq2dA2NSkaeuvSqK3aWPKzRoWjqJcMCJSuD4hAN/EwNzrsksaZp871yyHcaEnjGFUgb6nd12WC8OOk7KwpxTyeiV2AWm6votImbum8RCsYNrVHQif0yRrS8gINsPPBjdkGEHobtGSQK4gAFGiXYQIhH9zwRAS3Qt1o9f7+AEMsSyxqH+RFK2BGSv8WSQPo+Az9kOF/oBAwoHHPc7lMmJOapNecLC43PScrdARz9xPxS9gduWE/z0RzxH+d8dbprYLlGVwy0dQAWgoVqoiRwJsfredu47pLIUdUNc7MV8AH4UGXVCofZgZqm9NdQa29IEWVnJN6D9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736574573; c=relaxed/relaxed;
	bh=2jKrk3bVYPr7k5YkzhCVfFSlyEMyT0et7JHsh9IpwE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlOQ19TqpwAcZFCIPwnSKEdIG0iqYJIepcwn2trYUueql9y7duSGWriFeMNQiTgKpKzthhNRFoiqR3x5nqJamnqFCZurIfL/W4dxI+L+QFnU8cO2XObtToGWA4t71i56CcXO2+ZJhXVc42LPQqENWJNx44FUeqUsSLgjan6R+Ls7fjJ16Ojb8K2Cs2q4yNlcxal1cs1R6XkWC5t9Zv+gBmgdpanKyZVJ6X2Ka1byYDv3qr0l4xukC7bXrIKaHo7nDRXStUPDYeC8fv1nppgx4NcryhJK8hR6zPaqkrDdOm8QrlAVgEmATeOcssn4tl6fh1M67n2M1Bz24il6o9xODA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=EyBKWhnK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=EyBKWhnK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVSJr5Kjnz3cmr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 16:49:32 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2164b1f05caso47690935ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 21:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736574570; x=1737179370; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jKrk3bVYPr7k5YkzhCVfFSlyEMyT0et7JHsh9IpwE8=;
        b=EyBKWhnK0dz2lSzhfwoxkQuvp7udybbvxGHlLnmUEvVPGpaHe+N14MVKebEWlNclYB
         LR22M2pnX8ABgNny1W5JZ7yGFssJN4c2kIJ2L+EjkPjN8P4wAqyhiJ4LNJc8Nudivclb
         ftHkrObu8KKGyLmVUX8mAozgXYms6qAWvSkUCsS3vHbdl0prMR8IFNiqvCqZpkxj+6fb
         8tOGUNuWH89orJtDGVxE8dhkbf0k5K/cuNwOTUX/K4cIV0pHcmHeTNgOKLk7fC+HtmpK
         zPRVnV4xJg0K4bkncHYESnRMVa9ZpdCgE6V7aZ8e/pnTmKigRYRoeTixn3ZpJUuU7JYw
         ZLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736574570; x=1737179370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jKrk3bVYPr7k5YkzhCVfFSlyEMyT0et7JHsh9IpwE8=;
        b=nbuWdOzQbZUW3GX7EjBAzu70JVHe51KUqI+nyC+x8u9q/slthF9AvtmbZhoQa66W3N
         58xFz5g5dxaRJm2VAxXhQAMCLkePgoHp1ZpkXNbjc1uXbLHTqymlWQ6OEaKFcMiO0txt
         fPZci5BwIn2b0C2ndF5O6YSQdsrnnKrYiSWvf6B3qgUngb/Kca4omcU4ZHYMMDPosd6T
         FNiJrUxLJR0kJH6tFEug6o2kE1DtE9u9nKZeRKlm7RQ3VO88GlWX7igVgThpCvrvFBzw
         Z0+GDqpzfKnV35gEckFe+b30vIfaEqvxb6hhM6aO+J/ZKYoffUszAuAnk+3pzc8ApSdL
         JHrA==
X-Forwarded-Encrypted: i=1; AJvYcCWA+wzwdT4I3j4S39DD2Gl8LfC1RuZR59X/ILteM8us3jOWJ2uKepc4Rca9C5gI5h5FvjklliClTHLfLVA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyu5OCdnJ85jCUixhjtoeW5+AZKXYetd4W2nBTN4wJQqBijMUUW
	O19Zy9z/f6u8N3o5hdd4n1uaqU7w+I92yvKCEQPc8fgQNFdz29DzfYMyrrRg4zE=
X-Gm-Gg: ASbGnctONuQnxhJ8OkbJppJdzBRdP3c/X7x1pemAMfLOuta7WiPd5TbfCjByiEQQIjb
	DaAH51us9M2UOJ4exdrdstazGxT0Ks687lqsjMBRrTJ60hsnLFFEDMPEhZgLi1SWbLyK1iu4zDi
	ff0xgAFX4IbwmxitQzIW/N0KF0hZ6IC6Jipt2hx4DtF0v3MeQYPePxVgPxhYUVokZgme5xioMZd
	ilCkTweQvp3i54VV3Cx3Oy2jjfaUlM8Fgxd1vnZuMFDCXzepqtEirh0jKI=
X-Google-Smtp-Source: AGHT+IF/DO7Xc25oCNYWji4iMt60P0/C5k2sp2lZQdBF9bk3Ar0+kFGVzpELgHH1uV8P5GY4v7KRrA==
X-Received: by 2002:a17:902:e84f:b0:216:410d:4c53 with SMTP id d9443c01a7336-21a83fc6db1mr183636355ad.41.1736574570100;
        Fri, 10 Jan 2025 21:49:30 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21a9f217d56sm21372405ad.141.2025.01.10.21.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 21:49:29 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 11 Jan 2025 14:48:48 +0900
Subject: [PATCH v4 5/6] s390/crash: Use note name macros
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
Message-Id: <20250111-elf-v4-5-b3841fa0dcd9@daynix.com>
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
 Akihiko Odaki <akihiko.odaki@daynix.com>, 
 Heiko Carstens <hca@linux.ibm.com>
X-Mailer: b4 0.14-dev-fd6e3
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use note name macros to match with the userspace's expectation.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Heiko Carstens <hca@linux.ibm.com>
---
 arch/s390/kernel/crash_dump.c | 62 ++++++++++++++++---------------------------
 1 file changed, 23 insertions(+), 39 deletions(-)

diff --git a/arch/s390/kernel/crash_dump.c b/arch/s390/kernel/crash_dump.c
index cd0c93a8fb8b..022f4f198edf 100644
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
+#define nt_init(buf, type, desc) \
+	nt_init_name(buf, NT_ ## type, &(desc), sizeof(desc), NN_ ## type)
 
 /*
  * Calculate the size of ELF note
@@ -300,10 +289,7 @@ static size_t nt_size_name(int d_len, const char *name)
 	return size;
 }
 
-static inline size_t nt_size(Elf64_Word type, int d_len)
-{
-	return nt_size_name(d_len, nt_name(type));
-}
+#define nt_size(type, desc) nt_size_name(sizeof(desc), NN_ ## type)
 
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
+	ptr = nt_init(ptr, PRSTATUS, nt_prstatus);
+	ptr = nt_init(ptr, PRFPREG, nt_fpregset);
+	ptr = nt_init(ptr, S390_TIMER, sa->timer);
+	ptr = nt_init(ptr, S390_TODCMP, sa->todcmp);
+	ptr = nt_init(ptr, S390_TODPREG, sa->todpreg);
+	ptr = nt_init(ptr, S390_CTRS, sa->ctrs);
+	ptr = nt_init(ptr, S390_PREFIX, sa->prefix);
 	if (cpu_has_vx()) {
-		ptr = nt_init(ptr, NT_S390_VXRS_HIGH,
-			      &sa->vxrs_high, sizeof(sa->vxrs_high));
-		ptr = nt_init(ptr, NT_S390_VXRS_LOW,
-			      &sa->vxrs_low, sizeof(sa->vxrs_low));
+		ptr = nt_init(ptr, S390_VXRS_HIGH, sa->vxrs_high);
+		ptr = nt_init(ptr, S390_VXRS_LOW, sa->vxrs_low);
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
+	size =	nt_size(PRSTATUS, struct elf_prstatus);
+	size += nt_size(PRFPREG, elf_fpregset_t);
+	size += nt_size(S390_TIMER, sa->timer);
+	size += nt_size(S390_TODCMP, sa->todcmp);
+	size += nt_size(S390_TODPREG, sa->todpreg);
+	size += nt_size(S390_CTRS, sa->ctrs);
+	size += nt_size(S390_PREFIX, sa->prefix);
 	if (cpu_has_vx()) {
-		size += nt_size(NT_S390_VXRS_HIGH, sizeof(sa->vxrs_high));
-		size += nt_size(NT_S390_VXRS_LOW, sizeof(sa->vxrs_low));
+		size += nt_size(S390_VXRS_HIGH, sa->vxrs_high);
+		size += nt_size(S390_VXRS_LOW, sa->vxrs_low);
 	}
 
 	return size;
@@ -373,7 +357,7 @@ static void *nt_prpsinfo(void *ptr)
 	memset(&prpsinfo, 0, sizeof(prpsinfo));
 	prpsinfo.pr_sname = 'R';
 	strcpy(prpsinfo.pr_fname, "vmlinux");
-	return nt_init(ptr, NT_PRPSINFO, &prpsinfo, sizeof(prpsinfo));
+	return nt_init(ptr, PRPSINFO, prpsinfo);
 }
 
 /*
@@ -589,7 +573,7 @@ static size_t get_elfcorehdr_size(int phdr_count)
 	/* PT_NOTES */
 	size += sizeof(Elf64_Phdr);
 	/* nt_prpsinfo */
-	size += nt_size(NT_PRPSINFO, sizeof(struct elf_prpsinfo));
+	size += nt_size(PRPSINFO, struct elf_prpsinfo);
 	/* regsets */
 	size += get_cpu_cnt() * get_cpu_elf_notes_size();
 	/* nt_vmcoreinfo */

-- 
2.47.1


