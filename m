Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C2DD2966
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 14:20:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pqtV5WZnzDr5j
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 23:20:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pqPG3FgpzDr4N
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 22:58:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46pqPF3RYkz8tL0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 22:58:57 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46pqPF2Y89z9sPd; Thu, 10 Oct 2019 22:58:57 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=psampat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46pqPD5syJz9sPc
 for <linuxppc-dev@ozlabs.org>; Thu, 10 Oct 2019 22:58:56 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9A9cqqd049599
 for <linuxppc-dev@ozlabs.org>; Thu, 10 Oct 2019 07:58:53 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vj26km305-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 10 Oct 2019 07:58:53 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Thu, 10 Oct 2019 12:58:51 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 10 Oct 2019 12:58:48 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9ABwlak60293172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Oct 2019 11:58:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA9BE42042;
 Thu, 10 Oct 2019 11:58:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0143742049;
 Thu, 10 Oct 2019 11:58:45 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.199.37.96])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Oct 2019 11:58:44 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, mpe@ellerman.id.au,
 svaidy@linux.ibm.com, ego@linux.vnet.ibm.com, premjha2@in.ibm.com,
 akshay.adiga@linux.vnet.ibm.com
Subject: [PATCH v1 0/3] Integrate support for Self save,
 determine support and preference for self save or restore
Date: Thu, 10 Oct 2019 17:28:40 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101011-0020-0000-0000-00000377D896
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101011-0021-0000-0000-000021CDE4A8
Message-Id: <20191010115843.22283-1-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-10_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=657 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910100084
X-Mailman-Approved-At: Thu, 10 Oct 2019 23:17:34 +1100
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

Currently the stop-api supports a mechanism called as self-restore
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
2. preferred_mode: Calls out what mode is preferred for each SPR. It
                   could be strictly self save or restore, or it can also
                   determine the preference of  mode over the other if both
                   are present by encapsulating the other in bitmask from
                   LSB to MSB.
Below is a table to show the Scenario::Consequence when the self save and
self restore modes are available or disabled in different combinations as
perceived from the device tree.

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
 arch/powerpc/platforms/powernv/idle.c      | 404 ++++++++++++++++++---
 arch/powerpc/platforms/powernv/opal-call.c |   1 +
 4 files changed, 357 insertions(+), 52 deletions(-)

-- 
2.21.0

