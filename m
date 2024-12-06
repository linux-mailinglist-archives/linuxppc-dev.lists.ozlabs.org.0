Return-Path: <linuxppc-dev+bounces-3841-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A469E6DCA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2024 13:07:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y4VP573vDz2y8V;
	Fri,  6 Dec 2024 23:07:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733468181;
	cv=none; b=OSAxjjt718Lgo+XObXJsFwzdO0njRa4jLWTXLW89fnq4FTkADT6XOcGzAYDpFVOqRESienCgVSHG5+dZtWd7ivmynrQ1yQb9xGuWnvNxErwete6kBWnkvAnvBU5XPRpjvrrL1xir1DM92LOF9QychTEzCXAYULc6F9tmuxPuhwLf06cMgCnJTldng8IWdnJhgi1mISkS10C8xb+pDZUoFKDZ7g0e5f/bfOD2sfrIZvJuHFvIAcgrvYWIMW/cnD0Ds4iBiukjfhHjfaKbPmr7wuQ9vYupL34yobY4N/L9snQkj9k7Ebl1kJjvuAo+VncUy72UD1KqyoLnmV5QWP0nHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733468181; c=relaxed/relaxed;
	bh=PIZJkSgVKl7lE4StkR7Ra6+rcU33RMgvhyKFpvwEt4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VyLyYkCcnJEmCsiR0SlENMLBwGPv9YHjVBXonK2McneQVtZptSnnkfpG7rHSwGsbWoJ1u6R6DYg6wBScFDPHpRnvgaKKiyFJLxFEvupFcYZkKFxc9o0r4Kyh+W5KHoTq8lYDDpiL0bMQyzssok3dJY7KizBVtM1/Pr/tOtxA1ME0+a/gI/8g8kXMjw9v7XkDylSw4495YBgWHP0kim91o95I2aMUVy6+d4fkF8Ff/8fQjk/X8FXR3X5pBLAfKp33ByoI5Z5ropK/YhQTY75g+H7sCy92sqKQX5YN7AtQteupljHXSA82diQblgZMpMlVAmdSifdmXSqkWbsC5wtGqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OpOJEJLC; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=avnish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OpOJEJLC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=avnish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y4MVT0xrBz2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 17:56:16 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B613Wog012926;
	Fri, 6 Dec 2024 06:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=PIZJkSgVKl7lE4StkR7Ra6+rcU33RMgvhyKFpvwEt
	4c=; b=OpOJEJLCcV5Y3cbAdu7xrHtUnnO1HDmDjaHQsyxwNXbTttr65ZrjXr5d9
	tPzBC1bl+L3rWU7IKyg6ZMl6wwqdDfds40GjxCGx/Ro+7SV0mEWwrc50WKcNoXqQ
	QPjCEE/LthpPxuleSetxN6G85H5n72nebXvyJa4TLsgMKXPzeol4hbLiZolVlMB7
	RgCD5/Smhi3KKj05ljzMgSkoWgVEq8D9VJKMv3Cp2xnMeE/Ip0fz8qR42iEgaqbS
	m48eKVguEsLEaO7w2sLK6Rf0DgvMtq9ZdZjqrbSM3smleFFpuRhz1ppbnFzYdqAe
	Xb9yM2sgixQNDp3gIFqXdZ58rGjhg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437s4jhqx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 06:56:06 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B66lD6i031769;
	Fri, 6 Dec 2024 06:56:06 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 438ehm9h5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 06:56:05 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B66tx9B34537874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Dec 2024 06:55:59 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 170392004B;
	Fri,  6 Dec 2024 06:55:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2CF720040;
	Fri,  6 Dec 2024 06:55:57 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.153.221])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Dec 2024 06:55:57 +0000 (GMT)
From: Avnish Chouhan <avnish@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, brking@linux.ibm.com, meghanaprakash@in.ibm.com,
        sourabhjain@linux.ibm.com, maddy@linux.ibm.com,
        Avnish Chouhan <avnish@linux.ibm.com>
Subject: [PATCH v2] powerpc: increase MIN RMA size for CAS negotiation
Date: Fri,  6 Dec 2024 12:25:45 +0530
Message-ID: <20241206065545.14815-1-avnish@linux.ibm.com>
X-Mailer: git-send-email 2.46.0
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
X-Proofpoint-GUID: -Bh7cBLhCcwz0PZx0mk1UklaeANPyS05
X-Proofpoint-ORIG-GUID: -Bh7cBLhCcwz0PZx0mk1UklaeANPyS05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412060045
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URI_HEX autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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

Signed-off-by: Avnish Chouhan <avnish@linux.ibm.com>
---
Change logs:

v2:
 - Added GRUB2 debug logs and Kernel traces.

---
 arch/powerpc/kernel/prom_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index fbb68fc28ed3..c42fd5a826c0 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1061,7 +1061,7 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
 		.virt_base = cpu_to_be32(0xffffffff),
 		.virt_size = cpu_to_be32(0xffffffff),
 		.load_base = cpu_to_be32(0xffffffff),
-		.min_rma = cpu_to_be32(512),		/* 512MB min RMA */
+		.min_rma = cpu_to_be32(768),		/* 768MB min RMA */
 		.min_load = cpu_to_be32(0xffffffff),	/* full client load */
 		.min_rma_percent = 0,	/* min RMA percentage of total RAM */
 		.max_pft_size = 48,	/* max log_2(hash table size) */
-- 
2.43.5


