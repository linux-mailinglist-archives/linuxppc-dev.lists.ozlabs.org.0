Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B27C606F62
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 07:25:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MttG03Lq5z3dtZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 16:25:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UOyNFcHB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UOyNFcHB;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MttDz1P8tz3c5v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 16:24:18 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29L5K12I004368;
	Fri, 21 Oct 2022 05:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=EMJce44ZoQ1luf9MdYrgWQ+ENXVqgBDIQf/1LUSLPnI=;
 b=UOyNFcHB5ejmM7aT9Z12OPqEoEvpf7TocayIFUo4NpNRtZTSgqtuKlVThqIbqVVXrXiD
 0a7STEuMU2vR50jX8GJIdZx4XbK3GbGd9zLbyXwbUdQjEhoYadFIOMaT2pWiV6XZ2pxI
 TQERoPZtRB/XiTo4NAA1Yrp7r61Ff/TPTmG856E6vQNGgFz9EQcVIkAp1EnYQrevzUpv
 ePMenB5qzaZ6V8GDNRU01gYgi1nlIojodcU0tj4nZI6DrZs54rcm5E6qe91MAOkySF50
 8VsdFJVNackRpRwcU9YwLHS1muuehfXvkN+9PUEsVtB3YYFpMr2je/7PMusdDH7Qt4mN Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbn6f838f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 05:24:06 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29L5KQ8F006238;
	Fri, 21 Oct 2022 05:24:06 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbn6f837s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 05:24:06 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29L5MbMn031655;
	Fri, 21 Oct 2022 05:24:04 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3k7mg9a14q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 05:24:04 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29L5IwvM16449834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Oct 2022 05:18:58 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D8F74203F;
	Fri, 21 Oct 2022 05:24:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6206D42041;
	Fri, 21 Oct 2022 05:24:01 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 21 Oct 2022 05:24:01 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (unknown [9.177.89.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B0266600EE;
	Fri, 21 Oct 2022 16:23:48 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 0/6] Use per-CPU temporary mappings for patching
Date: Fri, 21 Oct 2022 16:22:32 +1100
Message-Id: <20221021052238.580986-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 99HOh4kLVavlu62E-dj6A_NVDelY7BTE
X-Proofpoint-GUID: NLoqelxju8OOgzkWn8bmqRqG9t6WzFji
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_01,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1011 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210029
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

This is a revision of Chris and Jordan's series to introduces a per cpu temporary
mm to be used for patching with strict rwx on radix mmus.

It is just rebased on powerpc/next. I am aware there are several code patching
patches on the list and can rebase when necessary. For now I figure this'll get
changes requested for a v9 either way.

v8:	* Merge the temp mm 'introduction' and usage into one patch.
	  x86 split it because their temp MMU swap mechanism may be
	  used for other purposes, but ours cannot (it is local to
	  code-patching.c).
	* Shuffle v7,3/5 cpu_patching_addr usage to the end (v8,4/4)
	  after cpu_patching_addr is actually introduced.
	* Clearer formatting of the cpuhp_setup_state arguments
	* Only allocate patching resources as CPU comes online. Free
	  them when CPU goes offline or if an error occurs during allocation.
	* Refactored the random address calculation to make the page
	  alignment more obvious.
	* Manually perform the allocation page walk to avoid taking locks
	  (which, given they are not necessary to take, is misleading) and
	  prevent memory leaks if page tree allocation fails.
	* Cache the pte pointer.
	* Stop using the patching mm first, then clear the patching PTE & TLB.
	* Only clear the VA with the writable mapping from the TLB. Leaving
	  the other TLB entries helps performance, especially when patching
	  many times in a row (e.g., ftrace activation).
	* Instruction patch verification moved to it's own patch onto shared
	  path with existing mechanism.
	* Detect missing patching_mm and return an error for the caller to
	  decide what to do.
	* Comment the purposes of each synchronisation, and why it is safe to
	  omit some at certain points.

Previous versions:
v7: https://lore.kernel.org/all/20211110003717.1150965-1-jniethe5@gmail.com/
v6: https://lore.kernel.org/all/20210911022904.30962-1-cmr@bluescreens.de/
v5: https://lore.kernel.org/all/20210713053113.4632-1-cmr@linux.ibm.com/
v4: https://lore.kernel.org/all/20210429072057.8870-1-cmr@bluescreens.de/
v3: https://lore.kernel.org/all/20200827052659.24922-1-cmr@codefail.de/
v2: https://lore.kernel.org/all/20200709040316.12789-1-cmr@informatik.wtf/
v1: https://lore.kernel.org/all/20200603051912.23296-1-cmr@informatik.wtf/
RFC: https://lore.kernel.org/all/20200323045205.20314-1-cmr@informatik.wtf/
x86: https://lore.kernel.org/kernel-hardening/20190426232303.28381-1-nadav.amit@gmail.com/

Benjamin Gray (5):
  powerpc/code-patching: Use WARN_ON and fix check in poking_init
  powerpc/code-patching: Verify instruction patch succeeded
  powerpc/tlb: Add local flush for page given mm_struct and psize
  powerpc/code-patching: Use temporary mm for Radix MMU
  powerpc/code-patching: Use CPU local patch address directly

Jordan Niethe (1):
  powerpc: Allow clearing and restoring registers independent of saved
    breakpoint state

 arch/powerpc/include/asm/book3s/32/tlbflush.h |   9 +
 .../include/asm/book3s/64/tlbflush-hash.h     |   5 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   8 +
 arch/powerpc/include/asm/debug.h              |   2 +
 arch/powerpc/include/asm/nohash/tlbflush.h    |   1 +
 arch/powerpc/kernel/process.c                 |  36 ++-
 arch/powerpc/lib/code-patching.c              | 236 +++++++++++++++++-
 7 files changed, 284 insertions(+), 13 deletions(-)


base-commit: 8636df94ec917019c4cb744ba0a1f94cf9057790
prerequisite-patch-id: b8387303be6478fdf94264d485d5e08994f305c7
prerequisite-patch-id: 06e54849e6c9e45a9b24668fa12cc0ece3f831a7
prerequisite-patch-id: f4be9e7d613761fba33fb2f7a81839cef36fe0fe
prerequisite-patch-id: 4ea0e36de5c393f9f6ae6243cb21a0ddb364c263
prerequisite-patch-id: 47a1294f0a5d5531ec5c32a761269cb5a1158515
prerequisite-patch-id: d72e371d3d820fdf529f03d2544c7f7f8bb6327a
prerequisite-patch-id: 3024e700433cb6a20dc1e1c6476ea1e98409d8b7
prerequisite-patch-id: f136637f7a8fe92dc4f60b908e2e7aa24aac3f43
--
2.37.3
