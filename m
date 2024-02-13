Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB6585283A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 06:29:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m7Cwk1fE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYqdj6lVFz3dVm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 16:29:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m7Cwk1fE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYqcN3mbDz3cWw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 16:28:36 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41D52jZ4000539;
	Tue, 13 Feb 2024 05:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=IvK+8d3L5jmfDhMn4Bt1DklpfBeWrXTvDFcR/8Fi/wQ=;
 b=m7Cwk1fEUE/TRfPJRIfhKyw+Bh/VciJjAUVItqLh6Cjb+x2w1N56MMqf+qrAD4yQ800B
 y3V2cug4Z58tEyTnwtWWOazLOy3PnlOMdnILPvimSNFiYIAqPUx0mTG5wkRVG3XDx/wO
 Tzz5zuP9bdLvFnVmOlzq+lK58TDpGxW1rxRc+yVSYxLlsEEjhxFavMsi7d55R97cGI8I
 y0YEg2vopjGOoZSdiodA4i+czqraVFo6jrRDrp2GrgmiwCvIhYbsQqT8SAXlpwsoK3Tv
 LeZ5J6+7+RMqE3F1yDRcanlL0a1Jh40u/TWrHws1UYTuNX4uPMITzV67HNiaQzyTDVvZ +A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w81wy0ff7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 05:28:25 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41D5PnlD030991;
	Tue, 13 Feb 2024 05:28:25 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w81wy0fem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 05:28:25 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41D3cpSd004258;
	Tue, 13 Feb 2024 05:28:24 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6kv05m1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 05:28:24 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41D5SI6728115258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Feb 2024 05:28:20 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCA942004B;
	Tue, 13 Feb 2024 05:28:18 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C463E20049;
	Tue, 13 Feb 2024 05:28:16 +0000 (GMT)
Received: from li-c1fdab4c-355a-11b2-a85c-ef242fe9efb4.ibm.com.com (unknown [9.179.15.254])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Feb 2024 05:28:16 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com
Subject: [PATCH] powerpc/pseries: fix accuracy of stolen time
Date: Tue, 13 Feb 2024 10:56:35 +0530
Message-Id: <20240213052635.231597-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uLuySvfLQsPOfW2ewn6SOjkmNFasJ7bK
X-Proofpoint-ORIG-GUID: l3H3sve1MtbU7_j4zZ--sgRaWLxhsWtj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_02,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402130039
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
Cc: srikar@linux.vnet.ibm.com, sshegde@linux.ibm.com, aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerVM hypervisor updates the VPA fields with stolen time data.
It currently reports enqueue_dispatch_tb and ready_enqueue_tb for
this purpose. In linux these two fields are used to report the stolen time.

The VPA fields are updated at the TB frequency. On powerPC its mostly
set at 512Mhz. Hence this needs a conversion to ns when reporting it
back as rest of the kernel timings are in ns. This conversion is already
handled in tb_to_ns function. So use that function to report accurate
stolen time.

Observed this issue and used an Capped Shared Processor LPAR(SPLPAR) to
simplify the experiments. In all these cases, 100% VP Load is run using
stress-ng workload. Values of stolen time is in percentages as reported
by mpstat. With the patch values are close to expected.

		6.8.rc1		+Patch
12EC/12VP	   0.0		   0.0
12EC/24VP	  25.7		  50.2
12EC/36VP	  37.3		  69.2
12EC/48VP	  38.5		  78.3


Fixes: 0e8a63132800 ("powerpc/pseries: Implement CONFIG_PARAVIRT_TIME_ACCOUNTING")
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 4561667832ed..bdcc428e1c2b 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -662,8 +662,12 @@ u64 pseries_paravirt_steal_clock(int cpu)
 {
 	struct lppaca *lppaca = &lppaca_of(cpu);

-	return be64_to_cpu(READ_ONCE(lppaca->enqueue_dispatch_tb)) +
-		be64_to_cpu(READ_ONCE(lppaca->ready_enqueue_tb));
+	/*
+	 * VPA steal time counters are reported at TB frequency. Hence do a
+	 * conversion to ns before returning
+	 */
+	return tb_to_ns(be64_to_cpu(READ_ONCE(lppaca->enqueue_dispatch_tb)) +
+			 be64_to_cpu(READ_ONCE(lppaca->ready_enqueue_tb)));
 }
 #endif

--
2.39.3

