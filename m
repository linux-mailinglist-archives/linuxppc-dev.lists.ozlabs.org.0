Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C51B930EE13
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 09:11:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWWVB4k4VzDwnd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 19:11:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KQR1wuNc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWWPs1W2mzDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 19:08:00 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11485ZQj046569; Thu, 4 Feb 2021 03:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3MyTQe/hsdXDqlQQU5ccUD/++4CtQV5SzXHbFEQ4Rz0=;
 b=KQR1wuNcrrZlgq6+O3tBsk+W5Pv5TuhEjbaamzzRpOsp2Hsr+Vbnd6Twq32jVaigJdoC
 dD+R4ScEhvMFyoq0zHUVLv1yqCxgqyXRJPBObhWVpxq4fCCa/Xc/81X4ixN+tjjMCNNC
 pKn4cOmGJYeNHc7R/GzzMmzTdhfZ65+HtIx8VN562mBexa4guev2ZWuRYUgEms8Kvztf
 PndbwWDDdZugsoaLRN12oe3STdEVSf+JKfSA2ViL4tE0GkDPRJVIEgskDG1juR8aXrJl
 KJ9IKeYDTBS1tOtxX8urACgnluOka6KApclvNNNDI5jAPUPJ4UaRc4dEuj7yR6mJa16c mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gcv70dsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 03:07:55 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11485tEH048207;
 Thu, 4 Feb 2021 03:07:54 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gcv70drh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 03:07:54 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11482Bfm015965;
 Thu, 4 Feb 2021 08:07:52 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 36fwcw0pu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 08:07:52 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 11487eio32506178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 08:07:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AB0FA4064;
 Thu,  4 Feb 2021 08:07:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8319A405C;
 Thu,  4 Feb 2021 08:07:47 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Feb 2021 08:07:47 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 2/2] powerpc: sstep: Fix darn emulation
Date: Thu,  4 Feb 2021 13:37:44 +0530
Message-Id: <20210204080744.135785-2-sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204080744.135785-1-sandipan@linux.ibm.com>
References: <20210204080744.135785-1-sandipan@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_03:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040044
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

Commit 8813ff49607e ("powerpc/sstep: Check instruction
validity against ISA version before emulation") introduced
a proper way to skip unknown instructions. This makes sure
that the same is used for the darn instruction when the
range selection bits have a reserved value.

Fixes: a23987ef267a ("powerpc: sstep: Add support for darn instruction")
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 11f14b209d7f..683f7c20f74b 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1916,7 +1916,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 				goto compute_done;
 			}
 
-			return -1;
+			goto unknown_opcode;
 #ifdef __powerpc64__
 		case 777:	/* modsd */
 			if (!cpu_has_feature(CPU_FTR_ARCH_300))
-- 
2.25.1

