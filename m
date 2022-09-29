Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1AD5EEB61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 03:58:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdGjn2fQ7z3c81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 11:58:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eldl3pW3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eldl3pW3;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdGj22ynJz306m
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 11:57:57 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28T0UFte013496;
	Thu, 29 Sep 2022 01:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fE9gR5hp0LMFgDOfFw8iZQx5MYNa99Yo3ntO91XQ6gk=;
 b=eldl3pW39lvHzJXOlnuUp4GpkQZNm6X2SQ2QEshEka/qbuuRQJLSfG7sezsIjOQSDyBN
 5m7X7/Ah1YFYM2gHn6jPhski6ucJW0GMfhUDLYu3xXr2OqdodXHBoD/xKekxBXRPS2Ed
 1FFFCE5CCZhCaGrf19U99Lqiu7J40h+whT7woj0uhRhs979cP/NMb/KxpTLfC1j/OhGi
 2lXQtGr1zXaPrYmr+YJB9QtxD9iuXcoAd0eUmo5L+qj7+VItlu78A5+VmnhBALZPepf+
 XpiJe/SU1LSWTRsN2IhLfMKjFpI2RUs2skx8Cp8Pe11wA5kGb2srwmbBsWhSmfvUviMX GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvqgcuey2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 01:57:48 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28T1qDYD019621;
	Thu, 29 Sep 2022 01:57:47 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvqgcuexs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 01:57:47 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28T1pGnS030522;
	Thu, 29 Sep 2022 01:57:47 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma05wdc.us.ibm.com with ESMTP id 3jssh9xx0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 01:57:47 +0000
Received: from smtpav05.dal12v.mail.ibm.com ([9.208.128.132])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28T1vjWi7144072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Sep 2022 01:57:45 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDD7A5805D;
	Thu, 29 Sep 2022 01:57:44 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A932058056;
	Thu, 29 Sep 2022 01:57:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.36.35])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Sep 2022 01:57:43 +0000 (GMT)
Message-ID: <55380253ea0c11341824cd4c0fc6bbcfc5752689.camel@linux.ibm.com>
Subject: [PATCH] powerpc/pseries/vas: Pass hw_cpu_id to node associativity
 HCALL
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, nathanl@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Date: Wed, 28 Sep 2022 18:57:33 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lP8UrWNeDi2OjBRd1m8HOz7HXlGp884N
X-Proofpoint-GUID: qFJyemReBbugxjAkkKrnxCgmM9jAP1RY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_11,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290008
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Generally the hypervisor decides to allocate a window on different
VAS instances. But if the user space wishes to allocate on the
current VAS instance where the process is executing, the kernel has
to pass associativity domain IDs to allocate VAS window HCALL. To
determine the associativity domain IDs for the current CPU, passing
smp_processor_id() to node associativity HCALL which may return
H_P2 (-55) error during DLPAR CPU event.

This patch fixes this issue by passing hard_smp_processor_id() with
VPHN_FLAG_VCPU flag (PAPR 14.11.6.1 H_HOME_NODE_ASSOCIATIVITY).

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index fe33bdb620d5..533026fd1f40 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -348,7 +348,7 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 		 * So no unpacking needs to be done.
 		 */
 		rc = plpar_hcall9(H_HOME_NODE_ASSOCIATIVITY, domain,
-				  VPHN_FLAG_VCPU, smp_processor_id());
+				  VPHN_FLAG_VCPU, hard_smp_processor_id());
 		if (rc != H_SUCCESS) {
 			pr_err("H_HOME_NODE_ASSOCIATIVITY error: %d\n", rc);
 			goto out;
-- 
2.26.3


