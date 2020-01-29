Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 055D814CBF3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 14:59:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4874pk0GzhzDqFJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 00:59:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4874h15RjJzDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 00:53:21 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TDiRTn186208
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 08:53:18 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xtfh0smpk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 08:53:17 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Wed, 29 Jan 2020 13:53:15 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 Jan 2020 13:53:13 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00TDrCOH50528384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 13:53:12 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A0F3A405C;
 Wed, 29 Jan 2020 13:53:12 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 228E1A4062;
 Wed, 29 Jan 2020 13:53:11 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.193.110.254])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jan 2020 13:53:10 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v6 1/5] powerpc/vphn: Check for error from hcall_vphn
Date: Wed, 29 Jan 2020 19:22:57 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200129135301.24739-1-srikar@linux.vnet.ibm.com>
References: <20200129135301.24739-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20012913-0020-0000-0000-000003A51647
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012913-0021-0000-0000-000021FCC6CD
Message-Id: <20200129135301.24739-2-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=807 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290114
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no value in unpacking associativity, if
H_HOME_NODE_ASSOCIATIVITY hcall has returned an error.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
---
Changelog (v2->v1):
- Split the patch into 2(Suggested by Nathan).

 arch/powerpc/platforms/pseries/vphn.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/vphn.c b/arch/powerpc/platforms/pseries/vphn.c
index 3f07bf6..cca474a 100644
--- a/arch/powerpc/platforms/pseries/vphn.c
+++ b/arch/powerpc/platforms/pseries/vphn.c
@@ -82,7 +82,8 @@ long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity)
 	long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
 
 	rc = plpar_hcall9(H_HOME_NODE_ASSOCIATIVITY, retbuf, flags, cpu);
-	vphn_unpack_associativity(retbuf, associativity);
+	if (rc == H_SUCCESS)
+		vphn_unpack_associativity(retbuf, associativity);
 
 	return rc;
 }
-- 
1.8.3.1

