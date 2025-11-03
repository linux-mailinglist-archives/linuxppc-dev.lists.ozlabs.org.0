Return-Path: <linuxppc-dev+bounces-13684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D398CC2A015
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 04:59:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0HsG4xc2z3btS;
	Mon,  3 Nov 2025 14:59:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762142370;
	cv=none; b=URAcAUE5Yvk+XhVEeWyLDhlZUo8YJRxkYvolxKkwdIpYCKZgMe5rHVcK3H+zOQ3TuDelI+W9T0dmISeCwLJnz9ktsLSyPQjWiX5/Bhzd7D5Vja61HoXPYZcyO9LuPG4xeVZVEvafDS5B45Y9OXskkYskP45282lBdr8U5kkkhB5CzIySfhQFwHV8ZrBwlBWakInUXBltFoVPHmMZQmJ7apeLhqtJ3MRs8eT9GwLuX+WYSd5KHC6eSbPV7kLQf7s25dLYObWL0eiY8sWLR3OTuQaGYSmj2Ep1th5HpRQmMh4ViMuQ1wzrcygjPaVZq9LAWFVdAgJoq2LDFpE2rR5Mkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762142370; c=relaxed/relaxed;
	bh=ZPZsTXk92qwOQf9lGLrlH/F3vYa3J75iomls7UbiwMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLzcKWx6hqTfZp8psBg+lzh0+zpUu/bd7pNlnzKT9uQE3WsPlky1j+HI0dqZH997iPc9OeJ1lZRrk4R5yEZYIpF3TO1o+gFkkzGEjs2ZocBHBqR9djoYZ/1WmF2iB6RKsBxr61mVOEJiOzhxA4WPFjKf+Fdzroz8LDxhw0c3CEXaGayG18+QZ36lFVpQBkvAtnJqDQmKhHY33sCy14sroyrDGXW4Lgg8j9myr2dFXC7UXX/yfvP+IviWBg8ioMkf+B29Np5gVT3jUojV+aMzQDGuCEvCnAkcI0aCPo2nw3Yvf0Xa1vzHrj6+UfRIbuI3JyqFhNyikSZowro0snew8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YE6LC3hX; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YE6LC3hX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0HsF6M8wz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Nov 2025 14:59:29 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A2LjECd010334;
	Mon, 3 Nov 2025 03:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ZPZsTXk92qwOQf9lG
	LrlH/F3vYa3J75iomls7UbiwMU=; b=YE6LC3hXW1gooxS0Xfn0xaKhSdh0cgqrw
	jNawS3mu1YR+lGhKWP11tbopZpjC6rjWf0NU8uBrjQB4Pgjsd+x/5qWu82CKCVPI
	VZnq8fV0EI2DdFXl/CkhQocm86f/138bJlLR2aPHTXKpswOyamihiETYnN80Bmb1
	wudneDGSiHYaef5a4WNIYKpCDA/XXJl9EtAG6qs0evKmAWMRntXqUTzzD1T6Fa7t
	zhUCgTqEcCuqdU3EVIwcvq9NGEhkewHjq968xQfHe0ogigY3bmxU4b0JbTutQmhN
	MBSN19VMvlxmCC9TnYo3M/2R35n6q7fjmBOcrSIzbB1OjbvNHv8/A==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59v1ms6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 03:59:24 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A33UExT009874;
	Mon, 3 Nov 2025 03:59:24 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5x1k3mpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 03:59:23 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A33xKhp42467762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Nov 2025 03:59:20 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 040282004E;
	Mon,  3 Nov 2025 03:59:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01E592004B;
	Mon,  3 Nov 2025 03:59:18 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Nov 2025 03:59:17 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Jiri Bohac <jbohac@suse.cz>, Shivang Upadhyay <shivangu@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org
