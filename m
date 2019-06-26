Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33290570D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 20:40:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YsJt41zJzDqXK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 04:39:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YsH34ygQzDqGL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 04:38:23 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5QIapZ7038970
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 14:38:19 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tcdskgyyx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 14:38:18 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 26 Jun 2019 19:38:17 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Jun 2019 19:38:14 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5QIc38d38470086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 18:38:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 001FE42041;
 Wed, 26 Jun 2019 18:38:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 228E542047;
 Wed, 26 Jun 2019 18:38:11 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.84.174])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Jun 2019 18:38:10 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Steven Rostedt <rostedt@goodmis.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] recordmcount: Fix spurious mcount entries on powerpc
Date: Thu, 27 Jun 2019 00:08:01 +0530
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062618-0012-0000-0000-0000032CA849
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062618-0013-0000-0000-00002165E37F
Message-Id: <20190626183801.31247-1-naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-26_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906260215
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The recent change enabling HAVE_C_RECORDMCOUNT on powerpc started
showing the following issue:

  # modprobe kprobe_example
   ftrace-powerpc: Not expected bl: opcode is 3c4c0001
   WARNING: CPU: 0 PID: 227 at kernel/trace/ftrace.c:2001 ftrace_bug+0x90/0x318
   Modules linked in:
   CPU: 0 PID: 227 Comm: modprobe Not tainted 5.2.0-rc6-00678-g1c329100b942 #2
   NIP:  c000000000264318 LR: c00000000025d694 CTR: c000000000f5cd30
   REGS: c000000001f2b7b0 TRAP: 0700   Not tainted  (5.2.0-rc6-00678-g1c329100b942)
   MSR:  900000010282b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]>  CR: 28228222  XER: 00000000
   CFAR: c0000000002642fc IRQMASK: 0
   <snip>
   NIP [c000000000264318] ftrace_bug+0x90/0x318
   LR [c00000000025d694] ftrace_process_locs+0x4f4/0x5e0
   Call Trace:
   [c000000001f2ba40] [0000000000000004] 0x4 (unreliable)
   [c000000001f2bad0] [c00000000025d694] ftrace_process_locs+0x4f4/0x5e0
   [c000000001f2bb90] [c00000000020ff10] load_module+0x25b0/0x30c0
   [c000000001f2bd00] [c000000000210cb0] sys_finit_module+0xc0/0x130
   [c000000001f2be20] [c00000000000bda4] system_call+0x5c/0x70
   Instruction dump:
   419e0018 2f83ffff 419e00bc 2f83ffea 409e00cc 4800001c 0fe00000 3c62ff96
   39000001 39400000 386386d0 480000c4 <0fe00000> 3ce20003 39000001 3c62ff96
   ---[ end trace 4c438d5cebf78381 ]---
   ftrace failed to modify
   [<c0080000012a0008>] 0xc0080000012a0008
    actual:   01:00:4c:3c
   Initializing ftrace call sites
   ftrace record flags: 2000000
    (0)
    expected tramp: c00000000006af4c

Looking at the relocation records in __mcount_loc showed a few spurious
entries:
  RELOCATION RECORDS FOR [__mcount_loc]:
  OFFSET           TYPE              VALUE
  0000000000000000 R_PPC64_ADDR64    .text.unlikely+0x0000000000000008
  0000000000000008 R_PPC64_ADDR64    .text.unlikely+0x0000000000000014
  0000000000000010 R_PPC64_ADDR64    .text.unlikely+0x0000000000000060
  0000000000000018 R_PPC64_ADDR64    .text.unlikely+0x00000000000000b4
  0000000000000020 R_PPC64_ADDR64    .init.text+0x0000000000000008
  0000000000000028 R_PPC64_ADDR64    .init.text+0x0000000000000014

The first entry in each section is incorrect. Looking at the relocation
records, the spurious entries correspond to the R_PPC64_ENTRY records:
  RELOCATION RECORDS FOR [.text.unlikely]:
  OFFSET           TYPE              VALUE
  0000000000000000 R_PPC64_REL64     .TOC.-0x0000000000000008
  0000000000000008 R_PPC64_ENTRY     *ABS*
  0000000000000014 R_PPC64_REL24     _mcount
  <snip>

The problem is that we are not validating the return value from
get_mcountsym() in sift_rel_mcount(). With this entry, mcountsym is 0,
but Elf_r_sym(relp) also ends up being 0. Fix this by ensuring mcountsym
is valid before processing the entry.

Fixes: c7d64b560ce80 ("powerpc/ftrace: Enable C Version of recordmcount")
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 scripts/recordmcount.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
index 13c5e6c8829c..47fca2c69a73 100644
--- a/scripts/recordmcount.h
+++ b/scripts/recordmcount.h
@@ -325,7 +325,8 @@ static uint_t *sift_rel_mcount(uint_t *mlocp,
 		if (!mcountsym)
 			mcountsym = get_mcountsym(sym0, relp, str0);
 
-		if (mcountsym == Elf_r_sym(relp) && !is_fake_mcount(relp)) {
+		if (mcountsym && mcountsym == Elf_r_sym(relp) &&
+				!is_fake_mcount(relp)) {
 			uint_t const addend =
 				_w(_w(relp->r_offset) - recval + mcount_adjust);
 			mrelp->r_offset = _w(offbase
-- 
2.22.0

