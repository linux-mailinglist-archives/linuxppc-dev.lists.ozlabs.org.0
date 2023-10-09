Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C947BD2E8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 07:56:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m8Oo4WRm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3pDn11HLz3vZk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 16:56:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m8Oo4WRm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3pBv5x3rz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 16:54:31 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3995qj25024650;
	Mon, 9 Oct 2023 05:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rs6+TxGfRompCj4fjxdLMKymnKZKIgd/qBU/0pNuDbg=;
 b=m8Oo4WRmjsx9KaEOFCQ5sAafrftZKeHjSrAgGyzuXzebvbSF5GIeLiETAXcsB+gc0p7+
 422qgQZY6hy7SSt4pumgMsiRtrn2pqHXPCXWgMIdiILuP7pYpGonJjKwkvRkVLrwE+qO
 SpFuzeLCtTJ53zfRpbj0nd2A24rM54IRt1WsNMgCkrNLDlY2e4TZDw13f79nE/zddP6C
 P0N7ZEUQipROcZGmdisDMEDgopiKjLTKWCe8ScV8QOXc5qlwnIGLgxoDJL3kyER8fmZ7
 wL6r96sczjAndlOUqMT1GhNG2JQugCRqCS0cYsuGRQFEyXU/+IPhgvs4xao4kjWGS33j /A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmbrg80y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:26 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3995sQlp029378;
	Mon, 9 Oct 2023 05:54:26 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmbrg80xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:26 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39938h7p000647;
	Mon, 9 Oct 2023 05:54:25 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkk5k6s0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:25 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3995sNOx44434122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Oct 2023 05:54:23 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D8FA2004F;
	Mon,  9 Oct 2023 05:54:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DE972004B;
	Mon,  9 Oct 2023 05:54:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Oct 2023 05:54:22 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AD2C76057F;
	Mon,  9 Oct 2023 16:54:20 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/6] prctl: Define PowerPC DEXCR interface
Date: Mon,  9 Oct 2023 16:54:03 +1100
Message-ID: <20231009055406.142940-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009055406.142940-1-bgray@linux.ibm.com>
References: <20231009055406.142940-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YquNhTXLjcIsj0VsL0hzvPenHJVm4CFy
X-Proofpoint-ORIG-GUID: OHY2U7yGxAwjmSXWTrukKBZT7u_ZrILZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_04,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=453 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090051
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adds the definitions and generic handler for prctl control of the
PowerPC Dynamic Execution Control Register (DEXCR).

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 include/uapi/linux/prctl.h | 13 +++++++++++++
 kernel/sys.c               | 16 ++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 3c36aeade991..85d66ad134b1 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -305,4 +305,17 @@ struct prctl_mm_map {
 # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
 # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
 
+/* PowerPC Dynamic Execution Control Register (DEXCR) controls */
+#define PR_PPC_GET_DEXCR		71
+#define PR_PPC_SET_DEXCR		72
+/* DEXCR aspect to act on */
+# define PR_PPC_DEXCR_SBHE		0 /* Speculative branch hint enable */
+# define PR_PPC_DEXCR_IBRTPD		1 /* Indirect branch recurrent target prediction disable */
+# define PR_PPC_DEXCR_SRAPD		2 /* Subroutine return address prediction disable */
+# define PR_PPC_DEXCR_NPHIE		3 /* Non-privileged hash instruction enable */
+/* Action to apply / return */
+# define PR_PPC_DEXCR_CTRL_OFF		(1UL << 0)
+# define PR_PPC_DEXCR_CTRL_ON		(1UL << 1)
+# define PR_PPC_DEXCR_CTRL_INHERIT	(1UL << 2)
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 2410e3999ebe..0c1b8e9c3d16 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -146,6 +146,12 @@
 #ifndef RISCV_V_GET_CONTROL
 # define RISCV_V_GET_CONTROL()		(-EINVAL)
 #endif
+#ifndef PPC_GET_DEXCR_ASPECT
+# define PPC_GET_DEXCR_ASPECT(a, b)	(-EINVAL)
+#endif
+#ifndef PPC_SET_DEXCR_ASPECT
+# define PPC_SET_DEXCR_ASPECT(a, b, c)	(-EINVAL)
+#endif
 
 /*
  * this is where the system-wide overflow UID and GID are defined, for
@@ -2686,6 +2692,16 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_GET_MDWE:
 		error = prctl_get_mdwe(arg2, arg3, arg4, arg5);
 		break;
+	case PR_PPC_GET_DEXCR:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = PPC_GET_DEXCR_ASPECT(me, arg2);
+		break;
+	case PR_PPC_SET_DEXCR:
+		if (arg4 || arg5)
+			return -EINVAL;
+		error = PPC_SET_DEXCR_ASPECT(me, arg2, arg3);
+		break;
 	case PR_SET_VMA:
 		error = prctl_set_vma(arg2, arg3, arg4, arg5);
 		break;
-- 
2.41.0

