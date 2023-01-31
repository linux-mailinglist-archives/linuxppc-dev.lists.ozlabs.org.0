Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A486824BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 07:42:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5b7X56nnz3cKb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 17:42:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VWQTHs5L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VWQTHs5L;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5b5b03H1z2yNs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 17:40:18 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V5PdxL029099;
	Tue, 31 Jan 2023 06:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Oj5fUqD8cXfhCXGHqmmAnB4nFoPDkXudrH0a2Bq25gU=;
 b=VWQTHs5Lwd/FOzlueNuXV5zXQqjGQJ00nuljuX/obnvlvVSeULmlzRpwdWs1DT0hm6oI
 riVQxGWflg4LX1Tn6Oz8BtICizcdGDgxljnskHEeecmYP0mNZLay6mqsFEJTg4NI12Va
 b+1aFn4mIQI6lB/tY4irHcgRpRviSi/SZJQ1P5xXhmbfORd+5lYRzeEqyaLKoYdlQ9IT
 bGtCU7oX84QC2Ci/38EVMdwMT7rn3o48JOlDcTqGFsjbVGX/RTwrzccHtqD2ZynPsi8s
 p8YcHkdKSJIkXoTngHjNrHTjO53TRHzVcw+EY0AQC6ooqX/cPl8XFeYGF3QFdGDKqBFv Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nevu21dh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:12 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30V5rDV3021862;
	Tue, 31 Jan 2023 06:40:12 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nevu21dga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:11 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30UHGNZJ013226;
	Tue, 31 Jan 2023 06:40:09 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3ncvsha6wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:09 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30V6e7uP43254156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 06:40:07 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDE0A2004D;
	Tue, 31 Jan 2023 06:40:06 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEABF2004B;
	Tue, 31 Jan 2023 06:40:05 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 06:40:05 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.au.ibm.com (unknown [9.192.255.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B7D3160151;
	Tue, 31 Jan 2023 17:40:03 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v5 00/25] pSeries dynamic secure boot secvar interface + platform keyring loading
Date: Tue, 31 Jan 2023 17:39:03 +1100
Message-Id: <20230131063928.388035-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6mVqwP3h7xxCkZ0jYJ50CcSQOfEQg9EC
X-Proofpoint-GUID: Xtx_qJn4w6seaN2XOtA0aO3n_Jesf0OS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310059
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
Cc: sudhakar@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series exposes an interface to userspace for reading and writing
secure variables contained within the PowerVM LPAR Platform KeyStore
(PLPKS) for the purpose of configuring dynamic secure boot, and adds
the glue required to load keys from the PLPKS into the platform keyring.

This series builds on past work by Nayna Jain[0] in exposing PLPKS
variables to userspace.  Rather than being a generic interface for
interacting with the keystore, however, we use the existing powerpc
secvar infrastructure to only expose objects in the keystore used
for dynamic secure boot.  This has the benefit of leveraging an
existing interface and making the implementation relatively minimal.

This series integrates a previous series to fix some bugs in PLPKS
and implement support for signed updates[1], and a cleanup patch from
Michael Ellerman[2].

There are a few relevant details to note about the implementation:

 * New additions to the secvar API: format(), max_size(), config_attrs,
   var_names

 * New optional sysfs directory "config/" for arbitrary ASCII variables

 * Some OPAL-specific code has been relocated from secvar-sysfs.c to
   powernv platform code.  Would appreciate any powernv testing!

 * Variable names are fixed and only those used for secure boot are
   exposed.  This is not a generic PLPKS interface, but also doesn't
   preclude one being added in future.

With this series, both powernv and pseries platforms support dynamic
secure boot through the same interface.

Many thanks to Nayna Jain, Ben Gray, Sudhakar Kuppusamy, Shubham Pandey,
Mimi Zohar, George Wilson and the others at IBM who have helped us with
developing this series, and to everyone who has provided review comments
and feedback.

[0]: https://lore.kernel.org/linuxppc-dev/20221106210744.603240-1-nayna@linux.ibm.com/
[1]: https://lore.kernel.org/linuxppc-dev/20221220071626.1426786-1-ajd@linux.ibm.com/
[2]: https://lore.kernel.org/linuxppc-dev/20230112023819.1692452-1-mpe@ellerman.id.au/

v1: https://lore.kernel.org/linuxppc-dev/20221228072943.429266-1-ruscur@russell.cc/
v2: https://lore.kernel.org/linuxppc-dev/20221230042014.154483-1-ruscur@russell.cc/
v3: https://lore.kernel.org/linuxppc-dev/20230118061049.1006141-1-ajd@linux.ibm.com/
v4: https://lore.kernel.org/linuxppc-dev/20230120074306.1326298-1-ajd@linux.ibm.com/

=================

Changes in v5:

    New patch to fix incorrect return value in secvar_sysfs_load() (ruscur)

    Better explanation of power of 2 kmalloc rounding (mpe)

    Add null component check on signed updates (npiggin)

    Don't export plpks_signed_update_var() (npiggin)

    Fix all the feedback we got on kexec handling, including removing the
    password from the FDT (npiggin, mpe)

    Enable plpks-secvar.c using CONFIG_PPC_SECURE_BOOT rather than
    CONFIG_PPC_SECVAR_SYSFS (ajd)

    Clarify handling of ibm,secvar-backend vs ibm,edk2-compat-v1
    compatible string (zohar)

    Lots of miscellaneous improvements (npiggin)

Changes in v4:

    Fix the build when CONFIG_PSERIES_PLPKS=n (snowpatch)

    Shuffled fixes to the front the series (npiggin)

    Pass buffer size in secvar_operations->format() (stefanb, npiggin)

    Return an error when set_secvar_ops() fails (npiggin)

    Add some extra null checks (stefanb, gjoyce)

    Add commit message comment elaborating on PAGE_SIZE issues (joel)

    Fix error handling in the kexec code (ruscur)

    Fix hvcall.h MAX_HCALL_OPCODE rebasing issue (npiggin)

Changes in v3:

    Integrate Andrew's PLPKS bugfixes and enhancements series and Michael
    Ellerman's u64 cleanup patch into this series (and update the other
    patches to use u64)

    New patches to load keys from the PLPKS into the kernel's platform
    keyring (ruscur)

    New patches to pass PLPKS password to new kernels when kexecing
    (ruscur)

    Improve handling of format strings (ruscur)

    Clean up secvar error messages (ajd)

    Merge config attributes into secvar_operations (mpe)

    Add a new static variable names API rather than (ab)using get_next()
    (ajd/mpe)

    Warning message when PAGE_SIZE is smaller than the max object size
    (ajd)

    Move plpks.h to the include directory, and move a bunch of constants
    in there with a consistent naming scheme

    Refresh PLPKS config values whenever plpks_get_usedspace() is called
    (ajd)

    Extra validation on PLPKS config values (ruscur)

    Return maxobjlabelsize to userspace as is without subtracting overhead (ruscur)

    Fix error code handling in plpks_confirm_object_flushed() (ruscur)

    Pass plpks_var struct to plpks_signed_update_var() by reference (mpe)

    Make the data buffer in plpks_read_var() caller-allocated to reduce
    number of allocations/copies (mpe)

    Rework the Kconfig options so that PSERIES_PLPKS is a hidden option,
    turned on by enabling PPC_SECURE_BOOT, and the PLPKS secvar code is
    activated by PPC_SECVAR_SYSFS to match powernv (ajd)

    Use machine_arch_initcall() rather than device_initcall() so we don't
    break powernv (mpe)

    Improve ABI documentation (mpe)

    Return -EIO on most read errors (mpe)

    Add "grubdbx" variable (Sudhakar)

    Use utf8s_to_utf16s() rather than our own "UCS-2" conversion code (mpe)

    Fix SB_VERSION data length (ruscur)

    Stop prepending policy data on read (ruscur)

    Don't print errors to the kernel log when reading non-existent
    variables (Sudhakar)

    Miscellaneous code style, checkpatch cleanups

