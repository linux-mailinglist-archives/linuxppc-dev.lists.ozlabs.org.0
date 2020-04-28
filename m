Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 149811BB403
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:32:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B5Jb6FzRzDqpG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:32:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QmiiylMz; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4cN617DzDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:00:52 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id z1so8239114pfn.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 19:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=grbp1c3dWYQb0kLdLiMwJ+NvsRGkVo5pZEcNmE67qps=;
 b=QmiiylMz40JXcqYjYcBwFQXk3mJWqokktGEGqM4GKh97Z7je1mBSgwxSfiLSm0+jhV
 bMKzI5lt4VeuT8b3aw18xV7QMq+QKQEXxOocC31NS58KRrNzHwFTLAqz/n4LLsHC0iQT
 W6qPsMUR0oGm/fOTNYzm+TonnINc9XSeipJdwv/9zA3ZKpKJ9D4caYC4pIIgoL+oH5sE
 PIVPwjoKGqiASMKbOPky0g/jnkyJEw/1Qfvj3cJ9BY0XsDSJI5AiyeM4Ii/yf+iJnNn3
 l7HStcoEvbr1eGDWDEuGOm7OTRqNpMd/XR3Yh2XhMprN70VM6GWn0plZwPb2fwaoafKJ
 oLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=grbp1c3dWYQb0kLdLiMwJ+NvsRGkVo5pZEcNmE67qps=;
 b=HvEm1DbN/ChMSk2gvwRsFeUTH9wX/LElfvn4BGy/+swOdXUkgQTIZjTTiFookYQjUU
 JlAO07VPOlql4MWSIGIuM55YUmj0EVlolLH39e/JeffvO3NF93kny09GgBwXl3LuWehN
 75693QNMyEtD0K82ER4QsllXtMBkHNaP32o3CFrv4IEaXzpPGlrazzraAGAePcgIdyGq
 94DJY9KouCWLjfmbVKLRWyAxrIoJ32jq/v+lmbvR9FT0GvZaj5r2Y03y5e/quBklRR67
 gyq0phfrEpwvxgnXV5WiJRSmp7s7RN2NxkC2Av9hbB1Rw5XX2omdDwuzvgwfFckfRVUd
 EC9g==
X-Gm-Message-State: AGi0PubzPHWQ8azSYVjsQH2gZYRhyBPTPjIGob3BXcY9//Ot+rYnaEOU
 OlsuNWt0tWtHmJAP6f76ytv9wZEnOI0=
X-Google-Smtp-Source: APiQypLxKcfwIi1iWeINJmAnJPvzDGmxIDH2QzQUW6Pz4j98e7yTP8bIQ/MbXW2wpcAvCfqLuoN0vQ==
X-Received: by 2002:a63:e350:: with SMTP id o16mr25044393pgj.250.1588039248272; 
 Mon, 27 Apr 2020 19:00:48 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.19.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 19:00:47 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 15/28] powerpc/kprobes: Use patch_instruction()
Date: Tue, 28 Apr 2020 11:58:01 +1000
Message-Id: <20200428015814.15380-16-jniethe5@gmail.com>
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
index 17ad844e24f5..ff53e5ef7e40 100644
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

