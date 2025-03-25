Return-Path: <linuxppc-dev+bounces-7323-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3183CA6EDBC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Mar 2025 11:32:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMR7S3wQVz2yLJ;
	Tue, 25 Mar 2025 21:32:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742898740;
	cv=none; b=Mv/PLMgLiFKyjDXwMaetSKjJwZdJsQe/y2R+GMMj85uNwEZreZl376PUyOCAWcZ0kNe+ganyhNEuoIpAnoa4I4XggoryWM3wNIYKqNCnzQaROx0R0kA/RoVGiuKK9A7/Cm6Lp2zZa8ogJvfSaFN0DyoIKNp5fjCqSEH1VTRxMPN3HTgSAknBY6LHH5vgiogqosOAvgEwR+E6bgGMuRejNuTWMnv90DUe3/BLU4rpMNeVVmYAFDru8mwE0522Oq1kgmMfHbsUTgpdSX+k6tnvW+hxyO7bOahZNJj1S8TrSDLZwNRzSuq9IP+jdCkQRXNLffZPArJ55wzJe9AwrARnGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742898740; c=relaxed/relaxed;
	bh=TDu0Ny0Fcmjl+OCepVqwkzhE+JS6jvmII5BtRtgp3Xw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=FK8YKsPbQDgMAZ0kWEVkZq+gMO4SwXG4tFSE1FwSoE9j64QVsc63aoT8ijA5YaePjJ12ivs7ZlpZgyrEHHkzDmB0R4TpbqZdsOv8Igt0eA+1XYQzU1eVsJ/8Ba+3buNRDSYRU+2eDfjh3XvzbJ795H60jG+Wvb0o6kb0gE/o8j4KziFLuUNa/Nh+EcbyQiJV2uYH4XNuxhyzEn1kpvdDWoRf2P04uiZjILJyM7vDORKnIKU1SzvE/cRtoxDpYL2kiCXz1kiJn7A8FCLOr4XdYHRzVsIl/kd6/7ydcwz+9neRTFZcvWHgjqDXIngG4V40TAhGsEvEfiWwOfGTel+TzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MBpKnnhe; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MBpKnnhe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMR7R2hDMz2yGZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 21:32:19 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P8rFDM011900;
	Tue, 25 Mar 2025 10:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=TDu0Ny0Fcmjl+OCepVqwkzhE+JS6
	jvmII5BtRtgp3Xw=; b=MBpKnnheWBepOp1W3NkAWcv+9Gb1k630RvhptHs0nJNd
	1UJJXSc8yRGxr8XxX7CN59FL/oEAn+uI9A9zim3LeC8TfbI+vQ7+OCBhoD76uAxU
	OCKZMjYzNbrW96JTv68qn2FcmuWp+Y3zsLQS5PNVBRphJeUn2f9cZyb/bhKSdkn0
	g2G3+XNlNqu89PqAlokJuNhFY6sHrjlTcklqsmIOf2RTboe9vxF9RGHQqKOZdazC
	uSO5eJ6aAm1WI/PXQu5LfVk2x7dCxt2y0Rj8aNLkVOUCqMb/mUr9xpGjEkxrsjeQ
	XeeHxim5ceqLyRNtedDX3gSs+ASU+2BprMyJsRi0Ww==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45kejptytp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 10:32:15 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52P7lM8M030330;
	Tue, 25 Mar 2025 10:32:14 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45j7htb351-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 10:32:14 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52PAWD2j11076112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Mar 2025 10:32:14 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7B3F58058;
	Tue, 25 Mar 2025 10:32:13 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2058558059;
	Tue, 25 Mar 2025 10:32:10 +0000 (GMT)
Received: from [9.61.251.51] (unknown [9.61.251.51])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Mar 2025 10:32:09 +0000 (GMT)
Message-ID: <5df6968a-2e5f-468e-b457-fc201535dd4c@linux.ibm.com>
Date: Tue, 25 Mar 2025 16:02:08 +0530
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
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>, bpf <bpf@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
        jkacur@redhat.com, lgoncalv@redhat.com, gmonaco@redhat.com,
        williams@redhat.com, tglozar@redhat.com, rostedt@goodmis.org
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [linux-next-20250324]/tool/bpf/bpftool fails to complie on
 linux-next-20250324
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: upORWBvozE1TM21JUSyh-tiHSH1YQ4xZ
X-Proofpoint-GUID: upORWBvozE1TM21JUSyh-tiHSH1YQ4xZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_04,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=802 adultscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250072
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Greetings!!!


