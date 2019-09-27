Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE62EC0797
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 16:31:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fvNp5CSdzDqZ2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 00:31:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fvHR6F01zDqwb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 00:26:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46fvHQ5ts0z8w9Y
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 00:26:26 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46fvHQ2nqQz9sPk; Sat, 28 Sep 2019 00:26:26 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46fvHP0zh9z9sPS
 for <linuxppc-dev@ozlabs.org>; Sat, 28 Sep 2019 00:26:24 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8REMDEP140205
 for <linuxppc-dev@ozlabs.org>; Fri, 27 Sep 2019 10:26:19 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v9jpr3yc5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 27 Sep 2019 10:26:19 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <nayna@linux.ibm.com>;
 Fri, 27 Sep 2019 15:26:17 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 27 Sep 2019 15:26:11 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8REQ9mQ56033366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 14:26:09 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6769BA4064;
 Fri, 27 Sep 2019 14:26:09 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F861A405C;
 Fri, 27 Sep 2019 14:26:05 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.80.207.173])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 27 Sep 2019 14:26:05 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 0/9] powerpc: Enabling IMA arch specific secure boot
 policies
Date: Fri, 27 Sep 2019 10:25:51 -0400
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 19092714-0028-0000-0000-000003A3417A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092714-0029-0000-0000-0000246563D4
Message-Id: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-27_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909270134
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset extends the previous version of the patchset[1] by adding
the support for checking against the binary blacklisted hashes.

IMA subsystem supports custom, built-in, arch-specific policies to define
the files to be measured and appraised. These policies are honored based
on the priority where arch-specific policies is the highest and custom
is the lowest.

PowerNV systems uses the linux based bootloader and kexec the Host OS.
It rely on IMA for signature verification of the kernel before doing the
kexec. This patchset adds support for powerpc arch specific ima policies
that are defined based on system's OS secureboot and trustedboot state.
The OS secureboot and trustedboot state are determined via device-tree
properties.

The verification needs to be done only for the binaries which are not
blacklisted. The kernel currently checks against the blacklisted keys.
However that results in blacklisting all the binaries that are signed by
that key. In order to prevent single binary from loading, it is required
to support checking against blacklisting of the binary hash. This patchset
adds the support in IMA to check against blacklisted hashes for the files
signed by appended signature.

[1] http://patchwork.ozlabs.org/cover/1149262/ 

Changelog:
v6:
* includes feedbacks from Michael Ellerman on the patchset v5
  * removed email ids from comments
  * add the doc for the device-tree
  * renames the secboot.c to secure_boot.c and secboot.h to secure_boot.h
  * other code specific fixes
* split the patches to differentiate between secureboot and trustedboot
state of the system
* adds the patches to support the blacklisting of the binary hash.

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

Nayna Jain (9):
  dt-bindings: ibm,secureboot: secure boot specific properties for
    PowerNV
  powerpc: detect the secure boot mode of the system
  powerpc: add support to initialize ima policy rules
  powerpc: detect the trusted boot state of the system
  powerpc/ima: add measurement rules to ima arch specific policy
  ima: make process_buffer_measurement() non-static
  ima: check against blacklisted hashes for files with modsig
  ima: deprecate permit_directio, instead use appraise_flag
  powerpc/ima: update ima arch policy to check for blacklist

 Documentation/ABI/testing/ima_policy          |  3 +-
 .../bindings/powerpc/ibm,secureboot.rst       | 76 +++++++++++++++
 .../devicetree/bindings/powerpc/secvar.rst    | 89 +++++++++++++++++
 arch/powerpc/Kconfig                          | 12 +++
 arch/powerpc/include/asm/secure_boot.h        | 37 +++++++
 arch/powerpc/kernel/Makefile                  |  2 +
 arch/powerpc/kernel/ima_arch.c                | 71 ++++++++++++++
 arch/powerpc/kernel/secure_boot.c             | 96 +++++++++++++++++++
 include/linux/ima.h                           |  3 +-
 security/integrity/ima/ima.h                  | 15 +++
 security/integrity/ima/ima_appraise.c         | 35 +++++++
 security/integrity/ima/ima_main.c             | 37 +++----
 security/integrity/ima/ima_policy.c           | 12 ++-
 security/integrity/integrity.h                |  1 +
 14 files changed, 468 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst
 create mode 100644 Documentation/devicetree/bindings/powerpc/secvar.rst
 create mode 100644 arch/powerpc/include/asm/secure_boot.h
 create mode 100644 arch/powerpc/kernel/ima_arch.c
 create mode 100644 arch/powerpc/kernel/secure_boot.c

-- 
2.20.1

