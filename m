Return-Path: <linuxppc-dev+bounces-14169-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE65C5B5F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 06:15:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d751x1SkMz2yx7;
	Fri, 14 Nov 2025 16:15:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763097333;
	cv=none; b=W/l8kvucTMd7rKsYmGe7TX71OuOutSyShuPnx/bzHU+nfQOfCxzoeRWDpzqjieXjTw3UX5s6hwr74nv+N0mn65nYbd8MrGJjPhjE/e2MHrwjDw03PG/pfQBg/gLCpjWzgE/aQU1SZIWXlLyIjkdEOELvWwTmP2Mrli9sk2NtkIz1uv+csC1Xz9PUuHJheLWkZO9pGLA7l4Y8ELDvw4s6JLk0kLPf2XyqufLFiYkRxBi+neM+8diY+Jgj238nwoadxuxUTHSbT/GSlkcjWxFkuG3T92OfYTC258GmmEK+6FwKmsvlKi29Okz3WtvUQf4LBpnj+jqnhlibanO7dLv+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763097333; c=relaxed/relaxed;
	bh=jLkKZ1wrDTNzqEPulnNnfzQPDQVRnZJQEYbNRVZF4tw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QTeQLzW+vdcM/1NbdcXnSf5PALlAZqrd3AFj2IMk6HBAcKsx3A0h1pQ2FGa7so67dRU+hGLiS6fmgcaksXEjwO50ZwthbelTWyM79cgDg1WgsGXoGiCJx/A6BJs3mKAxPH7q+a4qHW7jhlAgsETkKs5BMUnxoB1WPOfxf/uO2g2Dt2O/S6sKtAKY2SUQhk35LWcwldJk2xqnHVSmQjd8VY68p3tn4C0hasfkVYLJ0lKf8upa+fzCcV+9oAziAMASyU9n589QeY3PMeObQ4jl6uK8l/ZrBUkTwUuzlIZJerq+CNDpOJfjX3DTnFacXYigWbIeZ7hIsxAa/nz2PY1PDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d0eLi+70; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d0eLi+70;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d751v5jKcz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 16:15:30 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ADMmmQF029159;
	Fri, 14 Nov 2025 05:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=jLkKZ1wrDTNzqEPulnNnfzQPDQVRnZJQEYbNRVZF4
	tw=; b=d0eLi+70wthgXTuTbrui/KOImLdIX1HuUml9uC92UqFf/KNOlgSikzTaO
	2L1+Q5j4cKFtVyNq6+ngqcjB/43JqWrRMpPMlK+6yqmUnK0YfLcKn/fiU8HtixyX
	SE3IYqudqyRL2oHCrEKnsgHXYXxp6V5g8vf0ZkPjLeajaXATE1kmxLDride2pfMj
	su4tQhUjp5/9CXByip5ZTch3rKK4RyIQD28VEJQQycC2Jp5mIaqbT5P7r0nyJolH
	6eEWHdmc8RG/2fLYGJvEot9TAaqL99UUiGCohHiK4tegzmGgqUzhppbNYlVsTuss
	WFpht4gKn2OBW57jIfqxDnukeu/gw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4adrevgxqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 05:15:26 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AE5EB02019653;
	Fri, 14 Nov 2025 05:15:26 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4adrevgxqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 05:15:26 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AE4LPYI008260;
	Fri, 14 Nov 2025 05:15:25 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aah6n9nsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 05:15:25 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AE5FI6a41288114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Nov 2025 05:15:18 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C1D320043;
	Fri, 14 Nov 2025 05:15:17 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 875372004B;
	Fri, 14 Nov 2025 05:15:13 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.124.211.127])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Nov 2025 05:15:13 +0000 (GMT)
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
Subject: [PATCH v4 0/5]  kexec: reorganize sysfs interface and add new kexec sysfs
Date: Fri, 14 Nov 2025 10:44:59 +0530
Message-ID: <20251114051504.614937-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: dMzjcw9Cj46WjoUoIhjSlvf7aWe7d-J1
X-Authority-Analysis: v=2.4 cv=E9nAZKdl c=1 sm=1 tr=0 ts=6916baee cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=U2Zq5r_CMUrxw1IodPQA:9
 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE3OSBTYWx0ZWRfXzfbxI6b6iVE6
 N48ODHxus5lobbXO//8GFwosiNNbH2MjK7su6OfXMdVizz1q189ks+sSZ9ezH2eTqKeEqcMCw3y
 LdX4nkzOXBJLVQgLwAnCVkP94Ix+/ge8kSbazvlJ8pF1hhemKSJwkAdwolwUDk5HhhTt2NGBiJb
 KToa8cmxrxVB/G318Dm3icXLT34/xD8K28R62U1Ujbg6TL8dATe7yAXyQyVxK6rRpmx0YQqiLSZ
 xFpOPcqO7+u43Z2AtKmfL8T2/goy1mhi4613BxzRoBRqKEA5maA9qYwVCB1yu7xUE4FMFC34Zld
 PSSlDAzUGG1BEEZOLFNOGovfh/Z5rNtZpinVtmLD08dgoaNypqPXdLaf4elf+rf6dqkVXjeoYAT
 J+TbwrsV4Qg2zFjA6b1+2FlJybUjvw==
X-Proofpoint-GUID: E6Nn5BYA5mdjv9X6KbOEeFbajhkHr2gL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511130179
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
CMA reservation details to user space [05/05]. This helps tools
determine the total crashkernel reserved memory and warn users that
capturing user pages while CMA is reserved may cause incomplete or
unreliable dumps.

Changlog:
---------

v2 -> v3:
 - Add the missing hunk to export crash_cma_ranges sysfs [05/05]
 - Declare kexec_kobj static [02/05]

 v3 -> v4:
 - Update the commit log of [05/05] to explain why Crash CMA Ranges
   are not exported to /proc/iomem.

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

Sourabh Jain (5):
  Documentation/ABI: add kexec and kdump sysfs interface
  kexec: move sysfs entries to /sys/kernel/kexec
  Documentation/ABI: mark old kexec sysfs deprecated
  kexec: document new kexec and kdump sysfs ABIs
  crash: export crashkernel CMA reservation to userspace

 .../ABI/obsolete/sysfs-kernel-kexec-kdump     |  59 ++++++++
 .../ABI/testing/sysfs-kernel-kexec-kdump      |  61 ++++++++
 kernel/kexec_core.c                           | 135 ++++++++++++++++++
 kernel/ksysfs.c                               |  68 +--------
 4 files changed, 256 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-kexec-kdump

-- 
2.51.1


