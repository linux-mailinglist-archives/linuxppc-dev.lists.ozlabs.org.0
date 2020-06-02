Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B886F1EB552
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 07:34:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bghF0ZGHzDqlV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 15:34:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bgXy0LYRzDqLB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 15:27:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mhqy7D4y; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49bgXx4CN1z9BGJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 15:27:45 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49bgXx3QMWz9sSn; Tue,  2 Jun 2020 15:27:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mhqy7D4y; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49bgXx1y8Kz9sSy
 for <linuxppc-dev@ozlabs.org>; Tue,  2 Jun 2020 15:27:45 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id e1so1975065wrt.5
 for <linuxppc-dev@ozlabs.org>; Mon, 01 Jun 2020 22:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=waOrQVSuIWtBPhBqEQ5/JFl4vCqIg2ZOu6BdG4zPGGU=;
 b=mhqy7D4y8QSTFAQeydKTXhtbJpjmstnJrfz28gWmiK/GAKx6whd1yoHOw9E+mm1co2
 HuLiw4W8CABJlHdkAqAZiZT03Ok1lFMKZ9E9w0a3ByZzBPakxfvFn/La8mWH0qX+pcmt
 zIst0QuVmeKeXooRIdkDxESEyySJyV2ovzS+Ificv0BdS/1hivN5pThxL6Iy5GNCZFMo
 eWnDVPVEK5v6PdtAFvh/2INe/Z7w1+TnH0/sea/PUWi9tK8uMwPh8kMvw/370TNdx6RQ
 XRNhraxCBx8bEMoWEe4Fd1PcqBgss/Dt1fTtOfahA5bwpU3hm5nbZ73rZHHh2Iwuvtis
 zhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=waOrQVSuIWtBPhBqEQ5/JFl4vCqIg2ZOu6BdG4zPGGU=;
 b=UYBmPSyeKQ977yqyu0bqcbyqGAPCLPCqUqknMbDIKHoPol/ONwf1wH/BT2bcut2o9l
 mlMJaNdxwBu5crlE7dzIcfxFjaHPQRnVlnEfl2DGwTUaDA5a45TB/YXmFelbGyTE0bl5
 XMmQLtuUT/L/ovVNSBKXNJ2TLaSrgkZ6QCl191P7+9C0I+yGdjfLmz6HX6a3qeS5lL+x
 NS0g2dV0xgjX+cpmQ69z+x8SZOGADez202ncLUt3YpOXGXin1iQuZWrmvEOjv60btNyA
 zRC34I2H3DBNIaPxsorVfkOVqc99ht0BW6Wxucb3RWcLHUKNPyzjQ6LhLbW1J02KtPeP
 HmIw==
X-Gm-Message-State: AOAM533liJdo3x3nBtetu/rFm9Te8P0LMvMrro3AIn364lbvyK7IkJxy
 lXFAGLoGEpU1w9Fw02Md4WtflEuW
X-Google-Smtp-Source: ABdhPJyw/ik1UK5IKACc2TpKGYHyPoOpbdJ8MOhTDbs6KMR0l7+GMNZTyAeM8dfiRFP8mPBjBZAkgw==
X-Received: by 2002:adf:fd49:: with SMTP id h9mr25260426wrs.67.1591075661664; 
 Mon, 01 Jun 2020 22:27:41 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id a124sm1831336wmh.4.2020.06.01.22.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 22:27:41 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 2/4] powerpc/xmon: Improve dumping prefixed instructions
Date: Tue,  2 Jun 2020 15:27:26 +1000
Message-Id: <20200602052728.18227-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200602052728.18227-1-jniethe5@gmail.com>
References: <20200602052728.18227-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, alistair@popple.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently prefixed instructions are dumped as two separate word
instructions. Use mread_instr() so that prefixed instructions are read
as such and update the incrementor in the loop to take this into
account.

'dump_func' is print_insn_powerpc() which comes from ppc-dis.c which is
taken from binutils. When this is updated prefixed instructions will be
disassembled.

Currently dumping prefixed instructions looks like this:
0:mon> di c000000000094168
c000000000094168  0x06000000    .long 0x6000000
c00000000009416c  0x392a0003    addi    r9,r10,3
c000000000094170  0x913f0028    stw     r9,40(r31)
c000000000094174  0xe93f002a    lwa     r9,40(r31)
c000000000094178  0x7d234b78    mr      r3,r9
c00000000009417c  0x383f0040    addi    r1,r31,64
c000000000094180  0xebe1fff8    ld      r31,-8(r1)
c000000000094184  0x4e800020    blr
c000000000094188  0x60000000    nop
 ...
c000000000094190  0x3c4c0121    addis   r2,r12,289
c000000000094194  0x38429670    addi    r2,r2,-27024
c000000000094198  0x7c0802a6    mflr    r0
c00000000009419c  0x60000000    nop
c0000000000941a0  0xe9240100    ld      r9,256(r4)
c0000000000941a4  0x39400001    li      r10,1

After this it looks like:
0:mon> di c000000000094168
c000000000094168  0x06000000 0x392a0003 .long 0x392a000306000000
c000000000094170  0x913f0028    stw     r9,40(r31)
c000000000094174  0xe93f002a    lwa     r9,40(r31)
c000000000094178  0x7d234b78    mr      r3,r9
c00000000009417c  0x383f0040    addi    r1,r31,64
c000000000094180  0xebe1fff8    ld      r31,-8(r1)
c000000000094184  0x4e800020    blr
c000000000094188  0x60000000    nop
 ...
c000000000094190  0x3c4c0121    addis   r2,r12,289
c000000000094194  0x38429570    addi    r2,r2,-27280
c000000000094198  0x7c0802a6    mflr    r0
c00000000009419c  0x60000000    nop
c0000000000941a0  0xe9240100    ld      r9,256(r4)
c0000000000941a4  0x39400001    li      r10,1
c0000000000941a8  0x3d02000b    addis   r8,r2,11

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/xmon/xmon.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 1dd3bf02021b..548571536bd1 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2935,11 +2935,10 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 	int nr, dotted;
 	unsigned long first_adr;
 	struct ppc_inst inst, last_inst = ppc_inst(0);
-	unsigned char val[4];
 
 	dotted = 0;
-	for (first_adr = adr; count > 0; --count, adr += 4) {
-		nr = mread(adr, val, 4);
+	for (first_adr = adr; count > 0; --count, adr += ppc_inst_len(inst)) {
+		nr = mread_instr(adr, &inst);
 		if (nr == 0) {
 			if (praddr) {
 				const char *x = fault_chars[fault_type];
@@ -2947,7 +2946,6 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 			}
 			break;
 		}
-		inst = ppc_inst(GETWORD(val));
 		if (adr > first_adr && ppc_inst_equal(inst, last_inst)) {
 			if (!dotted) {
 				printf(" ...\n");
@@ -2960,7 +2958,10 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 		if (praddr)
 			printf(REG"  %s", adr, ppc_inst_as_str(inst));
 		printf("\t");
-		dump_func(ppc_inst_val(inst), adr);
+		if (!ppc_inst_prefixed(inst))
+			dump_func(ppc_inst_val(inst), adr);
+		else
+			dump_func(ppc_inst_as_u64(inst), adr);
 		printf("\n");
 	}
 	return adr - first_adr;
-- 
2.17.1

