Return-Path: <linuxppc-dev+bounces-5280-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A86B0A11941
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 06:49:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXw6d2Wfdz3bYQ;
	Wed, 15 Jan 2025 16:49:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736920153;
	cv=none; b=IWxWR1RDcqQXDhfDFPLXKCQHmU5DH3izi++7iEJZs0kGAyDxI62vlzk1K2wEZDX0VDLOIwY2quQY30gOVdsFKwewoF3CKRGN1KMflL4mSy56fPHHO/j130y5D/RVtbztmraW93t/iOv8lf6TyYmMO91LjezJ/r7wc5gGVPL9cl27qbAlzUWCai1pi3ASpBNodb1Fgasy0hN+veZZYK6NoWB7qAYrgbJO04YGsT0/7kYf3zwctL5RckR6kNU+xYl4cxWGu0C7CoutygNPl4Hz3bLS0vVMruoCGtNo4TWIlEm0kWS+tmRZ0SwF8GKCghqW6aDeIlqjSScnJtkcZDZeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736920153; c=relaxed/relaxed;
	bh=gqxfn2Bh8pqSgpWAhYuCaH8o2BUeXgVOaRACTrcmMAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJLj0/69fmXI5UL/wh54mQGIb1/2Pm21g/wY2vp9yweQK6UR3rQfsTwXntDhYh01PQtBZk1Wm5Clp5xKebVEUXPJySFfHDrxZtoMYFS/vaOUn6MTacSDquoZoK/rxjcUUx9RjOQCpM5Dvj1ryxrAgoSgDkxMuDGuvlDE73JOO3nzKgIJsly64hgUDYZXlOx/8vbQLzR0hH1/zNQMsnf70ggqX7nsrj2mrpmyJK88OQ+3s/okG6LTYo3qmcS03Xxx8chQ2zWGiHkWDOw0aNvv2tGnyBSRR+4Ti1EnzxcUTETlHEAyani7O50YiZiGm6pjssUG8InBShuYMOrqjtnoag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Yp6fJBIJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Yp6fJBIJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXw6c5JCTz3bVS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 16:49:12 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21644aca3a0so138939645ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 21:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736920151; x=1737524951; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqxfn2Bh8pqSgpWAhYuCaH8o2BUeXgVOaRACTrcmMAY=;
        b=Yp6fJBIJWran605LMtsa6vpUdZYhJ3LjKpg06SnaGYRLy74MTSug9mVR3dikQCh5eD
         dAx0UT/JOAN4vjEpI0e5jkGylzSTRzpD0iq4z6aDsmrz+t3GdGxz5NfY56tGT2mcOKDo
         gw2ZxaVca+EeGP+2uDaY49EZ1IX5bNjg+KtcZytNQ4iRnZXlCCTvdwMYAXF8fnMOcM+g
         VKuNwqiUEEx61xvaQnHrDLoyYbYWpkFkHzKUrU1ytM0vkt05XbLTqQTqBdXQCSAxIgNA
         atW4TWwNqe665GmtrpDf0p5X9Aw4o3D5jlhjlLWBRcw2bpCm5MD7MesMcFTeUsrvBmqJ
         KKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736920151; x=1737524951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqxfn2Bh8pqSgpWAhYuCaH8o2BUeXgVOaRACTrcmMAY=;
        b=U+v2f+WF7aV9EkBlfzecUCP96mMbQ7tpBFLJGe2NSmir+S1DHcz33O/5FSb/b8vEgP
         bLv4ts2SowbLZuO4q3UTZNm6H2y2mQHbPe/3iwyH7RIExX14OwOwDNzXoHARTp1Z5zRP
         IjXeFWzejuUrbJ9lJ5l14JBeEQma/IQiKIsjBuUtZLSNxsNqnFfbeO7kK0ckFYVW383i
         ErDK953+SyBCz3AGhbD+ubAFd4cene+0Hh9Dhb+5ZUkHkcMfU76izfbCmO2957DTs2YD
         xCLNTUNabPUSl5oGgkSVvj4bGKS+PL1kjNwsOwYaveAjfKrb28tcaW116YYt/SrEaznM
         TaHg==
X-Forwarded-Encrypted: i=1; AJvYcCVomp/L0E4zXH5xQsfFPgFGpK4C3aFo+SQR6u/RHtXHMpXTSBIvS1Oz4DZfFA1Cd8Jhqbjw9uPs8A8ETkM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzTbk5KsdySw2tKVVOKAlbdDbZHKykJkTY1PF8wm1K64so1Zxg1
	RJ+wBAU3q8ZY7ievyVe1YaBCRSvCci5f/zi7zwTekqTyl9tGFBtgeXdAOXsvuts=
X-Gm-Gg: ASbGncsSX/uGKP+fP5UVigZ+EwB7l+P4hFoBbrACnHLAA31hXjKIHMkcsxKplffmuGW
	XmpH4hw47zDBZ6QH5lQpR7bY84+DpstzkmvT8fNY07uFr3+44tTUdcBjjqcFfc1BlGco8fidp4v
	KNOTwhGiVE+5MnbBshJxejxKtvE8aqR3USnUdJGBvSkJrY6OxBvCmA+Yr87V9sMsDCTRhiZhPdo
	AcAcN01cMSXWeUZmSWJzvjrvCw65gkGZhxQ0cFwE2WJXE67m5NEy9Y2A6E=
X-Google-Smtp-Source: AGHT+IGEE8Fm6k+e43goXL9XR3kNG0Qk7QvIMeGK5viYe25EF4qO0xqHuY9x+AzGWdKmvE+R7dTOXQ==
X-Received: by 2002:a05:6a21:1087:b0:1e1:b727:181a with SMTP id adf61e73a8af0-1e88cfd3cb1mr47297876637.24.1736920150754;
        Tue, 14 Jan 2025 21:49:10 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72d406a94b8sm8295174b3a.167.2025.01.14.21.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 21:49:10 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 15 Jan 2025 14:48:02 +0900
Subject: [PATCH v5 5/6] s390/crash: Use note name macros
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
Message-Id: <20250115-elf-v5-5-0f9e55bbb2fc@daynix.com>
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
Reviewed-by: Dave Martin <Dave.Martin@arm.com>
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


