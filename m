Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A4B1098F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:42:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MXqD2S5QzDqgX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:42:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FeYJicmV"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNS5CCzzDqcH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:22:48 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id o8so3228360pls.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Hu1u9ZLQ9K7Aj3Pww8SQ7V9Th/VLadwDwyjyzLFJg8=;
 b=FeYJicmVRWo6+W4afB036Pe6jMvG4YanzFxI8cfuQL7fon8qeAj+6KQzZL1tBLTjL8
 JXmkmO/YqcNMFrt74mq58Jpu6LP3iiu9yB5/YMGHiVGI3OXNwg0VN7zqbSFj9Is8FzxQ
 MHEBYEd2TBY/VwASAU72B0zZGGds4EIAyVlR47MnpI0iKWcR22VWn6gkhrBEqslEg0GG
 QOksdXW+c8sTKdjSA5Enz9W/LpF25Fax6XcDqT5hLkepYblFlYv4JfWy5iZGuu810rv5
 P949e/S/tm5lNMEWi9NNOEmeZ/3RmdWWw/jctCOw1AMWy//8aoy206RlvBDY9XdFdKfH
 6G8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Hu1u9ZLQ9K7Aj3Pww8SQ7V9Th/VLadwDwyjyzLFJg8=;
 b=ktagh0ERKnPdyj1gK/WXe9bfUOMOpHdSo0TtE+g6ErFlPuUfyo/8snHgXRZeImcQv1
 k4jHdr9QxuW4qQB7LhhZQwZ6WP25t36ZsGZ1TnJY1zw0v1A/FCFiVV+gc/0Fm6LBxb2s
 QSRyiE10r67HeK7/wJ7OU4+csmnxGXHS9JBRLZ9evlvi4Jj2hva0Jbf3hGLfVFTeLWIA
 fUXsVktjHeJ4WTN7gk04BSzMnVvaI1JqrEYZGgX4AzXIMvj1MgBKP7diwwXdIPPbaVhx
 +rNgyI3D1pwb4OFrpm+IPGHOlm8cEJkj/XtgOk0OsMcpCV4S3ALXvxglaUtMY5r/Q2m5
 7TXw==
X-Gm-Message-State: APjAAAW8XTLiO9VLXobN/lyRpPZQNhzs4PH4oaMWrcIVjZp0+9b3IREG
 aIxDKAbtBtTV3BewodUSp3rlyQBQ
X-Google-Smtp-Source: APXvYqxDj2APlTf4veBvV5hAFQskzQXaxCppLKCINMbns8hKWoKNyMcnwmDxI1GZWtnzcxgKLOec8g==
X-Received: by 2002:a17:902:b60d:: with SMTP id
 b13mr33198315pls.145.1574745765977; 
 Mon, 25 Nov 2019 21:22:45 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:22:45 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/18] powerpc sstep: Add support for prefixed fixed-point
 arithmetic
Date: Tue, 26 Nov 2019 16:21:32 +1100
Message-Id: <20191126052141.28009-10-jniethe5@gmail.com>
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

This adds emulation support for the following prefixed Fixed-Point
Arithmetic instructions:
  * Prefixed Add Immediate (paddi)

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/lib/sstep.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 9ae8d177b67f..1bb0c79cb774 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -2776,6 +2776,10 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 				break;
 			op->ea = mlsd_8lsd_ea(instr, sufx, regs);
 			switch (sufxopcode) {
+			case 14:	/* paddi */
+				op->type = COMPUTE | PREFIXED;
+				op->val = op->ea;
+				goto compute_done;
 			case 32:	/* plwz */
 				op->type = MKOP(LOAD, PREFIXED, 4);
 				break;
-- 
2.20.1

