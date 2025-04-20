Return-Path: <linuxppc-dev+bounces-7811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 264FBA948B4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 20:09:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zgc2X0HQgz2ySY;
	Mon, 21 Apr 2025 04:09:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745172547;
	cv=none; b=eVeTDkcl/7ijrKW3BaKD3/7L3voiW7ZUHAG9TnpMBiNjgNNyvTNHJTkhKxISMgLcOe9TOXYF4r85ItNS41hPFno/UpUOR3+SYtv1YasDUkQ8eNDRq7t3S29isqEU2sK+02FslOpPzMxfeibR6B5daqsvfi3W3I9juTFpQS0QVv79wkgWMw3Nw2q4n/nhGRDeKBN5O+y2kMafjqK2O9bWeDV+g5CYHg8p62q/Hg9nyNhOM0dX4VsCtfk/ljPA9WIvRo3CkaSKDtWz7C5+EP4xQa9Jo+zj2X0CzeGcWFzIZC7j1bj+BfEmcBlmUcl0VbENXpZjn4vz7GM50A4mVKV08g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745172547; c=relaxed/relaxed;
	bh=Y45B9C5ZZBy9qegBl2APq2qJwEjZnVIYL+XpzUW19xw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UpYo0c9FjoEx3MNJ86wdnTVZ9I9answvHiTVwIHQimSuTBa9UFG41+OR2+FrXkhM5vXoRQUHMVKTKALNARJZRUa9ktmVDCZ0B/b6W/nQg7pvXKFhkQk6PBJowqMlUxy6+M3AVMKGD1i7MvHxtzxJTVUFa/NXvuVkQ6blt7K8OWkNCC2Skf50jY+nO3BizHEw3ilN4gU6JRoICyTrW9YweehrmtEkzGZ+CGfVx6/F1NrbvgNd1u2ycNQPK9VjFv9g5vCRZvFVZRR+HmzxuYECYCNgkekHh3QLeNZYl9p/u3SYsLSe0W9BKYm2JpitBX6tSIbmEE1sJQtUtqjpcOK9kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KzzvYcmZ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KzzvYcmZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgc2W0RTyz2yST
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 04:09:06 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53K3TFCk017387
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Y45B9C5ZZBy9qegBl2APq2qJwEjZnVIYL+XpzUW19
	xw=; b=KzzvYcmZPa3sO/QOKWUejXmRLkbDrZQ2t1h3UM1VI8J2zXIMxjzcrOTI1
	nCHeXQIp4SCdQDewhlgXGUUUeYiDT6XWB3Wng7A0tQaOuSCVz45cJQDdokkCzkTK
	OhS0SAaKABc3KURaJ88uD0ha/DzElYvcwvyoqnLkA+7Q+g+1ydRPkKRtiE8ov9Z6
	Gjuuvtiu835UyLAr4sNMEi4NsUVX4y23SrJ40vp9r9Nf4DwGzH645rohEZQQpg+W
	9EmyFU4Sj+9ByTSr8lEBCgdlZvm+9SkWmK16SOuK2d8CkcoL+6zQ6j1UmPsVy1Gk
	iD5+yOBLlrBYeI0gbvsfWnefuUd0w==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464kx8asd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:03 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53KFqnxr012496
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:03 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 464p5su2n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:09:02 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53KI8wWP21102898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 18:08:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24B5420040;
	Sun, 20 Apr 2025 18:08:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 968C120043;
	Sun, 20 Apr 2025 18:08:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.246.217])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 20 Apr 2025 18:08:52 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V3 0/9] Add support for configure and control of Hardware Trace Macro(HTM)
Date: Sun, 20 Apr 2025 23:38:35 +0530
Message-Id: <20250420180844.53128-1-atrajeev@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OmJr8R17K3lzgBN0SXvUeV6Jw-z_bQRZ
X-Proofpoint-ORIG-GUID: OmJr8R17K3lzgBN0SXvUeV6Jw-z_bQRZ
X-Authority-Analysis: v=2.4 cv=OdyYDgTY c=1 sm=1 tr=0 ts=6805383f cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=vLgeZNsbtDgG83_IlX8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxlogscore=719
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200144
X-Spam-Status: No, score=1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	LONGWORDS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: *
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
V2 -> V3:
- Added Tested-by from Venkat.
- Addressed review comments from Maddy:
  1. Disable the interface in kvm guest
  2. Instead of using 1 and 0 to enable/disable HTM during some of the
     operations, use macro (ex: HTM_ENABLE, HTM_DISABLE for 1, 0
respectively
  3. In code where htm return code gives negative, add a failure
     message

V1 -> V2:
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
 arch/powerpc/platforms/pseries/htmdump.c  | 394 +++++++++++++++++++++-
 3 files changed, 499 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/arch/powerpc/htm.rst

-- 
2.43.0


