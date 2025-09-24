Return-Path: <linuxppc-dev+bounces-12564-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E0B9B8A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 20:41:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cX5KS6dwzz3bpS;
	Thu, 25 Sep 2025 04:41:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758739292;
	cv=none; b=fZ9bOzerF4z6tWvi3X7kNhEjZ6IGV2Ory/QGHM7lj8BSo+7kPiSeCTB2rZggZB89BRN4fBx06HCgi3iZWRmSz8c4jiMDhgenJvqDAEeKyz8KcZPL2+UQMU9tHqOO1cGailUscyruk+nF9x7XlAN2Y51tw1/meDG/HyUoPVgoSZNyRXPTCdT1prhdXYmGqFz1QgzGlEwNRA+MA2wmS8PEbm/iZJlh6BNPOYNCF1xEVgWH40elpRzqwUwLwMzp/Y1OKi4QjSBWslYTb/D0Nl0vQnr0IBcewXANWPmmNFs7aXhIqSK27BKCHBab2PshphaTmXWnpMYbsyXNJYIg0IS23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758739292; c=relaxed/relaxed;
	bh=UxrvbhRi5qIbb53e4q9T6m/KTCcP0t1N9Grz7dih72s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N3uItjZyYv79PtQyidDy9OYEIMEOZdnbRTXZo6/kUyzomJZMMcRe9GFfZlrk3eimsAH2Misjvxch5Vlk4zwXE1wMg+ke3jvh6rTephhLQUmttmXjfYSGsVK6cLtdbFV12HpoiJVd9+fQFVqHNJEaYPAl5qrCA2TNS0uvYBEzxSTuO/CnBEZ9gGUQII9ClTvF21IiUnGN1oaMKtbPF7KlGAhio+VVgEAqp4CVnKJ8+ta7VPxD7NR5Gme7znAGAbUxdqlymzap/jvH8eoJN14Vkmyx6+0DCoHcU+prH+CEKBi0pTfk2QFLUAuRgpQy5ULyJuf83RsA5Xb77vDgl6hr0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MN586EU7; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MN586EU7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cX5KP0RTWz2yqg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 04:41:28 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OAWNhn032221;
	Wed, 24 Sep 2025 18:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=UxrvbhRi5qIbb53e4q9T6m/KTCcP0t1N9Grz7dih7
	2s=; b=MN586EU7SDSkvQyJKHTD31RRBBSnCwqRe6vkLxYqPOq7VAfQxdnbwvl2M
	lXI32BtJ/92gi0HVFwOfZZLIM/csybWAKoCIay1E6rsWpuSdHVhntp+iI9KjR3w2
	PR+hPiTuxPBC0t6aYg2Jv1iiYGaN++ux8zAubAuxCZK90SMPq030hoGJCpzIy/KT
	2j8+la2mcyCChX0Ly7Owqid3ZXkcPbXdbSec4z2tMtQEpRFC3bZ+XleTSSSG40bm
	mTG0ZXUuud5ToSb6JojABKULmwcJCf+aM89BVH2VHwSg3y/KvxVnmvj8x/RN0Azf
	RRSp9gWEAkCwcGzFnuGnH6M3lqhTw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499hpqgwjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 18:41:05 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58OIUJpH031936;
	Wed, 24 Sep 2025 18:41:04 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499hpqgwjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 18:41:04 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58OGZ5iL031166;
	Wed, 24 Sep 2025 18:41:03 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 49b9vdb3s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 18:41:03 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58OIf0ht53477778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Sep 2025 18:41:00 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 066D920040;
	Wed, 24 Sep 2025 18:41:00 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D7BDC20043;
	Wed, 24 Sep 2025 18:40:55 +0000 (GMT)
Received: from li-218185cc-29b5-11b2-a85c-9a1300ae2e6e.ibm.com.com (unknown [9.39.28.85])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 24 Sep 2025 18:40:55 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Dave Jiang <dave.jiang@intel.com>, Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH 0/2] drivers/base/node: fold node register and unregister functions
Date: Thu, 25 Sep 2025 00:10:49 +0530
Message-ID: <cover.1758736423.git.donettom@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=FrEF/3rq c=1 sm=1 tr=0 ts=68d43b41 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=KFY20ALy1DZ1KhuY3mYA:9
X-Proofpoint-ORIG-GUID: czx2wiS_tSVfgnNn8tsKr_m-DZkTk-BC
X-Proofpoint-GUID: TmIYvx6EGz04tjFfpJeHy-d1Mz-GBxyD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDIyNCBTYWx0ZWRfX370bLG+S6F2M
 wcTVuBvEi37um2hyQ9MnyXoGynceg8EHVrS+w/8fSRxMCD6EPemdeP0Oe67b0pwiRjtiHAN4XBx
 rnZIBQM6tUPVre8sBmj8wOS2Ebcw00WaCpr12HeHxSbvmBLBIwdPFolPZb7dGIeGqDVRyHLJcsW
 YWq7b+FyoQPL5B+Eec6wlaCpUdy4ysN3uZkpxd9vRf0nD9fYyRGwqmlAz2+WiFha97wJRS75Y8p
 M9lkZJhGHSAFcbE9r626xh+NbwWjKcWk/VWrLealcXccYDI+fBsGWCwLlar/MJIpNascuBSV3oI
 TNfgxLML0iNAimfO303evz3EFiZ0YbOZAMxvgJ/BFltNeYCJG9LjplusHi5B7H9Efff4pzLQjO7
 /ocgssqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1011 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509190224
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

Donet Tom (2):
  drivers/base/node: merge register_one_node() and register_node() to a
    single function.
  drivers/base/node: merge unregister_one_node() and unregister_node()
    to a single function.

 arch/powerpc/platforms/pseries/pci_dlpar.c |  2 +-
 arch/x86/mm/numa.c                         |  4 +-
 drivers/base/node.c                        | 89 +++++++++-------------
 include/linux/node.h                       | 10 +--
 mm/memory_hotplug.c                        |  8 +-
 mm/mm_init.c                               |  2 +-
 6 files changed, 49 insertions(+), 66 deletions(-)

-- 
2.51.0


