Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 0C97B8C99CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 10:26:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SbRAsbpL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VjVs250vcz3fnN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 18:21:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SbRAsbpL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjVrG5hmFz3cXL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2024 18:20:46 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44K7jwGA026212;
	Mon, 20 May 2024 08:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=6ibjdJZpJPbLn0KY6yYakUfCG8KCGMWhloUWxKT+g6M=;
 b=SbRAsbpL6MbKXttKxFTYkQKKsB/QbB20CcPMdZcQKTiUdSCSQO1jGGaMZvNCqx9C3eML
 yy+VJVB1pRQmcvt8JRKn21pq19RpJ0qZ28Cci3EeL/UAXL0j+j7Uoax1hmW/0nmnnGDA
 3kaYYk4ACMcGviFgmXxE9FOkA5epY7yBbOPs3Ws5so1FtZ3ojwbgadxu9vl2zI2yjNCM
 L5qhHUKdznlZLdzwc3HjqhBjNTNQXAB06qBi20wH3nTFDMKxhwexwQePAb+b7Y/usVGe
 QIdGK3ynouq/FUWZkT0qBkudp7HC/guK8PCFxrLV0FQsO73ndhJUdEaIirCY7pqDhT72 BA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y80ypg8vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 08:20:30 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44K8KT6a014300;
	Mon, 20 May 2024 08:20:29 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y80ypg8vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 08:20:29 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44K50bKS000967;
	Mon, 20 May 2024 08:20:29 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y771yxvyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 08:20:28 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44K8KNmA36110756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 May 2024 08:20:25 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36B2C2004D;
	Mon, 20 May 2024 08:20:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6662D20040;
	Mon, 20 May 2024 08:20:21 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.in.ibm.com (unknown [9.204.206.66])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 May 2024 08:20:21 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen.n.rao@linux.ibm.com, clg@kaod.org
Subject: [RESEND PATCH 0/3] XICS emulation optimizations in KVM for PPC
Date: Mon, 20 May 2024 13:50:07 +0530
Message-ID: <20240520082014.140697-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: llrPwTYK0wMMi7VVcjfeLRcnn2qBhCRI
X-Proofpoint-ORIG-GUID: VIym0kwuFRaMK0W0EVnT3K-BNOvclc-h
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_04,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=599 clxscore=1011 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405200068
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
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Optimize the XICS emulation code in KVM as per the 'performance todos'
in the comments of book3s_xics.c. 

Performance numbers:
1. Test case: Pgbench run in a KVM on PowerVM guest for 120 secs


2. Time taken by arch_send_call_function_single_ipi() currently measured 
with funclatency [1].

$ ./funclatency.py -u arch_send_call_function_single_ipi

usecs               : count     distribution
0 -> 1          : 7        |                                        |
2 -> 3          : 16       |                                        |
4 -> 7          : 141      |                                        |
8 -> 15         : 4455631  |****************************************|
16 -> 31         : 437981   |***                                     |
32 -> 63         : 5036     |                                        |
64 -> 127        : 92       |                                        |

avg = 12 usecs, total: 60,532,481 usecs, count: 4,898,904


3. Time taken by arch_send_call_function_single_ipi() with changes in
this series.

$ ./funclatency.py -u arch_send_call_function_single_ipi

usecs               : count     distribution
0 -> 1          : 15       |                                        |
2 -> 3          : 7        |                                        |
4 -> 7          : 3798     |                                        |
8 -> 15         : 4569610  |****************************************|
16 -> 31         : 339284   |**                                      |
32 -> 63         : 4542     |                                        |
64 -> 127        : 68       |                                        |
128 -> 255        : 0        |                                        |
256 -> 511        : 1        |                                        |

avg = 11 usecs, total: 57,720,612 usecs, count: 4,917,325

4. This patch series has been also tested on KVM on Power8 CPU.

[1]: https://github.com/iovisor/bcc/blob/master/tools/funclatency.py

Changes v1 -> v1 resend
1. Add Cedric to CC

Gautam Menghani (3):
  arch/powerpc/kvm: Use bitmap to speed up resend of irqs in ICS
  arch/powerpc/kvm: Optimize the server number -> ICP lookup
  arch/powerpc/kvm: Reduce lock contention by moving spinlock from ics
    to irq_state

 arch/powerpc/kvm/book3s_hv_rm_xics.c |  8 ++--
 arch/powerpc/kvm/book3s_xics.c       | 70 ++++++++++++----------------
 arch/powerpc/kvm/book3s_xics.h       | 13 ++----
 3 files changed, 39 insertions(+), 52 deletions(-)

-- 
2.44.0

