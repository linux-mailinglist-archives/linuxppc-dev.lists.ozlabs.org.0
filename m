Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C76647C494D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 07:40:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UafGGyCn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S51pD4PSfz3vh7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 16:40:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UafGGyCn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S51kP67rfz30Ng
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 16:37:33 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B5PgnV015637
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=mCStjHBcQJsfueSEQNevqub4xYEYrcBfLQ7Zg0CEzBE=;
 b=UafGGyCnLsRiM4sfzaCMKgvA1EEfvkl3YOeaLfeMvoC2GiZyl9kaf4ofBm01ZsHJy/tw
 cHvTWo6ra2ogo2ysVFTDvsm/0uh4B+xMv8UT9akHZV92p0jh30m/lkhEjJqW8yzUsrZ9
 ndFvlRqcBU8Z7J59/kXj44DxwJ5ax5Pb92ONb7Qkjc/6gt+A5Uyf+ui/9WOTgFzgPHiL
 uYrwO3C3s4Jwk8RkK8Yd1xHM/7Txc1HEwgQuX5Nzr8fEUWQQs2SuF22feF2uVvKTeOVT
 xn37WMHZEU0OZiGX2zvox72So+e7l3H7zLjWQKaiY+ctIdghr85i95vPGnkMQBSZ24St EA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnnhw8bnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:30 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39B5RGgY026364
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkjnndw4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39B5bRvo44499416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:27 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 703AD20040
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:27 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01E6A20043
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:27 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:26 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 775AD60419;
	Wed, 11 Oct 2023 16:37:24 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/12] Miscellaneous Sparse fixes
Date: Wed, 11 Oct 2023 16:36:59 +1100
Message-ID: <20231011053711.93427-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hXA6G874ke51HKLWSt3McIxMiSJMGjzd
X-Proofpoint-GUID: hXA6G874ke51HKLWSt3McIxMiSJMGjzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_02,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=890 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110048
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are many Sparse warnings in the kernel, including the powerpc
directory. This series provides fixes for some low-hanging fruit found
when trying to triage the warnings earlier this year. It addresses about
100 warnings (many have the same root cause).

I know there's concerns about making it harder to backport things. In
general, as someone who was not around during the development of these
features, I think that it is useful make the annotations as correct as
possible. But it's no fuss if some/all of the patches are nacked for this
reason. I just figured some of it might be useful instead of continuing to
sit on it indefinitely.

Benjamin Gray (12):
  powerpc/xive: Fix endian conversion size
  powerpc/pseries: Restructure hvc_get_chars() endianness
  powerpc: Explicitly reverse bytes when checking for byte reversal
  powerpc: Use NULL instead of 0 for null pointers
  powerpc: Remove extern from function implementations
  powerpc: Annotate endianness of various variables and functions
  powerpc/kvm: Force cast endianness of KVM shared regs
  powerpc/opal: Annotate out param endianness
  powerpc/uaccess: Cast away __user annotation after verification
  powerpc: Cast away __iomem in low level IO routines
  powerpc/eeh: Remove unnecessary cast
  powerpc/fadump: Annotate endianness cast with __force

 arch/powerpc/include/asm/book3s/64/pgtable.h    |  2 +-
 arch/powerpc/include/asm/imc-pmu.h              | 16 ++++++++--------
 arch/powerpc/include/asm/kvm_ppc.h              |  8 ++++----
 arch/powerpc/include/asm/opal.h                 |  2 +-
 arch/powerpc/include/asm/uaccess.h              |  2 +-
 arch/powerpc/kernel/eeh_driver.c                |  4 ++--
 arch/powerpc/kernel/io.c                        | 12 ++++++------
 arch/powerpc/kernel/iommu.c                     |  8 ++++----
 arch/powerpc/kernel/prom_init.c                 |  2 +-
 arch/powerpc/kernel/setup_64.c                  |  2 +-
 arch/powerpc/kernel/traps.c                     |  4 ++--
 arch/powerpc/kexec/core_64.c                    |  4 ++--
 arch/powerpc/kexec/file_load_64.c               |  6 +++---
 arch/powerpc/kvm/book3s_64_vio.c                |  8 ++++----
 arch/powerpc/kvm/book3s_xive_native.c           |  2 +-
 arch/powerpc/mm/drmem.c                         |  2 +-
 arch/powerpc/net/bpf_jit_comp.c                 |  8 ++++----
 arch/powerpc/perf/hv-24x7.c                     |  2 +-
 arch/powerpc/perf/imc-pmu.c                     | 11 ++++++-----
 arch/powerpc/platforms/4xx/soc.c                |  2 +-
 arch/powerpc/platforms/powermac/feature.c       |  3 ++-
 arch/powerpc/platforms/powernv/opal-fadump.h    |  2 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c |  3 ++-
 arch/powerpc/platforms/pseries/hvconsole.c      |  6 +++---
 arch/powerpc/platforms/pseries/lpar.c           |  8 ++++----
 arch/powerpc/sysdev/mpic.c                      |  2 +-
 arch/powerpc/sysdev/xive/native.c               |  2 +-
 27 files changed, 68 insertions(+), 65 deletions(-)

-- 
2.39.2
