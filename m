Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A26215A7D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 12:25:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HckR30shzDqPy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 22:25:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Hcd90tTzzDqMN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 22:20:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48Hcd82hHxz9BMq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 22:20:28 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48Hcd80l1Dz9sRY; Wed, 12 Feb 2020 22:20:28 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48Hcd7381Qz9sPJ
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Feb 2020 22:20:26 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CBEWJH087878
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Feb 2020 06:20:24 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y1ubsq961-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Feb 2020 06:20:23 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Wed, 12 Feb 2020 11:20:21 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 12 Feb 2020 11:20:19 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01CBKImc30343254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Feb 2020 11:20:18 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DCD1A4054;
 Wed, 12 Feb 2020 11:20:17 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA6B2A406A;
 Wed, 12 Feb 2020 11:20:14 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.199.42.59])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Feb 2020 11:20:14 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, 
 svaidy@linux.ibm.com, ego@linux.vnet.ibm.com, linuxram@us.ibm.com,
 pratik.sampat@in.ibm.com, psampat@linux.ibm.com, pratik.r.sampat@gmail.com
Subject: [PATCH v4 0/3] Introduce Self-Save API for deep stop states
Date: Wed, 12 Feb 2020 16:50:10 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20021211-0012-0000-0000-0000038621A0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021211-0013-0000-0000-000021C2A08F
Message-Id: <cover.1581505210.git.psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_04:2020-02-11,
 2020-02-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 clxscore=1011
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002120090
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Skiboot patches v4: https://lists.ozlabs.org/pipermail/skiboot/2020-February/016404.html
v3 patches: https://lkml.org/lkml/2020/1/13/333
Changelog
v3 --> v4
Device tree interface change: Cease to use the active property for
self-save and self-restore and use only presence/absence of the node to 
signify the status.

Currently the stop-API supports a mechanism called as self-restore
which allows us to restore the values of certain SPRs on wakeup from a
deep-stop state to a desired value. To use this, the Kernel makes an
OPAL call passing the PIR of the CPU, the SPR number and the value to
which the SPR should be restored when that CPU wakes up from a deep
stop state.

Recently, a new feature, named self-save has been enabled in the
stop-api, which is an alternative mechanism to do the same, except
that self-save will save the current content of the SPR before
entering a deep stop state and also restore the content back on
waking up from a deep stop state.

This patch series aims at introducing and leveraging the self-save feature in
the kernel.

Now, as the kernel has a choice to prefer one mode over the other and
there can be registers in both the save/restore SPR list which are sent
from the device tree, a new interface has been defined for the seamless
handing of the modes for each SPR.

A list of preferred SPRs are maintained in the kernel which contains two
properties:
1. supported_mode: Helps in identifying if it strictly supports self
                   save or restore or both.
                   Initialized using the information from device tree.
2. preferred_mode: Calls out what mode is preferred for each SPR. It
                   could be strictly self save or restore, or it can also
                   determine the preference of  mode over the other if both
                   are present by encapsulating the other in bitmask from
                   LSB to MSB.
                   Initialized statically.

Below is a table to show the Scenario::Consequence when the self save and
self restore modes are available or disabled in different combinations as
perceived from the device tree thus giving complete backwards compatibly
regardless of an older firmware running a newer kernel or vise-versa.
Support for self save or self-restore is embedded in the device tree,
along with the set of registers it supports.

SR = Self restore; SS = Self save

.-----------------------------------.----------------------------------------.
|             Scenario              |                Consequence             |
:-----------------------------------+----------------------------------------:
| Legacy Firmware. No SS or SR node | Self restore is called for all         |
|                                   | supported SPRs                         |
:-----------------------------------+----------------------------------------:
| SR: !active SS: !active           | Deep stop states disabled              |
:-----------------------------------+----------------------------------------:
| SR: active SS: !active            | Self restore is called for all         |
|                                   | supported SPRs                         |
:-----------------------------------+----------------------------------------:
| SR: active SS: active             | Goes through the preferences for each  |
|                                   | SPR and executes of the modes          |
|                                   | accordingly. Currently, Self restore is|
|                                   | called for all the SPRs except PSSCR   |
|                                   | which is self saved                    |
:-----------------------------------+----------------------------------------:
| SR: active(only HID0) SS: active  | Self save called for all supported     |
|                                   | registers expect HID0 (as HID0 cannot  |
|                                   | be self saved currently)               |
:-----------------------------------+----------------------------------------:
| SR: !active SS: active            | currently will disable deep states as  |
|                                   | HID0 is needed to be self restored and |
|                                   | cannot be self saved                   |
'-----------------------------------'----------------------------------------'

Pratik Rajesh Sampat (3):
  powerpc/powernv: Interface to define support and preference for a SPR
  powerpc/powernv: Introduce Self save support
  powerpc/powernv: Parse device tree, population of SPR support

 arch/powerpc/include/asm/opal-api.h        |   3 +-
 arch/powerpc/include/asm/opal.h            |   1 +
 arch/powerpc/platforms/powernv/idle.c      | 420 ++++++++++++++++++---
 arch/powerpc/platforms/powernv/opal-call.c |   1 +
 4 files changed, 367 insertions(+), 58 deletions(-)

-- 
2.17.1

