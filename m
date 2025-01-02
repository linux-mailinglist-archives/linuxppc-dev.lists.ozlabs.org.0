Return-Path: <linuxppc-dev+bounces-4591-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49879FFF52
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 20:19:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPGjg1YZ2z2yyT;
	Fri,  3 Jan 2025 06:19:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735845575;
	cv=none; b=aFrTVztJxYayXVzYlbvbPiQCMKSGdyJ5gUw3CJPVc3VJQLIfk20tnd6v0KnKIP8sFDnMLkvyQ8leI28VXL2YhrEN1IyeZ6MNQvLR0wIcmVFfxKU3CaCJVCjobvnMs36qeR0MpvCTb/EMSRDYHiIYLzcvwqISNQO4MYOSUtL9weE8OKMfTQnjbin8uj/H/NQxYMhbLCP7oQFYeR5anuVQolEoXkeXhffhuEVzDyjjhF9AbIcJjmIIyBT/iHJQE5i5AIAEbWY1Bnw69Nb906w3U+GErdUGIRGXKDevHtprVplwNTlHXPguJIGEShzvvJ6z51y9LwK8y01AdbktU9sk1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735845575; c=relaxed/relaxed;
	bh=dajllWH3TvAw1EOr6puZiHpwkDd8uX5q+EWvz9E14hY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NfKSkBX+AopXkRUVpknOi2uu5c+6HEzuT2/ggdGs/xFH5YiNyLecG/2ttQsXbYkqO17ZPV4PJHQ3uPQtQOJ6Dxtbw84ScJNoQYaqi9LMi6ddhK/VC70ecd6JaeKpuBYY4lVOZVCG20iwB3JqULvZkwDZaHW4c74VEMP0wVRz7BTw3/+Uxn16jDmPy67D+6s4eM93XMBewzSURUHfrvqT6fOPrcYWFBejJDlRNSiwcPDIpAAkj507SciQfUgjKXkIHqtYDSK9UeoJniImHY6bZsiO4dkxaAAIFDKmFpuTWAAQtGUMpKrHR9ULc89XJa9wAMeczihs7G+Q3jg96D/wOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a8w0wYVn; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a8w0wYVn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPGjd42wZz2yvl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 06:19:32 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502G1jo3029226;
	Thu, 2 Jan 2025 19:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=dajllWH3TvAw1EOr6puZiHpwkDd8uX5q+EWvz9E14
	hY=; b=a8w0wYVnjz79RYoeZrQ/+g7LIqsql+XsdboNs79SvRMB4P6Kk27z240Xt
	+iGDkpXDddGSLhqDChsMiy8A/N3TkSQsMZDDYzM1bPDJv+g/xwPIy1tSUM+vw7C1
	QTT26qctR01meMC+EgU0F29auqMo6IeLL99TAw0vNwxxY/8XIDCp2hiICb18jO/x
	CWGd/2vDuZJYPI+U0EUWTVy301rgAS0XvIVM7nQcQcw36WGSxBu6jVsja7K66Rvg
	RsQe1S6CVq5ee10256xU9ZilPqO+7S6y6rM6xBPA3yeIpn+S1RQwouhJ2vwQLvYy
	67x+iq9xAtkqK953Q3NhwZrvuNzvw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43wfhabmgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 19:19:20 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 502JEaf1029946;
	Thu, 2 Jan 2025 19:19:20 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43wfhabmgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 19:19:20 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 502FrNvo010180;
	Thu, 2 Jan 2025 19:19:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43tvnnkccy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 19:19:19 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 502JJFgE56820158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 19:19:15 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFD342004B;
	Thu,  2 Jan 2025 19:19:15 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1854520040;
	Thu,  2 Jan 2025 19:19:14 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.222.188])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Jan 2025 19:19:13 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mpe@ellerman.id.au, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] powerpc: Enable dynamic preemption
Date: Fri,  3 Jan 2025 00:48:55 +0530
Message-ID: <20250102191856.499424-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _z0JCdzpYA67sUQs9sZN9fZBLaosnR3s
X-Proofpoint-ORIG-GUID: 0FEpspzjamd1mAw8SfyMWKZZtfOsUnxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxlogscore=430 suspectscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501020167
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Now that preempt=lazy patches[1] are in powerpc-next tree, sending out the
patch to support dynamic preemption based on DYNAMIC_KEY. I am not sure
when it was to be sent out exactly. So here it is.

Depends on [1] to be applied first, if not in the tree yet.

Once the arch supports static inline calls, it would be needed to
evaluate to see if that gives better performance. 

v1->v2:
- Instead of copying asm-generic preempt.h content include it in
  arch/asm preempt.h. (Christophe Leroy)
- Merge the patches into one patch (Christophe Leroy)

v1: https://lore.kernel.org/all/20241125042212.1522315-1-sshegde@linux.ibm.com/
[1]: https://lore.kernel.org/all/173572211264.1875638.9927288574435880962.b4-ty@linux.ibm.com/

Shrikanth Hegde (1):
  powerpc: Enable dynamic preemption

 arch/powerpc/Kconfig               |  1 +
 arch/powerpc/include/asm/preempt.h | 11 +++++++++++
 arch/powerpc/kernel/interrupt.c    |  6 +++++-
 arch/powerpc/kernel/traps.c        |  6 +++++-
 arch/powerpc/lib/vmx-helper.c      |  2 +-
 5 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/include/asm/preempt.h

-- 
2.39.3


