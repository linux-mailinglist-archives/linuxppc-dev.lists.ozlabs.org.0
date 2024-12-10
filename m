Return-Path: <linuxppc-dev+bounces-3900-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F879EA7FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 06:42:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6nfr4Wbvz2ymb;
	Tue, 10 Dec 2024 16:41:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733809316;
	cv=none; b=b/E396FD0CfheuLkrjCBLlEvbTG/9b7d4htOnuQsoEDTdouxXvQvASiT5PwsUcbm8K/EfTeYYQRwb25xgrhZKs9NWlkKE1O+oNTFLCXkYJvicD2cYmSVxQvRMsd0cpBt/cFVpuXo7S2Tzt+XN7YR5ciam7wKaTTym6C/8lix+Yf59Bmvd/nicMwXpOTEpYJoLnH3qQYCTNqJOHBcJ/7ffGp7ivsMRLXy+euQGFmxyDjfZdl0FxxMZ4nUCVNMRghXxzgSuyPPWHoj0+oDay3r/OWwWYyhFrTMXmEJyBZad5ojlj8IVN0/2wdbXvIg+pMKzXQEk05dkUmW2pRiO0V/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733809316; c=relaxed/relaxed;
	bh=2P+jQaWUNjFuD4UCAcPCp5v1vlynyr+oJ6Z2P2dOL/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gq8qfo7x1uEljh6Xd8SW+uddJgzX5bN4YuBE2dnGDkK6jTmb7OoARDyruRD9Zhse6fRkXFoP04QgfevCZHiGuHa3v/SvkYg5fm/ouuQuCr77kJ7urrDwSxAHd44QaXDP4KRX0/6+MKn1g5occGjcE2mlYJujqfGmLWZsg3mH7JQGMRt8Wp1aLmHumnbBWNguTNhUQGJAd+A7+cJNRwhZDqtV1S2P++g20/1ggwRwKsj6L7ytkmsUG9/8DTszJc5X6GLBp4dVk1q9EXQAAWQhUEbcYWahwW3ppIw0iKPxqZm4RVpJRUdQMoLkVESer4KqPyIS0Y5xP2N3I9qSs9VAaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TD3oxNdW; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TD3oxNdW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6nfq1sxyz2yhn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 16:41:54 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9NcWlu032615;
	Tue, 10 Dec 2024 05:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=2P+jQaWUNjFuD4UCAcPCp5v1vlynyr+oJ6Z2P2dOL
	/E=; b=TD3oxNdWBoqRHX/MVLVygLR+K3+A+AjltyOXkSBROnrdptOlhOqXdKJsL
	q51xJrIjeWvzvuZ0KLgW2386GjMNBijiegqA5CAorbJTCdQkrMvTzkUyROWhrNbT
	esbq2XC60iXRJvF42D7p90HPfleQGlUgDVHn2K+Uotmnu9EUXIcxxc+KMF1XpT0k
	mO0pnvqhgEVaRSpnP5bAD1oY0oYhyTiVMDi5sxXq7MMFFjJ0HGRSVPkrwl1rh0jr
	5AE3fvV9k0mm2o0xLQPfmN+fBxel52wfJifFq7xVOLse1TzPlzWgtOiWTLrxFv40
	lCR8UTyw/sx4nPmM8BJJoFc7+PErA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce0xc7f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 05:41:50 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA59uJi017397;
	Tue, 10 Dec 2024 05:41:50 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43d3d1hu7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 05:41:50 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BA5fmfE18088346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2024 05:41:48 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CEDE20043;
	Tue, 10 Dec 2024 05:41:48 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B3F620040;
	Tue, 10 Dec 2024 05:41:48 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Dec 2024 05:41:48 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.5.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5CC7760687;
	Tue, 10 Dec 2024 16:41:41 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, ukrishn@linux.ibm.com,
        manoj@linux.ibm.com, clombard@linux.ibm.com, vaibhav@linux.ibm.com
Subject: [PATCH 0/2] Deprecate cxl and cxlflash drivers
Date: Tue, 10 Dec 2024 16:40:53 +1100
Message-ID: <20241210054055.144813-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
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
X-Proofpoint-GUID: rKu_YlGomn6n8q2dRNRVIjGEXP3dN9uA
X-Proofpoint-ORIG-GUID: rKu_YlGomn6n8q2dRNRVIjGEXP3dN9uA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 mlxlogscore=440
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100039
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This series marks the cxl and cxlflash drivers as obsolete/deprecated,
disables them by default, and prints a warning to users on probe.

CAPI devices have been out of production for some time, and we're not
aware of any remaining users who are likely to want a modern kernel.
There's almost certainly some remaining driver bugs and we don't have much
hardware available to properly test the drivers any more.

This was previously discussed at [0] - I've decided not to try to do
anything funny with the Kconfig settings as explored in that thread, as it
seems unlikely to have any significant benefit.

This series will be followed up with patches to remove the drivers and
associated arch code, which I hope will be merged in the following cycle.

[0] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20240409031027.41587-2-ajd@linux.ibm.com/

Andrew Donnellan (2):
  cxl: Deprecate driver
  scsi/cxlflash: Deprecate driver

 Documentation/ABI/{testing => obsolete}/sysfs-class-cxl | 3 +++
 MAINTAINERS                                             | 4 ++--
 drivers/misc/cxl/Kconfig                                | 6 ++++--
 drivers/misc/cxl/of.c                                   | 2 ++
 drivers/misc/cxl/pci.c                                  | 2 ++
 drivers/scsi/cxlflash/Kconfig                           | 6 ++++--
 drivers/scsi/cxlflash/main.c                            | 2 ++
 7 files changed, 19 insertions(+), 6 deletions(-)
 rename Documentation/ABI/{testing => obsolete}/sysfs-class-cxl (99%)

-- 
2.47.1


