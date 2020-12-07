Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7422D1C85
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 22:58:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqcd00cnMzDqVV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 08:58:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jkGBUI0J; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcTz3pqfzDqVK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:06 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LTKfC106485
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8SpgHLcVlEoptyi4OjxzgIgZ+/4j18QPzlXSHwxSfAM=;
 b=jkGBUI0JasBZ1D6AEkzYfvunlMUZ+/UC2zkyEVW0Q+dlZKPcTBl0oAV4psX+fpHssR1n
 YfNpTiIxShqdcBtDybPmy32YgN2lqhvrvzW58LXzYypdg8co5revPM1RpDb3If8d80fl
 mXexv+kvm+arNdgiCYRrw88J3ymDsYdxferFo6/e48H4YmNG4krOTO3ETgLEFoVIcdgO
 V6Lanh9oxPl8ObLRa1ystSpi3pgatcEyBrMOhkjTc5G4VDad2dA2AWOJ9TWx9ummVyOX
 9akzFoVGp3dpbBIJQSGSih5PdwR0pa9Tozu3ChDpt95HPuyXCReFVy62Wdzvrn16BDeS kg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359s0r6bx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:03 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LlkKe000963
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:02 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3581u92xyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:02 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7Lq1lN11796802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:01 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ABCE6E052;
 Mon,  7 Dec 2020 21:52:01 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1843C6E04C;
 Mon,  7 Dec 2020 21:52:00 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:00 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/28] partition suspend updates
Date: Mon,  7 Dec 2020 15:51:32 -0600
Message-Id: <20201207215200.1785968-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_16:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1015 mlxlogscore=347 lowpriorityscore=0
 suspectscore=1 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012070132
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series aims to improve the pseries-specific partition migration
and hibernation implementation, part of which has been living in
kernel/rtas.c. Most of that code is eliminated or moved to
platforms/pseries, and the following major functional changes are
made:

- Use stop_machine() instead of on_each_cpu() to avoid deadlock in the
  join/suspend sequence.

- Retry the join/suspend sequence on errors that are likely to be
  transient. This is a mitigation for the fact that drivers currently
  have no way to prepare for an impending partition suspension,
  sometimes resulting in a virtual adapter being in a state which
  causes the platform to fail the suspend call.

- Request cancellation of the migration via H_VASI_SIGNAL if Linux is
  going to error out of the suspend attempt. This allows the
  management console and other entities to promptly clean up their
  operations instead of relying on long timeouts to fail the
  migration.

- Little-endian users of ibm,suspend-me, ibm,update-nodes and
  ibm,update-properties via sys_rtas are blocked when
  CONFIG_PPC_RTAS_FILTERS is enabled.

- Legacy user space code (drmgr) historically has driven the migration
  process by using sys_rtas to separately call ibm,suspend-me,
  ibm,activate-firmware, and ibm,update-nodes/properties, in that
  order. With these changes, when sys_rtas() dispatches
  ibm,suspend-me, the kernel performs the device tree update and
  firmware activation before returning. This is more reliable, and
  drmgr does not seem bothered by it.

- If the H_VASI_STATE hcall is absent, the implementation proceeds
  with the suspend instead of erroring out. This allows us to exercise
  these code paths in QEMU.

Changes since v1:
- Drop "powerpc/rtas: move rtas_call_reentrant() out of pseries
  guards". rtas_call_reentrant() actually is pseries-specific and this
  broke builds without CONFIG_PPC_PSERIES set.
- Simplify polling logic in wait_for_vasi_session_suspending().
  ("powerpc/pseries/mobility: extract VASI session polling logic")
- Use direct return instead of goto in pseries_migrate_partition().
  ("powerpc/pseries/mobility: use stop_machine for join/suspend")
- Change dispatch of ibm,suspend-me in rtas syscall path to use
  conventional config symbol guards instead of a weak function.
  ("powerpc/rtas: dispatch partition migration requests to pseries")
- Fix refcount imbalance in add_dt_node() error path.
  ("powerpc/pseries/mobility: refactor node lookup during DT update")

Nathan Lynch (28):
  powerpc/rtas: prevent suspend-related sys_rtas use on LE
  powerpc/rtas: complete ibm,suspend-me status codes
  powerpc/rtas: rtas_ibm_suspend_me -> rtas_ibm_suspend_me_unsafe
  powerpc/rtas: add rtas_ibm_suspend_me()
  powerpc/rtas: add rtas_activate_firmware()
  powerpc/hvcall: add token and codes for H_VASI_SIGNAL
  powerpc/pseries/mobility: don't error on absence of ibm,update-nodes
  powerpc/pseries/mobility: add missing break to default case
  powerpc/pseries/mobility: error message improvements
  powerpc/pseries/mobility: use rtas_activate_firmware() on resume
  powerpc/pseries/mobility: extract VASI session polling logic
  powerpc/pseries/mobility: use stop_machine for join/suspend
  powerpc/pseries/mobility: signal suspend cancellation to platform
  powerpc/pseries/mobility: retry partition suspend after error
  powerpc/rtas: dispatch partition migration requests to pseries
  powerpc/rtas: remove rtas_ibm_suspend_me_unsafe()
  powerpc/pseries/hibernation: drop pseries_suspend_begin() from suspend
    ops
  powerpc/pseries/hibernation: pass stream id via function arguments
  powerpc/pseries/hibernation: remove pseries_suspend_cpu()
  powerpc/machdep: remove suspend_disable_cpu()
  powerpc/rtas: remove rtas_suspend_cpu()
  powerpc/pseries/hibernation: switch to rtas_ibm_suspend_me()
  powerpc/rtas: remove unused rtas_suspend_last_cpu()
  powerpc/pseries/hibernation: remove redundant cacheinfo update
  powerpc/pseries/hibernation: perform post-suspend fixups later
  powerpc/pseries/hibernation: remove prepare_late() callback
  powerpc/rtas: remove unused rtas_suspend_me_data
  powerpc/pseries/mobility: refactor node lookup during DT update

 arch/powerpc/include/asm/hvcall.h         |   9 +
 arch/powerpc/include/asm/machdep.h        |   1 -
 arch/powerpc/include/asm/rtas-types.h     |   8 -
 arch/powerpc/include/asm/rtas.h           |  17 +-
 arch/powerpc/kernel/rtas.c                | 243 ++++++---------
 arch/powerpc/platforms/pseries/mobility.c | 358 ++++++++++++++++++----
 arch/powerpc/platforms/pseries/suspend.c  |  79 +----
 7 files changed, 415 insertions(+), 300 deletions(-)

-- 
2.28.0