Changes in v2:

    Remove unnecessary config vars from sysfs and document the others,
    thanks to review from Greg.  If we end up needing to expose more, we
    can add them later and update the docs.

    Use sysfs_emit() instead of sprintf() for all sysfs strings

    Change the size of the sysfs binary attributes to include the 8-byte
    flags header, preventing truncation of large writes.

Andrew Donnellan (8):
  powerpc/pseries: Fix handling of PLPKS object flushing timeout
  powerpc/pseries: Fix alignment of PLPKS structures and buffers
  powerpc/secvar: Clean up init error messages
  powerpc/secvar: Allow backend to populate static list of variable
    names
  powerpc/secvar: Warn when PAGE_SIZE is smaller than max object size
  powerpc/secvar: Don't print error on ENOENT when reading variables
  powerpc/pseries: Make caller pass buffer to plpks_read_var()
  powerpc/pseries: Turn PSERIES_PLPKS into a hidden option

Michael Ellerman (1):
  powerpc/secvar: Use u64 in secvar_operations

Nayna Jain (2):
  powerpc/pseries: Expose PLPKS config values, support additional fields
  powerpc/pseries: Implement signed update for PLPKS objects

Russell Currey (14):
  powerpc/secvar: Fix incorrect return in secvar_sysfs_load()
  powerpc/secvar: Warn and error if multiple secvar ops are set
  powerpc/secvar: Use sysfs_emit() instead of sprintf()
  powerpc/secvar: Handle format string in the consumer
  powerpc/secvar: Handle max object size in the consumer
  powerpc/secvar: Extend sysfs to include config vars
  powerpc/pseries: Move plpks.h to include directory
  powerpc/pseries: Move PLPKS constants to header file
  powerpc/pseries: Log hcall return codes for PLPKS debug
  powerpc/pseries: Add helper to get PLPKS password length
  powerpc/pseries: Pass PLPKS password on kexec
  powerpc/pseries: Implement secvars for dynamic secure boot
  integrity/powerpc: Improve error handling & reporting when loading
    certs
  integrity/powerpc: Support loading keys from PLPKS

 Documentation/ABI/testing/sysfs-secvar        |  75 +++-
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/include/asm/hvcall.h             |   1 +
 arch/powerpc/include/asm/plpks.h              | 195 +++++++++
 arch/powerpc/include/asm/secvar.h             |  21 +-
 arch/powerpc/kernel/prom.c                    |   4 +
 arch/powerpc/kernel/secvar-ops.c              |   8 +-
 arch/powerpc/kernel/secvar-sysfs.c            | 176 ++++----
 arch/powerpc/kexec/file_load_64.c             |  15 +-
 arch/powerpc/platforms/powernv/opal-secvar.c  |  60 ++-
 arch/powerpc/platforms/pseries/Kconfig        |  19 +-
 arch/powerpc/platforms/pseries/Makefile       |   4 +-
 arch/powerpc/platforms/pseries/plpks-secvar.c | 219 ++++++++++
 arch/powerpc/platforms/pseries/plpks.c        | 378 +++++++++++++++---
 arch/powerpc/platforms/pseries/plpks.h        |  71 ----
 .../integrity/platform_certs/load_powerpc.c   |  47 ++-
 16 files changed, 1040 insertions(+), 254 deletions(-)
 create mode 100644 arch/powerpc/include/asm/plpks.h
 create mode 100644 arch/powerpc/platforms/pseries/plpks-secvar.c
 delete mode 100644 arch/powerpc/platforms/pseries/plpks.h

-- 
2.39.1
