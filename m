Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6B81098FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:56:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MY7Z1fmpzDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:56:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XYQpqzyi"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNl482RzDqcQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:23:03 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id t3so7924211pgl.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=16RY2Kf98s94qH1BbDGG60qjU59/40pTWteyWeWv3jU=;
 b=XYQpqzyi8DAhKKkg4aB7ZL6dwwHOqvL3/WpWIbHXudm8wS5Bn9BxfSzZAt5BX4fv1z
 z4QmVe159UvTEJNpw3yKb4Au54EtxEKD3eqcTt3fnnytnH9MDs3BgwQF16D96zq5Hslq
 helQmCgGRaDC4U41FQPa6Zi+NHzGYN5xcwsXMml8CyPeaTDjmYZdxzKkt2rSYuDhjsJp
 CQbHoKM9faOAMw27JAB8o4lXiFqo9BQfVTyzz8LhouLpcZ2Iz1qMEuWDK1XTNs5PBfct
 ZDLcvfDLV4ynA6JAWEo9E5BAKupdWWNswIRaCXsHl3rw5Uk8i4spRXAufX12xRh/Qy7O
 /ZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=16RY2Kf98s94qH1BbDGG60qjU59/40pTWteyWeWv3jU=;
 b=VyRirrd2QVHqSEsQgK3pCJm8MqficQelwirJqmVmY5nP3ER1L3mTi56RQnBSyuaYd2
 jAbioMGGz7lYlx7ck05RlCldAxwyZIGUy1w8bN+t1qyCDwvOWMlhunM/4NmWeIc8a/Uj
 6Pm1kkRcGtpMCiNbbqVJNdC7NmR7jCLZqMLsOrTvXJC/ifEERKZXfjld/YoqCZYHzyZj
 Xj0Lvgme54G4n4B3OGSArRcGE2uNwY9yfU+L7Ka9DRSZPCA57F5G9VZeIMuty7iF3lhp
 scUIeXdsf9bCsA9TXdFlPfJT1KEN3aaBXTkDwRM+sDNa4fi3UK5IfoNbJtDAEltq/Ggg
 TH8Q==
X-Gm-Message-State: APjAAAWCUQDBseYZeXnGkUEjTKfJO51sDE7de0KrG/LBC8yHi8chfFXc
 oIiU414IWEDhYh9dNmOs084gAMZ4
X-Google-Smtp-Source: APXvYqwDq9m8qagHzoLSBQJcNbs2dBHcAaUQp2NeJgbeDQfXcmspjVExUdAF291Z4ICJeQbZ9iwllg==
X-Received: by 2002:a65:6843:: with SMTP id q3mr15075878pgt.361.1574745781475; 
 Mon, 25 Nov 2019 21:23:01 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:23:01 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 16/18] powerpc/hw_breakpoints: Initial support for prefixed
 instructions
Date: Tue, 26 Nov 2019 16:21:39 +1100
Message-Id: <20191126052141.28009-17-jniethe5@gmail.com>
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

Currently when getting an instruction to emulate in
hw_breakpoint_handler() we do not load the suffix of a prefixed
instruction. Ensure we load the suffix if the instruction we need to
emulate is a prefixed instruction.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/kernel/hw_breakpoint.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index f4530961998c..f7e1af8b9eae 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -240,15 +240,15 @@ dar_range_overlaps(unsigned long dar, int size, struct arch_hw_breakpoint *info)
 static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
 			     struct arch_hw_breakpoint *info)
 {
-	unsigned int instr = 0;
+	unsigned int instr = 0, sufx = 0;
 	int ret, type, size;
 	struct instruction_op op;
 	unsigned long addr = info->address;
 
-	if (__get_user_inatomic(instr, (unsigned int *)regs->nip))
+	if (__get_user_instr_inatomic(instr, sufx, (unsigned int *)regs->nip))
 		goto fail;
 
-	ret = analyse_instr(&op, regs, instr, 0);
+	ret = analyse_instr(&op, regs, instr, sufx);
 	type = GETTYPE(op.type);
 	size = GETSIZE(op.type);
 
@@ -272,7 +272,7 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
 		return false;
 	}
 
-	if (!emulate_step(regs, instr, 0))
+	if (!emulate_step(regs, instr, sufx))
 		goto fail;
 
 	return true;
-- 
2.20.1

