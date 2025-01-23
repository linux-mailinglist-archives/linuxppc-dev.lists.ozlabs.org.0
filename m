Return-Path: <linuxppc-dev+bounces-5508-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D6CA1A357
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 12:43:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ydzbd23Swz307V;
	Thu, 23 Jan 2025 22:43:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737632605;
	cv=none; b=DtYRlokE8POAEH0CJwVhyCxL//IunriRRYwhcWut8sVAKT5TBrZX3u8GcxnRJjDAZ4x7YlNNl8kMhHzZp5HKWWNr6lDzpe6Gnl99QZvExndeqZ5famQsnjWWvkF9EoC11fAIYsyDJTyl/5u7YieCTavPi6UycY8p/Gn++e+RPwptcsI4fhhH6k3s6hRyYfwZv1y0uG5X0gK09yK0/8AIeyg1ynK7sRYQBkfWmxWu4xuVeFugs+fHuxOx8qPoFfb8K45ZnmgYE3M3wu+skGqEEwaX728/kBGttAoznm4CLu3MX6Y8uc3hoFdYNMY/67TaXL5cjzgCjxPaooX3KCAj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737632605; c=relaxed/relaxed;
	bh=rMquS2SpA/TIYnakC4y3sXM/MZF9vjJZqppddL7RWhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AuQA7mEdbUKcmHYWVWw7uSCXgC8T9TuLVaAn3v4i663tiPJkiRVOZb2+MFuX7H3mQd2Q5jGo+ESUoGFQ5/hZ7bpAY3KUvKbjv1q8VDQxkrvc7K69V7F4TUiH2CnjBCkqFG7bJgGRFyOoMzUr5RTwO9p2Qe6wv1m+2r0FuUYLhyPHWb5v7Pl+n1VKlYGec1/bXBYSWV/JMYq5Wj6x4D+zuJe2LNZGtYFVM09ilpiGHbhCQy2hgxZ8YlsMPlGl+2g1sPOEkFynXLJSEPHcaYf7IMTF0wmKTUmSMhN17P5evX22UQrEPiMMmXvTpUowxBEKRjvc9A267YyXo+Cs8pQfaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RYcQT84C; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RYcQT84C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ydzbc3LL3z304C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 22:43:24 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N3Sq4V016933;
	Thu, 23 Jan 2025 11:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=rMquS2SpA/TIYnakC
	4y3sXM/MZF9vjJZqppddL7RWhQ=; b=RYcQT84CYVR+3o4c0beCnZX2rXEusCQcI
	6exK6u2Bwpv/DXdGol8mPSdGUA+cNzIEJvjwODZUFnKVEeFM34OG9EhQ4q2eqtIk
	R2oL7HXwIKAyAlj27HzdJv2D20cvESbyk1Gr7m9kO0ZjY4vkVY66DWyUJU3WcX3r
	QRVeRgMF2KWzSWaYj5XFerlLoOdpZlekzciHE1AKyEk6B+Gdwx7P4ojm3nHtGIfV
	NWrtsMuIZZuz8BFi9rdGA5AjfLvy5wTFgm/P9k38fGFfO6dqUKxTUAih7edDl/Hh
	jAHxUnrdS7f7pEWjZZU2yWoAn9lY4bCnOJxU2bcDXdqCQsjP+mCqA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44b3gtvsf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:43:16 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50NAWZrf029587;
	Thu, 23 Jan 2025 11:43:15 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448qmnnb3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:43:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NBh85640435990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 11:43:08 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A91152004B;
	Thu, 23 Jan 2025 11:43:08 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9044520040;
	Thu, 23 Jan 2025 11:43:06 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 11:43:06 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Avnish Chouhan <avnish@linux.ibm.com>, Brian King <brking@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Meghana Prakash <meghanaprakash@in.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: [PATCH v3 3/4] powerpc: increase MIN RMA size for CAS negotiation
