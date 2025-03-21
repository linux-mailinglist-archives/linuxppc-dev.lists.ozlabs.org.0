Return-Path: <linuxppc-dev+bounces-7248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66DA6B4D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 08:22:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJv5y1SXgz30DL;
	Fri, 21 Mar 2025 18:22:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742541734;
	cv=none; b=mhvOM2CY8n2XEcJAzeoHL5B+jrZFTGfQ5RNnIHLCwyRvyMhRAaaCv+/ksZYLtoJCoQNkMYsq2R24JsW9HijZw/q55BYs5G+3GzfY/hA2QJWCdmbLVVzKDe1WoOttE0FHPT3drUw6l3Pl0mqB1oP3J0KwGa84Cfy5kFXa1VIQ894bMnaNSsuwMIKaNFjmhuMO5tZ0RNbst8pPdaSn9GJm7vMltfLcX+9bhdd9e3uM6QzF12XNRZLknqBrzSKxUOK5Tyfp6vzWVKlmK186nhVyeIS0OHWaSUOt+Phq6q0Re10YhkZlbyx6X86Pj6GMvn6m5JsCZzI1liyZx7flIwFDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742541734; c=relaxed/relaxed;
	bh=VR6IWz8Kr890fwW4DLQPb+GtL1qiPNqssAmCjb+IvYM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=SL+4TZJdna5z1fdkoVD7JUbSseTRrM0l7F4PuW5Ec2x9xIsHuie46Zhc2rMc2avT6bBwmviaY/Iam/CzBbAZUaNJdiWSEjECwlzc0ZuR3E+fv0WfdpsIOw4hdLAzBJSXlgzaWR+KgcpIKwOWTP0tc4otzEEVYpCZNmjkXUSgDJITA9IbD4IsZrM6r6LwaZDSs5Tz6WaaF/NBpPhdUGRXf8RazFXYASoE6qb9lBMcEWC4jDRC79+tsCMucSuzNcad603QQh+11SXKSG44GbAjjWsyMPxaKDIsAZxnjl/1wSZKNwAlpYsVDA0f3Ci7AqNbuOY1wPALJsCBs6k3hdflmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HvZDzP1j; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HvZDzP1j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJv5w2TyGz2yrS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 18:22:11 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L5aeGQ024829
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=VR6IWz8Kr890fwW4DLQPb+GtL1qi
	PNqssAmCjb+IvYM=; b=HvZDzP1jOXq5zcyfNwrspR5HwMT44EZ0hBSGuy96yn1g
	xX527DgOlgUNJRcbI0Fzt24Q/C4A8E+hSZtDNbmqno6vU1iz/4jFOQB2Y4z3sJV6
	W5Uh4bpUJzyhxXSHA4sbPmcwYiJh2waMpMUWKT9o2hBClUoJvrigvelezelSTKPk
	ahqIqToMu1CQVxSHkNx53687K4fsWib7HRjx9AkCh/yXtaA030BC5nBveZw+w6e+
	pQ2Ie63otClFl9Mz9WIaFE0FPY9BLuYQ7FqCd31QFhyKILJvLy1S7nQar88u7x9s
	uTRFaWSIUELqxqQmM1e9/haUhhcYdFsvoJd6nYtKiQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45gq6w36yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:08 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52L41jSY020324
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:07 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45dncmm5y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:22:07 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52L7M2vg58917362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 07:22:02 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FE4F20043;
	Fri, 21 Mar 2025 07:22:02 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1F1520040;
	Fri, 21 Mar 2025 07:21:56 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.255.71])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Mar 2025 07:21:56 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V2 0/9] Add support for configure and control of Hardware Trace Macro(HTM)
Date: Fri, 21 Mar 2025 12:51:43 +0530
Message-Id: <20250321072152.7414-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: SQzr4Ad5p1_4vGsaX3VQs50z2jV_kGEr
X-Proofpoint-ORIG-GUID: SQzr4Ad5p1_4vGsaX3VQs50z2jV_kGEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_02,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=670
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503210049
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	LONGWORDS,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

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

Changelog:
V2: Venkat reported that patch 7 failed to apply on powerpc-next.
Fixed that in V2.

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


