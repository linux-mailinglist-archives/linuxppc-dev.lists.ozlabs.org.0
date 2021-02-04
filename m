Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3180230EE08
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 09:09:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWWRT0qlZzDwvJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 19:09:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i4N2BR5b; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWWPp6dpszDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 19:07:58 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 114845pK188798; Thu, 4 Feb 2021 03:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ydMDpM6EkRfL20eMsWO1U0gEWgvPPEXyC+eotVQ4+Us=;
 b=i4N2BR5bi6WKhab5rfs67NHTsKlq9thoRjYn/84CpHV46b1tKOuNq2Qxv/L9U+kTIqKv
 DfNy/Gb8kJkKoC6th1EMA89gXPsKm48G1EGrZufkrADBFutwepmPEBtGM3qDwDV0j1u+
 VTQxKCnnZ6G4aGiyJZh72Wk2jDqUmKaD5wVL3lsY4VpQMdMC5emX4vGgWg7BUQVtWmsb
 y3SP3vu6I/W8JAs/r+mEkZzpU7Qi2M4Lownr+sTVd6UiUsSx9dHrETQcbZLcKW1wxtdZ
 tQK0gC6etwg6P48Z6jYYrQ7y64v6vhY4/X2wsVORrCvZUNWFXbecKIVGP6XZwajbzcOn fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gcu7rnxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 03:07:53 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11485Oem002288;
 Thu, 4 Feb 2021 03:07:52 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gcu7rnva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 03:07:52 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11486mx9030500;
 Thu, 4 Feb 2021 08:07:50 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 36cy38mnqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 08:07:50 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11487lp030802420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 08:07:47 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D64DA4060;
 Thu,  4 Feb 2021 08:07:47 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E78CA405C;
 Thu,  4 Feb 2021 08:07:45 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Feb 2021 08:07:45 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 1/2] powerpc: sstep: Fix load-store and update emulation
Date: Thu,  4 Feb 2021 13:37:43 +0530
Message-Id: <20210204080744.135785-1-sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_03:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102040048
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
Cc: ravi.bangoria@linux.ibm.com, ananth@linux.ibm.com, jniethe5@gmail.com,
 paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Power ISA says that the fixed-point load and update
instructions must neither use R0 for the base address (RA)
nor have the destination (RT) and the base address (RA) as
the same register. Similarly, for fixed-point stores and
floating-point loads and stores, the instruction is invalid
when R0 is used as the base address (RA).

This is applicable to the following instructions.
  * Load Byte and Zero with Update (lbzu)
  * Load Byte and Zero with Update Indexed (lbzux)
  * Load Halfword and Zero with Update (lhzu)
  * Load Halfword and Zero with Update Indexed (lhzux)
  * Load Halfword Algebraic with Update (lhau)
  * Load Halfword Algebraic with Update Indexed (lhaux)
  * Load Word and Zero with Update (lwzu)
  * Load Word and Zero with Update Indexed (lwzux)
  * Load Word Algebraic with Update Indexed (lwaux)
  * Load Doubleword with Update (ldu)
  * Load Doubleword with Update Indexed (ldux)
  * Load Floating Single with Update (lfsu)
  * Load Floating Single with Update Indexed (lfsux)
  * Load Floating Double with Update (lfdu)
  * Load Floating Double with Update Indexed (lfdux)
  * Store Byte with Update (stbu)
  * Store Byte with Update Indexed (stbux)
  * Store Halfword with Update (sthu)
  * Store Halfword with Update Indexed (sthux)
  * Store Word with Update (stwu)
  * Store Word with Update Indexed (stwux)
  * Store Doubleword with Update (stdu)
  * Store Doubleword with Update Indexed (stdux)
  * Store Floating Single with Update (stfsu)
  * Store Floating Single with Update Indexed (stfsux)
  * Store Floating Double with Update (stfdu)
  * Store Floating Double with Update Indexed (stfdux)

E.g. the following behaviour is observed for an invalid
load and update instruction having RA = RT.

While a userspace program having an instruction word like
0xe9ce0001, i.e. ldu r14, 0(r14), runs without getting
receiving a SIGILL on a Power system (observed on P8 and
P9), the outcome of executing that instruction word varies
and its behaviour can be considered to be undefined.

Attaching an uprobe at that instruction's address results
in emulation which currently performs the load as well as
writes the effective address back to the base register.
This might not match the outcome from hardware.

To remove any inconsistencies, this adds additional checks
for the aforementioned instructions to make sure that the
emulation infrastructure treats them as unknown. The kernel
can then fallback to executing such instructions on hardware.

Fixes: 0016a4cf5582 ("powerpc: Emulate most Book I instructions in emulate_step()")
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
Previous versions can be found at:
v3: https://lore.kernel.org/linuxppc-dev/20210204071432.116439-1-sandipan@linux.ibm.com/
v2: https://lore.kernel.org/linuxppc-dev/20210203063841.431063-1-sandipan@linux.ibm.com/
v1: https://lore.kernel.org/linuxppc-dev/20201119054139.244083-1-sandipan@linux.ibm.com/

Changes in v4:
- Fixed grammar and switch-case alignment.

Changes in v3:
- Consolidated the checks as suggested by Naveen.
- Consolidated load/store changes into a single patch.
- Included floating-point load/store and update instructions.

Changes in v2:
- Jump to unknown_opcode instead of returning -1 for invalid
  instruction forms.

---
 arch/powerpc/lib/sstep.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index e96cff845ef7..11f14b209d7f 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -3017,6 +3017,20 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	}
 
+	if (OP_IS_LOAD_STORE(op->type) && (op->type & UPDATE)) {
+		switch (GETTYPE(op->type)) {
+		case LOAD:
+			if (ra == rd)
+				goto unknown_opcode;
+			fallthrough;
+		case STORE:
+		case LOAD_FP:
+		case STORE_FP:
+			if (ra == 0)
+				goto unknown_opcode;
+		}
+	}
+
 #ifdef CONFIG_VSX
 	if ((GETTYPE(op->type) == LOAD_VSX ||
 	     GETTYPE(op->type) == STORE_VSX) &&
-- 
2.25.1

