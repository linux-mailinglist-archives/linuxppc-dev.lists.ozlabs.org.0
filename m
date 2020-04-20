Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F91B0124
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 07:49:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495G3w5yM2zDqmh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 15:49:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495G2742vkzDql8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 15:47:58 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03K5Vf9j140278
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 01:47:55 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmvfa3xg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 01:47:55 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Mon, 20 Apr 2020 06:47:04 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Apr 2020 06:47:01 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03K5ln2x53411874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 05:47:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A83C6A4053;
 Mon, 20 Apr 2020 05:47:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55C63A4040;
 Mon, 20 Apr 2020 05:47:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 05:47:49 +0000 (GMT)
Received: from osmium.ibmuc.com (unknown [9.163.65.234])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9BA20A019C;
 Mon, 20 Apr 2020 15:47:41 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] powerpc/eeh: Release EEH device state synchronously
Date: Mon, 20 Apr 2020 15:47:38 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042005-0020-0000-0000-000003CB028F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042005-0021-0000-0000-00002223F404
Message-Id: <cover.1587361657.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_01:2020-04-17,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=1 phishscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004200044
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
Cc: Oliver O'Halloran <oohall@gmail.com>
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

Notes for v2:

I've dropped both cleanup patches (3/4, 4/4) because that type of cleanup
(replacing a call to eeh_rmv_from_parent_pe() with one to eeh_remove_device())
is incorrect: if called during recovery, it will cause edev->pe to remain set
when it would have been cleared previously. This would lead to stale
information in the edev. I think there should be a way to simplify the code
around EEH_PE_KEEP but I'll look at that separately.

Patch set changelog follows:

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

Sam Bobroff (2):
  powerpc/eeh: fix pseries_eeh_configure_bridge()
  powerpc/eeh: Release EEH device state synchronously

 arch/powerpc/kernel/eeh.c                    | 31 ++++++++++++++++++++
 arch/powerpc/kernel/pci-hotplug.c            |  2 --
 arch/powerpc/platforms/pseries/eeh_pseries.c |  2 +-
 3 files changed, 32 insertions(+), 3 deletions(-)

-- 
2.22.0.216.g00a2a96fc9

