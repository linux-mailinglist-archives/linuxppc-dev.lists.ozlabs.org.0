Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F8F71F621
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 00:40:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXLgG0LFXz3f1F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 08:40:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J7ZmdTM0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J7ZmdTM0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXLbd56Jzz3f0Z
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 08:37:01 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351MRXqd022373;
	Thu, 1 Jun 2023 22:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=OaENUk+OtTo7XYcgtLR8ZNNmcqnB6oV2wFbe20cGWJY=;
 b=J7ZmdTM0M8QK3ig6zfsznu5yvsIhhGtBqQbpq5kqS4O8AWWxm+NZRyhMPXaYc0N6q4m9
 M3pTrWVaN1rMtuGwfDTqD2s0RXn6lcKffAkX7rCEmKviU0FTSA26G7GB5v7TAmq+V4Qs
 KB+MLj/Ua30UH0JKdn1LcBfur7dThxbfLHf4tV/6Vo5iCDkEjnvpIzuAXBY28LOuSDZc
 gBWr32Ob5N78uH+FtRpU/Ok0RbkyIg/XqfgFLGqSrR/ljkejaImgmaI00e12iK5Ozc6g
 1FIIi8odU0Td1FeSD/diIU9m3e8lEyOA8xhumJA2OfhTQvk0JcmW29Q4UhTmDepe2QI9 xw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qy44sg4m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 22:36:34 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 351FDmB7017407;
	Thu, 1 Jun 2023 22:36:33 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3qu9g5af7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 22:36:33 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 351MaWeu37880554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Jun 2023 22:36:32 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 106F358054;
	Thu,  1 Jun 2023 22:36:32 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C0D158063;
	Thu,  1 Jun 2023 22:36:31 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.58.163])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Jun 2023 22:36:31 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v6 0/4] generic and PowerPC SED Opal keystore
Date: Thu,  1 Jun 2023 17:36:27 -0500
Message-Id: <20230601223630.2136006-1-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Mpj7272lQAxVFgGC8awYVZQWP3bcinF8
X-Proofpoint-GUID: Mpj7272lQAxVFgGC8awYVZQWP3bcinF8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=770
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010194
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

This patchset has gone through numerous rounds of review and
all comments/suggetions have been addressed. I believe that
this patchset is ready for inclusion.

TCG SED Opal is a specification from The Trusted Computing Group
that allows self encrypting storage devices (SED) to be locked at
power on and require an authentication key to unlock the drive.

Generic functions have been defined for accessing SED Opal keys.
The generic functions are defined as weak so that they may be superseded
by keystore specific versions.

PowerPC/pseries versions of these functions provide read/write access
to SED Opal keys in the PLPKS keystore.

The SED block driver has been modified to read the SED Opal
keystore to populate a key in the SED Opal keyring. Changes to the
SED Opal key will be written to the SED Opal keystore.

Patch 3 "keystore access for SED Opal keys" is dependent on:
        https://lore.kernel.org/keyrings/20220818143045.680972-4-gjoyce@linux.vnet.ibm.com/T/#u

Changelog
v6:	- squashed two commits (suggested by Andrew Donnellan)

v5:	- updated to reflect changes in PLPKS API

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
 .../powerpc/platforms/pseries/plpks_sed_ops.c | 114 ++++++++++++++++++
 block/Kconfig                                 |   1 +
 block/Makefile                                |   2 +-
 block/sed-opal-key.c                          |  24 ++++
 block/sed-opal.c                              |  18 ++-
 include/linux/sed-opal-key.h                  |  15 +++
 8 files changed, 178 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/platforms/pseries/plpks_sed_ops.c
 create mode 100644 block/sed-opal-key.c
 create mode 100644 include/linux/sed-opal-key.h

-- 
gjoyce@linux.vnet.ibm.com