Subject: [PATCH 2/2] crash: export crashkernel CMA reservation to userspace
Date: Mon,  3 Nov 2025 09:28:59 +0530
Message-ID: <20251103035859.1267318-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103035859.1267318-1-sourabhjain@linux.ibm.com>
References: <20251103035859.1267318-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-GUID: 8YErAyaTIp0NQGWWgShZOZMcihC7I2Bd
X-Proofpoint-ORIG-GUID: 8YErAyaTIp0NQGWWgShZOZMcihC7I2Bd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX9/YTQbBRYTQg
 bFIRQ5u91E8//hRZZL4Nt8RrkCh2AChSu5SQy+MjmJ6JzF5WP3ZjgyFEy4h9L8haYIkLekJAgnF
 87VbtUFuoCAVdfcoyZ5cGT3H+MHkf/092vdic01/7KbBhO+ecWgLpNg0sZJSK4L+xIYMaWaNO/V
 +TlU7l//PLnlVcux6re3845ZV2eTQXMu1IWsNg8RKyREEvgQaEBrqTqt18NMkKtHU51T/AGzIEM
 Y1pQyjNrs8WcO+3ujeKOicR5QS/5gsVCK2rq6sxDvxa2/N+LCLRoIrgMOl46jlSh2EdK8rqjHSV
 Q/Qn0u096a3MoGtlWFzSVv1WNdL9URvzWsjhYbfdAKtQiCVvtwkIrimK/Vk7a5mdxddDEtab9aF
 1Od5hUOAGp1j6zlslQrfrKu1rwNBCw==
X-Authority-Analysis: v=2.4 cv=H8HWAuYi c=1 sm=1 tr=0 ts=6908289c cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8
 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8 a=8KeDlnjoBlZ3mOFQgX4A:9
 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a sysfs entry /sys/kernel/kexec_crash_cma_ranges to expose all
CMA crashkernel ranges.

This allows userspace tools configuring kdump to determine how much
memory is reserved for crashkernel. If CMA is used, tools can warn
users when attempting to capture user pages with CMA reservation.

The new sysfs hold the CMA ranges in below format:

cat /sys/kernel/kexec_crash_cma_ranges
100000000-10c7fffff

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Jiri Bohac <jbohac@suse.cz>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradead.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 .../ABI/testing/sysfs-kernel-kexec-kdump        | 10 ++++++++++
 kernel/ksysfs.c                                 | 17 +++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
index 96b24565b68e..f6089e38de5f 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
@@ -41,3 +41,13 @@ Description:	read only
 		is used by the user space utility kexec to support updating the
 		in-kernel kdump image during hotplug operations.
 User:		Kexec tools
+
+What:		/sys/kernel/kexec_crash_cma_ranges
+Date:		Nov 2025
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Provides information about the memory ranges reserved from
+		the Contiguous Memory Allocator (CMA) area that are allocated
+		to the crash (kdump) kernel. It lists the start and end physical
+		addresses of CMA regions assigned for crashkernel use.
+User:		kdump service
diff --git a/kernel/ksysfs.c b/kernel/ksysfs.c
index eefb67d9883c..3855937aa923 100644
--- a/kernel/ksysfs.c
+++ b/kernel/ksysfs.c
@@ -135,6 +135,22 @@ static ssize_t kexec_crash_loaded_show(struct kobject *kobj,
 }
 KERNEL_ATTR_RO(kexec_crash_loaded);
 
+static ssize_t kexec_crash_cma_ranges_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+
+	ssize_t len = 0;
+	int i;
+
+	for (i = 0; i < crashk_cma_cnt; ++i) {
+		len += sysfs_emit_at(buf, len, "%08llx-%08llx\n",
+				     crashk_cma_ranges[i].start,
+				     crashk_cma_ranges[i].end);
+	}
+	return len;
+}
+KERNEL_ATTR_RO(kexec_crash_cma_ranges);
+
 static ssize_t kexec_crash_size_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buf)
 {
@@ -260,6 +276,7 @@ static struct attribute * kernel_attrs[] = {
 #ifdef CONFIG_CRASH_DUMP
 	&kexec_crash_loaded_attr.attr,
 	&kexec_crash_size_attr.attr,
+	&kexec_crash_cma_ranges_attr.attr,
 #endif
 #endif
 #ifdef CONFIG_VMCORE_INFO
-- 
2.51.0


