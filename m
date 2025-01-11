Return-Path: <linuxppc-dev+bounces-5071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 676E7A0A11A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 06:49:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVSJZ3hWyz3cmw;
	Sat, 11 Jan 2025 16:49:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736574558;
	cv=none; b=YAmj8zHP6n27Fzn9POEdUENbMhpB7lIou6B5PlreaJ9XXmC1mVEa8Wb7MOIGbs8ad9qJM3nTS0Ct/21mmekx/PxCUrgPOkRDRHyVgr4Gl8V049T8FJhoyGW76C2d6No1hknY4EA24EOvq+M6lq40TALierLih8r7Jx9zCavDekBiAR7xrlIJjRCdcHvO/VwSh6/OAtXi2ALbShVJcVJm7BBoyghPgUhlkNAth+jaQVJji3R8DKJxlEU5/emX6Ur87eYnQttwTfLbtD07OWCzPW8tHW1VnCuoN1tNKptmMoDCrpNzGP12WCfJqIC5Dg7haP4HIWgWSQFaVZnMZ6oIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736574558; c=relaxed/relaxed;
	bh=NDoGkIZOBZADHox4rebBhOBkiub95NT2vaNCAf0u1/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FusFBzKovanSGUvZyecq9Jo3I3eIHnMEqJWiUPkNNJFeOeiiZN0J7EROhpicXLgqd/n6luNf7uBk2R54/VFCTR08dn1o7epDyoQ6fAqmQybKrzyaZpM0ITNiWlHjF1L8SWkz5EmK1qA/EUA6xh7CtYd1q3vRNDbp54bF68F+FIiM66ssMbrzJGTb77QK95P/i1cudy0zvaicpXnljRZYGEXb8XNJs/xV1hN0GUN29Ipe0bAmTbURwnx57VFnABSK4tSV5HVWOLV8bh4VtA/wffVIkHE2kS3GJxWO63mp+sY1P4PxAmrdoojpq3leokC9k2lB1SSOHVU+csiGYlQJTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tU25/nXD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tU25/nXD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVSJY421dz3cmr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 16:49:17 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2162c0f6a39so67362525ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 21:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736574556; x=1737179356; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDoGkIZOBZADHox4rebBhOBkiub95NT2vaNCAf0u1/w=;
        b=tU25/nXDF5nOCZcKO+HGIqJVBN34t8UC1eFR8re9Qk+5Fm8aL1JdFokvckpgkabkLm
         qe6gENSUKqT6EhP0vpv8QYZzK0u58U+jeLNs51INrYbwtk7CmmzMDe2esW+07b7X5NVA
         41CqgJ5I0TYPXGp3weVH93cyHwL0GXrXuLbmgzDTdHs/CAiZqZ3+rjYhgfWCvkstPmcu
         BXauQyjtCcaKR78yH4amRSlgLNLuSO/x9lo4h3GZXdoUDpG5LUvWWiWJIkbcX3py5Quw
         NSrwP2dlvlkTqzkSO4z0MZa1N2P/tAyP+5YC8yfKGpJ9WunrSB6TSPm+vjOKyG3GEgke
         lcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736574556; x=1737179356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDoGkIZOBZADHox4rebBhOBkiub95NT2vaNCAf0u1/w=;
        b=fS4AcmmWVBDBvx5/9KsVr1VzSkLO/Xr1J82+U3zTbeAON7HmDM90SQc6XE7qw+jYVg
         IHRRErZaMcbKCDi9KzkPCOPeq3SBdr+jMtoD5C5qCVDlfhJ9T2vjQVAPQlvxCfG5Kt0a
         7CRDt7X/wRg5B14TOC7L2vjiH6T4JZReJEkFpDjcHCGjDzSeMjhZpYbOLyV6Sj1No813
         THK8pQR6o1FEGd6ic04U1TtfyVrrxuZdZdD1CLpS4fNrOPQotG481fUyj18du8ua8aPC
         vedzjWMhjOs6c2D5WnGE08yRYakat28ugIOmvvVgEMU7WSZ5RtiAZAAhp+lWrAvYJKih
         X2bg==
X-Forwarded-Encrypted: i=1; AJvYcCUF1eLQXQyD9O5bZUj4u++wqrYhlwMCrNgZISfDLVA14OSO8MQnh6Ay9w34L1uUK4PhpWHpK13H0yd3rgw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx3eM5WLCvqfW3W7fQy4vekEDFQt93jHh9RsxUf1CBHfp99A79g
	+tiqXU1e/FLaaKMKJILx7Q5UTDGjy+dW/f1U3Lgd9jFY4OHMSVhtxQNLoSrj6Rw=
X-Gm-Gg: ASbGnctT7LEwq8Tqa66C2qXe8UjeqziAiytnjKHfPmCajavVn1wUa+VwDhzdgDDT331
	KytWjpGYJa33rqwQm7snb0roGNtfdUYmmbpAkHZcadZpJgG5NajbNRFRVaIZI/UHWiJSZ9baF+5
	/dUQ8oMAIsotcCQvILi2xXNW6XYP+1yqFwf21wLh0Yu1bgYLdmx1Iq5t8xV9CLJFAzGzETGLxQe
	bfCAEdfTyc3HSUhBA5sxur93zIi+tae3YzlTX7N0VWrQzQlv/my4sDo7js=
X-Google-Smtp-Source: AGHT+IGYDl29OCGY4z1owZDP0XWbhTx09xSMaaJapB97QNqOQhHfEZ2TmztXqViOu57Hf/bAEePhOw==
X-Received: by 2002:a05:6a20:841d:b0:1d8:d5c0:ad74 with SMTP id adf61e73a8af0-1e89c89888cmr15576349637.1.1736574556053;
        Fri, 10 Jan 2025 21:49:16 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-a31de806694sm3683573a12.69.2025.01.10.21.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 21:49:15 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 11 Jan 2025 14:48:46 +0900
Subject: [PATCH v4 3/6] powerpc: Use note name macros
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
Message-Id: <20250111-elf-v4-3-b3841fa0dcd9@daynix.com>
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


