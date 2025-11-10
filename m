Return-Path: <linuxppc-dev+bounces-13980-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E94C44E7D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 05:32:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4cFg18Tdz2xqM;
	Mon, 10 Nov 2025 15:32:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762749127;
	cv=none; b=NlVQ8/5Ut0itf87fHG1WjWsC9n4QLvT8iiQdu8UfF6ynFIitPKxpx65SH1W410FxLLNCq4HeaLkrhNsYyKmQalvk061bAPTVJ4mWjilrpAZcVmTVwIwMfadVHVM6/a2l7LNY/dVip9TD+sumQk29mxeKwcF9yJHFd7Nabt2mIP91hkH8ymEJcy9nsytQobUebmHw/Yq7uRWnHxYwrV37r9paY3BwszeMI8P1E6tNZs1KX3uIt58HhV/HfNTZniN17BNflX/XRPFnzvAn9pf6P0zfkjW98iz5HqIgekXWgp9QsQVeTQPnATBgpW9LuzZi/j2eOxRgZWpAP3il+lUbKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762749127; c=relaxed/relaxed;
	bh=GSIHS5tTjaggwFqe1bEYD18tRhEzWsnsjL5fO1RIuM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l+sNG4Be5fc4GgI0FaLIUxpH4OtFpdvmltnCrZjL89vYk12yP7FBNhPYxUhSeNRrkzk0f3lmnkOJIkaSdODvSQlS+Y1PN6kIO+p9FUJwmNzcA20WONNlqvIu0/Cu2mJrsvPEYQ7PAlh+OrpdqLDJB9kOBPyJPnmA25muXgZhCA65RxTDWtpPNH32efLuybOpRedL29c7m/F9/9jd+cdJjWc4xbXlsEvrRPXrHJjFviybx66tGu7TdiU8vAbQL7vtz4j/caPF4+j4UL1voRaN9fEwzbjAh3OfL65yG7GjYpf1KBngY8fENiZX6QLFmACVRhasxX/eeF3VWGPdwuvueA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d1oMl/bb; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d1oMl/bb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4cFd5PBVz2xFT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 15:32:04 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9Ks8gK031322;
	Mon, 10 Nov 2025 04:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=GSIHS5tTjaggwFqe1bEYD18tRhEzWsnsjL5fO1RIu
	M0=; b=d1oMl/bbsV9WTfESm9eYZ4FsoslcY2Ne8I3y5t2vPS3gO8qPxDHAyBMsj
	Px1c5rc+MJBvaa6s8uIFo+aGlpaLYGQU5p4TeLosq9DRqJiDq8HrnYyFjqvM8a95
	mVzPY0VJTgfO0YXBpscZIkkJbGzCw+JprvS8jz6XO/96Tj/BADhFeItOD4suGGVP
	ldTT77eIXkhtKaDIp7AQl3EpxrtSMI1woSaWY/8QLVZNDc9ou0kTfag/YUbJpacb
	KdJP6JBrSNOAoRQjiJnJnnuNkrrbQXiOuu/cSQHo9j0aNmYGV+ncBK20eKw3+JMa
	Z/6ISlmvo8eHyurV7UEGXjh+0rDdQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wk7xdv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:31:56 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AA4Vtdr020451;
	Mon, 10 Nov 2025 04:31:55 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wk7xdv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:31:55 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9NJFnQ007325;
	Mon, 10 Nov 2025 04:31:54 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aajdj3nb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:31:54 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AA4VotJ41550178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Nov 2025 04:31:51 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0609A2004E;
	Mon, 10 Nov 2025 04:31:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E62A20040;
	Mon, 10 Nov 2025 04:31:46 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Nov 2025 04:31:46 +0000 (GMT)
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
Subject: [PATCH v3 0/5] kexec: reorganize sysfs interface and add new kexec sysfs
Date: Mon, 10 Nov 2025 10:01:38 +0530
Message-ID: <20251110043143.484408-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAyMiBTYWx0ZWRfX1rnJ0LuOdoxy
 7CJJcOI6ZLPP/T9i6lF8wmz+oCImw/xCTq3dhARayCL+SYoQK/6x6qkVvOf/wr3Bf+vjUVW1OBl
 zkCHme4SDnP/BbrlWFajK9Nwg2RyCKiEVvPcw9r2ldDgUDKh3Q9NOD3lzoXYon3CSgjdY3WeejP
 C2l63rPV6ffSasjw1PE6vuLv34sOwqPh7O1s/s5ZPFyVrbNI4zARR6Y/8e3cPhrVVRLJwtN0+Bk
 wkcOHcsTMcxlCw0DY3ypqce+ZvJLWs2d66efuCjkw1xTmtYP88e1sJMy7+NJQHR3jzLvbnPf3rP
 PNRcD9sLG1w6/iFLf0KY1nQMhA1K9uZBG1fmdg8aVeTXbVSMaSOF0ivib4NHcSdM1khuFDa7Y4l
 LUWCu+IBKl6qsylfesR8pUjsAuhaKA==
X-Authority-Analysis: v=2.4 cv=ZK3aWH7b c=1 sm=1 tr=0 ts=69116abc cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8
 a=LRU2jnFezOS3J6eLL00A:9 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: uzFoxsjBYnAGMCBSO5nLYhimKGjpbOQl
X-Proofpoint-GUID: o0rWVqbWpvX2ZpFvuTjHOykWXzciUBWy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511080022
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

Changlog:
---------

v2 -> v3:
 - Add the missing hunk to export crash_cma_ranges sysfs [05/05]
 - Declare kexec_kobj static [02/05]

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

 .../ABI/obsolete/sysfs-kernel-kexec-kdump     |  59 ++++++++
 .../ABI/testing/sysfs-kernel-kexec-kdump      |  61 ++++++++
 kernel/kexec_core.c                           | 135 ++++++++++++++++++
 kernel/ksysfs.c                               |  68 +--------
 4 files changed, 256 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-kexec-kdump

-- 
2.51.1


