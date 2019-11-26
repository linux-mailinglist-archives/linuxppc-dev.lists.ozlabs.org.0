Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 235521098E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:38:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MXkH41TDzDqSD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:38:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cFbS7Vhy"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNN0xSZzDqc3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:22:44 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id b10so8373599pgd.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ipeVQjXaasu7Gw62UCM6TXL1mCVprbwKX5A93z2JntE=;
 b=cFbS7Vhy59C62qRHkoZdXhVjig1cLunV0Z2JevkyQU2mGPXJt/D3LRe32oDWsj1hrA
 uowub6aWp5dK/yOBCrXYP2rPcT9KJPmTf4+vaJvb4DG5g3BjKF4jIbzgrTpkchrM3MLb
 IPOOeSxK6dWBJK5lZFQZbnhJXVtAfxiB70MxplyD5uY7Bv7IBC6VJEjUtDdMklfhGCR8
 Qwq+6dTK4K3GZ/xika6dWhokL0UAgQiP4ITyVEoBiO0EXgvcJqTKOqHjLnyAnpA+Ua/x
 mDmfLih6L8SMaXIaPVahxV6ULLLqtvrQJUhjsKDx9IcJNQ+piduzy4Msk8oRsELFV8rA
 0wUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ipeVQjXaasu7Gw62UCM6TXL1mCVprbwKX5A93z2JntE=;
 b=eTy3SDoq3t6JWpobV5ohPfW78x48m1OE7z40KHzgnFLRVu3Fthowbbn7IW18YRFbuH
 o2mtfLJJvEqLa+AYZN/bpSikmvpPv5Gk7k3MTDVc9SBmoXevB2w9jjXNEw52GFexgcvc
 Ye+vLbk2gKmyKs8CooBx1q3jtEhWRCrKXVCIkOweMDGNFDHqr9nJCTDdDzumm4CyoTfy
 59lvo75svMuDaFyYUQc2CgLly1+96WS0hCL+4aJPTEqQib65XVABRXrWf/5WukiKNJs3
 0I4YpP6QhJxzZ4XgvzDsoGj41Eo5tlcNBAdxy5LoOlAdZZ1+wkD5xBNXq1JMdPVrflqx
 i0uA==
X-Gm-Message-State: APjAAAUYqWDWL8Zfr40FPMyQwlzqgANB6JjPFzpFLPpQ6jW0EM3HTVcn
 a3E7F5UqQIX9mdTbDIghrLPjNYTY
X-Google-Smtp-Source: APXvYqwOBaBfF/tAbVFqzwPCUD1Ff5YyzyzSN14j2LQhDAh1dDT+9c+stFkdbFcjLO7eh4cQCeNGrw==
X-Received: by 2002:a63:e0a:: with SMTP id d10mr23923803pgl.124.1574745761719; 
 Mon, 25 Nov 2019 21:22:41 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:22:41 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/18] powerpc sstep: Add support for prefixed floating-point
 load/stores
Date: Tue, 26 Nov 2019 16:21:30 +1100
Message-Id: <20191126052141.28009-8-jniethe5@gmail.com>
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

This adds emulation support for the follow prefixed floating-point
load/stores:
  * Prefixed Load Floating-Point Single (plfs)
  * Prefixed Load Floating-Point Double (plfd)
  * Prefixed Store Floating-Point Single (pstfs)
  * Prefixed Store Floating-Point Double (pstfd)

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/lib/sstep.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 4f5ad1f602d8..9113b9a21ae9 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -2755,6 +2755,18 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			case 44:	/* psth */
 				op->type = MKOP(STORE, PREFIXED, 2);
 				break;
+			case 48:        /* plfs */
+				op->type = MKOP(LOAD_FP, PREFIXED | FPCONV, 4);
+				break;
+			case 50:        /* plfd */
+				op->type = MKOP(LOAD_FP, PREFIXED, 8);
+				break;
+			case 52:        /* pstfs */
+				op->type = MKOP(STORE_FP, PREFIXED | FPCONV, 4);
+				break;
+			case 54:        /* pstfd */
+				op->type = MKOP(STORE_FP, PREFIXED, 8);
+				break;
 			}
 			break;
 		case 3: /* Type 11 Modified Register-to-Register */
-- 
2.20.1

