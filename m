Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E51BB40D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:39:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B5Sh5GhGzDqS2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:39:16 +1000 (AEST)
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
 header.s=20161025 header.b=Ip3HWcHI; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4cr2yL6zDqSR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:01:16 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id r14so9929791pfg.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 19:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qzEmDq93hO/LNBDZnD3TOUPZe9xn+E75HAP9/Rmq4Cg=;
 b=Ip3HWcHI0f3jPTxbbMnZZ9GjqLoF45ADIJd7tWV59uCf9+5L6WJY45BngsaNfPMH9D
 VV8k6B20L5qTEiL0SWl+wEH2yntB6wY3wCHsinbbezvMyKuFAfVi7XhBOm1W6Rw+DbjP
 vvje8GcbatMgZzJ1FeTjLoWuCxBtMAnkrhE0LmxJhWGjJmz8mnxZW2fX0JUfgmfsicn+
 GiAdXILA8JEECXSVDz14n0Yn79DGkm0Dw9aCLSUUkF/WD/Zgd94zz2rdI8KRLTXsIGph
 CoLSZR3h4o9ooxzvTgimFiGhVFB90OxCcIFm1YOAoU7rDn3Gp37HU+yom7iXkCsrH7DH
 Y4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qzEmDq93hO/LNBDZnD3TOUPZe9xn+E75HAP9/Rmq4Cg=;
 b=Q6gniFprUvUh+r7zEJMPM+rcrlNGwjeVbFTRYpLR3xMZyoiPww5OoIB1s+NNv2xswG
 ehlgiK4fn6W6smyu01L+1ZVzAF4FWfBcbRnLB+i3yof27CLqQXekv5NDV8/XOg+djGoh
 s729zuPuxLWDdBc3mIEZB8A42V8f3mNl4jOjqqXSGRc6EFg5qjrI6w58ySokmM1TA5kY
 EJXc1xSm6j03AKkewv+jX0DQOE5oov2VdGyd2zFVYDuJtp62OzECssonjrTvdBNLJu9M
 c3vjbRYq01KVR3C4Yr6VtIFh5OIU7QnBeJuKukPTkA8oGiDlwMGnF1VNY4nIwos6p5+X
 NJDw==
X-Gm-Message-State: AGi0PuZwHIHLdRFr9XayTWvZ4WLQTNwk+kv7u8x+/EBoR895xF+DZMGg
 HPyweoBn+9dJaUGXaEh0opf3zrHiu8A=
X-Google-Smtp-Source: APiQypK2c7Dt3X/FqAkJPeq/AawQNPO3VPYA0rZTCSiiPlG/SgmVXpjrLJODbo4E6Q/TlbgYxjqA7Q==
X-Received: by 2002:a63:2e03:: with SMTP id u3mr9961424pgu.121.1588039274016; 
 Mon, 27 Apr 2020 19:01:14 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.19.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 19:01:13 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 19/28] powerpc/xmon: Move insertion of breakpoint for
 xol'ing
Date: Tue, 28 Apr 2020 11:58:05 +1000
Message-Id: <20200428015814.15380-20-jniethe5@gmail.com>
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
index 716967f12063..ce2a0150d43c 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -877,7 +877,6 @@ static struct bpt *new_breakpoint(unsigned long a)
 		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
 			bp->address = a;
 			bp->instr = (void *)(bpt_table + ((bp - bpts) * BPT_WORDS));
-			patch_instruction(bp->instr + 1, ppc_inst(bpinstr));
 			return bp;
 		}
 	}
@@ -909,6 +908,7 @@ static void insert_bpts(void)
 			continue;
 		}
 		patch_instruction(bp->instr, instr);
+		patch_instruction((void *)bp->instr + ppc_inst_len(instr), ppc_inst(bpinstr));
 		if (bp->enabled & BP_CIABR)
 			continue;
 		if (patch_instruction((struct ppc_inst *)bp->address,
-- 
2.17.1

