Return-Path: <linuxppc-dev+bounces-5086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 827FCA0A7F4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 10:22:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YW90D6Qc2z2yFK;
	Sun, 12 Jan 2025 20:22:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736615603;
	cv=none; b=CCy2rtTOIaLPdFtQGKPhx64O5W1YaLSf/LfKp5H0VXVopvNJkGDUayRsf5wLMDgqXxzSR1CvsxkuijDwdx+fMNwFH2TA6/3LcAc2yOe4srj9rkOpGf1J2cFwzpYdSR4HiQa2IvRHA9tc3pxdbvYyrwWG2l66RibuEPfCUjwvJMo6A1YRJFCsQq3o/c0e+LbBSKyYyZMJV86lvRLkXqZ0ESAK06Nhpy8Ish9bbb75j3aoJB0ctS16FUXs7IjdA3IpYU73tHXjFb6Z/f96GwRDOmprZm6WGgs6BakP1eX54T8NKWY+/lJ4Df6vFs2twlQnDRvPNoRgdfCUcthK5XhA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736615603; c=relaxed/relaxed;
	bh=QeeiiJberKqp+MSuQnxPBfH4/FsnHt7yucRyT35nN7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NfLslPM58AkU+XTXll1rkLVFyYkTTSugNjsdHVWrLQoLYdWSAOPMfhespfBoeepPH+rkMFnA1y/Q6GK3zvTmzR21erwCn003bbP0BPqpzgkMpWe6rlMHz/E+A6BMWfv63lvCPz4o8GVRtRBo+4QQMd6/AHAFOjkvB9qUR7upPy22srQGLYxLo7eHWs8xa5g9wdMCAu9vcl7/CWXI5wW2an1Hf6TcmXGkqqgZPaHHtd5k5nJMTLjSGC/8hwbWACp0Cc+Y92Ehf1UwkBu0OO7pGBhOkonspUL9qvEuOuCxrZvjRyM976u3IJNJa3IciGlZrexJflzcdu+L/9zH08R/Pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nq4WTb26; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=eleanor15x@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nq4WTb26;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=eleanor15x@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVlTt1m0Hz3c9g
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 04:13:22 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21680814d42so42608865ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 09:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736615599; x=1737220399; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QeeiiJberKqp+MSuQnxPBfH4/FsnHt7yucRyT35nN7k=;
        b=nq4WTb260BiMLU3nMjFt6nKPRmciax0ez4YJ1ajUpy7vQ81KCso88BCrEv+JQrNdqn
         O+fHALWXvhW6+gMBe1eIqx/h/SH8Y8pwJcewaIOhMQC8g7O13FSKn2LQD7wcg9PWB/1J
         S3Ka1nGbM4HYr6/AoKoydbZx685YcYB5AQBXSGiPe8GTUqyb1uPPrdTyFZwKij1dJcSi
         ylMsPdaSZtJJOACbmS29dxhWVwSacHMLVm8NwZLYhpItujEqDoIaa7pdydIEvScl6K1t
         P5ObgC+adRE+7f3IPl0cCRy+eNGJR13JEC1NDZpT8XQMEnmEtgV1n68/Joq1D7cIS35S
         WMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736615599; x=1737220399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeeiiJberKqp+MSuQnxPBfH4/FsnHt7yucRyT35nN7k=;
        b=wnRDXWiGnRXGMZQT9YgSe22ronqGBE2ZENokgAtV8qQBL6KDVHQm0iSoLz7KcNQ2Mf
         9nU9OJbcJMJMCs7KB2RDxuh+DRQLJaksBmk1XE/oWiNinJ+dNG9MikcDmd7Eiv2WBzfx
         ZLbYd3/zW2gmOFbMa72AL2YjEtwUH6FAKA73lExERzldtbokCKRMJ+JL6jV+evC2RSDi
         V41fSBLbTpG3zH502gyZKE6kmXdgEfzJbFcI5p/WXBObIqNOShTR+zbbeV4rnoUzJjm7
         upQ31ZKIUK1MkoWFucfQD+Qq+8HPthtA2MU46fRZbBoU4ZDMdthg7eFwGs40XvlD/hBp
         FwkA==
