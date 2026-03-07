Return-Path: <linuxppc-dev+bounces-17861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IsUqIuK1q2myfwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Mar 2026 06:21:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E60522A336
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Mar 2026 06:21:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSWph1hbhz3cBx;
	Sat, 07 Mar 2026 16:21:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772860892;
	cv=none; b=Wc6psTHUk4rtmoEsPoKsVcBu+dBMkDpoX9kNAEJPMsJ7oxHAAjgJoJfZQAGcngiH/ZSW5VOTSAihYY4RjZkeWPpmvPDV6j86VTZ8Prf1fzNTstOZDlRbhQ4mtuxtgVis+KAFuNlkXkwI/Ce6s8+iYZehT4td6eqxwlkQixWnjOqfWwqRL6gsmfxzhwhYWrI/pnaH11Sc3bJyqhfx6TMmkF62NFZqmVXO5hcvulbcejglz7bPBGQszgk1MAx3JHXSt9J4PCw+cxAaeidzDkiczzOaJk+22ZiPlLEdk3EUvdNmF4M54B1LkVeEn9KOATzYEAnDa987hg5ymvqDKdqZow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772860892; c=relaxed/relaxed;
	bh=C+1lRCwA/BOdt4Xrg4fOGnfGGg39mu0/9ApPD+bCW+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RvWQbmtX/vohRTYWW714r2JiwrHe5DrNUrIfKJY8UJ8is7kXzylthygMkzit8l4Cb5YcMEo2Zi71y4443XELWl+koZOyw+pTB5k6xkXLZhgTfIEWD0q073AxxeuM7sSmjJu/EiRk3ri9gosfOKCapCG9tIRZ1JzI+clBeovYfHIF2sRYEviVtGiTQ+lwVY8XFmTI1A2epG9PZ2P6RxC/DY9zCeEpx96W/W4DslnJd72Ih47I3fd/VVtQy22avN1o++ofvMjUiZtu39smb3KGJgUsz6Ob18cQ33RcI6VFByoFUaGGBSRx081ngzCce1h1OjiXDPsSNgGRkm5H030ARQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mo3ueJfE; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mo3ueJfE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSWpg13zfz3bcf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 16:21:30 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6274TUrk877795;
	Sat, 7 Mar 2026 05:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=C+1lRCwA/BOdt4Xrg4fOGnfGGg39mu0/9ApPD+bCW
	+M=; b=mo3ueJfEv2YsaVe+NFFHJ8gnUxAsiaZLb7ZHsVS/TaPYsRinISAjhJtlT
	zGM2WkMw7xY9dTe/u+d+GSSd+5Yi9A2Tm4z2i/wU1vnAo6BZAAnw7iurKKb4k09N
	cpxWuT+OgH6QbaqUxDEfyPhtX5kZuIKG2l/n2PLFCH6XfYuCMwo9M/hXM6Obv4YQ
	/zfYiomg03CU+zHg2/nTNrSeuu3QXfjzQo+ImGMU5FCzRYRL7IjhKldT5VzmOSaB
	L6VRQZr9Gr99VOvt4QM6UW3+EhLb5gf9g74uugXoubeAzDEVXkkHtIWLOLMtq5HK
	lBvK2DZMIZiAdGM3zD8HVoxX+K5Uw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crd1m83ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Mar 2026 05:21:18 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6274o6Fh010305;
	Sat, 7 Mar 2026 05:21:18 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmc6kjkvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Mar 2026 05:21:18 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6275LELF16908684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 7 Mar 2026 05:21:14 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3264A20040;
	Sat,  7 Mar 2026 05:21:14 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B95820043;
	Sat,  7 Mar 2026 05:21:11 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.domain.name (unknown [9.124.213.92])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  7 Mar 2026 05:21:11 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: [PATCH v2 0/2] powerpc/crash: backup region offset update to eflcorehdr
Date: Sat,  7 Mar 2026 10:50:55 +0530
Message-ID: <20260307052102.944952-1-sourabhjain@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=ds3Wylg4 c=1 sm=1 tr=0 ts=69abb5cf cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=pGLkceISAAAA:8 a=h0ihOahIyXu_IyCkdeYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDA0MyBTYWx0ZWRfX7fQwW71xdjMn
 EE3r4ylktUB9yMKCzkfPLZVL64S46KCZZi9mn2SjnvA4RxJSNgpTFGFdHOHwegyNVU5gPtIfKn0
 WSYmg8qRcFSaA8aC7OggfCmW6yJj9ZsevsBuyQMWfuoot69BUX8Ff0Liijtv8choA3ZQkXgjwLs
 BChcoXbQ1+a4eb+OVynSE4yGm2wpg7usNhfeY8KabI65rdcdZTzPaBWNHR+f3pJangc4FBRLztq
 Z+/1s/i+RftYoSCc1IxyxGLeS/SQ4ZH2+8XsIZsBnjojuW4u8bhY6L6jNo9idSKfKxWPJTdf3Xg
 nC/UZIfVsCJp+I5jpPWhU2JaDYP5mjocF8UfNI+rHMyEfizWONkmCD1+03J3A2DB2HhKs87vqOd
 1bANR1913zOeBpcOO8yjfbq7HvkKIUp7bsE1MCGXdz45EP3AxxMOrc9gcdIaFgZEpOIjOAzicYZ
 +83vLXlTDqZCMzQorOQ==
X-Proofpoint-GUID: PmWa31avfGOtjdb_a7-h61HnElloWNmG
X-Proofpoint-ORIG-GUID: L74ujOM5pA7bVnZ61RL8LvzYdZ8Kp4Bz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070043
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 3E60522A336
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17861-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ellerman.id.au:email];
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

Changlog:

v1:
https://lore.kernel.org/all/20260303134722.2814049-1-sourabhjain@linux.ibm.com/

v2:
 - Fix build error: 'struct kimage' has no member named 'arch'
   How?
   Define ARCH_HAS_KIMAGE_ARCH and struct kimage_arch when
   CONFIG_KEXEC_FILE or CONFIG_CRASH_DUMP is enabled so that
   kimage->arch.backup_start is available with the kexec_load syscall.

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

 arch/powerpc/include/asm/kexec.h  | 14 ++++++--
 arch/powerpc/kexec/crash.c        | 60 +++++++++++++++++++++++++++++++
 arch/powerpc/kexec/file_load_64.c | 29 +--------------
 3 files changed, 72 insertions(+), 31 deletions(-)

-- 
2.52.0


