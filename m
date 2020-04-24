Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BB01B6D02
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 07:04:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497htX0C2KzDqch
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 15:04:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497hlP3bMrzDr8H
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 14:58:40 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03O4Xbmi176500
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 00:58:37 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jvfv7e4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 00:58:37 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03O4Xn8W177194
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 00:58:37 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jvfv7e4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 00:58:37 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03O4v3Y3012845;
 Fri, 24 Apr 2020 04:58:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 30fs658pc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 04:58:35 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03O4wX7K57606220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 04:58:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 666DB11C04C;
 Fri, 24 Apr 2020 04:58:33 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1388111C04A;
 Fri, 24 Apr 2020 04:58:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Apr 2020 04:58:33 +0000 (GMT)
Received: from osmium.ibmuc.com (unknown [9.206.180.103])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 410E4A0198;
 Fri, 24 Apr 2020 14:58:27 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/3] powerpc/eeh: Release EEH device state synchronously
Date: Fri, 24 Apr 2020 14:58:28 +1000
Message-Id: <cover.1587704308.git.sbobroff@linux.ibm.com>
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_19:2020-04-23,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004240027
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi everyone,

Here are some fixes and cleanups that have come from other work but that I
think stand on their own.

Only one patch ("Release EEH device state synchronously", suggested by Oliver
O'Halloran) is a significant change: it moves the cleanup of some EEH device
data out of the (possibly asynchronous) device release handler and into the
(synchronously called) bus notifier. This is useful for future work as it makes
it easier to reason about the lifetimes of EEH structures.

Note that I've left a few WARN_ON_ONCEs in the code because I'm paranoid, but I
have not been able to hit them during testing.

Cheers,
Sam.

Notes for v3:
I've tweaked the fix for pseries_eeh_configure_bridge() to return the correct
error code (even though it's not used) by calling an already present RTAS
function, rtas_error_rc(). However, I had to make another change to export that
function and while it does seem like the right thing to do, but I'm concerned
it's a bit out of scope for such a small fix.

Notes for v2:

I've dropped both cleanup patches (3/4, 4/4) because that type of cleanup
(replacing a call to eeh_rmv_from_parent_pe() with one to eeh_remove_device())
is incorrect: if called during recovery, it will cause edev->pe to remain set
when it would have been cleared previously. This would lead to stale
information in the edev. I think there should be a way to simplify the code
around EEH_PE_KEEP but I'll look at that separately.

Patch set changelog follows:

Patch set v3: 
Patch 1/3 (new in this version): powerpc/rtas: Export rtas_error_rc
Patch 2/3 (was 1/2): powerpc/eeh: fix pseries_eeh_configure_bridge()
Patch 3/3 (was 2/2): powerpc/eeh: Release EEH device state synchronously

Patch set v2: 
Patch 1/2: powerpc/eeh: fix pseries_eeh_configure_bridge()
Patch 2/2: powerpc/eeh: Release EEH device state synchronously
- Added comment explaining why the add case can't be handled similarly to the remove case.
Dropped (was 3/4) powerpc/eeh: Remove workaround from eeh_add_device_late()
Dropped (was 4/4) powerpc/eeh: Clean up edev cleanup for VFs

Patch set v1:
Patch 1/4: powerpc/eeh: fix pseries_eeh_configure_bridge()
Patch 2/4: powerpc/eeh: Release EEH device state synchronously
Patch 3/4: powerpc/eeh: Remove workaround from eeh_add_device_late()
Patch 4/4: powerpc/eeh: Clean up edev cleanup for VFs

Sam Bobroff (3):
  powerpc/rtas: Export rtas_error_rc
  powerpc/eeh: fix pseries_eeh_configure_bridge()
  powerpc/eeh: Release EEH device state synchronously

 arch/powerpc/include/asm/rtas.h              |  1 +
 arch/powerpc/kernel/eeh.c                    | 31 ++++++++++++++++++++
 arch/powerpc/kernel/pci-hotplug.c            |  2 --
 arch/powerpc/kernel/rtas.c                   |  3 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c |  4 ++-
 5 files changed, 37 insertions(+), 4 deletions(-)

-- 
2.22.0.216.g00a2a96fc9

