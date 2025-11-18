Return-Path: <linuxppc-dev+bounces-14293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1809AC69297
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 12:45:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9jV46TBMz2yvM;
	Tue, 18 Nov 2025 22:45:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763466332;
	cv=none; b=MczJ6ZzvWWtQ3hVgPFfneGsoUdnALx77aAgDZNjIPWcetFKlsdkl6Cp7ur22LJ/ESXHmgYr2p5TKVjhZArlGfBe9q9fSclpJy5Fwf1HikvjIi7KIjMldqO0JP3syixI6jwqA2X4tfSpSQAS3dsOtACZFqkaAoRpa6oJ7Hl5u3KtsqXH2KlgZnGUpO6pd4yTlcWBAokS8DlNjTiW4uhRrU0ZejcR7DX3+/RiCbHc85Iwi29GHibIbEpaX6463s4IdXXqJGVUtZb0nn87C4byvn657rkpt/ZyewAOw1kI87iOGXE8TOOIz1UpdaxHBjB14gdCCkLf3pGRsOJxEJHvm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763466332; c=relaxed/relaxed;
	bh=1LYnpw7BQsBxhdrG/PnVMrZd5dQ4MlcXe04BUtniivM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E6lcU6/1JZR5GhFJJDewrqoCl5RveGo6fuY+QgoBBCz0gjSQFLubUDBKsJYbvcwQ29du4ZF+vNmexY5vqevgBLoiCdsbIsD5TZsXHMWKvwDirlw2Fftofdp+TWOf4oiVSwBfqSoJR3JZPriYnN7U/9n8OR48acLBlpB/otk4g9rj0A5KUhLysw/lm29YSHVvL9CcVBA0j6AzbF7jR0ECsjeQwtYo+sBxXAzD+b0gOPILWz/UTuxQYbRuuAOKSDhTHNIVxU+2R05HLQX45Kd68C6y3/tONYhmiJxwv0uTGaqHJUID1/4ygooWJ10oZFVOqGSWTscVXfYGa0rTOJXRGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E/H1KOMf; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E/H1KOMf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9jV35fL9z2yv6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 22:45:31 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI105BC003015;
	Tue, 18 Nov 2025 11:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=1LYnpw7BQsBxhdrG/PnVMrZd5dQ4MlcXe04BUtnii
	vM=; b=E/H1KOMfYQCANcB9pYaIJnhnXJguY4Ita3mdnv3v6bECdXeVx3X9qi707
	7uGobpBUzz73ZCuSdy86/oov+thYrMqBcyfFsyWBwB0hAVUMSrptnxwLnU89qSoF
	gS4ZcIXu87qmIhKVUIv7BkY5vt2br8zG6b8enx7BMtRaszDLmBCgMZCXbM7BP/+B
	x32kByJ3UKMTNqNWqz69gMWN7Xgt9EB0b8oF1CSfI/jpC74BUGwTO9v3L162/SW5
	qCiJr9NCbkNrlfbk6nwOt4CbYT2+NdAnCNQD/+EJv8eSHIVDTcnsCYA9MU7HWZKx
	OjWw7S7AgusYEbomeOqFxeTi4+GEA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw2k06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 11:45:25 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AIBjOXM017596;
	Tue, 18 Nov 2025 11:45:24 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw2k04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 11:45:24 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIBZ5Qo022434;
	Tue, 18 Nov 2025 11:45:23 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4umtuhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 11:45:23 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AIBjJdd49480080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Nov 2025 11:45:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2EDDC20043;
	Tue, 18 Nov 2025 11:45:19 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9282C20040;
	Tue, 18 Nov 2025 11:45:15 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.39.25.190])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Nov 2025 11:45:15 +0000 (GMT)
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
        Vivek Goyal <vgoyal@redhat.com>, linuxppc-dev@lists.ozlabs.org,
        kexec@lists.infradead.org
Subject: [PATCH v6 0/3] kexec: reorganize kexec and kdump sysfs
Date: Tue, 18 Nov 2025 17:15:04 +0530
Message-ID: <20251118114507.1769455-1-sourabhjain@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=BanVE7t2 c=1 sm=1 tr=0 ts=691c5c55 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8
 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8
 a=JfrnYn6hAAAA:8 a=ySsn6G4rmpzxBGPr9pgA:9 a=HkZW87K1Qel5hWWM3VKY:22
 a=IC2XNlieTeVoXbcui8wp:22 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX2eyMoiZpzWKn
 8Ym/lXNPqe8y3VlDnSV3S8wPhOPj7E+3TVjFu66vY0iUKHk/sFoviFvnJLrR9LBeJ3parymYXvI
 Xxl5cspHwoH9rjjvybeRtJz4Gy3/3rGHyTY5vQJnZpkanJRxm0jtbDFDY03tkrM1tShGGaHCfxY
 3XE2ZecaS9S0bFA9cRdxtDwnJj2xPGcq4ZUf6KE9gAf8HSNaABuLnJoHhkJ5N5JyV38E6YCeOxa
 /4L9liHsFeS41AMBzeKWlOB9EqOoRFvW7iYo+iykAjzgtq539yXVRwQcH650lAfbg9yrX5oWOC5
 KxaEyIyOHU2l/wGeiGO5pLL8nWMO3tECPVlnQnvYCffSWJ3+UMSkYU5qm19/wG9oT72VXU3uUx6
 Eok9SSsPL5dvZY0FSQ9Sl8AY/Qvhvw==
X-Proofpoint-GUID: _MjYGZukH7LGBnnSOSWkY_C6rgEmreeq
X-Proofpoint-ORIG-GUID: SRrtRBWNnJ1LoTN24vTLy0NU7O8FerCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
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
[03/03], so users and tools can rely on the updated sysfs interfaces
going forward.

Changlog:
---------

v4 -> v5:
 https://lore.kernel.org/all/20251114152550.ac2dd5e23542f09c62defec7@linux-foundation.org/
 - Splitted patch series from the above patch series

v5 -> v6:
 - Move /sys/kernel/kexec_crash_cma_ranges also to new /sys/kernel/kexec node
 - Update commit messages

Note:
This patch series is dependent on the patches:
https://lore.kernel.org/all/20251117035153.1199665-1-sourabhjain@linux.ibm.com/
https://lore.kernel.org/all/20251118071023.1673329-1-sourabhjain@linux.ibm.com/

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
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradead.org

Sourabh Jain (3):
  kexec: move sysfs entries to /sys/kernel/kexec
  Documentation/ABI: mark old kexec sysfs deprecated
  Documentation/ABI: new kexec and kdump sysfs interface

 .../ABI/obsolete/sysfs-kernel-kexec-kdump     |  71 +++++++++
 .../ABI/testing/sysfs-kernel-kexec-kdump      |  26 ++--
 kernel/kexec_core.c                           | 141 ++++++++++++++++++
 kernel/ksysfs.c                               |  89 +----------
 4 files changed, 230 insertions(+), 97 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump

-- 
2.51.1


