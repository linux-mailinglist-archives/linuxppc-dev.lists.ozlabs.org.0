Return-Path: <linuxppc-dev+bounces-657-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6E6962097
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:18:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtwk8731Gz3013;
	Wed, 28 Aug 2024 17:18:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824223;
	cv=none; b=SrRLvz5oG8/DQToeFvMzHr/20zjiXCVvb60/IgVry8rYdqEsxSgHFtwT71U/Zkry1bjbQXFQ2/vwTC2++bX3P344ZRFbRtQtFNKZHt2aaVRy+C2rrvxlMwqMvOjk84JLngFrVFn7/8a8kbxOtdjQQx7HUw+naLg3EEHltgChheZ2m8FdO4wMHYg0UdIPBIQdEymtQSTCagObcB9WiZazqPJR/8LJxDKmiTeLLPm7oAjY+Ba0VlsiJYDxqTmydcoyKn5C2VxrRLAMVjQH6+hw9WQsP43PYp7LBI6KGwbH+JzV7OSrUvp+eoOlVXxa79oU/wN518gXlZ8aJTJDD/QQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824223; c=relaxed/relaxed;
	bh=n1bnpMYTna27bSqlaeNn9zMkLMdTuL1lgzvNhNTdiTs=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=T7acqMiB+krMBA4wv+zwEWY/yc6T0v3ytp1YrPmHGwJck6T6QwJByMTDOlZKwSvIElw7D4HUtO2nRAr/L70hr4Y3SFUrz0tFsiPPkYtqBule7ZEMPoOB69CaKARpHiC0Q/ozfo/7IM/5OkYXJg+dAEJgW8Xt4DrqjY+icZuukia0CS5IAz/J1vn+W3cI0m92pEnxst8hBvrjtOEXi3RkI1e3+3d9uUWLztQXUN1oos0hz8gWP0orZr2nQC9/UljV5eGlvprG4Gn4QiB7XLo55JFRkemXmcCtEHt8VHfulAJye89J4X1MiLnSXo7NS9bunCymoROKwY63I2It7/Wiqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=haCBsk9h; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=haCBsk9h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WttmZ500Hz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:50:22 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-202089e57d8so1743835ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824221; x=1725429021; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1bnpMYTna27bSqlaeNn9zMkLMdTuL1lgzvNhNTdiTs=;
        b=haCBsk9hwYQjCW4y6bIYIX+M8L2MufRwKCw3YourmK+ENYcGFZxZWFNJMV4cBmM4Dz
         5kHq1P4bIQQtqLAKZLBPdq1tGcej/tJXrCDTGSuFAoW0UpTIKQ3qvi0Yw8IElAddzd4d
         4D+4FrdE98w0j/MC2r+4AZf2M8gYgyiqEu4flBIAvN6gLNX6GK8COYNHys7FDSRph8rd
         PKx0U0hqs+V1lu7U9/3t1i7fOszH5Mxi7+Wp/9MbajJ0uVPTB+mR4/mpnaJAmUOHsmdV
         vidC1hmwsgLk2fkbxhRy/5ukLOIFRvrq5jnnay5aRJixWD+KIdpat7miKEj4W+6VvWP0
         XPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824221; x=1725429021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1bnpMYTna27bSqlaeNn9zMkLMdTuL1lgzvNhNTdiTs=;
        b=WgS7fkIFviHn1QtpkWT57aS4IaCoqe34rJYiWxJB/bpBv20GdAgX6L0AtX5zCZaFrR
         FokgGU6dVoOCRvH83pqEcQQHx3Kf6A0GjYH7smgntMOcPKGKte35otqSCkLLu0/ZfDwf
         ZUmV5/S2W6/hf0mB/gS/L7OOeizKj+D/MMguNJbRCUsyq6C1NIbx9SFcyuUcdxIGjuoX
         tv5fu3WypTdSfYUeRO1o/tChtl5FADn4Idoo3KOklp8LGJas+FEPc9Ws3fKj8btzbgkN
         Km6+Qs8uq9spD6tSCEbAZJQJeP+F1i1/We/C8Jj1CMhZpQa3hgZVd1SZG18Zu9c8aPTX
         Zv2A==
