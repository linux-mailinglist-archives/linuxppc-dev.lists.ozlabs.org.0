Return-Path: <linuxppc-dev+bounces-12865-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B18BDA6FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 17:39:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmJLW4XpNz3020;
	Wed, 15 Oct 2025 02:39:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760456387;
	cv=none; b=hwuNyexA9qRzW1aZfH0DkCLFVB7WOCBcyec6JjJ3A6Cg5j5mmZwc+VvJcLcIBXu+ddAYOS9nN58R2B2UHkHviH+1KUhp+LszApCSYyFrBD2qTRPNaYjl7WDxzTga1P26NGSF0bxiRRBM+guGR/AQzv6t5cgHL/S2Um7EjQmy0cOkhK9PmzBgh+3fnL8JI9iTKO1ROc0IL1P5mnTg1bk6qaqy1uJEQM8b4lVHeoVkVnV6JZlHBLgCPyJazNtUKG3KrwaQ+Wk0m/IVyzvAXr+KvtU1wS4U1xYQ+tsJUYPk24ydAzcnjFJ6WrGyeBeCXWl6Uxriy84CkKyWTpjXyshiCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760456387; c=relaxed/relaxed;
	bh=Wm5at7iaF5OGO9aI3neMRU6XnOo7cGQsqGNFW19C7S8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QWtVNQ/diExirXfgbg+9paIsXKKErTMvSoRMu5NOF5TfEA9p3fQTR2V4S03Kstn9fav+Esc5lRLwj8hvswNEmvu0XYAYyyLahuK6Q9nAxxaAIRJ3SifufTEhvWcoBwyQaV2IWNmljxSviNm1mmvoZr5e/HKT6AWmFgoySSHQ3ICSUj00EHfw1rRBW4yyfG8jIoeAcg8LEf4a6d3PXfR5Zoi9xqvfoWohEYPNKej2MzwoePwLBpk9Tw1C+kY7C+JmVH/OErVRW/RLx5LhLGTqLHxdfRtTEQ3M82c2ReTfUECdGS9fZQyJ3y/OO5qy9kO6HqnNQGRqO7XeLSsZq09LKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YtYiM+us; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YtYiM+us;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmJLV4yqdz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 02:39:46 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E8vWNQ004069;
	Tue, 14 Oct 2025 15:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Wm5at7iaF5OGO9aI3neMRU6XnOo7cGQsqGNFW19C7
	S8=; b=YtYiM+usk2dliwQ9wY1Ttg6Vz30kBdvXd7xQpBkaGNNaCNU5Iocco9arR
	/zoiwRurRhOWxII6Eu4rgGaZTbOwHRcUkKDMqXgxysGxDB+LarsP+9DcpMIy6pcg
	qX4TTCm/WZ7Q9GdPZf1+8KLTejLkcQ4C86Q3xQLpmnzdHP5jy1lmMG4SQE6EJGuv
	LlDrBhS+5dapvjtarDDyMi3tiabHQpimcM+gk7zhq//pGJZ25dNWiJVoDrzFQVUm
	Sjidg+oSbKf3LTA9ksqg1f84nSpn0apxp9GLHPOI87vG8mJ2EARRPtpGM39GRwm4
	rQDKCOmOnWSDG8YxfN682IPOuaJNA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qey8qkxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 15:39:29 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59EFckni019003;
	Tue, 14 Oct 2025 15:39:29 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qey8qkxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 15:39:29 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59ECQl1M015466;
	Tue, 14 Oct 2025 15:39:28 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 49r3sjbf1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 15:39:27 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59EFdOoX25362978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Oct 2025 15:39:24 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1554D20071;
	Tue, 14 Oct 2025 15:39:24 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABCF12004D;
	Tue, 14 Oct 2025 15:39:20 +0000 (GMT)
Received: from li-218185cc-29b5-11b2-a85c-9a1300ae2e6e.in.ibm.com (unknown [9.109.215.183])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Oct 2025 15:39:20 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
        Oscar Salvador <osalvador@suse.de>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael@kernel.org, Danilo Krummrich <dakr@kernel.org>,
        Dave Jiang <dave.jiang@intel.com>, Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v2 0/2] drivers/base/node: fold node register and unregister functions
Date: Tue, 14 Oct 2025 21:09:15 +0530
Message-ID: <cover.1760097207.git.donettom@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: L4v7lPQ9NJXjKRFesvdVP-_Mfj59bHgr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxMSBTYWx0ZWRfX0CFUNLWjuH/O
 ZqGm2OlE1jWu1cjapFjLibDl2hRXHQjB0+CnGlHiVkCUYoEg4lf2MHma3Eutk+4FWCkdj5x6SdE
 AUMWUnb8rQ+f+EYvL7QmROE4Mp/KGo52oXe7ZPDv49j8VEhPAQs2KiaSyLShR6u45YKnf3FEGFv
 g2L52lndA/7NCtbZ12KGoyThd7+XJPe/3GnJhuNuS4YIRxPs5aK3dBUQXu8qVE7vCMGGkD3vzFi
 sS46jfuXhg2ScLJcWrgfxG+rOzcRGeXL7bwz3j56M5ybOdQXcxca+IEbuLmrCHDm6Zhom+nvgdU
 iHyHhkhbXtarSUqaquZg7hne5n/5CiNcHmedW0YzNP/hDaE4K3EKDncXlSxn5n325M3rvjTA7G3
 B4B+4/YQIUyUeRBtDVoQoDHpqturbw==
X-Proofpoint-GUID: f2YuwwXFcjJ6pCQGE8fsU_vrHwabf42l
X-Authority-Analysis: v=2.4 cv=QZ5rf8bv c=1 sm=1 tr=0 ts=68ee6eb1 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=VnNF1IyMAAAA:8 a=KFY20ALy1DZ1KhuY3mYA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110011
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This change came from the discussion in [1]. It consists of two patches:

The first patch merges register_one_node() and register_node(), leaving a
single register_node() function.

The second patch merges unregister_one_node() and unregister_node(), leaving
a single unregister_node() function.

There is no functional change in these patches.

[1] https://lore.kernel.org/all/5512b1b6-31f8-4322-8a5f-add8d1e9b22f@redhat.com/

---
v1 -> v2
- Changed commit description
- Removed extern from the function declarations of register_node() and unregister_node().

v1 - https://lore.kernel.org/all/cover.1758736423.git.donettom@linux.ibm.com/

Donet Tom (2):
  drivers/base/node: Fold register_node() into register_one_node()
  drivers/base/node: Fold unregister_node() into unregister_one_node()

 arch/powerpc/platforms/pseries/pci_dlpar.c |  2 +-
 arch/x86/mm/numa.c                         |  4 +-
 drivers/base/node.c                        | 90 +++++++++-------------
 include/linux/node.h                       | 10 +--
 mm/memory_hotplug.c                        |  8 +-
 mm/mm_init.c                               |  2 +-
 6 files changed, 49 insertions(+), 67 deletions(-)

-- 
2.47.1


