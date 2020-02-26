Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0BC16F666
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:21:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S2fv3r8WzDqTK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 15:21:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A/6LY34S; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S2NC0M3kzDqNp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 15:08:27 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id j9so733274pfa.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 20:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xZeEBCnrzbsIkbPwtjtPASOk3V0e9+i7/vPYjZHaukE=;
 b=A/6LY34S2c3FHyIZTuI5n+iHlzCspNr4R6KPuGFgYf0O9aQfqsIK0m3t7VUuWYC7N5
 uwQWF2INkRIdM7gw1g42MOf79/juleQyhVrdPGIecSTn2cLWwbKkuGkVOsDFuew7XAgJ
 6Ztf36NYVORbTCrbGM5hhF22m4kEqZCsu1Au1Tzc2ztslSNkppchfsUs4aXtW3BxL2d8
 Wcy35QLqscDJkhfWz2tY8lytWCepnYxj8t+dv+0jrDf394zmyF4xCyim/RZ2Vvx4uA4a
 6wvFAied8uBO2kPAN4b+xSThWfu+72M+8wYYazKMMuKsqEAKjHswRfBD01Mu6O1mM3Wv
 3i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xZeEBCnrzbsIkbPwtjtPASOk3V0e9+i7/vPYjZHaukE=;
 b=iaiTap/NyfGL9VJt2INod3HBN/YZRKeE8M+gZVWfa4TDJIboALS7vBn9biFo2WR46Y
 wJ6kLiUIq9hV05wh9fa3mcG9BAILxxpvvKyDMGRVRtN1Dw0/l5r47k+GBKrgx+IoAOJx
 8JCd7kOJ1d/ODGAuw146G5arlX/5vf4hkwI4KW31Wpulh/dRGDc1Q6pECSa9S3WO8G3S
 01hVxdHGIiyAycl5h0b/OleUkA0qUo/BDZEUzeWGsrKAzzAwXeYZ5ifHVM3cCk4Wnvcr
 8t96L0Q11mp+UQ0+U9tmlfp7TfU4XBVhr6G/wf4S4UhrJSJvs/EaqdKH9Qu3BM4nacGa
 S/2g==
X-Gm-Message-State: APjAAAX1SOL08UT7z298JhSBXNTEmeKSzpDnnz+mtZpCIIAn6uLyPq3T
 Sp6QB2nPMFc2Ehd6f6OrbJGViuqf9JQ=
X-Google-Smtp-Source: APXvYqwZiCHvJyBy0aREZoLt/JDK8U3trQOQcs1szIx0oZvbZJgATn3WYWogu3FVRMTHFvnIR/ME/g==
X-Received: by 2002:a63:d244:: with SMTP id t4mr1779301pgi.241.1582690104991; 
 Tue, 25 Feb 2020 20:08:24 -0800 (PST)
Received: from tee480.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d4sm604681pjg.19.2020.02.25.20.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 20:08:24 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 05/14] powerpc sstep: Add support for prefixed fixed-point
 arithmetic
Date: Wed, 26 Feb 2020 15:07:07 +1100
Message-Id: <20200226040716.32395-6-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226040716.32395-1-jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: alistair@popple.id.au, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds emulation support for the following prefixed Fixed-Point
Arithmetic instructions:
  * Prefixed Add Immediate (paddi)

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v3: Since we moved the prefixed loads/stores into the load/store switch
statement it no longer makes sense to have paddi in there, so move it
out.
---
 arch/powerpc/lib/sstep.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 8e4ec953e279..f2010a3e1e06 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1331,6 +1331,26 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	switch (opcode) {
 #ifdef __powerpc64__
+	case 1:
+		prefix_r = instr & (1ul << 20);
+		ra = (suffix >> 16) & 0x1f;
+		rd = (suffix >> 21) & 0x1f;
+		op->reg = rd;
+		op->val = regs->gpr[rd];
+		suffixopcode = suffix >> 26;
+		prefixtype = (instr >> 24) & 0x3;
+		switch (prefixtype) {
+		case 2:
+			if (prefix_r && ra)
+				return 0;
+			switch (suffixopcode) {
+			case 14:	/* paddi */
+				op->type = COMPUTE | PREFIXED;
+				op->val = mlsd_8lsd_ea(instr, suffix, regs);
+				goto compute_done;
+			}
+		}
+		break;
 	case 2:		/* tdi */
 		if (rd & trap_compare(regs->gpr[ra], (short) instr))
 			goto trap;
-- 
2.17.1