Date: Thu, 23 Jan 2025 17:12:53 +0530
Message-ID: <20250123114254.200527-4-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
References: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qWtr_fKsjr9elBicM8-Qas8fN9SvqeST
X-Proofpoint-GUID: qWtr_fKsjr9elBicM8-Qas8fN9SvqeST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 mlxlogscore=890 phishscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230087
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URI_HEX autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Avnish Chouhan <avnish@linux.ibm.com>

Change RMA size from 512 MB to 768 MB which will result
in more RMA at boot time for PowerPC. When PowerPC LPAR use/uses vTPM,
Secure Boot or FADump, the 512 MB RMA memory is not sufficient for
booting. With this 512 MB RMA, GRUB2 run out of memory and unable to
load the necessary. Sometimes even usage of CDROM which requires more
memory for installation along with the options mentioned above troubles
the boot memory and result in boot failures. Increasing the RMA size
will resolves multiple out of memory issues observed in PowerPC.

Failure details:

1. GRUB2

kern/ieee1275/init.c:550: mm requested region of size 8513000, flags 1
kern/ieee1275/init.c:563: Cannot satisfy allocation and retain minimum runtime
space
kern/ieee1275/init.c:550: mm requested region of size 8513000, flags 0
kern/ieee1275/init.c:563: Cannot satisfy allocation and retain minimum runtime
space
kern/file.c:215: Closing `/ppc/ppc64/initrd.img' ...
kern/disk.c:297: Closing
`ieee1275//vdevice/v-scsi
@30000067/disk@8300000000000000'...
kern/disk.c:311: Closing
`ieee1275//vdevice/v-scsi
@30000067/disk@8300000000000000' succeeded.
kern/file.c:225: Closing `/ppc/ppc64/initrd.img' failed with 3.
kern/file.c:148: Opening `/ppc/ppc64/initrd.img' succeeded.
error: ../../grub-core/kern/mm.c:552:out of memory.

2. Kernel

[    0.777633] List of all partitions:
[    0.777639] No filesystem could mount root, tried:
[    0.777640]
[    0.777649] Kernel panic - not syncing: VFS: Unable to mount root fs on "" or unknown-block(0,0)
[    0.777658] CPU: 17 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-0.rc4.20.el10.ppc64le #1
[    0.777669] Hardware name: IBM,9009-22A POWER9 (architected) 0x4e0202 0xf000005 of:IBM,FW950.B0 (VL950_149) hv:phyp pSeries
[    0.777678] Call Trace:
[    0.777682] [c000000003db7b60] [c000000001119714] dump_stack_lvl+0x88/0xc4 (unreliable)
[    0.777700] [c000000003db7b90] [c00000000016c274] panic+0x174/0x460
[    0.777711] [c000000003db7c30] [c00000000200631c] mount_root_generic+0x320/0x354
[    0.777724] [c000000003db7d00] [c0000000020066f8] prepare_namespace+0x27c/0x2f4
[    0.777735] [c000000003db7d90] [c000000002005824] kernel_init_freeable+0x254/0x294
[    0.777747] [c000000003db7df0] [c00000000001131c] kernel_init+0x30/0x1c4
[    0.777757] [c000000003db7e50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
[    0.777768] --- interrupt: 0 at 0x0
[    0.784238] pstore: backend (nvram) writing error (-1)
[    0.790447] Rebooting in 10 seconds..

Cc: Brian King <brking@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Meghana Prakash <meghanaprakash@in.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Avnish Chouhan <avnish@linux.ibm.com>
---
 arch/powerpc/include/asm/prom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index b4e504b914e4..f679a11a7e7f 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -17,7 +17,7 @@
 struct device_node;
 struct property;
 
-#define MIN_RMA			512		/* Minimum RMA (in MB) for CAS negotiation */
+#define MIN_RMA			768		/* Minimum RMA (in MB) for CAS negotiation */
 
 #define OF_DT_BEGIN_NODE	0x1		/* Start of node, full name */
 #define OF_DT_END_NODE		0x2		/* End node */
-- 
2.48.1


