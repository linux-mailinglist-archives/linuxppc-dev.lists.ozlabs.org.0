Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54755342FB3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 22:42:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2vPC2VBtz30Cj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Mar 2021 08:42:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YAuo3BSi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YAuo3BSi; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2vNm5w7hz2yRP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 08:41:58 +1100 (AEDT)
Received: by mail-qk1-x731.google.com with SMTP id c3so6751792qkc.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 14:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WmkUdc+UawEmOx8mi12mwBFnOrtbW4nko08btHWnCoI=;
 b=YAuo3BSi+3NWa3D5mBVIOLfRrTXExAkAEqdNmbM3eNy1opX039InfEUW4m/JLaIvg9
 FIVi/dYO1BMacEZRqhfW+BYkNkomhgu61Ct3vDNuG98omgTjDjTfx7YEBp0X7du+lmvI
 iX7r+DcMYoWpibnKMYx51v5X+1THO+JqJOfiAldxCGydCsyYAyW84WAxbR4AkB5b3dzW
 qRRSmj/v0OVG54ie+THbgdMGncQZKgXcyU46I5BKYHp+wgYbw+0Xp2sUyparHKa05Hl8
 TPn3O0yFVdZIjdVlMm98LYI0bZ0esaa/tReV98CR7Sb4LrATCBoKXXl1UK1CZwwUHNW6
 8snA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WmkUdc+UawEmOx8mi12mwBFnOrtbW4nko08btHWnCoI=;
 b=IWd0ODZouo5fCUlUMul8lMmGdudVBXZnsbBrfDgmtyfbEAAjDYsxrfq0RcHjl5h9cZ
 1CqMLeZ301PIjy/ZvQLwdBAw4XixKkM7s4EbaeaM/v53cu1pCdb58CQD86h4LKEaFe2M
 CU/MqfQfoBVr6T1k92/9xHPTnGQG1j3HIDLq9ifPUOWNqNjB02vceb1pjeRyugOVsW+Y
 NKN4M2J/nPD4a49y5q3Mcjhbq4jTiNeLomDYrVVovDxsl413RH2dI/LEdgp3p/PvXIXH
 JsrOCqux/3hQV8zXqfNDWj11qpgN2Mk3yqx5Ut06OgBKxpbGavcuYuuG3l0zzsbgFZGK
 sgzg==
X-Gm-Message-State: AOAM530ukZm0CKZ+TSZwwohm80FWf68i4PqnU1LlOYLkKx2wHpiUmpbg
 ywuCdSSJNWkB1Hodd9JMlcU=
X-Google-Smtp-Source: ABdhPJyjYUwycOeoDxVxu73dJR8lALyAyDQzNWrriNxrRZE0y1MYJEX3AlivH9L5AGZZl1XLfK0USQ==
X-Received: by 2002:a37:a48a:: with SMTP id n132mr4402949qke.359.1616276515381; 
 Sat, 20 Mar 2021 14:41:55 -0700 (PDT)
Received: from localhost.localdomain ([138.199.13.205])
 by smtp.gmail.com with ESMTPSA id b21sm7380728qkl.14.2021.03.20.14.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 14:41:54 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 unixbhaskar@gmail.com, rdunlap@infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: epapr: A typo fix
Date: Sun, 21 Mar 2021 03:09:32 +0530
Message-Id: <20210320213932.22697-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


s/parmeters/parameters/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/powerpc/include/asm/epapr_hcalls.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/epapr_hcalls.h b/arch/powerpc/include/asm/epapr_hcalls.h
index c99ba08a408d..cdf3c6df5123 100644
--- a/arch/powerpc/include/asm/epapr_hcalls.h
+++ b/arch/powerpc/include/asm/epapr_hcalls.h
@@ -65,7 +65,7 @@
  * but the gcc inline assembly syntax does not allow us to specify registers
  * on the clobber list that are also on the input/output list.  Therefore,
  * the lists of clobbered registers depends on the number of register
- * parmeters ("+r" and "=r") passed to the hypercall.
+ * parameters ("+r" and "=r") passed to the hypercall.
  *
  * Each assembly block should use one of the HCALL_CLOBBERSx macros.  As a
  * general rule, 'x' is the number of parameters passed to the assembly
--
2.26.2

