Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C93923AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 14:42:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BtqM4RfFzDqlB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 22:42:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Btgb5XBKzDqfK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 22:35:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46Btgb1FL3z8x3S
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 22:35:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46BtgZ54MVz9sNF; Mon, 19 Aug 2019 22:35:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46BtgY0gFnz9sNf
 for <linuxppc-dev@ozlabs.org>; Mon, 19 Aug 2019 22:35:36 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7JCXvpi136786
 for <linuxppc-dev@ozlabs.org>; Mon, 19 Aug 2019 08:35:34 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ufrxkqe2n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 19 Aug 2019 08:35:31 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <nayna@linux.ibm.com>;
 Mon, 19 Aug 2019 13:35:22 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 19 Aug 2019 13:35:19 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7JCYvPq27525584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2019 12:34:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEB5111C05B;
 Mon, 19 Aug 2019 12:35:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 467BA11C058;
 Mon, 19 Aug 2019 12:35:15 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.80.231.242])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Aug 2019 12:35:15 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-integrity@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] powerpc: Enabling IMA arch specific secure boot
 policies
Date: Mon, 19 Aug 2019 08:35:06 -0400
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 19081912-0008-0000-0000-0000030AB4F0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081912-0009-0000-0000-00004A28D83A
Message-Id: <1566218108-12705-1-git-send-email-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-19_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908190142
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

IMA subsystem supports custom, built-in, arch-specific policies to define
the files to be measured and appraised. These policies are honored based
on the priority where arch-specific policies is the highest and custom
is the lowest.

OpenPOWER systems rely on IMA for signature verification of the kernel.
This patchset adds support for powerpc specific arch policies that are
defined based on system's OS secureboot state. The OS secureboot state
of the system is determined via device-tree entry.

Changelog:
v5:
* secureboot state is now read via device tree entry rather than OPAL
secure variables
* ima arch policies are updated to use policy based template for
measurement rules

v4:
* Fixed the build issue as reported by Satheesh Rajendran.

v3:
* OPAL APIs in Patch 1 are updated to provide generic interface based on
key/keylen. This patchset updates kernel OPAL APIs to be compatible with
generic interface.
* Patch 2 is cleaned up to use new OPAL APIs.
* Since OPAL can support different types of backend which can vary in the
variable interpretation, the Patch 2 is updated to add a check for the
backend version
* OPAL API now expects consumer to first check the supported backend version
before calling other secvar OPAL APIs. This check is now added in patch 2.
* IMA policies in Patch 3 is updated to specify appended signature and
per policy template.
* The patches now are free of any EFIisms.

v2:

* Removed Patch 1: powerpc/include: Override unneeded early ioremap
functions
* Updated Subject line and patch description of the Patch 1 of this series
* Removed dependency of OPAL_SECVAR on EFI, CPU_BIG_ENDIAN and UCS2_STRING
* Changed OPAL APIs from static to non-static. Added opal-secvar.h for the
same
* Removed EFI hooks from opal_secvar.c
* Removed opal_secvar_get_next(), opal_secvar_enqueue() and
opal_query_variable_info() function
* get_powerpc_sb_mode() in secboot.c now directly calls OPAL Runtime API
rather than via EFI hooks.
* Fixed log messages in get_powerpc_sb_mode() function.
* Added dependency for PPC_SECURE_BOOT on configs PPC64 and OPAL_SECVAR
* Replaced obj-$(CONFIG_IMA) with obj-$(CONFIG_PPC_SECURE_BOOT) in
arch/powerpc/kernel/Makefile

Nayna Jain (2):
  powerpc: detect the secure boot mode of the system
  powerpc: Add support to initialize ima policy rules

 arch/powerpc/Kconfig               | 13 ++++++
 arch/powerpc/include/asm/secboot.h | 27 ++++++++++++
 arch/powerpc/kernel/Makefile       |  2 +
 arch/powerpc/kernel/ima_arch.c     | 50 +++++++++++++++++++++
 arch/powerpc/kernel/secboot.c      | 71 ++++++++++++++++++++++++++++++
 include/linux/ima.h                |  3 +-
 6 files changed, 165 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/secboot.h
 create mode 100644 arch/powerpc/kernel/ima_arch.c
 create mode 100644 arch/powerpc/kernel/secboot.c

-- 
2.20.1

