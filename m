Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FA97288C5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:37:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcZHd5y9Hz3fbt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 05:37:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ap+OGTXl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ap+OGTXl;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcZD000KQz3g4Y
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 05:34:39 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 358JWcKV027478;
	Thu, 8 Jun 2023 19:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=6iDW1kX4q82sjHfPDMuszudpwL6b3DfvJyHTBZ4tFww=;
 b=Ap+OGTXl6ICJxxWpD6ASHMSUzpQAjC2mod8HTo2SePvvNM0VpCTb5uiiuaKWFdOz3XRs
 eLWC+VVJ2G1Rk6C/Vak4BJvKTwO86ejG95OTgMw7/bcCZa76euRjy9VkjSEU/il0LJ/M
 RGvEvRV5a8ptXuh1+DtMEB5vrNalfHaI45gdvu6dWhXAId0w7GcUOZGJCd2E+tnd9ZQo
 7cpjmx1oM7MPYdMt9WXYl1Lvkr3FM67U38WEp8/B98vJOeBlQti4/oqZLL4YmG6tpwLq
 F8qSb/+piDGa2oRmx62bNUtBvL4qQF3OGwEsXj+nMqVqZg1MmtIKm7X53bREQNEqShXh Ow== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r3n7tr2dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jun 2023 19:34:30 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 358HIijO008334;
	Thu, 8 Jun 2023 19:26:44 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3r2a78a6y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jun 2023 19:26:44 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 358JQhm240108322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Jun 2023 19:26:43 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 472B15805D;
	Thu,  8 Jun 2023 19:26:43 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 198A858055;
	Thu,  8 Jun 2023 19:26:43 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.61.30])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  8 Jun 2023 19:26:43 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v5 0/3] sed-opal: keyrings, discovery, revert, key store
Date: Thu,  8 Jun 2023 14:26:39 -0500
Message-Id: <20230608192642.516566-1-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DKNj3BRFOGbSdiTI6htYECpLX7teCiKB
X-Proofpoint-GUID: DKNj3BRFOGbSdiTI6htYECpLX7teCiKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_14,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=912 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306080170
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
Cc: axboe@kernel.dk, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Patchset rebased to for-6.5/block

This patchset has gone through numerous rounds of review and
all comments/suggetions have been addressed. I believe that
this patchset is ready for inclusion.

TCG SED Opal is a specification from The Trusted Computing Group
that allows self encrypting storage devices (SED) to be locked at
power on and require an authentication key to unlock the drive.

The current SED Opal implementation in the block driver
requires that authentication keys be provided in an ioctl
so that they can be presented to the underlying SED
capable drive. Currently, the key is typically entered by
a user with an application like sedutil or sedcli. While
this process works, it does not lend itself to automation
like unlock by a udev rule.

The SED block driver has been extended so it can alternatively
obtain a key from a sed-opal kernel keyring. The SED ioctls
will indicate the source of the key, either directly in the
ioctl data or from the keyring.

Two new SED ioctls have also been added. These are:
  1) IOC_OPAL_REVERT_LSP to revert LSP state
  2) IOC_OPAL_DISCOVERY to discover drive capabilities/state

change log v5:
        - rebase to for-6.5/block

change log v4:
        - rebase to 6.3-rc7
        - replaced "255" magic number with U8_MAX

change log:
        - rebase to 6.x
        - added latest reviews
        - removed platform functions for persistent key storage
        - replaced key update logic with key_create_or_update()
        - minor bracing and padding changes
        - add error returns
        - opal_key structure is application provided but kernel
          verified
        - added brief description of TCG SED Opal


Greg Joyce (3):
  block: sed-opal: Implement IOC_OPAL_DISCOVERY
  block: sed-opal: Implement IOC_OPAL_REVERT_LSP
  block: sed-opal: keyring support for SED keys

 block/Kconfig                 |   2 +
 block/opal_proto.h            |   4 +
 block/sed-opal.c              | 252 +++++++++++++++++++++++++++++++++-
 include/linux/sed-opal.h      |   5 +
 include/uapi/linux/sed-opal.h |  25 +++-
 5 files changed, 282 insertions(+), 6 deletions(-)


base-commit: 1341c7d2ccf42ed91aea80b8579d35bc1ea381e2
-- 
gjoyce@linux.vnet.ibm.com

