Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B12047A3437
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Sep 2023 10:03:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WrBV74jT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RpL5r3xlSz3cbs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Sep 2023 18:03:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WrBV74jT;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpL4z10ltz3bNm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Sep 2023 18:02:43 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RpL4z0LVdz4x5m
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Sep 2023 18:02:43 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RpL4z0FCFz4x5j; Sun, 17 Sep 2023 18:02:43 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WrBV74jT;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RpL4y28glz4x3q;
	Sun, 17 Sep 2023 18:02:41 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38H7cX2v027150;
	Sun, 17 Sep 2023 08:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=7a4JZRuqV6JxpkkqjcFVtP+SvMuDzkyhJSkh0SMaoys=;
 b=WrBV74jTVqNi5vyH8mMlGOtiRB7N81y+mrmVuvu0RCPe3aGarAW2hfG4k23V/brpGa06
 6GquCMw3jYj628280tPTLKdwLH6u7GpRwrUhiwgDNP/D56nigd8vWs8pk9N25F6lDJsL
 0zjLZOW1Qikw8BYAIbcaKM46r7LhEwP/uX26wW6pzOmQ9QUZbtAaOqfwPrJnr8W3BwPg
 pif57FvsFz0BTooZzzsaV33pnBE9SchxxrDbKXXrOP8kXE28DSqs5sGdoj1mpdCT3X3o
 QaNqOp9GjEC55Yc/tobcojyo+b7MZFTNu9R59n8krCXq3V0zO11BJ1ksgfVpIgQfblz+ uA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t54c5pj56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Sep 2023 08:02:38 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38H6DbDo018513;
	Sun, 17 Sep 2023 08:02:38 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t5pps28u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Sep 2023 08:02:37 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38H82Y3718612748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 17 Sep 2023 08:02:34 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A26F20043;
	Sun, 17 Sep 2023 08:02:31 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DC5420040;
	Sun, 17 Sep 2023 08:02:29 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.102.48])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 17 Sep 2023 08:02:28 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 0/3] powerpc: make fadump resilient with memory add/remove events
Date: Sun, 17 Sep 2023 13:32:22 +0530
Message-ID: <20230917080225.561627-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sRaycpADH_Zoaf2O3oU8giJsUdj-iT6t
X-Proofpoint-ORIG-GUID: sRaycpADH_Zoaf2O3oU8giJsUdj-iT6t
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_20,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309170070
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
Cc: mahesh@linux.vnet.ibm.com, adityag@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

problem:
========
due to changes in memory resources caused by either memory hotplug or
online/offline events, the elfcorehdr, which describes the cpus and
memory of the crashed kernel to the kernel that collects the dump (knows
as second/fadump kernel), becomes outdated. consequently, attempting
dump collection with an outdated elfcorehdr can lead to failed or
inaccurate dump collection.

memory hotplug or online/offline events is referred as memory add/remove
events in reset of the patch series.

existing solution:
==================
monitor memory add/remove events in userspace using udev rules, and
re-register fadump whenever there are changes in memory resources. this
leads to the creation of a new elfcorehdr with updated system memory
information.

challenges with existing solution:
==================================
1. performing bulk memory add/remove with udev-based fadump
   re-registration can lead to race conditions and, more importantly,
   it creates a wide window during which fadump is inactive until all
   memory add/remove events are settled.
2. re-registering fadump for every memory add/remove event is
   inefficient.
3. memory for elfcorehdr is allocated based on the memblock regions
   available during early boot and remains fixed thereafter. however, if
   the elfcorehdr is later recreated with additional memblock regions,
   its size will increase, potentially leading to memory corruption.

proposed solution:
==================
address the aforementioned challenges by shifting the creation of
elfcorehdr from the first kernel (also referred as the crashed kernel),
where it was created and frequently recreated for every memory
add/remove event, to the fadump kernel. as a result, the elfcorehdr only
needs to be created once, thus eliminating the necessity to re-register
fadump during memory add/remove events.

to know more about elfcorehdr creation in the fadump kernel, refer to
the first commit in this patch series.

the second patch includes a new sysfs interface that tells userspace
that fadump re-registration isn't needed for memory add/remove events. 
note that userspace changes do not need to be in sync with kernel
changes; they can roll out independently.

since there are significant changes in the fadump implementation, the
third patch updates the fadump documentation to reflect the changes made
in this patch series.

kernel tree rebased on 6.6-rc1 with patch series applied:
=========================================================
https://github.com/sourabhjains/linux/tree/fadump-mem-hotplug

userspace changes:
==================
to realize this feature, one must update the kdump udev rules to prevent
fadump re-registration during memory add/remove events.

on rhel apply the following changes to file
/usr/lib/udev/rules.d/98-kexec.rules

-run+="/bin/sh -c '/usr/bin/systemctl is-active kdump.service || exit 0; /usr/bin/systemd-run --quiet --no-block /usr/lib/udev/kdump-udev-throttler'"
+# don't re-register fadump if the value of the node
+# /sys/kernel/fadump/hotplug_ready is 1.
+
+run+="/bin/sh -c '/usr/bin/systemctl is-active kdump.service || exit 0; ! test -f /sys/kernel/fadump_enabled || cat /sys/kernel/fadump_enabled | grep 0  || ! test -f /sys/kernel/fadump/hotplug_ready || cat /sys/kernel/fadump/hotplug_ready | grep 0 || exit 0; /usr/bin/systemd-run --quiet --no-block /usr/lib/udev/kdump-udev-throttler'"

Sourabh Jain (3):
  powerpc: make fadump resilient with memory add/remove events
  powerpc/fadump: add hotplug_ready sysfs interface
  Documentation/powerpc: update fadump implementation details

 Documentation/ABI/testing/sysfs-kernel-fadump |  12 +
 .../powerpc/firmware-assisted-dump.rst        |  91 ++---
 arch/powerpc/include/asm/fadump-internal.h    |  24 +-
 arch/powerpc/kernel/fadump.c                  | 370 +++++++++++-------
 arch/powerpc/platforms/powernv/opal-fadump.c  |  18 +-
 arch/powerpc/platforms/pseries/rtas-fadump.c  |  23 +-
 6 files changed, 306 insertions(+), 232 deletions(-)

-- 
2.41.0

