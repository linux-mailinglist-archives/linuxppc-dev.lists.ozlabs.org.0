Return-Path: <linuxppc-dev+bounces-14206-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D93C6254E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 05:47:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d8wG92sc9z2y7c;
	Mon, 17 Nov 2025 15:47:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763354849;
	cv=none; b=V2plREuJJzvoSwmIRVaVplxoI1jgMkXkiBhQFREOgwktPqC7dQxPTMUSclBjGGqkMmfAT3Jhro3pbOTLaQYJrE/CSSpydrSDO+I3/G/mUuOkbk2F75LGuMZ9O7jAV8YCkTGVpiW5OTX9FI7cG4TE+KA0SVZKTUzWjQAA397nv9Ibd0ceYe0xPXL+IMG00r7iNv9DFy0UXP1vzDRsCSXOcu7nTthRfqic8tOPoQyt8iv2XOYEaDzIvi87PSFBCbuWGyqh4oO8Xx7HYOoKHvG3Mys74HQMhfrzaBwKuP9h8I2RB8MVSKurwDJV7K9tK6NUOyHVJg8clp5tY171CR+p/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763354849; c=relaxed/relaxed;
	bh=i3PyvRHFm9Bw6w2PxzSPxz6fuyFyJe9OHw+2q292SrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YsTIHlnzWVzegwRQJ9hEERoXKCdSBqaxIatyNeGtHICQQvuRhQjzZTjFtuNlLu0GQls6FIzc1qGjBJ4/907u31xrmbImqp7IHv6fa5ZjPAd7M1H64A31mvGZIlWIQTGky6Ae++sqrZQndFbyx4cNJTQLazxD3p6YFVdVMw3FfUEfHOCIYuKWteXbhrZoCV5S+5tTBewoSSMA5kBJ8Z7xzd6VLdBZAFhnNeFmBNhvdQgcxW9sUzxLkIWOVPlT3qUOQx6V2A+fbcHrW4Mqzm751Ywyz9i0uR5AAKLTueEplEciJBCMENuFgK+iYueotrtjVALZBTNq+f97nsBm5o+JRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m6w71gru; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m6w71gru;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d8wG8329Dz2xQr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Nov 2025 15:47:27 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AGJlKYv007805;
	Mon, 17 Nov 2025 04:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=i3PyvRHFm9Bw6w2PxzSPxz6fuyFyJe9OHw+2q292S
	rM=; b=m6w71grur2YtvAgehJqumxgtTyfwjNKt2Wtd8h2afXJB/zVBQPlZN8aM7
	CrRWxen+UesBrDeoJb4QFa600n7905fqgSH9uXyYlrAtQjFtrhYsxhge23V/gePD
	AGDfDyHZd3Lg9Yat3zh/B2Zg7iqvObhwTjPSxOR+3O7n7rCXV7yiVfayhzQba5MH
	Yycvh/ycfzsDEdHizINU+fNQ7/3XBA4/ECh2ABhjo7D+3ebv+rZfX66sBazSvfNm
	3OygcGU8czroDkDfagkkoKpDpGbsT94DluSSshss1pLtPQNaxhk6PdoTt4IIsOsV
	EPzl+44iQnV2YpJU46lOEft8E5hnQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjvvh95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 04:47:25 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AH4lPcu006026;
	Mon, 17 Nov 2025 04:47:25 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjvvh94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 04:47:24 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH33POD005244;
	Mon, 17 Nov 2025 04:47:23 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af5bjux8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 04:47:23 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AH4lHWB47972634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Nov 2025 04:47:17 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8420220049;
	Mon, 17 Nov 2025 04:47:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D1E320040;
	Mon, 17 Nov 2025 04:47:14 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Nov 2025 04:47:14 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Aditya Gupta <adityag@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Dave Young <dyoung@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
        Jiri Bohac <jbohac@suse.cz>, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Pingfan Liu <piliu@redhat.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Sourabh Jain <sourabhjains@linux.ibm.com>,
        Vivek Goyal <vgoyal@redhat.com>, linuxppc-dev@lists.ozlabs.org,
        kexec@lists.infradea
Subject: [PATCH v5 0/3] kexec: reorganize kexec and kdump sysfs
Date: Mon, 17 Nov 2025 10:17:05 +0530
Message-ID: <20251117044708.1337558-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
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
X-Authority-Analysis: v=2.4 cv=BanVE7t2 c=1 sm=1 tr=0 ts=691aa8dd cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8
 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8
 a=ySsn6G4rmpzxBGPr9pgA:9 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX+yWYuEPg6FQl
 m5UtIVnlgxoEXse+BMcXB6jznEaH4SWlaVIfFSAKdatJqSr7ikDqfVjo26G+yMUcUUoSJJpKx+M
 HIzimRnbh09kzrA2LP1LoVRwcRJEcrWi93xVYtC4cdkM3Dzy1eoZp0xSp7svVMYSxm+1/jgjDOu
 2tJFHq13tybvXDu8bKcQZmF/BWms6oJTdAPMuJFO0Y4+ZBY35MpxEL3cyvRApewJFexRxR/vT5p
 htrAFBdbJuVrRExQXZkInHFYpBp4CflR5xmD7EvVTV3H5qdBUMjEt1svFpuDGaEXEJ7qc5o5XlP
 Uc7zkFJAylvV3JUOeFe8SRkP+egKF2PYP+Q4wcBRPl0LgLGU+7USbJickLSXRmPB12UL4MUl9nK
 lm1fLUOvUkI0D/zpimAwNsvQHDokpg==
X-Proofpoint-GUID: WgiCgMzdwuAbf5jOBHpheioaLzKFn6uh
X-Proofpoint-ORIG-GUID: 1wDKyzMpO1PdNluh7EnFvQkQlRB2my0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

All existing kexec and kdump sysfs entries are moved to a new location,
/sys/kernel/kexec, to keep /sys/kernel/ clean and better organized.
Symlinks are created at the old locations for backward compatibility and
can be removed in the future [01/03].

While doing this cleanup, the old kexec and kdump sysfs entries are
marked as deprecated in the existing ABI documentation [02/03]. This
makes it clear that these older interfaces should no longer be used.
New ABI documentation is added to describe the reorganized interfaces
[03/03], so users and tools can rely on the updated layout going
forward.

Changlog:
---------

v4 -> v5:
 https://lore.kernel.org/all/20251114152550.ac2dd5e23542f09c62defec7@linux-foundation.org/
 - Splitted patch series from the above patch series

Note:
This patch series is dependent on the patches:
https://lore.kernel.org/all/20251117035153.1199665-1-sourabhjain@linux.ibm.com/
https://lore.kernel.org/all/20251117041905.1277801-1-sourabhjain@linux.ibm.com/

Cc: Aditya Gupta <adityag@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Jiri Bohac <jbohac@suse.cz>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Cc: Pingfan Liu <piliu@redhat.com>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: Sourabh Jain <sourabhjains@linux.ibm.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradea

Sourabh Jain (3):
  kexec: move sysfs entries to /sys/kernel/kexec
  Documentation/ABI: mark old kexec sysfs deprecated
  kexec: document new kexec and kdump sysfs ABIs

 .../ABI/obsolete/sysfs-kernel-kexec-kdump     | 59 ++++++++++++
 .../ABI/testing/sysfs-kernel-kexec-kdump      | 24 +++--
 kernel/kexec_core.c                           | 91 ++++++++++++++++++-
 kernel/ksysfs.c                               | 68 +-------------
 4 files changed, 166 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump

-- 
2.51.1


