Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA327B8DFE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 22:23:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R5o8UGUA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S15kJ50dzz3vcs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 07:23:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R5o8UGUA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S15fH6mq0z3c54
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 07:20:23 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 394K6i6L032592;
	Wed, 4 Oct 2023 20:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=60uuHAhjbFNbrxsW4mTGZK1/QN2qvb773gv1YRF42vM=;
 b=R5o8UGUAU/lfCoEiI9SCAAroTjs2TykkUyRzj3OwRAGCWVA1uYJcQekIosNGTn94Wlz9
 RDQWRA+9JHJtxjRQPALo6U97OKDhFJWwa15hY6gPUuXRZDO3IQkm0NXacSifFH2SWRMW
 lwCQfKvEZzQIGRpRT9KQipz9HyKB1X0r4GIC15J1qJqvE3woUMlZ19fHSMGos6FVOAhn
 dWvCT7WmQ2bytO5PCk2x9E7aNlgCpKJN5sEkCz97qJ5yhak5QHB5M1QnUutE6ICsELkk
 9IVbwo1xoQrtG8qfn8Vt3Zv5Rm9VmsXVDqazUs4Coe0E95xsrUKJjmSoJimIZTzKsQNs 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3thdm6j46h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 20:20:01 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 394K7dRg007199;
	Wed, 4 Oct 2023 20:20:00 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3thdm6j460-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 20:20:00 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 394K8wHS006672;
	Wed, 4 Oct 2023 20:19:59 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tf07kb642-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 20:19:59 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 394KJw482622066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Oct 2023 20:19:59 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C43205805B;
	Wed,  4 Oct 2023 20:19:58 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E08B58055;
	Wed,  4 Oct 2023 20:19:58 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.54.52])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Oct 2023 20:19:58 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org, axboe@kernel.dk
Subject: [PATCH v8 0/3] generic and PowerPC SED Opal keystore
Date: Wed,  4 Oct 2023 15:19:54 -0500
Message-Id: <20231004201957.1451669-1-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QNt4rnHyHauUo92tZB1p6o7Cl947Cxla
X-Proofpoint-ORIG-GUID: 27DqnB4yWvIFe9Uk43lrHA5qVak4umQQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_10,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxlogscore=732
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310040148
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
Cc: gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, ndesaulniers@google.com, nathan@kernel.org, okozina@redhat.com, jarkko@kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

This patchset has gone through numerous rounds of review and
all comments/suggetions have been addressed. The reviews have
covered all relevant areas including reviews by block and keyring
developers as well as the SED Opal maintainer.

TCG SED Opal is a specification from The Trusted Computing Group
that allows self encrypting storage devices (SED) to be locked at
power on and require an authentication key to unlock the drive.

PowerPC/pseries versions of key functions provide read/write access
to SED Opal keys in the PLPKS keystore.

The SED block driver has been modified to read the SED Opal
keystore to populate a key in the SED Opal keyring. Changes to the
SED Opal key will be written to the SED Opal keystore.


Changelog
v8:     - rebased to 6.6-rc4
	- fixed issues using clang (thanks Nathan Chancellor and Nick
	  Desaulniers)
	- fixed crash if PLPKS is not present for pseries (thanks Michael
	  Ellerman)

v7:     - rebased to for-6.5/block

v6:     - squashed two commits (suggested by Andrew Donnellan)

v5:     - updated to reflect changes in PLPKS API

v4:
        - scope reduced to cover just SED Opal keys
        - base SED Opal keystore is now in SED block driver
        - removed use of enum to indicate type
        - refactored common code into common function that read and
          write use
        - removed cast to void
        - added use of SED Opal keystore functions to SED block driver

v3:
        - No code changes, but per reviewer requests, adding additional
          mailing lists(keyring, EFI) for wider review.

v2:
        - Include feedback from Gregory Joyce, Eric Richter and
          Murilo Opsfelder Araujo.
        - Include suggestions from Michael Ellerman.
        - Moved a dependency from generic SED code to this patchset.
          This patchset now builds of its own.




Greg Joyce (3):
  block:sed-opal: SED Opal keystore
  block: sed-opal: keystore access for SED Opal keys
  powerpc/pseries: PLPKS SED Opal keystore support

 arch/powerpc/platforms/pseries/Kconfig        |   6 +
 arch/powerpc/platforms/pseries/Makefile       |   1 +
 .../powerpc/platforms/pseries/plpks_sed_ops.c | 131 ++++++++++++++++++
 block/Kconfig                                 |   1 +
 block/sed-opal.c                              |  18 ++-
 include/linux/sed-opal-key.h                  |  26 ++++
 6 files changed, 181 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/platforms/pseries/plpks_sed_ops.c
 create mode 100644 include/linux/sed-opal-key.h

-- 
gjoyce@linux.vnet.ibm.com

