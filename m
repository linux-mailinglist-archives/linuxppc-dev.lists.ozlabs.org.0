Return-Path: <linuxppc-dev+bounces-13825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF973C391CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 05:51:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d28ss4ZzBz3069;
	Thu,  6 Nov 2025 15:51:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762404689;
	cv=none; b=S004+nglR22Fpo+BLBAI3GWoSglMrtQyvhwwru0NzXgL9cQbDnOIfgl3QpNjCp7FiOZAL2jiCteJTbfep5nys5IBUcoH1f3th3klw0VF3BCBkZBSI3XDWIM5NCTOqJaxbnsnBae6CGJ0NOlhvJeNpxsiFcy22iPuDV7OVkP4myiXOfdEp/Ceswmvb/Rk/o/xTeBGsrROegBzec55vVIbCn1MTWy6V00XLcZUEAVTXVsndwvOWKl6eV5VTaDwWGiLC7T3fICNI3G39GaA7XgrmcsMqp6PvO+AGlVIO9RysaW/9z22d+/82cbGqhNxtiUc8SHRBE6uVMiLVdawVVHgfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762404689; c=relaxed/relaxed;
	bh=t6ZGzI+lmWrKHgAQrU3g0zBwXtXocDa7Pt+nSKTsl5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NZZ69gEFiK5Mpak2P6BnyQ/58Ko+mdmfZlvQjuFJ2z/Cg1QZsY42hMcxVDEDqEZ8da74I+uZ8ISxNxB2txYInFNPIajgCITWILBnYcmCCFwXe+yijDSwCnlWM7ynb4UDeWccXRVDKabtg44TiJUiddYYQWJDP0aXlsU/e3nSykprOUOCccMS6nbT79aJXoP8HV2uEkI91iMwtKFusuwWi96b2dBf6CxugZl9i1qcpVxBwjqq/VdWr1SW9zYH6jQiLvtCrv6WPaGrIG2PcVGRThmXgAxoJA0dzWb8VYpvSShLqnbGpSqwYWZ4oYzwUd5nBIwLDmecIIGRsOpQRvlvhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lr9MjWeY; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lr9MjWeY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d28sr2hV6z2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 15:51:27 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A5HHWPT007984;
	Thu, 6 Nov 2025 04:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=t6ZGzI+lmWrKHgAQrU3g0zBwXtXocDa7Pt+nSKTsl
	5w=; b=Lr9MjWeYsS6rtxcZuLQXCpVSWr82G/mAc/tMUdanTb75ZluIfpA9zncAl
	jrTNJxHQO33jPgNmGL48lcj1zZv22R742JiM2yq5zB+cneoaOvgJf1+RKfeH2IIg
	7lpTvZdslcO3BY6uwkzI4u8TT8+fRskfGbExvniHWgX9frbdaYZbZVw/EO3h2JGj
	Shr3YRgPJtKVZOosSGr4Vm99weZ2+NoJlhsWWQ1q2ILoQxqncLS+6eXikHVz1y7L
	8tQfcQo7/sgQN3o78qQ/kO59F5yjR8mk5TW0SHTSADvLH/bZyAzsu56ZKiwoXjSF
	FtxYpPqp0Iud0+da4tVNCuma2CfoQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xc53f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 04:51:20 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A64kmnN011733;
	Thu, 6 Nov 2025 04:51:20 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xc53f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 04:51:20 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A64VAiv012845;
	Thu, 6 Nov 2025 04:51:19 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5y823eu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 04:51:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A64pFUh44827062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Nov 2025 04:51:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EF4920040;
	Thu,  6 Nov 2025 04:51:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAB4B20049;
	Thu,  6 Nov 2025 04:51:11 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Nov 2025 04:51:11 +0000 (GMT)
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
Subject: [PATCH v2 0/5] kexec: reorganize sysfs interface and add new kexec sysfs
Date: Thu,  6 Nov 2025 10:21:02 +0530
Message-ID: <20251106045107.17813-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX5CQx7SCh2kek
 qYAhd++d60ohe22mOKaLVoiYMJNKmwanQW39Aq0TQQdUWR7SsMnS96Kt+4OgWp3TFMqgSw0M+kP
 h9RAd8WyU7DCgdSnU07lyspm/NX9m2u2Nnfk3xJiHRnOS/IKo4ZLHwJBgzTKP4Um4mYxJ/hLAgk
 j9MobE9g+n/n6W8k+nCYiM6jgKuS7yUXtooqtXhFWaCXcB24/0xEAST5qB+4Xe8wA80aYMYIraL
 IqqZGY8bA/Q1dnw666QClbc9Vxzudv4n4ZhZ6ka/WLPEqeDJaQplbfOWlqnTRgvMLV5eWFJ6NwY
 5BbTM4rl+jLlm9Uzh6YtZHFP5yZ8GedvJIwv1DTc8ctjSB9Zf90/46Po70fpMRk+MujbGq+O4Dx
 Ns/FVKH4z5czwndzayr3SIi3y+ypKw==
X-Proofpoint-GUID: BRkJBFIbd1iEaeb1OE7FUCT4H_3rNtGb
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=690c2949 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8
 a=LRU2jnFezOS3J6eLL00A:9 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 8p2ec5RZks7lsiT5R9iNvRbbcqj20fl4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

All existing kexec and kdump sysfs entries are moved to a new location,
/sys/kernel/kexec, to keep /sys/kernel/ clean and better organized.
Symlinks are created at the old locations for backward compatibility and
can be removed in the future [02/05].

While doing this cleanup, missing ABI documentation for the old sysfs
interfaces is added, and those entries are marked as deprecated
[01/05 and 03/05]. New ABI documentation is also added for the
reorganized interfaces. [04/05]

Along with this reorganization, a new sysfs file,
/sys/kernel/kexec/crash_cma_ranges, is introduced to export crashkernel
CMA reservation details to user space [05/05]. This helps tools determine the
total crashkernel reserved memory and warn users that capturing user
pages while CMA is reserved may cause incomplete or unreliable dumps.

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
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradead.org

Sourabh Jain (5):
  Documentation/ABI: add kexec and kdump sysfs interface
  kexec: move sysfs entries to /sys/kernel/kexec
  Documentation/ABI: mark old kexec sysfs deprecated
  kexec: document new kexec and kdump sysfs ABIs
  crash: export crashkernel CMA reservation to userspace

 .../ABI/obsolete/sysfs-kernel-kexec-kdump     |  59 +++++++++
 .../ABI/testing/sysfs-kernel-kexec-kdump      |  61 +++++++++
 kernel/kexec_core.c                           | 118 ++++++++++++++++++
 kernel/ksysfs.c                               |  68 +---------
 4 files changed, 239 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-kexec-kdump

-- 
2.51.0


