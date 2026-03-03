Return-Path: <linuxppc-dev+bounces-17573-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOEWJ4jmpmnjZAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17573-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:47:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B51391F0A75
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:47:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQHDj2MXpz3bnr;
	Wed, 04 Mar 2026 00:47:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772545669;
	cv=none; b=mxBgz2DEL+FlE+RPiTILu3tmeCIwprvEWgIJdd/tjBXKE9BoUz4F7rUC7iq2+DAbHpxLkKs9js/Gg1YYi5hm0WadjoP5oiCjJrAw7M5HaKIY0ZA7PprgZDTVTg5GINz0tOsgKWT/M3s5d9IStOzD/a+HzXSFm0OJ58Cxm6qX1DrcLbPVlUEXKPOY738ClrBNyiKBd/Qd3/GRu5MOtISb/ceRSncgy4PNSOPx0vhvL98c6qxtuqRgHKO+gAfRDDdOGh8CNpXuC2/S+kajOU0V/rHQB8dmRm5zbMYC2u486uYLxeyX7y3dCCWDCgDWsFOBZL4tJ39ozZsbJni9jlarFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772545669; c=relaxed/relaxed;
	bh=+4LcvlTQuY044gs8t48Mb3luXXyPBF4PrOsD96qLsX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AMK4+/FVSF3cbTJnF3weRQaTutjG3AA52KGraCc8KtnwhrEvXY2vZdPG7ldLFZmdQZpmHBgEMkgn6Qm4v8YXvfe6ZC6SQoy+fzuskjHr26jSB6ynKKBEGlb0jCP4NMtnNtX8n45iyCvHJnpmaL4u21O8ExyLicslg1tqm68fyCooN6C3XgfNdWxn2G3nMQdbLA77eVCrZyJiePL76sOyAK9C4XA5hLqIWrKbMJqxrQ82VRk6NVsOwITM4LqL7MndgOLHNfH1nQd0USdMxUewGnLGwA8q9iVnlX49R8r68dmF11Na7cNnnlT+OwinM+x6IQdGFhQmPD1LQFDsr1a7OA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iQkOeqWi; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iQkOeqWi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQHDh3Gcmz30Lw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 00:47:48 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6237V5GK2189877;
	Tue, 3 Mar 2026 13:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=+4LcvlTQuY044gs8t48Mb3luXXyPBF4PrOsD96qLs
	X8=; b=iQkOeqWiznW1yG6iZWAzG07GdjnG9J7O+ic7yqZIRc6pIBTfTbclCgCJj
	F220ycZMQhJZt4qHZ1530GHe5JcczCw6ho6q0+wJ7m96dgK634a+4e9VrsLGPe/S
	r/v9GsIWDaEEeS4Tt1PPQueOHq3vhv9+rn/nKMWHddWE6PkUyF64NhZZThk7LHEv
	6JOLRSnOXH1JPXegHV7Hpaiiq5NR+c5M2INBrHtzuE4CM9ZynxO4ZKwUJNVdorFV
	d8vZz9YVn836EhXP2kX0HQ20knCOCPvgXs2r08pehgM/NjDAAeps85Sx8v0U5kBl
	GmsyrQJX05fcfA0n0iQmXuSCVAQWA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksk3twqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:47:39 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 623B9vhx008796;
	Tue, 3 Mar 2026 13:47:38 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmdd1a6n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:47:38 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623DlYKD49218010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 13:47:34 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9A1F2004E;
	Tue,  3 Mar 2026 13:47:34 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC2C22004B;
	Tue,  3 Mar 2026 13:47:32 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 13:47:32 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: [PATCH 0/2] powerpc/crash: backup region offset update to eflcorehdr
Date: Tue,  3 Mar 2026 19:17:14 +0530
Message-ID: <20260303134722.2814049-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: boFn_rPgJoOLr19P5tHus6vyorLVdFgJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOCBTYWx0ZWRfXx8pKQff/RaEv
 50rwK11PgLyPuWDnmAl+/jcXomH92YHKbXmiV26K5939zd3BGlVmf53YlCuRDMd+TGYbAFl46CL
 PaRqMlICbt1BrT4tBtuwgPtQoMD0+7e7U+9U6yWsiXtuYjHzpkC5Gdt4nCubdsAlRP/6mG/e5fs
 Eo9PbZZDlB2NvqNUut1aTq+SeyV99l0nKiJ0iSjMIPGNNHtDXTMvs5ngbfIMDtZ91lX7xjewuVD
 j2CQsU+Qhm3D20HOtq4Ojb7nOe0kORrm76p9YYwefATS9mECpz8G8+le8+4G6zXboNTsJ6eNlAp
 7AE/4krc2WZkf3eIezMVbwiVi+WKXAr3FyKHn27l1aCpX/wHq+D3HUK9vMHgrBW1Zka8Yv2KZaC
 +YGi7VDOnVZSi5j07B7IpUItpR8urpdj61mv8NVxqfiwR/yRJbETM3jWuiPAPUNbLzZzLbehtnf
 y5EFusOvB1DytWCRkMw==