X-Forwarded-Encrypted: i=1; AJvYcCXduU7qMgYG9Z290c5yXZRFa8mqtxVhy4Ou6xQntFFRDymVR4KI+AeEHbMWT8dwKYTnqb3e3WJeLVyGDM0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysUMN5+rN2FVqj4gB2CrUoDduhgOuWrhuDREWtjIFS/NXysQP0
	fCXu4a6fOf2XIEG/tlZdAeHfm4lcOq4NuktkukqfbXYZSiwwgS/dG9zg/kI82FU=
X-Google-Smtp-Source: AGHT+IGQeeMMIWRhlzvEY447u73v0bcDYqggMB4NKbY4CT7iyrW8LbpZG4Gsc+7GkkDRX2iCA5iJHw==
X-Received: by 2002:a17:903:35d0:b0:1fc:41c0:7a82 with SMTP id d9443c01a7336-204f9912733mr19656305ad.0.1724824220864;
        Tue, 27 Aug 2024 22:50:20 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:50:20 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:22 -0700
Subject: [PATCH 16/16] selftests/mm: Create MAP_BELOW_HINT test
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-patches-below_hint_mmap-v1-16-46ff2eb9022d@rivosinc.com>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1906; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=bFLw7L4BlwG3KLICmNgvPIAvf1/5Sm3GeWEQAkx1eJA=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XYnPPfbbPo8yeWL66+yxo/N6BS8nd1/7qNQhsOWpf
 3tQ+KzTHaUsDGIcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEzkdAYjwwau79apS3QeSJmm
 67cdPe+1+9TsAsXmhc0Xrt4+G6VRe5aR4ekEGZPT2yyYhB/f/i4QYfZn696jodpGS1YWP+X48/d
 dEQMA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add a selftest for MAP_BELOW_HINT that maps until it runs out of space
below the hint address.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/testing/selftests/mm/Makefile         |  1 +
 tools/testing/selftests/mm/map_below_hint.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index cfad627e8d94..4e2de85267b5 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -50,6 +50,7 @@ TEST_GEN_FILES += hugepage-shm
 TEST_GEN_FILES += hugepage-vmemmap
 TEST_GEN_FILES += khugepaged
 TEST_GEN_FILES += madv_populate
+TEST_GEN_FILES += map_below_hint
 TEST_GEN_FILES += map_fixed_noreplace
 TEST_GEN_FILES += map_hugetlb
 TEST_GEN_FILES += map_populate
diff --git a/tools/testing/selftests/mm/map_below_hint.c b/tools/testing/selftests/mm/map_below_hint.c
new file mode 100644
index 000000000000..305274c5af49
--- /dev/null
+++ b/tools/testing/selftests/mm/map_below_hint.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test the MAP_BELOW_HINT mmap flag.
+ */
+#include <sys/mman.h>
+#include "../kselftest.h"
+
+#define ADDR 0x1000000UL
+#define LENGTH (ADDR / 100)
+
+#define MAP_BELOW_HINT	  0x8000000	/* Not defined in all libc */
+
+/*
+ * Map memory with MAP_BELOW_HINT until no memory left. Ensure that all returned
+ * addresses are below the hint.
+ */
+int main(int argc, char **argv)
+{
+	void *addr;
+
+	do {
+		addr = mmap((void *)ADDR, LENGTH, MAP_ANONYMOUS, MAP_BELOW_HINT, -1, 0);
+	} while (addr == MAP_FAILED && (unsigned long)addr <= ADDR);
+
+	if (addr != MAP_FAILED && (unsigned long)addr > ADDR)
+		ksft_exit_fail_msg("mmap returned address above hint with MAP_BELOW_HINT\n");
+
+	ksft_test_result_pass("MAP_BELOW_HINT works\n");
+}

-- 
2.45.0


