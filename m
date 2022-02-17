Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A404B9F11
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 12:39:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JztCJ0BTFz3cDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 22:39:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i4NaFTMW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i4NaFTMW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jzt922FMdz3bVd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 22:37:25 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21HBBe4U009513; 
 Thu, 17 Feb 2022 11:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6mlvZRSwlsDh5IrGJe/XwEIms3DwVqrOxjdrt0QYtbY=;
 b=i4NaFTMWFL2qMTIXxqLfmvM73ABxxvOzqmc5qPnuve8pK4HFL3XIXycerMN+P8FVB1kf
 4Cp8f27hrh4YEn/ZnVRAAPCDWH8QuGPVpnCEO5/8spOFXU4GkMkiolPwaxxQ0GCnciCv
 6UdOO4Ua5aqeY3sH+n0fcHnIAEQyqLiROieSRGSM65G/MGeFxN8cgxmKB7vyhvLJ8S96
 tCtHwTs4BMy009LBRTHrr1ym/XhDrNcBfvoYFsh1isv6evyTAPVnpaPukBXFLO8EWBlK
 3BWT9WCrzhQjly3fG4L1tTZawyE04YdTtqWGKLN0rtyX/vcLoxx5Rb+21WBW29j2O2i4 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e9n988q1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 11:36:57 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21HBCkbI011474;
 Thu, 17 Feb 2022 11:36:57 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e9n988q10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 11:36:57 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21HBaqxS017593;
 Thu, 17 Feb 2022 11:36:54 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3e64hahbce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 11:36:54 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21HBaqn947186420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 11:36:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D31B52074;
 Thu, 17 Feb 2022 11:36:52 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.115.39])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9AF085204E;
 Thu, 17 Feb 2022 11:36:49 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 3/3] kprobes: Allow probing on any address belonging to ftrace
Date: Thu, 17 Feb 2022 17:06:25 +0530
Message-Id: <78480d05821d45e09fb234f61f9037e26d42f02d.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s2pY3YpUXKKedvIx171jzWymSrmlo6RM
X-Proofpoint-GUID: 05TTG-txgITAc8F4zkEq4gAnsVDojiOQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_04,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170051
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On certain architectures, ftrace can reserve multiple instructions at
function entry. Rather than rejecting kprobe on addresses other than the
exact ftrace call instruction, use the address returned by ftrace to
probe at the correct address when CONFIG_KPROBES_ON_FTRACE is enabled.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 kernel/kprobes.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 94cab8c9ce56cc..0a797ede3fdf37 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -1497,6 +1497,10 @@ bool within_kprobe_blacklist(unsigned long addr)
 static kprobe_opcode_t *_kprobe_addr(kprobe_opcode_t *addr,
 			const char *symbol_name, unsigned int offset)
 {
+#ifdef CONFIG_KPROBES_ON_FTRACE
+	unsigned long ftrace_addr = 0;
+#endif
+
 	if ((symbol_name && addr) || (!symbol_name && !addr))
 		goto invalid;
 
@@ -1507,6 +1511,14 @@ static kprobe_opcode_t *_kprobe_addr(kprobe_opcode_t *addr,
 	}
 
 	addr = (kprobe_opcode_t *)(((char *)addr) + offset);
+
+#ifdef CONFIG_KPROBES_ON_FTRACE
+	if (addr)
+		ftrace_addr = ftrace_location((unsigned long)addr);
+	if (ftrace_addr)
+		return (kprobe_opcode_t *)ftrace_addr;
+#endif
+
 	if (addr)
 		return addr;
 
-- 
2.35.1

