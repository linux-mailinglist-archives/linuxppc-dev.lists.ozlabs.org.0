Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB58EA9AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 04:34:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473WC94fTXzF5P0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 14:34:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473W8S40X1zF3DB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 14:31:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 473W8R75gQz8tD1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 14:31:51 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 473W8R6jggz9sPv; Thu, 31 Oct 2019 14:31:51 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 473W8R2TvJz9sPK
 for <linuxppc-dev@ozlabs.org>; Thu, 31 Oct 2019 14:31:50 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9V3SOEE128174
 for <linuxppc-dev@ozlabs.org>; Wed, 30 Oct 2019 23:31:48 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vyjvvfyrv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 30 Oct 2019 23:31:48 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <zohar@linux.ibm.com>;
 Thu, 31 Oct 2019 03:31:45 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 31 Oct 2019 03:31:41 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9V3VeBN43516074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Oct 2019 03:31:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A80BA4060;
 Thu, 31 Oct 2019 03:31:40 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8486CA405B;
 Thu, 31 Oct 2019 03:31:38 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.85.201.217])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 31 Oct 2019 03:31:38 +0000 (GMT)
From: Mimi Zohar <zohar@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v10 0/9] powerpc: Enabling IMA arch specific secure boot
 policies
Date: Wed, 30 Oct 2019 23:31:25 -0400
X-Mailer: git-send-email 2.7.5
X-TM-AS-GCONF: 00
x-cbid: 19103103-4275-0000-0000-00000379641C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19103103-4276-0000-0000-0000388CA068
Message-Id: <1572492694-6520-1-git-send-email-zohar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-31_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910310031
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
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset extends the previous version[1] by adding support for
checking against a blacklist of binary hashes.

The IMA subsystem supports custom, built-in, arch-specific policies to
define the files to be measured and appraised. These policies are honored
based on priority, where arch-specific policy is the highest and custom
is the lowest.

PowerNV system uses a Linux-based bootloader to kexec the OS. The
bootloader kernel relies on IMA for signature verification of the OS
kernel before doing the kexec. This patchset adds support for powerpc
arch-specific IMA policies that are conditionally defined based on a
system's secure boot and trusted boot states. The OS secure boot and
trusted boot states are determined via device-tree properties.

The verification needs to be performed only for binaries that are not
blacklisted. The kernel currently only checks against the blacklist of
keys. However, doing so results in blacklisting all the binaries that
are signed by the same key. In order to prevent just one particular
binary from being loaded, it must be checked against a blacklist of
binary hashes. This patchset also adds support to IMA for checking
against a hash blacklist for files. signed by appended signature.

[1] http://patchwork.ozlabs.org/cover/1149262/ 

Changelog:

v10: (Mimi posting patch set on Nayna's behalf)
- Minor patch description changes
- Include comment in process_buffer_measurement()
- Additional patch: Enforcing kernel module appended signatures should
be reflected in "/sys/module/module/parameters/sig_enforce".
- Trimmed Cc list.

v9:
* Includes feedbacks from Michael
  * fix the missing of_node_put()
* Includes Mimi's feedbacks
  * fix the policy show() function to display check_blacklist
  * fix the other comment related and patch description
  * add the example of blacklist in the Patch 7/8
Note: Patch 7/8 is giving errors when checkpatch.pl is run because
of the format of showing measurement record as part of the example. I am
not very sure if that can be fixed as we need to represent the
measurements as is.

v8:
* Updates the Patch Description as per Michael's and Mimi's feedback
* Includes feedbacks from Michael for the device tree and policies
  * removes the arch-policy hack by defining three arrays.
  * fixes related to device-tree calls 
  * other code specific feedbacks
* Includes feedbacks from Mimi on the blacklist
  * generic blacklist function is modified than previous version
  * other coding fixes

v7:
* Removes patch related to dt-bindings as per input from Rob Herring. 
* fixes Patch 1/8 to use new device-tree updates as per Oliver
  feedback to device-tree documentation in skiboot mailing list.
(https://lists.ozlabs.org/pipermail/skiboot/2019-September/015329.html)
* Includes feedbacks from Mimi, Thiago
  * moves function get_powerpc_fw_sb_node() from Patch 1 to Patch 3 
  * fixes Patch 2/8 to use CONFIG_MODULE_SIG_FORCE.
  * updates Patch description in Patch 5/8
  * adds a new patch to add wrapper is_binary_blacklisted()
  * removes the patch that deprecated permit_directio

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

Mimi Zohar (1):
  powerpc/ima: indicate kernel modules appended signatures are enforced

Nayna Jain (8):
  powerpc: detect the secure boot mode of the system
  powerpc/ima: add support to initialize ima policy rules
  powerpc: detect the trusted boot state of the system
  powerpc/ima: define trusted boot policy
  ima: make process_buffer_measurement() generic
  certs: add wrapper function to check blacklisted binary hash
  ima: check against blacklisted hashes for files with modsig
  powerpc/ima: update ima arch policy to check for blacklist

 Documentation/ABI/testing/ima_policy   |  4 ++
 arch/powerpc/Kconfig                   | 11 +++++
 arch/powerpc/include/asm/secure_boot.h | 29 +++++++++++++
 arch/powerpc/kernel/Makefile           |  2 +
 arch/powerpc/kernel/ima_arch.c         | 78 ++++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/secure_boot.c      | 58 +++++++++++++++++++++++++
 certs/blacklist.c                      |  9 ++++
 include/keys/system_keyring.h          |  6 +++
 include/linux/ima.h                    |  3 +-
 security/integrity/ima/ima.h           | 11 +++++
 security/integrity/ima/ima_appraise.c  | 33 ++++++++++++++
 security/integrity/ima/ima_main.c      | 70 ++++++++++++++++++++----------
 security/integrity/ima/ima_policy.c    | 12 +++++-
 security/integrity/integrity.h         |  1 +
 14 files changed, 302 insertions(+), 25 deletions(-)
 create mode 100644 arch/powerpc/include/asm/secure_boot.h
 create mode 100644 arch/powerpc/kernel/ima_arch.c
 create mode 100644 arch/powerpc/kernel/secure_boot.c

-- 
2.7.5

