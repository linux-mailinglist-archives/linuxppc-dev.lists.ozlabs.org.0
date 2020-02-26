Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1795616F677
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:30:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S2sY6YjSzDqZl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 15:30:25 +1100 (AEDT)
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
 header.s=20161025 header.b=p31kqs2X; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S2NY0S0QzDqML
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 15:08:44 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id e9so702580pjr.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 20:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jvldIg9ukp/2Y7zI/KLEZznacWyhfTDJLdK7YEaLLXI=;
 b=p31kqs2XsnfXt3o1gpQApNriF4o9ZI379rslX6FouaUD37HB0Cxbf+r6thpvs1V/nv
 sDKxWklILdYIBfheTnuniSFPAjjt8NWUKNruml6xXIVKfKlhWGuKvZnoLl9cRaD2QN/9
 bVCU+GEYSPjlTUM8/1LhDK+SMZXKyMuCSplkgiWWo7ccnm8e1MYINbSBW/BJ+NGWw5Tf
 +Wk31Uv2JWAeCxMjWFbTBis/16v/PmY/6xiRyHV02fqpaxfiuI/Ypq0kMYK2csIdYTma
 2B8lqfAqqlOea7Z9FwjPU9p0EPHP0Nk+/kJR3nDKYCvj1xnJHrVtHhs/qq4PZjb5nQYC
 4D2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jvldIg9ukp/2Y7zI/KLEZznacWyhfTDJLdK7YEaLLXI=;
 b=iAr+NqUUy1oQf/3TU30KhbMhgLA9YNo9uwnDqqghj6vw1tqFEt8nFLDSf9mC2GQ/SI
 fiigj0yjZKmUMEW6Jden6SBBdR1qFPyv7ufukUDv6OXt7+/4329ny85tSneIIt3TSD9K
 q0U/mLsfXR0bFUr9hYca7gb/EmmtiRL9VWR3mcSW2ZcYiS5DXPlGMqiJhp2TtA6rqe/l
 R6izjQOo7l3lgOSo5gnUhWLSN3hm0KJAiRyeF+IKXAfJ3GtwB2vpbwoQVDL1M8qcfnhj
 DQ+oU0vt+QIRcpvr1Nv/CuYzOtQ+EgV7H72ypD/SV9EVzE3jlv11CyGGwII95UYfBYp2
 03eg==
X-Gm-Message-State: APjAAAWmTI4Ukd78rfr35qj9NJWE9qDrc1frro2E3S/jQN2M+EVO7gTz
 loyK4SsSsagrZQvDSFyguaynzKEdy9w=
X-Google-Smtp-Source: APXvYqwF4uUYUxWwh9YOo/FG223R7ZGSPhVciM86GC9yFrvJB7oHHAWg2yRhln9IGby16/ca3j65zw==
X-Received: by 2002:a17:902:b110:: with SMTP id
 q16mr1913007plr.289.1582690122204; 
 Tue, 25 Feb 2020 20:08:42 -0800 (PST)
Received: from tee480.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d4sm604681pjg.19.2020.02.25.20.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 20:08:41 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 10/14] powerpc/xmon: Dump prefixed instructions
Date: Wed, 26 Feb 2020 15:07:12 +1100
Message-Id: <20200226040716.32395-11-jniethe5@gmail.com>
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
v2: Rename sufx to suffix
v3: Simplify generic_inst_dump()
---
 arch/powerpc/xmon/xmon.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index a73a35aa4a75..bf304189e33a 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2900,6 +2900,21 @@ prdump(unsigned long adrs, long ndump)
 	}
 }
 
+static bool instrs_are_equal(unsigned long insta, unsigned long suffixa,
+			     unsigned long instb, unsigned long suffixb)
+{
+	if (insta != instb)
+		return false;
+
+	if (!IS_PREFIX(insta) && !IS_PREFIX(instb))
+		return true;
+
+	if (IS_PREFIX(insta) && IS_PREFIX(instb))
+		return suffixa == suffixb;
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
+	unsigned int inst, suffix, last_inst = 0, last_suffix = 0;
 
 	dotted = 0;
-	for (first_adr = adr; count > 0; --count, adr += 4) {
-		nr = mread(adr, val, 4);
+	for (first_adr = adr; count > 0; --count, adr += nr) {
+		nr = mread_instr(adr, &inst, &suffix);
 		if (nr == 0) {
 			if (praddr) {
 				const char *x = fault_chars[fault_type];
@@ -2921,8 +2935,9 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 			}
 			break;
 		}
-		inst = GETWORD(val);
-		if (adr > first_adr && inst == last_inst) {
+		if (adr > first_adr && instrs_are_equal(inst, suffix,
+							last_inst,
+							last_suffix)) {
 			if (!dotted) {
 				printf(" ...\n");
 				dotted = 1;
@@ -2931,10 +2946,17 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 		}
 		dotted = 0;
 		last_inst = inst;
-		if (praddr)
+		last_suffix = suffix;
+		if (praddr) {
 			printf(REG"  %.8x", adr, inst);
+			if (IS_PREFIX(inst))
+				printf(":%.8x", suffix);
+		}
 		printf("\t");
-		dump_func(inst, adr);
+		if (IS_PREFIX(inst))
+			printf("%.8x:%.8x", inst, suffix);
+		else
+			dump_func(inst, adr);
 		printf("\n");
 	}
 	return adr - first_adr;
-- 
2.17.1

