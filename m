Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E19F1BB438
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:55:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B5pr3kHBzDqGn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:55:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JyuqkA+m; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4dw1s8WzDqTQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:02:12 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id k18so7721217pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 19:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=w9+RugxpgeNAIGB1cFnhuKwhTigTcAXeuTyuKeGVHO8=;
 b=JyuqkA+mv9uHsXSiTbZ/GXnw4YJhQHo4433uJ/BIcjguyu88RaZ8OIqscJpzvfefrW
 YoEtxb8+bzIBS8KUaPtAKfHnyzwdgPJ93hxLZ6a5r+mx9ALm2PxxDzpUB98HspxUZu44
 DjAQKwpygFFtx63xDDNNAYUNURv6sZfNuXwZYcUHkP0DhtKFyd/d4uFiQzhvcNwZ3tsH
 75MLPfe21jzWbIre4FehSjZktuQIc3LQQRgY3VRSOTq5JGz/unoisxVVf9B4ihYzFb/b
 flLkJQVyAmVbHBvSCRNnJTj9GP3ZK15CLn+29lfiK81SMGtbAYOOZvdz4yBtCvem/k8J
 +/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=w9+RugxpgeNAIGB1cFnhuKwhTigTcAXeuTyuKeGVHO8=;
 b=QDVxW271KhgEAqAeXHwAufP6J+b6iwexfzjlPs80zkp4cwjr5Vg4VdXgIZWF1EvusR
 /P0ra2nJ9d/Uj48vaQB+bd5hE7tQp1/dfRg6ooYWCGl6ke8Lfh2C4Cy54Txb5NC18usY
 sRoqgr1JZ6c7+hZm8lKNgMSuivFaK4F5cwMnMnmahIUK9C0z1agMLUFm3frrT/yxkFaH
 C0Jz4fYzMS98XGQWYppO6nDJkZhwiUylfq6lXuFnKbqHfRlrjM3/JqYrstg86rSURYnF
 MFNnB9ge23T+0KL/svRyfQqEwa7X/Zh8RSqJPDIwUAOXfRXIwGv1pYduap6RgJ5irKO4
 D++A==
X-Gm-Message-State: AGi0PubHNqJPMFZxe154TwcMl0mblYz159k8CRy7G4R+fBU3pd+YSugz
 j7XZ4NOHBSsSCa8OIpi+TOpWvxAX/B4=
X-Google-Smtp-Source: APiQypJXoT9622liJnhzJTyTgMXiOn6Is5mv4C1wVB3PURsbUYReiJdUpx0yfLC4vgJylQUJ84if7w==
X-Received: by 2002:a17:90a:7482:: with SMTP id
 p2mr1959707pjk.151.1588039329776; 
 Mon, 27 Apr 2020 19:02:09 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.19.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 19:02:09 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 28/28] powerpc sstep: Add support for prefixed fixed-point
 arithmetic
Date: Tue, 28 Apr 2020 11:58:14 +1000
Message-Id: <20200428015814.15380-29-jniethe5@gmail.com>
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

This adds emulation support for the following prefixed Fixed-Point
Arithmetic instructions:
  * Prefixed Add Immediate (paddi)

Reviewed-by: Balamuruhan S <bala24@linux.ibm.com>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v3: Since we moved the prefixed loads/stores into the load/store switch
statement it no longer makes sense to have paddi in there, so move it
out.
---
 arch/powerpc/lib/sstep.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index d3ae0a36975f..ea419f65285b 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1337,6 +1337,26 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	switch (opcode) {
 #ifdef __powerpc64__
+	case 1:
+		prefix_r = word & (1ul << 20);
+		ra = (suffix >> 16) & 0x1f;
+		rd = (suffix >> 21) & 0x1f;
+		op->reg = rd;
+		op->val = regs->gpr[rd];
+		suffixopcode = suffix >> 26;
+		prefixtype = (word >> 24) & 0x3;
+		switch (prefixtype) {
+		case 2:
+			if (prefix_r && ra)
+				return 0;
+			switch (suffixopcode) {
+			case 14:	/* paddi */
+				op->type = COMPUTE | PREFIXED;
+				op->val = mlsd_8lsd_ea(word, suffix, regs);
+				goto compute_done;
+			}
+		}
+		break;
 	case 2:		/* tdi */
 		if (rd & trap_compare(regs->gpr[ra], (short) word))
 			goto trap;
-- 
2.17.1