X-Gm-Message-State: AOJu0YwIKqvGXRqk0jlJt9LoT6ueQKJZrWKrUavO/3Nlgkz/EH/ET0Qy
	HUetTUNLqp0GGMkKiiIKtZesJALE1U0w8jdOXbjdJn7p0nNXGgA+
X-Gm-Gg: ASbGncsmLXjhiZeBy9r38cD7YmpQMAF+Aq8ztPzT9EsYETYkaZe7n13s9JrCZaAcZ/p
	kWS4H+cdfDxYsvjFHL/zbK9BRRJAefCtXrnIak51zKKfIU1VGNuMi3p/Q5v7+u4qo+spKqqceR1
	zYnWjiBCZLcPxvGFUYf7pMZbT2kFTVi0abKe1M7uA/dJHQvhhZ3NOjwsxMNJUvPmwjMvOBnMMma
	k/9MMgzggbaUPRGivWwCdXi+aTZ8o2eJrwgZojlKfe/Ku1hYNKUqDTWicEfOg==
X-Google-Smtp-Source: AGHT+IGh/41tYV0DFX3l7c0x9lgQ/kHgoNOQ34IGwzm6xEZgYdku2Q6VUassIFgNu+CSqyJ1J5JFKA==
X-Received: by 2002:a17:902:8a86:b0:21a:8ce5:10dc with SMTP id d9443c01a7336-21a8ce52943mr144800515ad.28.1736615599471;
        Sat, 11 Jan 2025 09:13:19 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm29437785ad.139.2025.01.11.09.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 09:13:18 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	visitorckw@gmail.com,
	jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] powerpc: Fix warning with '__powerpc64__'
Date: Sun, 12 Jan 2025 01:13:12 +0800
Message-ID: <20250111171312.1513926-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

As reported by the kernel test robot, the following error occurs:

   arch/powerpc/lib/sstep.c: In function 'analyse_instr':
>> arch/powerpc/lib/sstep.c:1172:28: warning: variable 'suffix' set but not used [-Wunused-but-set-variable]
    1172 |         unsigned int word, suffix;
         |                            ^~~~~~
   arch/powerpc/lib/sstep.c:1168:38: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
    1168 |         unsigned int opcode, ra, rb, rc, rd, spr, u;
         |                                      ^~

These variables are now conditionally defined with the '__powerpc64__'
macro to ensure they are only used when applicable.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501100247.gEmkqu8j-lkp@intel.com/
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 arch/powerpc/lib/sstep.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index ac3ee19531d8..eea8653464e7 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1354,15 +1354,21 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #ifdef CONFIG_PPC64
 	unsigned int suffixopcode, prefixtype, prefix_r;
 #endif
-	unsigned int opcode, ra, rb, rc, rd, spr, u;
+	unsigned int opcode, ra, rb, rd, spr, u;
 	unsigned long int imm;
 	unsigned long int val, val2;
 	unsigned int mb, me, sh;
-	unsigned int word, suffix;
+	unsigned int word;
+#ifdef __powerpc64__
+	unsigned int suffix;
+	unsigned int rc;
+#endif
 	long ival;
 
 	word = ppc_inst_val(instr);
+#ifdef __powerpc64__
 	suffix = ppc_inst_suffix(instr);
+#endif
 
 	op->type = COMPUTE;
 
@@ -1480,7 +1486,9 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	rd = (word >> 21) & 0x1f;
 	ra = (word >> 16) & 0x1f;
 	rb = (word >> 11) & 0x1f;
+#ifdef __powerpc64__
 	rc = (word >> 6) & 0x1f;
+#endif
 
 	switch (opcode) {
 #ifdef __powerpc64__
-- 
2.43.0


