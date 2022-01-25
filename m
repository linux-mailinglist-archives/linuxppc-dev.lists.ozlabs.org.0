Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFD749B813
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 16:58:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jjs2t0nDlz3bPP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 02:58:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MUH7YzrX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MUH7YzrX; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jjs273pyTz2ypK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 02:57:50 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PFm5Mq026165; 
 Tue, 25 Jan 2022 15:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=K5VYV6WqCszK7ENSzIKYTfjFyMqznZDJesWgOB5E/4g=;
 b=MUH7YzrXw0mrZgaZv1sZgfVRPly5dX74MKBg279VD08xduXOyRBWEzmDhRzCn1nkrbnl
 TgEogQLPRrUvfkpCOz1UhEtmfbI27GmJUXq6o25MrZhW936bKOBkDrmWO9JdRkk7Azo1
 AUA06YNzOUAU+eM+U6MB9cOzNh55qcbEqDm7dPje4Ca95UrFCudoVxNPHvRrD0S5XM0e
 FcM475vgdgbYRQQuTaIjMIbBsHh79ZF+/00FnsLfowunR6L4tZbARFwYLfNnvkMvKGDy
 u/ithCgxHIXfu1K0GnavUwYQvLCPwM9wtEIkDP7y0orrQMDx1IqMMvGdYn/roV+VXWZN fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dtm5k87jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 15:57:45 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20PFpfru038613;
 Tue, 25 Jan 2022 15:57:44 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dtm5k87j4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 15:57:44 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20PFpldM019322;
 Tue, 25 Jan 2022 15:57:43 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 3dtbch1x30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 15:57:43 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20PFvgI436503808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 15:57:42 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CE85C6066;
 Tue, 25 Jan 2022 15:57:42 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F70FC6074;
 Tue, 25 Jan 2022 15:57:40 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.21.20])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jan 2022 15:57:40 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 0/4] KVM: PPC: KVM module exit fixes
Date: Tue, 25 Jan 2022 12:57:31 -0300
Message-Id: <20220125155735.1018683-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tqtfzLMPD7g0E8i71Do5nBv4wK41LB5S
X-Proofpoint-ORIG-GUID: 32gy_yZEVgEtLucHIl5brR0pNOnbC5rV
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_03,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=910
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201250100
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, aik@ozlabs.ru
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

changes from v2:

- patch 4: Matched module_put() to try_module_get()

v2:
https://lore.kernel.org/r/20220124220803.1011673-1-farosas@linux.ibm.com

v1:
https://lore.kernel.org/r/20211223211931.3560887-1-farosas@linux.ibm.com

Fabiano Rosas (4):
  KVM: PPC: Book3S HV: Check return value of kvmppc_radix_init
  KVM: PPC: Book3S HV: Delay setting of kvm ops
  KVM: PPC: Book3S HV: Free allocated memory if module init fails
  KVM: PPC: Decrement module refcount if init_vm fails

 arch/powerpc/kvm/book3s_hv.c | 28 ++++++++++++++++++++--------
 arch/powerpc/kvm/powerpc.c   |  9 +++++++--
 2 files changed, 27 insertions(+), 10 deletions(-)

-- 
2.34.1

