Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFF41C0D24
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:16:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CzTG1nz4zDqBM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:16:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PZlGcljp; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cyqr487fzDrL3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:47:20 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id f8so3243613plt.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rbUnP/sh6TNVN/kWsiw3WI73BRzieSpNkDkwlgCxnwA=;
 b=PZlGcljpKGkqfoc9GCf3mN/b4cbLkIxa3nMHOzkino/I2My3lKdxQnsVCDzCnYqdtd
 nVqKgfJDNgaidLqsz+FGKvxu0z8eP3WbceNtvb0QkeZgNrPyxqJ+8CgiNr/aqoB8Yeap
 +c0mhZVTlGvG5jGVhlch2nVk6qAcPF6e94qSiKYCHPwp1HsNC7TbzYpfufxPBbwFoE2g
 Lbt9U+AuxI/y9YsX1bhhEOfbqBto2v7obFOpHK0z9Vo4WlVaEJICa5CNGOhmaNfs4oH0
 /ws5Xik5n+2oywORk6cfPisNqwFQmuhcDfwGYCb2CIcYc930ANWlqwqLoUNzm7ZlW2iw
 qvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rbUnP/sh6TNVN/kWsiw3WI73BRzieSpNkDkwlgCxnwA=;
 b=TZbXXXk+bdlU5HOAAcn7FlDjcd7P9z7Xubl4rT7A8NnGYTM7sZuIN6KlfELyp9CQIp
 iFleEEbuqvjWpQ5BQR2cGJFPVu+Pex/70vAViHK7DNKz1X3RIkps6KC2jVunU78f19wS
 MG+tYI8apRUg+qMhk5igcgMy7M3s46eR5f8QLeHPGBP7P36oj8fJ4AIbv7og7fPztFUv
 T79JsUrrQhhZuNN4T910IKVXRTjVervp08mg9hWoDQa6AEx9niI1n/u3xFrDsXBlfdZA
 pkAOAcJQIx9eDU0RQxyOZtTxgv6eUvb2wQtt+To6rLUSz6ZWqsb0qiJoHyUGEpC0d5cy
 iImQ==
X-Gm-Message-State: AGi0PubPztwuLpl0Fig8mTCW8Kem5Zta4lD+Meh3Y9dYkg16BYk4kPYT
 l9sqGln59ZkU+xQOQjDL1nBU9OyO4jfa3Q==
X-Google-Smtp-Source: APiQypJRAO/3zELcajdCJsrhlU6pK9N1ClqkZT1Mg1v51wc/rAjfcyzXV2qdU3tsjzvpGquCXQjUDQ==
X-Received: by 2002:a17:902:8e8b:: with SMTP id
 bg11mr2315925plb.139.1588304838431; 
 Thu, 30 Apr 2020 20:47:18 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:47:18 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 15/28] powerpc/kprobes: Use patch_instruction()
Date: Fri,  1 May 2020 13:42:07 +1000
Message-Id: <20200501034220.8982-16-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of using memcpy() and flush_icache_range() use
patch_instruction() which not only accomplishes both of these steps but
will also make it easier to add support for prefixed instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v6: New to series.
---
 arch/powerpc/kernel/kprobes.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index f64312dca84f..a72c8e1a42ad 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -125,11 +125,8 @@ int arch_prepare_kprobe(struct kprobe *p)
 	}
 
 	if (!ret) {
-		memcpy(p->ainsn.insn, p->addr,
-				MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
+		patch_instruction((struct ppc_inst *)p->ainsn.insn, insn);
 		p->opcode = ppc_inst_val(insn);
-		flush_icache_range((unsigned long)p->ainsn.insn,
-			(unsigned long)p->ainsn.insn + sizeof(kprobe_opcode_t));
 	}
 
 	p->ainsn.boostable = 0;
-- 
2.17.1

