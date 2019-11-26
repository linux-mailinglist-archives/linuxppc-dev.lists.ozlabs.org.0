Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEEE1098FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:50:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MY0N5b1MzDqjR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:50:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tvthUxXW"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNd71JHzDqc8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:22:57 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id f9so7585088plr.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OcbBXfO/jU19AtT1dTmMT0Hw/k+tfWJzCtfLDx0siWw=;
 b=tvthUxXW3sSlpFbv2hlfdKOAFLznZXELbA1PAlUk3o7vJdHSjXySVYiCljUzNl3L4R
 pFTClsQcpg3l16Kvc4f5vr4myc3M7WKFqjFiG0UunaDhzIB2qD2mtesgRpHz/oLaq6U5
 6Wzq6J0JphOFwQXD4t3UHspnbMiuKE/uZpUgyGQnsziJfLVJEG2dM9N8iPkMoC2TO4sb
 xbvLAA4ozFZ6f0kZBXT18E4BV7yUSH+i2ixhcmC5lIVF2b1k8aWxd7yNegeSc7w457rj
 QDZLEiRv6QuwlYmGE69DoKIIokp+39FnrfCrNDDjwKthC18nP24ro8aVjMm0rt7sqkHL
 HpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OcbBXfO/jU19AtT1dTmMT0Hw/k+tfWJzCtfLDx0siWw=;
 b=VsFW+eX26iRvYyV6SPOjyIhsvRzGCrJ8TrN5BbOEJTEmvI9J/1pl+LpB3O0HTF5pGR
 f32MqLrPoKWfKIUb78/yIo9B1e52bMUgbUjLyhrFXyor0HU62LPICQ0TylwsZqU83nKW
 W1HI3PbEcdvwEFgt5TohWwvks0FyE1QfXIVd+IRLfkOXqPyMp8TvC4yB7TbCvyaqzKgn
 I11VyTWuVqO7lioF6hRQE3tjC8lNN3V1XtKBlsiSddgGOElJmo1tVMUYEJg6KniOr8pj
 AI0nkvbyOEO01nnl9SAwOptqU97yNJVVAbAFVWgUI3i6ZLG2rH4QAPaO+qJlucokRjOs
 rT6A==
X-Gm-Message-State: APjAAAXwC/aZu/ODntZh5Is+p/TkqbWWKZSHiJTx8xXhJc6H8YRfcbGG
 dWbqDwfCCTAhhGHmtNDFSMOi0/H+
X-Google-Smtp-Source: APXvYqyrwrf/RL3Omh3MpMWz0+/DMyLdiQKaAzhTh6vV2j+DVX4Y/QC6mfPAHXqbiDfuzT1Tfame6g==
X-Received: by 2002:a17:902:bf0c:: with SMTP id
 bi12mr30339361plb.98.1574745775087; 
 Mon, 25 Nov 2019 21:22:55 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:22:54 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/18] powerpc/xmon: Dump prefixed instructions
Date: Tue, 26 Nov 2019 16:21:36 +1100
Message-Id: <20191126052141.28009-14-jniethe5@gmail.com>
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

Currently when xmon is dumping instructions it reads a word at a time
and then prints that instruction (either as a hex number or by
disassembling it). For prefixed instructions it would be nice to show
its prefix and suffix as together. Use read_instr() so that if a prefix
is encountered its suffix is loaded too. Then print these in the form:
    prefix:suffix
Xmon uses the disassembly routines from GNU binutils. These currently do
not support prefixed instructions so we will not disassemble the
prefixed instructions yet.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/xmon/xmon.c | 50 +++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 93259a06eadc..dc8b1c7b3e1b 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2900,6 +2900,21 @@ prdump(unsigned long adrs, long ndump)
 	}
 }
 
+static bool instrs_are_equal(unsigned long insta, unsigned long sufxa,
+			     unsigned long instb, unsigned long sufxb)
+{
+	if (insta != instb)
+		return false;
+
+	if (!IS_PREFIX(insta) && !IS_PREFIX(instb))
+		return true;
+
+	if (IS_PREFIX(insta) && IS_PREFIX(instb))
+		return sufxa == sufxb;
+
+	return false;
+}
+
 typedef int (*instruction_dump_func)(unsigned long inst, unsigned long addr);
 
 static int
@@ -2908,12 +2923,11 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 {
 	int nr, dotted;
 	unsigned long first_adr;
-	unsigned int inst, last_inst = 0;
-	unsigned char val[4];
+	unsigned int inst, sufx, last_inst = 0, last_sufx = 0;
 
 	dotted = 0;
-	for (first_adr = adr; count > 0; --count, adr += 4) {
-		nr = mread(adr, val, 4);
+	for (first_adr = adr; count > 0; --count, adr += nr) {
+		nr = read_instr(adr, &inst, &sufx);
 		if (nr == 0) {
 			if (praddr) {
 				const char *x = fault_chars[fault_type];
@@ -2921,8 +2935,9 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 			}
 			break;
 		}
-		inst = GETWORD(val);
-		if (adr > first_adr && inst == last_inst) {
+		if (adr > first_adr && instrs_are_equal(inst, sufx,
+							last_inst,
+							last_sufx)) {
 			if (!dotted) {
 				printf(" ...\n");
 				dotted = 1;
@@ -2931,11 +2946,24 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 		}
 		dotted = 0;
 		last_inst = inst;
-		if (praddr)
-			printf(REG"  %.8x", adr, inst);
-		printf("\t");
-		dump_func(inst, adr);
-		printf("\n");
+		last_sufx = sufx;
+		if (IS_PREFIX(inst)) {
+			if (praddr)
+				printf(REG"  %.8x:%.8x", adr, inst, sufx);
+			printf("\t");
+			/*
+			 * Just use this until binutils ppc disassembly
+			 * prints prefixed instructions.
+			 */
+			printf("%.8x:%.8x", inst, sufx);
+			printf("\n");
+		} else {
+			if (praddr)
+				printf(REG"  %.8x", adr, inst);
+			printf("\t");
+			dump_func(inst, adr);
+			printf("\n");
+		}
 	}
 	return adr - first_adr;
 }
-- 
2.20.1

