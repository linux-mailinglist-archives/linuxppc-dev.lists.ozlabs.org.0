Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A85143BDBC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 22:47:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45N4vC1zflzDqRP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 06:47:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45N4cB6pzkzDqM7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 06:34:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45N4c850gBz8w3g
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 06:34:16 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45N4c81KKkz9sNy; Tue, 11 Jun 2019 06:34:16 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45N4c66V7nz9s7h
 for <linuxppc-dev@ozlabs.org>; Tue, 11 Jun 2019 06:34:14 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5AKWOUc063184
 for <linuxppc-dev@ozlabs.org>; Mon, 10 Jun 2019 16:34:08 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t1uapy54c-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 10 Jun 2019 16:34:08 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <nayna@linux.ibm.com>;
 Mon, 10 Jun 2019 21:34:06 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 10 Jun 2019 21:34:03 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5AKY2V328508348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jun 2019 20:34:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF50F11C05C;
 Mon, 10 Jun 2019 20:34:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0725C11C050;
 Mon, 10 Jun 2019 20:34:00 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.85.139.99])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 Jun 2019 20:33:59 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] powerpc: Enabling IMA arch specific secure boot
 policies
Date: Mon, 10 Jun 2019 16:33:54 -0400
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 19061020-4275-0000-0000-0000034111B2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061020-4276-0000-0000-000038511F92
Message-Id: <1560198837-18857-1-git-send-email-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-10_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906100139
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
 Nayna Jain <nayna@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Matthew Garret <matthew.garret@nebula.com>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch set, previously named "powerpc: Enabling secure boot on powernv
systems - Part 1", is part of a series that implements secure boot on
PowerNV systems.

In order to verify the OS kernel on PowerNV, secure boot requires X.509
certificates trusted by the platform, the secure boot modes, and several
other pieces of information. These are stored in secure variables
controlled by OPAL, also known as OPAL secure variables.

The IMA architecture specific policy support on POWER is dependent on OPAL
runtime services to access secure variables. OPAL APIs in skiboot are
modified to define generic interface compatible to any backend. This
patchset is consequently updated to be compatible with new OPAL API
interface. This has cleaned up any EFIsms in the arch specific code.
Further, the ima arch specific policies are updated to be able to support
appended signatures. They also now use per policy template.

Exposing the OPAL secure variables to userspace will be posted as a
separate patch set, allowing the IMA architecture specific policy on POWER
to be upstreamed independently.

This patch set adds the following features:

1. Add support for OPAL Runtime API to access secure variables controlled
by OPAL.
2. Define IMA arch-specific policies based on the secure boot state and
mode of the system. On secure boot enabled PowerNV systems, the OS kernel
signature will be verified by IMA appraisal.

Pre-requisites for this patchset are:
1. OPAL APIs in Skiboot[1]
2. Appended signature support in IMA [2]
3. Per policy template support in IMA [3]

[1] https://patchwork.ozlabs.org/project/skiboot/list/?series=112868 
[2] https://patchwork.ozlabs.org/cover/1087361/. Updated version will be
posted soon
[3] Repo: https://kernel.googlesource.com/pub/scm/linux/kernel/git/zohar/linux-integrity
Branch: next-queued-testing. Commit: f241bb1f42aa95

----------------------------------------------------------------------------------

Original Cover Letter:

This patch set is part of a series that implements secure boot on PowerNV
systems.

In order to verify the OS kernel on PowerNV, secure boot requires X.509
certificates trusted by the platform, the secure boot modes, and several
other pieces of information. These are stored in secure variables
controlled by OPAL, also known as OPAL secure variables.

The IMA architecture specific policy support on Power is dependent on OPAL
runtime services to access secure variables. Instead of directly accessing
the OPAL runtime services, version 3 of this patch set relied upon the
EFI hooks. This version drops that dependency and calls the OPAL runtime
services directly. Skiboot OPAL APIs are due to be posted soon.

Exposing the OPAL secure variables to userspace will be posted as a
separate patch set, allowing the IMA architecture specific policy on Power
to be upstreamed independently.

This patch set adds the following features:

1. Add support for OPAL Runtime API to access secure variables controlled
by OPAL.
2. Define IMA arch-specific policies based on the secure boot state and
mode of the system. On secure boot enabled powernv systems, the OS kernel
signature will be verified by IMA appraisal.

[1] https://patchwork.kernel.org/cover/10882149/

Changelog:

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

Claudio Carvalho (1):
  powerpc/powernv: Add OPAL API interface to get secureboot state

Nayna Jain (2):
  powerpc/powernv: detect the secure boot mode of the system
  powerpc: Add support to initialize ima policy rules

 arch/powerpc/Kconfig                         | 14 ++++
 arch/powerpc/include/asm/opal-api.h          |  4 +-
 arch/powerpc/include/asm/opal-secvar.h       | 23 ++++++
 arch/powerpc/include/asm/opal.h              |  6 ++
 arch/powerpc/include/asm/secboot.h           | 21 +++++
 arch/powerpc/kernel/Makefile                 |  1 +
 arch/powerpc/kernel/ima_arch.c               | 54 +++++++++++++
 arch/powerpc/platforms/powernv/Kconfig       |  6 ++
 arch/powerpc/platforms/powernv/Makefile      |  2 +
 arch/powerpc/platforms/powernv/opal-call.c   |  2 +
 arch/powerpc/platforms/powernv/opal-secvar.c | 85 ++++++++++++++++++++
 arch/powerpc/platforms/powernv/secboot.c     | 61 ++++++++++++++
 include/linux/ima.h                          |  3 +-
 13 files changed, 280 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/include/asm/opal-secvar.h
 create mode 100644 arch/powerpc/include/asm/secboot.h
 create mode 100644 arch/powerpc/kernel/ima_arch.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-secvar.c
 create mode 100644 arch/powerpc/platforms/powernv/secboot.c

-- 
2.20.1

