Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F19336DFE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 09:40:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dx2TZ1tyjz3dHv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 19:40:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qMLuhbDt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qMLuhbDt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dx2Sb4S1lz30My
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 19:39:59 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12B8Wu7g035303; Thu, 11 Mar 2021 03:39:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gum1SCWNcyuP6HT+HE9o65u/Z6KXvIZg+qIpRHtYEXs=;
 b=qMLuhbDt+N+Y9oVhilgwkorWPEcEO9zWGQxYSrvthqXvzXl2kQ222BnlXYRRGRL6/uy5
 lWoh+Rdko1Xmgxi+rSXqjpNfE3JLX0kOF5T8L34CEwDlrFpqJ5zVRqux/OGdq16YzsXm
 WjqyiJ5ON8Or43I1nj7DHlsL2qzCOExQVjgq7HT/EHN69gA/vYPyOSKyHgzU2JEFP1DI
 DLdhmQRSEC5cW0sg1YVFynZwzKgmPbeE+hYkRniivHssH1VPL9Dd4ZnmO5Z7ah3kWeD9
 H9xEvYlT5vv6fmiXDNM+9eHErs9aA6rPU3j0/NNy9irrwa4hhUsu42WxmOw+gxen2yVu Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3774me7srh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 03:39:55 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12B8X7wK035834;
 Thu, 11 Mar 2021 03:39:54 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3774me7sqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 03:39:54 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12B8ZWk7008645;
 Thu, 11 Mar 2021 08:39:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 376aqsruxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 08:39:52 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12B8dnbP35717476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Mar 2021 08:39:49 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4066852050;
 Thu, 11 Mar 2021 08:39:49 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.77.205.2])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 88C7B52051;
 Thu, 11 Mar 2021 08:39:47 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 1/6] KVM: PPC: Book3S HV: Fix comments of H_RPT_INVALIDATE
 arguments
Date: Thu, 11 Mar 2021 14:09:34 +0530
Message-Id: <20210311083939.595568-2-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311083939.595568-1-bharata@linux.ibm.com>
References: <20210311083939.595568-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_02:2021-03-10,
 2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103110047
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

The type values H_RPTI_TYPE_PRT and H_RPTI_TYPE_PAT indicate
invalidating the caching of process and partition scoped entries
respectively.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index ed6086d57b22..6af7bb3c9121 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -411,9 +411,9 @@
 #define H_RPTI_TYPE_NESTED	0x0001	/* Invalidate nested guest partition-scope */
 #define H_RPTI_TYPE_TLB		0x0002	/* Invalidate TLB */
 #define H_RPTI_TYPE_PWC		0x0004	/* Invalidate Page Walk Cache */
-/* Invalidate Process Table Entries if H_RPTI_TYPE_NESTED is clear */
+/* Invalidate caching of Process Table Entries if H_RPTI_TYPE_NESTED is clear */
 #define H_RPTI_TYPE_PRT		0x0008
-/* Invalidate Partition Table Entries if H_RPTI_TYPE_NESTED is set */
+/* Invalidate caching of Partition Table Entries if H_RPTI_TYPE_NESTED is set */
 #define H_RPTI_TYPE_PAT		0x0008
 #define H_RPTI_TYPE_ALL		(H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC | \
 				 H_RPTI_TYPE_PRT)
-- 
2.26.2

