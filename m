Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 411031BB3E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:20:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B5303BKNzDqMh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:20:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XN+rnMHV; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4bV45ZszDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:00:06 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id x77so9939529pfc.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 19:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fh86nuu96NXb/S0f8GHq7uv4IK3kP+PreTpnEo2bL4g=;
 b=XN+rnMHV+nQB7mt+dkP4UfoRCPABPeoCvvYuI79JUPnugS0jfR/CfWclomjkfHqvks
 bEllDOsUDpPTohhw40GF3n5kTl0MxnryWPLzI4SSK+S1DEEvZXFbwPVqwZ9juYurReRk
 JKFnj9C0+MbhdbkZLyzoZbkENkPusqeGKnYTNDa04he7n+v4UX9kLU+nHkDOzJtJ9hVy
 DgKkFfwOFGZL0Qpmc6xfeNK6/n5MyAV+Mg8mmYLqs89Vkhumxv9vO+qQ+jxKDosPBkNY
 CN3KEBgm77iuIl0cHzyzuetskKDMsQceNM7ihbJqbME5rmOJwyzLQ/pjE/egednkBDmT
 QKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fh86nuu96NXb/S0f8GHq7uv4IK3kP+PreTpnEo2bL4g=;
 b=b9q2gVlLm5/LWcxFHPBgaQ0sXzM1OoHIm8eEr49hRRoMBtUXgBF4HNOwEyRN3DcVOU
 sKNXmWV2OZ7vB+GumIpvnFoZvjIH1/3fUmFMAVoiavIg/VHqyzblaK/AjQRWVIWlP5Qp
 WLn7s6K1noFpTyfoxnptZMFg+/oqEi6UMuM7+TPih2aI5a/q6/iqtoVcSBVvyCMRdFs4
 txiD4zNeU0fHM4g328dSsmtS74IDhPl12HKUbz8W1VdJhngo4/VsoS5AdWP2eyFm7X2F
 I8VB4cUR5OA9KJKYGJcvXxgtyuDwmYtmi++9827PIazm0FA+mannwtHMW4J4JOJcxOOQ
 iPKA==
X-Gm-Message-State: AGi0PuZE7R696ZbVrUnVzB1GL1wC98GaW+e4qT/GHUJtx/JV+yyiflW4
 900XWePvAcBrnOkITWd4U2Qbs+s/gm0=
X-Google-Smtp-Source: APiQypIH4kx3iIzyvQOd73eaA+zLsTlpYqMXt19TynNoGGRmJIu2YJtryWYmgR9oLYbhMWYUx4IMSQ==
X-Received: by 2002:a63:e350:: with SMTP id o16mr25041550pgj.250.1588039204400; 
 Mon, 27 Apr 2020 19:00:04 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.18.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 19:00:04 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 09/28] powerpc: Use a function for byte swapping
 instructions
Date: Tue, 28 Apr 2020 11:57:55 +1000
Message-Id: <20200428015814.15380-10-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428015814.15380-1-jniethe5@gmail.com>
References: <20200428015814.15380-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use a function for byte swapping instructions in preparation of a more
complicated instruction type.

Reviewed-by: Balamuruhan S <bala24@linux.ibm.com>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/inst.h | 5 +++++
 arch/powerpc/kernel/align.c     | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 442a95f20de7..23fd57a86b03 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -18,4 +18,9 @@ static inline int ppc_inst_primary_opcode(u32 x)
 	return ppc_inst_val(x) >> 26;
 }
 
+static inline u32 ppc_inst_swab(u32 x)
+{
+	return ppc_inst(swab32(ppc_inst_val(x)));
+}
+
 #endif /* _ASM_INST_H */
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index 47dbba81a227..a63216da8cf1 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -310,7 +310,7 @@ int fix_alignment(struct pt_regs *regs)
 		/* We don't handle PPC little-endian any more... */
 		if (cpu_has_feature(CPU_FTR_PPC_LE))
 			return -EIO;
-		instr = swab32(instr);
+		instr = ppc_inst_swab(instr);
 	}
 
 #ifdef CONFIG_SPE
-- 
2.17.1

