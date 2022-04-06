Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D61B74F5A19
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 11:39:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYKGq6d1Yz2yb9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 19:39:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SeGq+9Pj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SeGq+9Pj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYKG76rWmz2xmZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 19:38:55 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2369LsBv015396; 
 Wed, 6 Apr 2022 09:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=/JwEGQZFge6821qPilSGSszZiKzPhjtQ14ws7k7msmg=;
 b=SeGq+9PjvFixgZXzMarOmuAdbKttYEOgUVpsLMpnJ6IJjw2FvfMpf+DzSlPS2RKJheir
 nY7B/e3LuQr3MwE5vIp+gm0bKROk0rM8M3lKJnzttcOn2mD4NircovAfA6OxfcEWSOcr
 wo4fkuuvwMIBrM71SJwnznHP6J612gpUwbqfH/fEWh14zxrsnuJlu2GPKqQktm/zZuDI
 YqZL1Qb5E032Jcbt9b99r93GfufoazYBGSHhdbAdU7flHy8RNokeOz/GhNkHnUAoVd2d
 Sn5jfSXaShSQi/+r/b5KLhxvEbuuEC/nXComQR96jeNRWI4IKFoBD/md4ev1zUT0H+i9 iA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f95epks7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 09:38:49 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2369bNWI022251;
 Wed, 6 Apr 2022 09:38:46 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3f6e48p7fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 09:38:46 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2369chVx38666572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Apr 2022 09:38:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84BBB52052;
 Wed,  6 Apr 2022 09:38:43 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.domain.name (unknown
 [9.211.33.167])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0B1D85204F;
 Wed,  6 Apr 2022 09:38:40 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 0/3] powerpc/fadump: fadump fixes and improvements
Date: Wed,  6 Apr 2022 15:08:36 +0530
Message-Id: <20220406093839.206608-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uqeYE8TKapf-Vw3iB1l6OKul_bcuKGo_
X-Proofpoint-ORIG-GUID: uqeYE8TKapf-Vw3iB1l6OKul_bcuKGo_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_03,2022-04-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxlogscore=820
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204060044
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series fixes a couple of issues in fadump and improves logging.
The first patch fixes a bug that is observed when memory reserved for
fadump is not adjacent to boot memory area. The second patch ensures
mmap read succeeds for all memory regions in the vmcore. The third
patch improves the data that is printed for fadump.

Hari Bathini (3):
  powerpc/fadump: fix PT_LOAD segment for boot memory area
  powerpc/fadump: align destination address to pagesize
  powerpc/fadump: print start of preserved area

 arch/powerpc/kernel/fadump.c                 | 13 +++++++++++--
 arch/powerpc/platforms/powernv/opal-fadump.c |  6 +++---
 arch/powerpc/platforms/pseries/rtas-fadump.c | 12 +++++++++---
 3 files changed, 23 insertions(+), 8 deletions(-)

-- 
2.35.1

