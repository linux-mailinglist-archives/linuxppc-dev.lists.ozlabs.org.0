Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBFD18C739
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:48:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kCVk1Qt9zF07t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:48:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OrGx5OjZ; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kBt12WflzDrTs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:19:53 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id j10so2622206pfi.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lrodgxN9VD9fhpwpSQLxuM6sRha44sWyBbPlSRZN2LY=;
 b=OrGx5OjZ8wgSRmqBsg3WEpXBFfXY9h4Fin43QoTa4OAL/XtCslSn0RO/m1oPcH/346
 Azgl4m6Znget46bOhEUkkHRXrIeXxFMKWw30qYo4R2370lrc+2z+DzPWQa3JRpEQfd93
 m1OGpvI6f+tSQygAcj5H9ikNH9JO1DUCaMI9rBP1fwO0J6GaXv91WH12wmksNbat33jo
 nai1J3WHQvdEhjqUf1JSIO5kB1Fo2rmr08VggIlkxqtIYV7XWCF7AWH0RMZ4XPumpChW
 Qr+vF/3cUTJ7xEP/wLaoe4E0uSnHAWTnQIfS3AYo/BmEr99OzLW7n5g7ehuN9IeHlpxU
 Ppag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lrodgxN9VD9fhpwpSQLxuM6sRha44sWyBbPlSRZN2LY=;
 b=PhOaba3Bj/QKj/CpI1wZoljEAfKzrPz9mIWs7NdZBZcgrSQqaIZt4mKPb+nfUDqClv
 p8GcLB4xd3AqU5XX0S7liWHjW4sPxu20RXlDnCA68Ozld5Yponh/mzyQUV1803YgM206
 03jguYE3es+OFg5th0y1FaqXpdqYChZj39dx9MLd462adtTS6xAbq8n9J3Vx0uwjP4Jf
 0JNwnwtWmLTPcE6Fhz2i+S0reqMXUYyBIuvO0S6bpjgK5gNxj8JyKbiRnGcYYymzlSOk
 W7taZQOs0WnRYPltKYD0A2fz6sFl5LuXplg4d7rXKCL+0G5ZRH826FFWp1/YlbMKHjyk
 jM1w==
X-Gm-Message-State: ANhLgQ1efxydK2BqUFgwmCQ0f3PeadNcLozUt1cFudvZil7Fm1bwGd78
 vZ1hPG283BJMp3QazZgfTzprkCgz1+Q=
X-Google-Smtp-Source: ADFU+vs1U3/svoLgtcADOXbJSCMX4tLbHSFdC6UoXC+raiH7XkiI1MfLsprvHnr5hvznDTaWqxN/3g==
X-Received: by 2002:a63:82c6:: with SMTP id w189mr6730172pgd.357.1584681591350; 
 Thu, 19 Mar 2020 22:19:51 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c207sm3988716pfb.47.2020.03.19.22.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 22:19:50 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 16/16] powerpc sstep: Add support for prefixed fixed-point
 arithmetic
Date: Fri, 20 Mar 2020 16:18:09 +1100
Message-Id: <20200320051809.24332-17-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200320051809.24332-1-jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
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

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v3: Since we moved the prefixed loads/stores into the load/store switch
statement it no longer makes sense to have paddi in there, so move it
out.
---
 arch/powerpc/lib/sstep.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index daef70eb8e22..6862fc019258 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1335,6 +1335,26 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
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

