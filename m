Return-Path: <linuxppc-dev+bounces-14295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF8C692A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 12:45:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9jVF14Ncz30Wn;
	Tue, 18 Nov 2025 22:45:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763466341;
	cv=none; b=al5j7Bp/cHUa7PzmzjezqHnlhLy1iyPPquXR92ipztlfDWNVMTM885lN3lWUQ8MyYKQJZUFcjADeaxk8qBPwRMvSPnkJIuDOnxGb2VeD6g56PwmukJGuu3yVTrxJYmK6yce2c8ApUudaqfw8tNOc7rnkakwW7Tzjppyc0bJvP2qJ55mvogkX1yZDCcRTUjgb1aRwPSbr8Lhz3PRVZfAXM4v6ZHxIeZ2zs9tcF0SCINfwlIcZQfUyqZN9mu7g7zASVD7mmhiSzs4yWP9UjMLfx7jWR3JI4Polt2TwfDthRLYAGNY8vK9RoOUkDplm9GLdGlXmwpG+ZLmkapF5rZg1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763466341; c=relaxed/relaxed;
	bh=/EdJcAjn0UUofVbNdZzgAJd5H9zW7YfwU3rw04h2rVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IH7wmah1qooyPF9MVPvvFD6KRAxjzwMmXAZ21z8mXR+KIQrdLdRTNRpk7g0bAlsbH6aSgAhys4upL4GcIoWe7UPco+jc3rR+d2kitkdwL1BEdiSUuaDUTMmnE2rLNOmDq1AelGruHEFA0UP8ePB0oDtoN70FNYzz8xv4IF8RTaNPGzD7NwPMdEdzvVYuoWfMrx3I/4vtgoYuMb3eYlcXr8pwqrMD5Xu8+YLDvucp8HK2Xq0MdfoB8OoEBtzjlCGQ3IYujlqcB8X8h3inRe5qvHwUBBo5d77X6T8YZ3HmKutSZQ26onDNC/2889CZWrSJeWKYwj+q+FLSxOIfYmS4WQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a50muEGp; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a50muEGp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9jVD2RSGz2yv6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 22:45:40 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI1VFMe017282;
	Tue, 18 Nov 2025 11:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=/EdJcAjn0UUofVbNd
	ZzgAJd5H9zW7YfwU3rw04h2rVc=; b=a50muEGpbDwjPqpkLDQfyK3As74KD5Rfi
	F6dpDSr98F8MdSpJi8RDvDPA4fXvoqgRS+RdojIn9PlM3xXc/TU6io0yMs9UsdaP
	pkbB8F/CjOUpr0rBsfPzrl35p4se2PHsdO8XWbd0VW+qBoYTLHdPcoVkZoq0S8Ns
	ny//JJBhlRYowCOWUwhAREjCikHOh0ALepg5jt6YtX+vw6FEBxtOW4K57hUBkHmB
	946uf6EP3ZrIuOJ85kZevYkBgCCmf9AfjuGM4HnocVBcb7W6EKKIFX3fDUcRve6a
	1s5SLDofP8YLTb3ZnlI8LRDIwqKtH+ehq/Z7himRpehGq+nUPXzjA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtt8rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 11:45:34 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AIBjXHY030696;
	Tue, 18 Nov 2025 11:45:33 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtt8rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 11:45:33 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI7anHH005122;
	Tue, 18 Nov 2025 11:45:32 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af5bk2u8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 11:45:32 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AIBjSQk43516254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Nov 2025 11:45:28 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE46C20040;
	Tue, 18 Nov 2025 11:45:28 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0A7020043;
	Tue, 18 Nov 2025 11:45:24 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.39.25.190])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Nov 2025 11:45:24 +0000 (GMT)
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
Subject: [PATCH v6 2/3] Documentation/ABI: mark old kexec sysfs deprecated
Date: Tue, 18 Nov 2025 17:15:06 +0530
Message-ID: <20251118114507.1769455-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118114507.1769455-1-sourabhjain@linux.ibm.com>
References: <20251118114507.1769455-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-GUID: AInG0RbrMUiTmtSvvRUBunMN2aIslJ5y
X-Proofpoint-ORIG-GUID: a3diN4XZq9a5Z-Y5xPFpJZUlJf7dQxl6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXzIH2yYtAofx5
 LREEd5BQFFBgq6RQV0Vqd2oLY0bBFqwXSWoqouKSvyFw8PH5Wd4LAE9XWIg9KkPYm6/ZUDG1HyV
 60c9EBePd2/OV/Y9OZ9ilbItIxxz2AcTH7ezp+wzM1BmCdz+d5dRo5kgO+rc4emK7W3xka/UKWB
 9faE5pmlPWmj4np5LrwQxG+LjYch+IVce2XAj5hy3huFtQpUzMHdrTmcnFv+pzG4TWNCHr1tPNC
 /Q9MbkxW2ICnpAA+HrwB84p+Icv0xhdpnPnJEIN2xbfrxPI0TCgJmndonRYnPQiKHJ7ebrEAXo7
 9Wv2apMNvg3xd6rqaPijjOi+NbwsvFuKe2gVZ6AP0gVZFSd93PVincApItvVfcF+0YKue0Tddv3
 aHl+16o3kJQFA1hOwltkzBRmLT6s3g==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691c5c5e cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8
 a=LRU2jnFezOS3J6eLL00A:9 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The previous commit ("kexec: move sysfs entries to /sys/kernel/kexec")
moved all existing kexec sysfs entries to a new location. The ABI
document is updated to include a note about the deprecation of the old
kexec sysfs entries.

The following kexec sysfs entries are deprecated:
- /sys/kernel/kexec_loaded
- /sys/kernel/kexec_crash_loaded
- /sys/kernel/kexec_crash_size
- /sys/kernel/crash_elfcorehdr_size
- /sys/kernel/kexec_crash_cma_ranges

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
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 .../sysfs-kernel-kexec-kdump                   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-kexec-kdump (63%)

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
similarity index 63%
rename from Documentation/ABI/testing/sysfs-kernel-kexec-kdump
rename to Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
index f6089e38de5f..ba26a6a1d2be 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+++ b/Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
@@ -1,3 +1,21 @@
+NOTE: all the ABIs listed in this file are deprecated and will be removed after 2028.
+
+Here are the alternative ABIs:
++------------------------------------+-----------------------------------------+
+| Deprecated                         | Alternative                             |
++------------------------------------+-----------------------------------------+
+| /sys/kernel/kexec_loaded           | /sys/kernel/kexec/loaded                |
++------------------------------------+-----------------------------------------+
+| /sys/kernel/kexec_crash_loaded     | /sys/kernel/kexec/crash_loaded          |
++------------------------------------+-----------------------------------------+
+| /sys/kernel/kexec_crash_size       | /sys/kernel/kexec/crash_size            |
++------------------------------------+-----------------------------------------+
+| /sys/kernel/crash_elfcorehdr_size  | /sys/kernel/kexec/crash_elfcorehdr_size |
++------------------------------------+-----------------------------------------+
+| /sys/kernel/kexec_crash_cma_ranges | /sys/kernel/kexec/crash_cma_ranges      |
++------------------------------------+-----------------------------------------+
+
+
 What:		/sys/kernel/kexec_loaded
 Date:		Jun 2006
 Contact:	kexec@lists.infradead.org
-- 
2.51.1


