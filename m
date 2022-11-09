Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 530FB622347
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 05:58:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Xmr1TD9z3dv2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 15:58:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aX7bJnLX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aX7bJnLX;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Xcj654Gz3bhv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 15:51:49 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A94fdga025242;
	Wed, 9 Nov 2022 04:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=f1E8AaI8Qw6rGqjmiAIsDmv/EOg/ib3XGrjaknG4OVk=;
 b=aX7bJnLXyQixwPmwLEhVOsfaQxr6oOgZTfY3d8QWkXKrbr6wQSMpW+Gv+JkjHsTztPdK
 A5gi37KiXI8Hv9swzmv5Cfu+Du2pXzkz7yczaOOaYaOS6qZDP24lE0twE1ifRAcZ3ohA
 dfDgoebXXKVxWShqb1X4v79qBl+IN6j+5slkFmsz1j7Vk/Bzb/+67h9Ikqyn53jkJVPd
 2f6cOhoO4r5oq/Twr9+V/QR8/JkP1U8NL7Ml2PdgiDEgJcvfuuXjfh6JJCm46x06c0z3
 6NiKEFW5l6l+eINmo45539x74q4Hhq7sxFeaSdWZjVEpRVtbA3DQJMK2p2DBRMv0bxFy TA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr5dg8efj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:36 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A94iL5N011537;
	Wed, 9 Nov 2022 04:51:35 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr5dg8eej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:35 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A94o56b000998;
	Wed, 9 Nov 2022 04:51:33 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3kngqgd333-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:33 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A94pVXS56885670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Nov 2022 04:51:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53560A405B;
	Wed,  9 Nov 2022 04:51:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A999AA4054;
	Wed,  9 Nov 2022 04:51:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  9 Nov 2022 04:51:30 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B53D96036F;
	Wed,  9 Nov 2022 15:51:28 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 0/9] powerpc/code-patching: Use temporary mm for Radix MMU
Date: Wed,  9 Nov 2022 15:51:03 +1100
Message-Id: <20221109045112.187069-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: C59vUyItU9m-X9fNPnPsbIhwETFasx_3
X-Proofpoint-ORIG-GUID: hQ1DcKPkFWfXkPtbnY2Uvww1Gt8idLl_
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_01,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 mlxlogscore=897 phishscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090032
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: ajd@linux.ibm.com, jniethe5@gmail.com, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a revision of Chris and Jordan's series to introduce a per-cpu temporary
mm to be used for patching with strict rwx on radix mmus.

v10:	* Don't set poking_init_enabled on boot CPU init failure
	* Remove extern from functions in files touched by this series
	* Changed book3s/32/tlbflush.h stub body from warning to build bug
	* Remove empty hash__ set of functions. Also removed the ones that are
	  just warnings (would have preferred to make them build bugs, but they
	  blocked the build even though it's all inline inside a radix_enabled()
	  if-block).
	  	- It's not possible to use the radix specific necessary TLB flush
		  in code patching, as code-patching.c is compiled even when radix__*
		  functions aren't visible. #ifdefs would be required.
		  The cxl usage required radix__* be visible anyway, so there is no
		  compile issue.
	* Mention cache benefits of struct of patching context variables
	* Don't open-code mm init and teardown. It seems tlb_gather_mmu does
	  the necessary steps to detect page table pages to free, so it should
	  not leak. get_locked_pte() is used over __get_locked_pte() because I
	  don't know what makes the double-underscore function dangerous.

Previous versions:
v9: https://lore.kernel.org/all/20221025044409.448755-1-bgray@linux.ibm.com/
v8: https://lore.kernel.org/all/20221021052238.580986-1-bgray@linux.ibm.com/
v7: https://lore.kernel.org/all/20211110003717.1150965-1-jniethe5@gmail.com/
v6: https://lore.kernel.org/all/20210911022904.30962-1-cmr@bluescreens.de/
v5: https://lore.kernel.org/all/20210713053113.4632-1-cmr@linux.ibm.com/
v4: https://lore.kernel.org/all/20210429072057.8870-1-cmr@bluescreens.de/
v3: https://lore.kernel.org/all/20200827052659.24922-1-cmr@codefail.de/
v2: https://lore.kernel.org/all/20200709040316.12789-1-cmr@informatik.wtf/
v1: https://lore.kernel.org/all/20200603051912.23296-1-cmr@informatik.wtf/
RFC: https://lore.kernel.org/all/20200323045205.20314-1-cmr@informatik.wtf/
x86: https://lore.kernel.org/kernel-hardening/20190426232303.28381-1-nadav.amit@gmail.com/

Benjamin Gray (9):
  powerpc: Allow clearing and restoring registers independent of saved
    breakpoint state
  powerpc/code-patching: Use WARN_ON and fix check in poking_init
  powerpc/mm: Remove extern from function prototypes
  powerpc/mm: Remove empty hash__ functions
  cxl: Use radix__flush_all_mm instead of generic flush_all_mm
  powerpc/mm: Remove flush_all_mm, local_flush_all_mm
  powerpc/tlb: Add local flush for page given mm_struct and psize
  powerpc/code-patching: Use temporary mm for Radix MMU
  powerpc/code-patching: Consolidate and cache per-cpu patching context

 arch/powerpc/include/asm/book3s/32/tlbflush.h |   9 +
 .../include/asm/book3s/64/tlbflush-hash.h     |  69 +-----
 arch/powerpc/include/asm/book3s/64/tlbflush.h |  41 +---
 arch/powerpc/include/asm/debug.h              |   2 +
 arch/powerpc/include/asm/mmu_context.h        |   6 +-
 arch/powerpc/include/asm/nohash/tlbflush.h    |  27 ++-
 arch/powerpc/kernel/process.c                 |  38 +++-
 arch/powerpc/lib/code-patching.c              | 207 ++++++++++++++++--
 arch/powerpc/mm/nohash/tlb.c                  |   8 +
 9 files changed, 287 insertions(+), 120 deletions(-)


base-commit: 247f34f7b80357943234f93f247a1ae6b6c3a740
--
2.38.1