X-Authority-Analysis: v=2.4 cv=csCWUl4i c=1 sm=1 tr=0 ts=69a6e67b cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8
 a=h0ihOahIyXu_IyCkdeYA:9
X-Proofpoint-GUID: yeKOMxcDzHPadHAfsmeVA76e_g_4w6Dg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030108
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: B51391F0A75
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17573-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	FROM_NEQ_ENVFROM(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On a kernel crash, purgatory copies the first 64 KB of the crashed
kernel memory to the backup memory region reserved within crashkernel
memory for the kdump kernel. This ensures that the capture kernel can
use the first 64 KB of memory to place the exception vectors and other
required data.

However, in the elfcorehdr prepared using the kexec_file_load syscall,
or the one recreated during a memory hotplug event, the offset of the
program header representing the first 64 KB of memory is set to 0,
whereas it should point to the backup region.

This has not caused issues so far because the first 64 KB is usually
identical in both the crashed and capture kernels. However, this is
only an assumption and is not guaranteed to always hold true.

Therefore, update the offset of the program header representing the
first 64 KB of the crashed kernel memory in the elfcorehdr prepared for
the kdump kernel.

Testing:
=======

Git Tree: https://github.com/sourabhjains/linux/commits/kdump-backup-region-offset/

The above tree contains an additional patch that introduces a new sysfs
interface to dump the kdump elfcorehdr to the dmesg/console.

$> cat /sys/kernel/kexec/crash_elfcorehdr_print 
ELF Program Header Summary:
  Total Program Headers: 13 (0xd)
  PT_LOAD segments:      4 (0x4)
  PT_NOTE segments:      9 (0x9)

Program Headers:
Index Type               Offset             VirtAddr           PhysAddr     FileSize     MemSize  Flags   
================================================================================
0x0   PT_NOTE            0x3fd966400        0x0                0x3fd966400        0x218              0x218              ---
0x1   PT_NOTE            0x3fd996400        0x0                0x3fd996400        0x218              0x218              ---
0x2   PT_NOTE            0x3fd9c6400        0x0                0x3fd9c6400        0x218              0x218              ---
0x3   PT_NOTE            0x3fd9f6400        0x0                0x3fd9f6400        0x218              0x218              ---
0x4   PT_NOTE            0x3fda26400        0x0                0x3fda26400        0x218              0x218              ---
0x5   PT_NOTE            0x3fda56400        0x0                0x3fda56400        0x218              0x218              ---
0x6   PT_NOTE            0x3fda86400        0x0                0x3fda86400        0x218              0x218              ---
0x7   PT_NOTE            0x3fdab6400        0x0                0x3fdab6400        0x218              0x218              ---
0x8   PT_NOTE            0xa2c0000          0x0                0xa2c0000          0x10024            0x10024            ---
0x9   PT_LOAD            0x1af40000         0xc000000000000000 0x0                0x10000            0x10000            RWX
0xa   PT_LOAD            0x10000            0xc000000000010000 0x10000            0x17ff0000         0x17ff0000         RWX
0xb   PT_LOAD            0x2ec70000         0xc00000002ec70000 0x2ec70000         0x1390000          0x1390000          RWX
0xc   PT_LOAD            0x58000000         0xc000000058000000 0x58000000         0x3a8000000        0x3a8000000        RWX

So, once kdump is successfully loaded using the kexec command,
for example:

$ kexec --initrd=/boot/initramfs-`uname -r`.img /boot/vmlinuz-`uname -r` --append="`cat /proc/cmdline`" -pds

Running cat /sys/kernel/kexec/crash_elfcorehdr_print prints the
elfcorehdr in the above format. The offset of the program header
representing the first 64 KB can be easily observed.

Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>

Sourabh Jain (2):
  powerpc/crash: fix backup region offset update to eflcorehdr
  powerpc/crash: Update backup region offset in elfcorehdr on memory
    hotplug

 arch/powerpc/include/asm/kexec.h  |  6 ++++
 arch/powerpc/kexec/crash.c        | 60 +++++++++++++++++++++++++++++++
 arch/powerpc/kexec/file_load_64.c | 29 +--------------
 3 files changed, 67 insertions(+), 28 deletions(-)

-- 
2.52.0


