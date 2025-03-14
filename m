Return-Path: <linuxppc-dev+bounces-7063-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C744DA61321
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 14:56:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDm9X6gNDz3cYr;
	Sat, 15 Mar 2025 00:56:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741960560;
	cv=none; b=mKG+TAHDT5GLiMWEgsUK6WOHFBv5JmZvaIeuOCjPTrDjEVcZC8oPOB1auntNbm2rFLX4WIk8FJ0XtCei32jPR4F1T57KL//1KfdY6AKKkDTis4TGBwYJHgdttCecuOe5dsD+y4pIsQTopUL/76NCAdOmiesdNuVrhrP0eDHm8sXfv3OcJUjfmabpibDY8WDzhpFyJ/PojuoIvfZFElu/F6R+XNlFqiTqB4JZcuEitHb7G+KPN6hYRN4M84PPLkduahKrK0I826YzjYOcoEXPmrgJV2tEGBuTO5S7rXryhxQAe9DvCcFXpwfiY1alP6lg2VlDt1WTe99YBlThE3kqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741960560; c=relaxed/relaxed;
	bh=E8y/TuITCz6oCXDr/dD+GS7tdrj4jyZwD7rIasAXMHw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hYt1h/NWqyY4Kvo9AVe2tFqUOP6egXb5jOnuWq7PkHrS1U0/5gGnlnToT9v6YU3ciA7GjlD3AlVaOZER2q/zQlMLkEPOvWbB7+qvvQfRp5DSMeYHgFUOJzz6HhxxMLhCgPAG1WU7+pLzjAOFeQlBly/8FRv1ixhK116OUo1Qm60k2hUfYKvRriYe+B7h3QMwScFOGhYGdHWNoRuhN+K2w/3ZwWffibHxltj9wl2enGsJnr6HJdeXfITmeT7MRNNylMlJW//qUrprhJmcehFh9/8JlsFlBXD0qxH6+r9+psbF3sQTGOBZsUr7KDDj0k5o4n7omAQ4CtWaWg6kdt2uYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kFBhX3th; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kFBhX3th;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDm9X0vJLz3cXx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 00:55:59 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EB2bHc018878
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=E8y/TuITCz6oCXDr/dD+GS7tdrj4
	jyZwD7rIasAXMHw=; b=kFBhX3thWLtuo4bKoTIl/OhtqFuXHBfVoEyVQFPyRCK/
	fjyuyIjWbpaLCB3f3QC7No71bfjJ9va/j1SOh9gGmUB298va+LK45s2v4tg+iq63
	g38RnLSokG+m9/PUD8tVrMG94/aHlyTldYC33Mh1I4+2oKmY6BPhocdDpOkonDU/
	XcQujvAIRk6HWF1XCPq2t4Pkjcn/0QAsB2lFQgUieUD042Nu0Q9BknHHKFNaRfq0
	Ej5zqXGSHf2uskE2JPC1tJAIQmdQtOqrd0+vIhAsA1LZlp0pXO6IzCPKgHSxi9CP
	Jd4szooLVwTTZ6FPf9lXBVSMPaAhTJewWltlYV5WYA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c0sre4yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:55:56 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52ED5WTU026021
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:55:56 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atspq8ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 13:55:56 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52EDtpn629688290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 13:55:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A09C2004B;
	Fri, 14 Mar 2025 13:55:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 06A3820043;
	Fri, 14 Mar 2025 13:55:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.102])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 13:55:45 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH 0/9] Add support for configure and control of Hardware Trace Macro(HTM)
Date: Fri, 14 Mar 2025 19:25:32 +0530
Message-Id: <20250314135541.1831-1-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pGDWnMWViKh3YGkPA3ohR35tJl9zzOF9
X-Proofpoint-GUID: pGDWnMWViKh3YGkPA3ohR35tJl9zzOF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 phishscore=0 mlxlogscore=628 mlxscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140106
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	LONGWORDS,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

H_HTM (Hardware Trace Macro) hypervisor call is an HCALL to export
data from Hardware Trace Macro (HTM) function. The debugfs interface
to export the HTM function data in a partition currently supports only
dumping of HTM data in an lpar. Patchset add support for configuration
and control of HTM function via debugfs interface.

With the patchset, after loading htmdump module,
below files are present:

ls /sys/kernel/debug/powerpc/htmdump/
  coreindexonchip  htmcaps  htmconfigure  htmflags  htminfo  htmsetup
  htmstart  htmstatus  htmtype  nodalchipindex  nodeindex  trace

- nodeindex, nodalchipindex, coreindexonchip specifies which
  partition to configure the HTM for.
- htmtype: specifies the type of HTM. Supported target is
  hardwareTarget.
- trace: is to read the HTM data.
- htmconfigure: Configure/Deconfigure the HTM. Writing 1 to
  the file will configure the trace, writing 0 to the file
  will do deconfigure.
- htmstart: start/Stop the HTM. Writing 1 to the file will
  start the tracing, writing 0 to the file will stop the tracing.
- htmstatus: get the status of HTM. This is needed to understand
  the HTM state after each operation.
- htmsetup: set the HTM buffer size. Size of HTM buffer is in
  power of 2.
- htminfo: provides the system processor configuration details.
  This is needed to understand the appropriate values for nodeindex,
  nodalchipindex, coreindexonchip.
- htmcaps : provides the HTM capabilities like minimum/maximum buffer
  size, what kind of tracing the HTM supports etc.
- htmflags : allows to pass flags to hcall. Currently supports
  controlling the wrapping of HTM buffer.

Example usage:
To collect HTM traces for a partition represented by nodeindex as
zero, nodalchipindex as 1 and coreindexonchip as 12.

  # cd /sys/kernel/debug/powerpc/htmdump/
  # echo 2 > htmtype
  # echo 0 > nodeindex
  # echo 1 > nodalchipindex
  # echo 12 > coreindexonchip
  # echo 1 > htmflags     # to set noWrap for HTM buffers
  # echo 1 > htmconfigure # Configure the HTM
  # echo 1 > htmstart     # Start the HTM
  # echo 0 > htmstart     # Stop the HTM
  # echo 0 > htmconfigure # Deconfigure the HTM
  # cat htmstatus         # Dump the status of HTM entries as data

Athira Rajeev (9):
  powerpc/pseries/htmdump: Add htm_hcall_wrapper to integrate other htm
    operations
  powerpc/pseries/htmdump: Add htm configure support to htmdump module
  powerpc/pseries/htmdump: Add htm start support to htmdump module
  powerpc/pseries/htmdump: Add htm status support to htmdump module
  powerpc/pseries/htmdump: Add htm info support to htmdump module
  powerpc/pseries/htmdump: Add htm setup support to htmdump module
  powerpc/pseries/htmdump: Add htm flags support to htmdump module
  powerpc/pseries/htmdump: Add htm capabilities support to htmdump
    module
  powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface

 Documentation/arch/powerpc/htm.rst        | 104 ++++++
 arch/powerpc/include/asm/plpar_wrappers.h |  20 +-
 arch/powerpc/platforms/pseries/htmdump.c  | 370 +++++++++++++++++++++-
 3 files changed, 475 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/arch/powerpc/htm.rst

-- 
2.43.5


