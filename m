Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B129FA9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:29:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMl993TwjzDqsv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:29:49 +1100 (AEDT)
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
 header.s=pp1 header.b=p/CRdOEc; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkvn4lf3zDqkC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:11 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U125iU190572
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=4I45XO243BfU8XwU3wDreVisPHCi5Mlow9OuTM6/iKo=;
 b=p/CRdOEcVhb2A4Oyaig3ney0qJi/zNcmzaPPabauNhnFOs0CRPY9ZmSOfRt0NOKvWgQS
 EQ0WsUW1AN5sUnO+okHkXr0SsAsiHlFWbB4n6dFKeN1bqJzH0zmFyGw/sMg2eKt3Ig4O
 1+VdaXLNqSUOxsHHPRgXJdu4M4u3UaqAnH3eyJSVPIdpqbDKAHfxQfCVHu6ZI4N2FyIr
 bkhcPxyXljPeQpgVFu3y4jSU5fv/inR8r8miGTC6/C9ApiCpalSVOxqIWYmYjQHnIiVQ
 YSIMi5rmqxC+hPqANqOL0mn1wcwyoAx+OqOLy9q0MTLNqCuGJe5QpLOMCy2CQ/r89w6e iw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34d97kajtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:08 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1HN0h027664
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:07 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 34cbw9s9up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:07 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1I6DJ47710510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:06 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34190C6059;
 Fri, 30 Oct 2020 01:18:06 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E874FC6055;
 Fri, 30 Oct 2020 01:18:05 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:05 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/29] partition suspend updates
Date: Thu, 29 Oct 2020 20:17:36 -0500
Message-Id: <20201030011805.1224603-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=5
 spamscore=5 mlxscore=5
 suspectscore=1 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=131
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010300001
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

Nathan Lynch (29):
  powerpc/rtas: move rtas_call_reentrant() out of pseries guards
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
 arch/powerpc/include/asm/rtas.h           |  13 +-
 arch/powerpc/kernel/rtas.c                | 245 ++++++---------
 arch/powerpc/platforms/pseries/mobility.c | 361 ++++++++++++++++++----
 arch/powerpc/platforms/pseries/suspend.c  |  79 +----
 7 files changed, 420 insertions(+), 296 deletions(-)

-- 
2.25.4