bpftool fails to complie on linux-next-20250324 repo.


Error:

make: *** No rule to make target 'bpftool', needed by 
'/home/linux/tools/testing/selftests/bpf/tools/include/vmlinux.h'. Stop.
make: *** Waiting for unfinished jobs.....


Git bisect points to commit: 8a635c3856ddb74ed3fe7c856b271cdfeb65f293 as 
first bad commit.

Bisect log:

git bisect start
# status: waiting for both good and bad commits
# good: [4701f33a10702d5fc577c32434eb62adde0a1ae1] Linux 6.14-rc7
git bisect good 4701f33a10702d5fc577c32434eb62adde0a1ae1
# status: waiting for bad commit, 1 good commit known
# bad: [882a18c2c14fc79adb30fe57a9758283aa20efaa] Add linux-next 
specific files for 20250324
git bisect bad 882a18c2c14fc79adb30fe57a9758283aa20efaa
# good: [36ad536dbad8e29a1fdb7a8760a9c4fcb0dcf7cb] Merge branch 
'for-next' of 
git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git
git bisect good 36ad536dbad8e29a1fdb7a8760a9c4fcb0dcf7cb
# good: [96c123361d8e32f6012aa449eed27147979af27e] Merge branch 'next' 
of git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
git bisect good 96c123361d8e32f6012aa449eed27147979af27e
# bad: [b9fc57d1f74797e7b25c779671c03192a81feb1a] Merge branch 
'usb-next' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
git bisect bad b9fc57d1f74797e7b25c779671c03192a81feb1a
# good: [1da0a3d00734bf365f53480a7ffb4361fd61e6d5] Merge branch 'master' 
of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
git bisect good 1da0a3d00734bf365f53480a7ffb4361fd61e6d5
# bad: [4541ffab99f8b7ddadb367c73f28ea1fe70f2f97] Merge branch 'next' of 
git://git.kernel.org/pub/scm/virt/kvm/kvm.git
git bisect bad 4541ffab99f8b7ddadb367c73f28ea1fe70f2f97
# good: [361da275e5ce98bbab5f6990d02eb9709742d703] Merge branch 
'kvm-nvmx-and-vm-teardown' into HEAD
git bisect good 361da275e5ce98bbab5f6990d02eb9709742d703
# bad: [28b4c36e59ccfd4e38eaf804b292b3c5b2287900] Merge branch 
'for-next' of 
git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
git bisect bad 28b4c36e59ccfd4e38eaf804b292b3c5b2287900
# good: [2ec5357274fdbe8d48d13d33a1b0e367bcadb85a] Merge sorttable/for-next
git bisect good 2ec5357274fdbe8d48d13d33a1b0e367bcadb85a
# good: [af1a78613133542583c9a9875c824678a3c3a145] Merge branch 
'edac-drivers' into edac-for-next
git bisect good af1a78613133542583c9a9875c824678a3c3a145
# good: [2325ccf7b99fa8e1e95c3ce8a205e170d244b062] Merge branch 
'edac-for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git
git bisect good 2325ccf7b99fa8e1e95c3ce8a205e170d244b062
# bad: [18923806b1291102cad3a6b713006c7e7f563534] rtla/timerlat_top: 
Move divisor to update
git bisect bad 18923806b1291102cad3a6b713006c7e7f563534
# bad: [9dc3766ed07c95c9a77fa98dcbc83dcb7f49df3d] rtla: Add optional 
dependency on BPF tooling
git bisect bad 9dc3766ed07c95c9a77fa98dcbc83dcb7f49df3d
# bad: [8a635c3856ddb74ed3fe7c856b271cdfeb65f293] tools/build: Add 
bpftool-skeletons feature test
git bisect bad 8a635c3856ddb74ed3fe7c856b271cdfeb65f293
# good: [6fa5e3a87cd7838453be66c3a69c2236a1680504] rtla/timerlat: Unify 
params struct
git bisect good 6fa5e3a87cd7838453be66c3a69c2236a1680504
# first bad commit: [8a635c3856ddb74ed3fe7c856b271cdfeb65f293] 
tools/build: Add bpftool-skeletons feature test


If you happen to fix this, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.


