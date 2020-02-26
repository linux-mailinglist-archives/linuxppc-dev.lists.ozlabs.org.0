Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ED916F687
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:37:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S31545lfzDqT1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 15:36:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Sz9OzlSB; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S2Nl31PZzDqNs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 15:08:55 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id j15so629351pgm.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 20:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=a3H6PUKpQUTzeCPqSuyT9Ovv7eBdfwqsfaLOWbT0shU=;
 b=Sz9OzlSBp3WfzYyVLDfrN0FzwjdAFwW+dnTZtvh5/jbF3THY5u1qKoqDPOwFjLAhQZ
 pow89wXoXEMyITzfsCN4vnMvf8Y0Ny1d9a8FAAa1mwyAOtZYbJH2ppWRIFht+IeO3vfA
 EFOati85I0kwSE4/IChHquPNFw5mLYOG4wfQYSvRljHVb1AUmwFMRztCrCkvkPqo0DM5
 ZvZFhROqi/A9T+ZMylG8pug7H5JaGhtGKy84FQiyCAZjzSCDI+GPLrejgTzoAiOjuOts
 hfbEHB1YxewPKOR/dU8osQ8AoxMZ3nnOgnwZ4xhZ+3VcWjRhS+uTb5ogJ7klkhMyv7cF
 yMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=a3H6PUKpQUTzeCPqSuyT9Ovv7eBdfwqsfaLOWbT0shU=;
 b=jfk+4W3X+alBLRWGlm/bvs2vE26mgOmWBycv+y6TS2EVljmhLCLb7nsg4SzHanGHSa
 req+Q5qR8Nmd/Dy7rOIV8od1V5tQPSOBYdg1Cpnd9HNGZNLNvk3OTTye1cgooMboWvF+
 FbIuisRgEJQsfsfGooYtbG4wUbZeiK5sIoXKGPOItjIVbeI/wToFugM5m3tISWhkQ6yB
 7DOTjfjNhN8QoMvv5mB3O2WFYyIDk1TG1E09WptvFj3fNcCYmMDIw0P/DZgTStUYID/K
 7d18AJd6p/O9BOvGbj8G2kZdgau8KjD1rKlcz8bCAvF4fS5EzxE6Hrly0tro1IXIaQxG
 UtNA==
X-Gm-Message-State: APjAAAXPUYVudlsDot/kz522YapRSJOd6vtNgMb/NcfPTWAxHKIUJa7w
 igdgHhuqn0FiB/g35Ng/F1IghQ8CWns=
X-Google-Smtp-Source: APXvYqwiYuQytE5mjjSkH9swNmCQ1XX4MNFcfUNTvEoqYlfxBA3RNHK9rs1JTSnlsc6ci7UcdY5x1w==
X-Received: by 2002:a63:ce0a:: with SMTP id y10mr1802402pgf.44.1582690132499; 
 Tue, 25 Feb 2020 20:08:52 -0800 (PST)
Received: from tee480.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d4sm604681pjg.19.2020.02.25.20.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 20:08:52 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 13/14] powerpc/hw_breakpoints: Initial support for prefixed
 instructions
Date: Wed, 26 Feb 2020 15:07:15 +1100
Message-Id: <20200226040716.32395-14-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226040716.32395-1-jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently when getting an instruction to emulate in
hw_breakpoint_handler() we do not load the suffix of a prefixed
instruction. Ensure we load the suffix if the instruction we need to
emulate is a prefixed instruction.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: Rename sufx to suffix
v3: Add __user to type cast to remove sparse warning
---
 arch/powerpc/kernel/hw_breakpoint.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 3a7ec6760dab..edf46356dfb2 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -243,15 +243,16 @@ dar_range_overlaps(unsigned long dar, int size, struct arch_hw_breakpoint *info)
 static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
 			     struct arch_hw_breakpoint *info)
 {
-	unsigned int instr = 0;
+	unsigned int instr = 0, suffix = 0;
 	int ret, type, size;
 	struct instruction_op op;
 	unsigned long addr = info->address;
 
-	if (__get_user_inatomic(instr, (unsigned int *)regs->nip))
+	if (__get_user_instr_inatomic(instr, suffix,
+				      (unsigned int __user *)regs->nip))
 		goto fail;
 
-	ret = analyse_instr(&op, regs, instr, PPC_NO_SUFFIX);
+	ret = analyse_instr(&op, regs, instr, suffix);
 	type = GETTYPE(op.type);
 	size = GETSIZE(op.type);
 
@@ -275,7 +276,7 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
 		return false;
 	}
 
-	if (!emulate_step(regs, instr, PPC_NO_SUFFIX))
+	if (!emulate_step(regs, instr, suffix))
 		goto fail;
 
 	return true;
-- 
2.17.1

