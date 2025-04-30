Return-Path: <linuxppc-dev+bounces-8172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EFBAA40F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 04:29:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnLjK3t3Mz30WT;
	Wed, 30 Apr 2025 12:29:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745980149;
	cv=none; b=fNSBAtbLxBHkUJLgkgrmbZ10gvQrp0+VdIwU8HEJ7mYRw/dCroZ1Jnn1yN/Tdpzpn3Zlv+pflsIeLTnB76vXW7KgZa4fvRl4QF7U+dSmwYXyxQCqOUN/oU0Y/0nN4rwYKsmjfHVDHaBulSh/kp0+zCa5irKmxosBZYVbICeuxhLnvWg364tn0NmWyKl5t+aiLI9JRDX76nC5cNCz4fy5ilDHdAbkcaL5XAK+JZgmWR+L+6VyYUbII/MNkkIIdM1mbQSk1MYJ17eLImiXFX2mMDP20UdZCjCIVhFqrK2BQWGrpUSqvI3Vdtn3BJFi7evakjYSHktQN5eZqPGmMTTtOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745980149; c=relaxed/relaxed;
	bh=YAt5PKrZsZXWVY4QvCJLY0dm50wh6yj00VnqU8/I+X4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g2Raoj1lPw3UeSnnlHkvOqHO8gOL0HjSPxxML69W6xMxNQ8X+a0n0vhtRE4r58gpYqW0mlSYwhY0FpYe65/COWiL+3dL79n2+HBbPCDCMX7O4qRwdC2vIgygkVzNi4w6ajmVrgMVGC4IIKSJdPumMfscQ2DWMgiiao40EGJOgkN7IqV8jdBTfbLZ/7kkbqSlDT8rVyzMTQbmyv+OXaiGptzOiE+8CBnmMMFMRr9fz1El4hOrno5MQXDCTRpGBhNzpZm2RX5ADVD07pECjLP0ZvvkRxAj+1yI5EW9sFSWdhU/UlVjpSLLYCeIHa30TCPpBhgd0EuSDaLdzteZWzqkmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KcDmo4nf; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KcDmo4nf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnLjJ4sVfz2yYf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 12:29:08 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLdKCI005335;
	Wed, 30 Apr 2025 02:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=YAt5PKrZsZXWVY4QvCJLY0dm50wh6yj00VnqU8/I+
	X4=; b=KcDmo4nfTtXDJ3C5Wur5a/+ln6KZ9plCwDhKcrPwmSixiKWBwi3J0GG9p
	gmSF6TSC/DrMOobKnMpj8DAv8yly/utCQgEJJBIZCkhz08i6aefhhbnC526xDfoA
	49J4s1DEwkF5CKbP14e98XzXtTehmx0ytGawjgPJIuyEQkA5nD7C7mPZr8HN2Eiq
	eGYQ+dC7qCc4e7St9dgD9oxjW9+DHjCkWu0IVNyu5j85Dk4RKbIgGKmk33i+srmo
	2gDQy5lDj5aMpt2rKmCVopZKjMdOipBMUzP15D27tP774aFEN6CTSkgnvdqhBIdn
	lyWLiYTr/bbMBR72a4e1Ip3IqfrzQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46b6vb0rvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 02:29:00 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53TNb4Xn008542;
	Wed, 30 Apr 2025 02:28:59 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 469ch35qx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 02:28:59 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53U2Suvg24249028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 02:28:56 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 534DA5805C;
	Wed, 30 Apr 2025 02:28:56 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 793FD5805E;
	Wed, 30 Apr 2025 02:28:54 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.186.27])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Apr 2025 02:28:54 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, sfr@canb.auug.org.au, tyreld@linux.ibm.com,
        linux-next@vger.kernel.org, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH] Documentation: Fix description format for powerpc RTAS ioctls
Date: Tue, 29 Apr 2025 19:28:47 -0700
Message-ID: <20250430022847.1118093-1-haren@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=BISzrEQG c=1 sm=1 tr=0 ts=68118aec cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=VnNF1IyMAAAA:8 a=djAk9vPNkLzTInBxRZwA:9 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: 33LKe_0kBKoJcMaZB7EZQUzW_WMvryO6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAxMyBTYWx0ZWRfX0Z/q0HnE9X3B m2kVKVdzeRKSBBhCbbd1n2x8JSpZKoqze8MBuuoUTCeqkr1+ywhDU9MvRQkpTALCQh7FDL/B+az TAe+jtfNSGUu23hKfpaEf20CwDx5kC0mNZ/k9kNffq6BRO3tk+bcxIUM3bIF5X6a1EpWThxJbkr
 pNit0mcJI1y/xVmwNjWswvNkAucVxZjqcdUR2+T0v1rP/9STHG7K4L7REblJdccJr+kSay2Opww jWiEoeOkdESRHaTAvwACSlHjRLK6jB36LiDMi8M+Qyur7t9cm0qnL3vtt4I7aPUgXBcy1cgCsL2 uT5pwN7iJEJ6G+XKj4LgjW2EXBWoZDLcEh66Jq+T9D6zLpH7PTJCTnil26KO+HSwyFWG4k196BX
 I3TWNc+UT/EH2lAlJALP/SS50U9pMFpmlDTUoiPOiQe1KxThhTIsasxKJf3iutTjCMxpO4BK
X-Proofpoint-ORIG-GUID: 33LKe_0kBKoJcMaZB7EZQUzW_WMvryO6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=933
 mlxscore=0 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300013
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix the description format for the following build warnings:

"Documentation/userspace-api/ioctl/ioctl-number.rst:369:
ERROR: Malformed table. Text in column margin in table line 301.

0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h
powerpc/pseries indices API
                            <mailto:linuxppc-dev>
0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h
powerpc/pseries Platform Dump API
                            <mailto:linuxppc-dev>
0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h
powerpc/pseries Physical Attestation API
                            <mailto:linuxppc-dev>"

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Fixes: 43d869ac25f1 ("powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls")
Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver for dump retrieval")
Fixes: 86900ab620a4 ("powerpc/pseries: Add a char driver for physical-attestation RTAS")
Closes: https://lore.kernel.org/linux-next/20250429181707.7848912b@canb.auug.org.au/
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 017a23aeadc3..fee5c4731501 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -366,11 +366,11 @@ Code  Seq#    Include File                                           Comments
                                                                      <mailto:linuxppc-dev>
 0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h            powerpc/pseries system parameter API
                                                                      <mailto:linuxppc-dev>
-0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h             powerpc/pseries indices API
+0xB2  03-05  arch/powerpc/include/uapi/asm/papr-indices.h            powerpc/pseries indices API
                                                                      <mailto:linuxppc-dev>
-0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h       powerpc/pseries Platform Dump API
+0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h      powerpc/pseries Platform Dump API
                                                                      <mailto:linuxppc-dev>
-0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h  powerpc/pseries Physical Attestation API
+0xB2  08     powerpc/include/uapi/asm/papr-physical-attestation.h    powerpc/pseries Physical Attestation API
                                                                      <mailto:linuxppc-dev>
 0xB3  00     linux/mmc/ioctl.h
 0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
-- 
2.43.5


