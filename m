Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 372A91098E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:40:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MXmQ5MKJzDqMF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:40:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rNKROW1e"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNQ5vWJzDqfV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:22:46 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id z4so8554821pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qq980Dg23z1tM9wzkmlvaj65OZbnhvEi8J9D42yWmOk=;
 b=rNKROW1emnMEGAg9jit8aXrCY4LJ3g+Iqwz3FSyT+N1VGvbfxjkf02gOthh5tjFgrJ
 v/oHTdobcOV5tVSQM2lybDGDknbMm9WOJemNzh/MKHVlr/yhWfmJhQ1BKfpGgUl/M5tq
 bCSvVAswqlqKKrjgWxlyOApmCBhYLiCj3MzApJzgoua+1C6d/GvLaUjyrl+zDlLZzpip
 Due69Ji9P58m2T5H4uxirn0YLokMnlhZFsYu7pvV5/R6E1i0BWitrl4UMhIGIPXTUp6W
 7rAPLqmrUc7xUkrsBzgdEx66w6gWlreC5RNYHIu36PeSkapWVmIL6jU6ccVvjxT8LXjS
 +h5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qq980Dg23z1tM9wzkmlvaj65OZbnhvEi8J9D42yWmOk=;
 b=kwfBQpf/GI0gRaWzkV2j2hVfl9cGRgXJV1ytlbB7QtL0fyH6pd0A3gL4ITkyJ5ohNR
 0oOA6UgQdMeaBRbW9RGqsxN7fBKFZWa9mVkxcwbsFEDQI3yh7PaK2P6vIXsqWlyl2sRk
 aBfDbfWkQgRdooR4GEmpG6cwAXoWNp74PATwFcBl83l/PKOgzpaXR6L0IdmvbpTm1LyI
 4hQP2jUu4Ij1nK9Uz5oDIItUIp2rQJQRCfIEwfqfvTcHVXuR5KoYr6zOHpNaGJG7T6s8
 Teea87s9UgB8ysa7i5JTaj4LYIhe72sIRQMCY/J/9Bz6HH9VK5twxygJ1+LU+AuIcDja
 RX+w==
X-Gm-Message-State: APjAAAWuUfe/F9OTpmDexRIaalh6+NFALpLXEDQ2x4EwyfUuUDH8lz+D
 uXKpuEU+1QQKRL8uofIUZdeJ57RR
X-Google-Smtp-Source: APXvYqzJuFZr/j6lQPcELlke3RLJElNewMWAq7WMyjB70l6yGe/1moavs73YwxQ8zgxAyeLy/oYsiQ==
X-Received: by 2002:aa7:868c:: with SMTP id d12mr39682427pfo.189.1574745763905; 
 Mon, 25 Nov 2019 21:22:43 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:22:43 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/18] powerpc sstep: Add support for prefixed VSX load/stores
Date: Tue, 26 Nov 2019 16:21:31 +1100
Message-Id: <20191126052141.28009-9-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126052141.28009-1-jniethe5@gmail.com>
References: <20191126052141.28009-1-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds emulation support for the following prefixed VSX load/stores:
  * Prefixed Load VSX Scalar Doubleword (plxsd)
  * Prefixed Load VSX Scalar Single-Precision (plxssp)
  * Prefixed Load VSX Vector [0|1]  (plxv, plxv0, plxv1)
  * Prefixed Store VSX Scalar Doubleword (pstxsd)
  * Prefixed Store VSX Scalar Single-Precision (pstxssp)
  * Prefixed Store VSX Vector [0|1] (pstxv, pstxv0, pstxv1)

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/lib/sstep.c | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 9113b9a21ae9..9ae8d177b67f 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -2713,6 +2713,48 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			case 41:	/* plwa */
 				op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 4);
 				break;
+			case 42:        /* plxsd */
+				op->reg = rd + 32;
+				op->type = MKOP(LOAD_VSX, PREFIXED, 8);
+				op->element_size = 8;
+				op->vsx_flags = VSX_CHECK_VEC;
+				break;
+			case 43:	/* plxssp */
+				op->reg = rd + 32;
+				op->type = MKOP(LOAD_VSX, PREFIXED, 4);
+				op->element_size = 8;
+				op->vsx_flags = VSX_FPCONV | VSX_CHECK_VEC;
+				break;
+			case 46:	/* pstxsd */
+				op->reg = rd + 32;
+				op->type = MKOP(STORE_VSX, PREFIXED, 8);
+				op->element_size = 8;
+				op->vsx_flags = VSX_CHECK_VEC;
+				break;
+			case 47:	/* pstxssp */
+				op->reg = rd + 32;
+				op->type = MKOP(STORE_VSX, PREFIXED, 4);
+				op->element_size = 8;
+				op->vsx_flags = VSX_FPCONV | VSX_CHECK_VEC;
+				break;
+			case 51:	/* plxv1 */
+				op->reg += 32;
+
+				/* fallthru */
+			case 50:	/* plxv0 */
+				op->type = MKOP(LOAD_VSX, PREFIXED, 16);
+				op->element_size = 16;
+				op->vsx_flags = VSX_CHECK_VEC;
+				break;
+			case 55:	/* pstxv1 */
+				op->reg = rd + 32;
+
+				/* fallthru */
+			case 54:	/* pstxv0 */
+				op->type = MKOP(STORE_VSX, PREFIXED, 16);
+				op->element_size = 16;
+				op->vsx_flags = VSX_CHECK_VEC;
+				break;
 			case 56:        /* plq */
 				op->type = MKOP(LOAD, PREFIXED, 16);
 				break;
-- 
2.20.1

