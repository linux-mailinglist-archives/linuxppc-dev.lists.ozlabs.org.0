Return-Path: <linuxppc-dev+bounces-9781-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CEDAE8E25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 21:12:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSBJp23vSz30NP;
	Thu, 26 Jun 2025 05:12:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750878730;
	cv=none; b=l7aDKDEq7+29e9thJjHVUPyfMAbAYFj8995jxF2GgYrOA1+ajIC9GO+hJQpCsZ6RuLV5tbHAMF3CeTq+4EdJlTMlrstNAYsclpv5WYXkGUFkSj1gwmVld06JjGE0xK9j1hMKYTL3WfjjcvKUtEaChcOxdvwH8hOOlVMFrWLl6mGu5gJG9ob1VXSMygG+jULxPWN7IVvK8/Tlbhz0MGMjIXe+iSzAdOM1Py31M7exzd1jfHT18ksTGPLlSV3jx6tXkw4J0xSVpwy3qbYV/nXGZ9YOjacUTeLI7kcMZbOYjgwuBGA7TmuIdqkG5zO1zbk7uMXXjrL0SwK0fBn63BTtXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750878730; c=relaxed/relaxed;
	bh=9+d7RfDCUMcyGi2BXCxRuU2xnlzRa42/iauZPwBkcyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5q73spKyR5Cz6Mz0qaZiXS4LaQbping4uIAn3G/RQ9iiXR/ZP2dvTczXuum3fbiMk1mvAn9JCbmG192uIET4uf1CzQcBpC7rbvGpuZc46/u0fQvyiZJnR7nBf4ERBpjceMUMfvkJ8OdOxPN4rwS5jhaCnktHHRIJ1fYpN4ROP2zxWZNJrcHTljaIb6CC9vChtaMFlsdtTZ1PCfSZFKp5T598YFmu3dzH7THUY23ugZTljEFLepI3PJrRfMFspiJaY/bgSVerUeLTD2KOaIhGC0f8GvA+SRxsSHpsHoSDLWN20F0TVmng04ILphUajz9eIlJao5nFa+lM7YQeqInOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I7j9hsKP; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I7j9hsKP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSBJn1PGYz30BG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 05:12:08 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PELbb5002256;
	Wed, 25 Jun 2025 19:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9+d7RfDCUMcyGi2BX
	CxRuU2xnlzRa42/iauZPwBkcyU=; b=I7j9hsKPuyh2e3he1wR8KmwFe8lQA7f5y
	rYxKu41fp/sfEjIwX4rW2yhSBAAcPLDI9kiKSWp1qzhf8EfM2exY4YvhmxBtEklF
	N4gcfYpqek8GdSi4kZHoshnLzrYdvrwMh7ieFPjuhIb1Bg9TpfiQIjGFYPTYd5iK
	D26gfc5tUip1KNh8VP8MHqnNN1MoFiASX8LCe0cEhUG3vcVnNI7jv5so1hD2qaNf
	eh7V6RheSlq9H/suTEHOMNSC/o642v3fev3/JyxHfU5QBdwkwE3Qii+uMMkkQvd7
	wP7ZygwJ/KHl7znanktJ40JYDvyfGrdfA4b2ZvsIS1wLAf6F3DFSA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jhhd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:38 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55PJAD2u020289;
	Wed, 25 Jun 2025 19:11:37 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jhhcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:37 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PGq7wY030487;
	Wed, 25 Jun 2025 19:11:36 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e7f030rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:36 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PJBWGM52494642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 19:11:32 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 105EC20040;
	Wed, 25 Jun 2025 19:11:32 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F22720043;
	Wed, 25 Jun 2025 19:11:28 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.209.143])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 19:11:28 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, kprateek.nayak@amd.com, huschle@linux.ibm.com,
        srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        gregkh@linuxfoundation.org
Subject: [RFC v2 1/9] sched/docs: Document avoid_cpu_mask and avoid CPU concept
Date: Thu, 26 Jun 2025 00:41:00 +0530
Message-ID: <20250625191108.1646208-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250625191108.1646208-1-sshegde@linux.ibm.com>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MSBTYWx0ZWRfX57VmWe5XYxRc b58FKiEEVnlkADF1Y4ms1gpjAq+hnNW/yN+Xh/0hAwGZ21ac7AJbrQdynjCCmVuDviQ2p12GRYo s8uIxGSTratWHXmzKrMwzSOIZXkr8DWyMcSZ/c9bqS1DHIrmsyF38BlAsBAf4qDQzZm59XH4Ewg
 nc3l4orWLycmkkV1j0/YqhYqVN/tOMxSSy9iFJrzN+SC+AGDAfQbauX/JX3F6FTMICo/Hd5hb3u xItrAyJh3uTSKLFOE7sFP5GjjyzhKZiqfOY4odzWqihMT8vD0gvJ7wjRLmyqoem0z3GarbmoMRN Z5BVmObk0zAhpK7wfqVbZAYPbDE9IrpG6b6qpaYyn+x3tMqS9pdcaMTLL2CAtyuTUMVO5lxLeZ1
 M+VkhqQWR5O8vHeChKt8BsY5D8M9rao9cMCejpXDLt6GV0vmaoQj7W/Z/erZmxKhwbCp+fzz
X-Proofpoint-GUID: CrdOf7y_8SXN7UNmObo2YZTj5GjREvzS
X-Proofpoint-ORIG-GUID: wQj-IDrmhnmGmzaEQsz7vdRhdF1uncyG
X-Authority-Analysis: v=2.4 cv=combk04i c=1 sm=1 tr=0 ts=685c49ea cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=5nzgSDI2G5BSHnRbDcAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=977 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250141
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This describes what avoid CPU means and what scheduler aims to do 
when a CPU is marked as avoid. 

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 Documentation/scheduler/sched-arch.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/scheduler/sched-arch.rst b/Documentation/scheduler/sched-arch.rst
index ed07efea7d02..d32755298fca 100644
--- a/Documentation/scheduler/sched-arch.rst
+++ b/Documentation/scheduler/sched-arch.rst
@@ -62,6 +62,31 @@ Your cpu_idle routines need to obey the following rules:
 arch/x86/kernel/process.c has examples of both polling and
 sleeping idle functions.
 
+CPU Avoid
+=========
+
+Under paravirt conditions it is possible to overcommit CPU resources.
+i.e sum of virtual CPU(vCPU) of all VM is greater than number of physical
+CPUs(pCPU). Under such conditions when all or many VM have high utilization,
+hypervisor won't be able to satisfy the requirement and has to context switch
+within or across VM. VM level context switch is more expensive compared to
+task context switch within the VM.
+
+In such cases it is better that VM's co-ordinate among themselves and ask for
+less CPU request by not using some of the vCPUs. Such vCPUs where workload
+can be avoided at the moment are called as "Avoid CPUs". Note that when the
+pCPU contention goes away, these vCPUs can be used again by the workload.
+
+Arch need to set/unset the vCPU as avoid in cpu_avoid_mask. When set, avoid
+the CPU and when unset, use it as usual.
+
+Scheduler will try to avoid those CPUs as much as it can.
+This is achived by
+1. Not selecting those CPU at wakeup.
+2. Push the task away from avoid CPU at tick.
+3. Not selecting avoid CPU at load balance.
+
+This works only for SCHED_RT and SCHED_NORMAL.
 
 Possible arch/ problems
 =======================
-- 
2.43.0


