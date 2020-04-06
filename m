Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D2519F1B1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 10:38:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wkT52HSHzDqVl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:38:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Dq7bZIqM; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wjsN42hFzDqsL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 18:10:48 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id ng8so6169944pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 01:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=k2JXOuLt4tSIAIO2mq+POzwfAB8whrHi3bMEjHCqH8c=;
 b=Dq7bZIqMD1mwvqHaDW6wO1hoNsiO5nBwZvbfVkeLeDlBaAk9uRlV/R0fsPo2EFUVbR
 P+fFEl1B8Z8dzwdmlgm8iHx9BP6gUDxeKySSkSKKDDUtd5J5mvRq1Fi2JheXcgRQ1Cx9
 po0KFDLP0t2x+6osYnh/+Am8epalWlW2jwvp/u290/njP3w4q3OKOMuP4Sk9EJcuuiV1
 gs+BhnaWi0AlkNryADpAdcUH14/7clhUzxs6UuTVsfRRt8hGE/hsjRAsCCumuoGvLsiP
 EbPhToSQNCHY16KdYPZ8cJCj2afwj24tx7XY+TxHtC7T27EiUvjCNuohzxsTTd5hRzpt
 0wLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=k2JXOuLt4tSIAIO2mq+POzwfAB8whrHi3bMEjHCqH8c=;
 b=tQsFsHwr9Lr/dBGXahqh0KthxOjvbP+QeaemoXj6It/VREHEgAECQKB5fiKqOyO56Y
 EXU/J+fGXG5jwpF3u/WwTywT+w9k5y44bGFJYgpSGJJOg54qwjrbag0nHog1wKSVZ9T8
 GwfOyuQBK6ohvpImZhTBNRj/Qo6c//RRJBlySmREBSKm3oEYm5oajbVOBfmo5ftBgfnS
 pKSaG/JW8915YS8BcpqwOE635tTAnhXHyZklmnX4kH8P5JKg/WuWA3E65Bu5NM7MkJm4
 vhhAphdAOROGm5pHSgxfy4jpiLv1AxZpE0wM1Rd+oz4cvrTNTpnebws6ulFjzcN7ISGN
 XZpw==
X-Gm-Message-State: AGi0PubZrHiMjJHQyjjOnkm7b4K2SejXZXWOPATxP7cAZ8PSmvfkesKL
 S761WETuEXhEtOBhOdvUlS+sLU0yqw0=
X-Google-Smtp-Source: APiQypIBFegCEoY/VtSk/pE+uP5bGa9+/gVddyWAYW5IB1isJpQuwJfN7zbZ+peWztrsBFpYXA/I2g==
X-Received: by 2002:a17:902:562:: with SMTP id
 89mr18776390plf.249.1586160646355; 
 Mon, 06 Apr 2020 01:10:46 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id m2sm11460406pjk.4.2020.04.06.01.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:10:46 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 14/21] powerpc/xmon: Move insertion of breakpoint for
 xol'ing
Date: Mon,  6 Apr 2020 18:09:29 +1000
Message-Id: <20200406080936.7180-15-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406080936.7180-1-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
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

When a new breakpoint is created, the second instruction of that
breakpoint is patched with a trap instruction. This assumes the length
of the instruction is always the same. In preparation for prefixed
instructions, remove this assumption. Insert the trap instruction at the
same time the first instruction is inserted.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/xmon/xmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 6f4cf01a58c1..6f3bcdcfc9c7 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -881,7 +881,6 @@ static struct bpt *new_breakpoint(unsigned long a)
 		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
 			bp->address = a;
 			bp->instr = (void *)(bpt_table + ((bp - bpts) * BPT_WORDS));
-			patch_instruction(bp->instr + 1, ppc_inst(bpinstr));
 			return bp;
 		}
 	}
@@ -913,6 +912,7 @@ static void insert_bpts(void)
 			continue;
 		}
 		patch_instruction(bp->instr, instr);
+		patch_instruction((void *)bp->instr + ppc_inst_len(instr), ppc_inst(bpinstr));
 		if (bp->enabled & BP_CIABR)
 			continue;
 		if (patch_instruction((struct ppc_inst *)bp->address,
-- 
2.17.1

