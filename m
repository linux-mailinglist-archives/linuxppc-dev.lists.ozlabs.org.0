Return-Path: <linuxppc-dev+bounces-14846-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B31AACC90A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 18:25:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWgg33FJyz30Vn;
	Thu, 18 Dec 2025 04:25:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765992335;
	cv=none; b=mQiKErCefSQKvyqYeMVrbm1adSDcr9pV3FVcrHC7Rxqx427j30rDF72pX+04o6Nw2quoMOBTgxJUM9sluDoqIHJhaMyuzb0GDaJRouj8ZfB+/Osuxrcw9EbcAvCsku31bGSTeTyFlwzIH+V57y3F6wuykdyLQRrrcjA29uqvgWO/sfa4o9URAypgDmemLFlKY0Rfdp19LNUa0sGqTJGtJ9I2kCrlTWc3GK9t8vuFFYWEhiPVCPDxAhjVvxZb3hvbgAvRTr7O47WJNaQe+bEV9M3i7ATQZ0qSCDiWleeKEXQeNuhcbAYp8/oMSuwf8wfwoPx7+9lu+U4ysCF1AwOSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765992335; c=relaxed/relaxed;
	bh=5SKiyMHvrorLkIZBE65fPl51HErpcrh4BjYe7S+LMUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DpJa3uIc8omRPKtfRw6aUOmvIwfhuVVqPley8RvhoPCvtnqOZ5BbAIQiSrpViPlxk8ZnpyP0Mv2/lGs3GiRzwQ19fn+mHwwTsPI5+Ls2NimLXoFrrZugFxM+bsxdAXn4zFhdXnlkImyPo/a42TmggwLBCkOie7mtu7OcZ2S9gr0ll90Zm89zM76Te4Npg8Pb03qzdPtF2FDYwi1s7+Ofu+UpiCWocQWSnFJPFEVd7q6JPiF7b8eHyyN6o2ACtJ+dnzvLnwsimmbcOYhO97NS/wDRVSVOmig+Cd2akH4Av2cuQ3FikmdK9QvK9/6P8hb7v7gQRDoZGAwF3BOucDMSmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Un3VgEF0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Un3VgEF0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWgg23pBbz30VM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 04:25:34 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BHE6lN2012659;
	Wed, 17 Dec 2025 17:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=5SKiyMHvrorLkIZBE
	65fPl51HErpcrh4BjYe7S+LMUQ=; b=Un3VgEF0Ij1Cl3U6kxyfKKUX6J1iyszQB
	BRtRduyTiAdRMY50tWrU9vMOcFw6ZqltcNW4zpl+Ba3+GvZli8OtYop3z1lu4pug
	fpbtNiDqHqU2u8VEJ2tmsOfm9HLjrXZ7WR//wjRkdKOWceoIalrDazGxM7sweFHz
	lGNPT4tXUP22FiZa+9h7EGtXv4wjchh9VutsAGCkWTxrkpkHrq3/E5eOKcOknD5P
	tOsCX4dHOwezP667Pzn/q6ByrYvd4gFzH3+F4OuuvEzEohSAcBZVhlmS7saa2bfV
	Cl7rhBUvs+Vmg6Vw2EwllhJQf0xO64f4Jb/vmRECZGCc3unayCwsA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0xjm5ghq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:22 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BHHEYrM012447;
	Wed, 17 Dec 2025 17:25:21 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0xjm5ghm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:21 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BHH9ZqH002960;
	Wed, 17 Dec 2025 17:25:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1kykuf7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:20 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BHHPGsa25363044
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Dec 2025 17:25:16 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 996BB20043;
	Wed, 17 Dec 2025 17:25:16 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D2B720040;
	Wed, 17 Dec 2025 17:25:13 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.124.211.226])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Dec 2025 17:25:13 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v2 2/6] powerpc/pseries: move the PLPKS config inside its own sysfs directory
Date: Wed, 17 Dec 2025 22:55:01 +0530
Message-ID: <20251217172505.112398-3-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217172505.112398-1-ssrish@linux.ibm.com>
References: <20251217172505.112398-1-ssrish@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xwXyKfd39xjnreLXNgme1xaiKlqbJXq-
X-Authority-Analysis: v=2.4 cv=CLgnnBrD c=1 sm=1 tr=0 ts=6942e782 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=mWGr4ncSMiNchjaCnzgA:9
X-Proofpoint-GUID: 85B0ugw7PXuQSVlsTJ76iF9pAc9tdisQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAwOSBTYWx0ZWRfX5ak+azcgl/Ld
 sLPlMp9b6U7xaW258vRUsiXcuCplCutr8b+RMKG7ENkiIqMOJAYn0tYSZJwFTL5KLJ7gTtFjHaH
 9Q6Duc/aL88yDleb4zeuukHPRGQx5WCqWLYiOUOMQL5XT/kaIUkTIx+I1AN2yWDIaEvBdnARPJu
 7C+sGc9KkMkTIrvEiEYGRfqw0mPsIJcIfI1S8khXxn4YxX5Ln/Ce11e+dPRfM6JxlACqgBEEYO5
 R5FxTrk8bUauwGofClgJU2c/ELtwc/tmhGFilS+uikjWLIARXKwHI7BB+CmDQXt8LZzsDWw7ZVu
 91DIGMpjOaZrqPEV2JKCjdNrwEpbB4hK+GkRCMsuS8pbH93InGpisZsggqFyZxpuxg/CLIr9SIh
 1+Squ/j+ZEiDA6pZ1XK4/zGj02+/uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130009
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The /sys/firmware/secvar/config directory represents Power LPAR Platform
KeyStore (PLPKS) configuration properties such as max_object_size, signed_
update_algorithms, supported_policies, total_size, used_space, and version.
These attributes describe the PLPKS, and not the secure boot variables
(secvars).

Create /sys/firmware/plpks directory and move the PLPKS config inside this
directory. For backwards compatibility, create a soft link from the secvar
sysfs directory to this config and emit a warning stating that the older
sysfs path has been deprecated. Separate out the plpks specific
documentation from secvar.

Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
---
 .../ABI/testing/sysfs-firmware-plpks          | 50 ++++++++++
 Documentation/ABI/testing/sysfs-secvar        | 65 -------------
 arch/powerpc/include/asm/plpks.h              |  5 +
 arch/powerpc/include/asm/secvar.h             |  1 -
 arch/powerpc/kernel/secvar-sysfs.c            | 21 ++---
 arch/powerpc/platforms/pseries/Makefile       |  2 +-
 arch/powerpc/platforms/pseries/plpks-secvar.c | 29 ------
 arch/powerpc/platforms/pseries/plpks-sysfs.c  | 94 +++++++++++++++++++
 8 files changed, 156 insertions(+), 111 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-plpks
 create mode 100644 arch/powerpc/platforms/pseries/plpks-sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-firmware-plpks b/Documentation/ABI/testing/sysfs-firmware-plpks
new file mode 100644
index 000000000000..af0353f34115
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-plpks
@@ -0,0 +1,50 @@
+What:		/sys/firmware/plpks/config
+Date:		February 2023
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	This optional directory contains read-only config attributes as
+		defined by the PLPKS implementation. All data is in ASCII
+		format.
+
+What:		/sys/firmware/plpks/config/version
+Date:		February 2023
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	Config version as reported by the hypervisor in ASCII decimal
+		format.
+
+What:		/sys/firmware/plpks/config/max_object_size
+Date:		February 2023
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	Maximum allowed size of	objects in the keystore in bytes,
+		represented in ASCII decimal format.
+
+		This is not necessarily the same as the max size that can be
+		written to an update file as writes can contain more than
+		object data, you should use the size of the update file for
+		that purpose.
+
+What:		/sys/firmware/plpks/config/total_size
+Date:		February 2023
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	Total size of the PLPKS in bytes, represented in ASCII decimal
+		format.
+
+What:		/sys/firmware/plpks/config/used_space
+Date:		February 2023
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	Current space consumed by the key store, in bytes, represented
+		in ASCII decimal format.
+
+What:		/sys/firmware/plpks/config/supported_policies
+Date:		February 2023
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	Bitmask of supported policy flags by the hypervisor, represented
+		as an 8 byte hexadecimal ASCII string. Consult the hypervisor
+		documentation for what these flags are.
+
+What:		/sys/firmware/plpks/config/signed_update_algorithms
+Date:		February 2023
+Contact:	Nayna Jain <nayna@linux.ibm.com>
+Description:	Bitmask of flags indicating which algorithms the hypervisor
+		supports for signed update of objects, represented as a 16 byte
+		hexadecimal ASCII string. Consult the hypervisor documentation
+		for what these flags mean.
diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
index 1016967a730f..c52a5fd15709 100644
--- a/Documentation/ABI/testing/sysfs-secvar
+++ b/Documentation/ABI/testing/sysfs-secvar
@@ -63,68 +63,3 @@ Contact:	Nayna Jain <nayna@linux.ibm.com>
 Description:	A write-only file that is used to submit the new value for the
 		variable. The size of the file represents the maximum size of
 		the variable data that can be written.
-
-What:		/sys/firmware/secvar/config
-Date:		February 2023
-Contact:	Nayna Jain <nayna@linux.ibm.com>
-Description:	This optional directory contains read-only config attributes as
-		defined by the secure variable implementation.  All data is in
-		ASCII format. The directory is only created if the backing
-		implementation provides variables to populate it, which at
-		present is only PLPKS on the pseries platform.
-
-What:		/sys/firmware/secvar/config/version
-Date:		February 2023
-Contact:	Nayna Jain <nayna@linux.ibm.com>
-Description:	Config version as reported by the hypervisor in ASCII decimal
-		format.
-
-		Currently only provided by PLPKS on the pseries platform.
-
-What:		/sys/firmware/secvar/config/max_object_size
-Date:		February 2023
-Contact:	Nayna Jain <nayna@linux.ibm.com>
-Description:	Maximum allowed size of	objects in the keystore in bytes,
-		represented in ASCII decimal format.
-
-		This is not necessarily the same as the max size that can be
-		written to an update file as writes can contain more than
-		object data, you should use the size of the update file for
-		that purpose.
-
-		Currently only provided by PLPKS on the pseries platform.
-
-What:		/sys/firmware/secvar/config/total_size
-Date:		February 2023
-Contact:	Nayna Jain <nayna@linux.ibm.com>
-Description:	Total size of the PLPKS in bytes, represented in ASCII decimal
-		format.
-
-		Currently only provided by PLPKS on the pseries platform.
-
-What:		/sys/firmware/secvar/config/used_space
-Date:		February 2023
-Contact:	Nayna Jain <nayna@linux.ibm.com>
-Description:	Current space consumed by the key store, in bytes, represented
-		in ASCII decimal format.
-
-		Currently only provided by PLPKS on the pseries platform.
-
-What:		/sys/firmware/secvar/config/supported_policies
-Date:		February 2023
-Contact:	Nayna Jain <nayna@linux.ibm.com>
-Description:	Bitmask of supported policy flags by the hypervisor,
-		represented as an 8 byte hexadecimal ASCII string. Consult the
-		hypervisor documentation for what these flags are.
-
-		Currently only provided by PLPKS on the pseries platform.
-
-What:		/sys/firmware/secvar/config/signed_update_algorithms
-Date:		February 2023
-Contact:	Nayna Jain <nayna@linux.ibm.com>
-Description:	Bitmask of flags indicating which algorithms the hypervisor
-		supports for signed update of objects, represented as a 16 byte
-		hexadecimal ASCII string. Consult the hypervisor documentation
-		for what these flags mean.
-
-		Currently only provided by PLPKS on the pseries platform.
diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
index f303922bf622..8829a13bfda0 100644
--- a/arch/powerpc/include/asm/plpks.h
+++ b/arch/powerpc/include/asm/plpks.h
@@ -13,6 +13,7 @@
 
 #include <linux/types.h>
 #include <linux/list.h>
+#include <linux/kobject.h>
 
 // Object policy flags from supported_policies
 #define PLPKS_OSSECBOOTAUDIT	PPC_BIT32(1) // OS secure boot must be audit/enforce
@@ -107,11 +108,15 @@ u16 plpks_get_passwordlen(void);
 void plpks_early_init_devtree(void);
 
 int plpks_populate_fdt(void *fdt);
+
+int plpks_config_create_softlink(struct kobject *from);
 #else // CONFIG_PSERIES_PLPKS
 static inline bool plpks_is_available(void) { return false; }
 static inline u16 plpks_get_passwordlen(void) { BUILD_BUG(); }
 static inline void plpks_early_init_devtree(void) { }
 static inline int plpks_populate_fdt(void *fdt) { BUILD_BUG(); }
+static inline int plpks_config_create_softlink(struct kobject *from)
+						{ return 0; }
 #endif // CONFIG_PSERIES_PLPKS
 
 #endif // _ASM_POWERPC_PLPKS_H
diff --git a/arch/powerpc/include/asm/secvar.h b/arch/powerpc/include/asm/secvar.h
index 4828e0ab7e3c..fd5006307f2a 100644
--- a/arch/powerpc/include/asm/secvar.h
+++ b/arch/powerpc/include/asm/secvar.h
@@ -20,7 +20,6 @@ struct secvar_operations {
 	int (*set)(const char *key, u64 key_len, u8 *data, u64 data_size);
 	ssize_t (*format)(char *buf, size_t bufsize);
 	int (*max_size)(u64 *max_size);
-	const struct attribute **config_attrs;
 
 	// NULL-terminated array of fixed variable names
 	// Only used if get_next() isn't provided
diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index ec900bce0257..4111b21962eb 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -12,6 +12,7 @@
 #include <linux/string.h>
 #include <linux/of.h>
 #include <asm/secvar.h>
+#include <asm/plpks.h>
 
 #define NAME_MAX_SIZE	   1024
 
@@ -145,19 +146,6 @@ static __init int update_kobj_size(void)
 	return 0;
 }
 
-static __init int secvar_sysfs_config(struct kobject *kobj)
-{
-	struct attribute_group config_group = {
-		.name = "config",
-		.attrs = (struct attribute **)secvar_ops->config_attrs,
-	};
-
-	if (secvar_ops->config_attrs)
-		return sysfs_create_group(kobj, &config_group);
-
-	return 0;
-}
-
 static __init int add_var(const char *name)
 {
 	struct kobject *kobj;
@@ -260,12 +248,15 @@ static __init int secvar_sysfs_init(void)
 		goto err;
 	}
 
-	rc = secvar_sysfs_config(secvar_kobj);
+	rc = plpks_config_create_softlink(secvar_kobj);
 	if (rc) {
-		pr_err("Failed to create config directory\n");
+		pr_err("Failed to create softlink to PLPKS config directory");
 		goto err;
 	}
 
+	pr_info("/sys/firmware/secvar/config is now deprecated.\n");
+	pr_info("Will be removed in future versions.\n");
+
 	if (secvar_ops->get_next)
 		rc = secvar_sysfs_load();
 	else
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 931ebaa474c8..3ced289a675b 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -30,7 +30,7 @@ obj-$(CONFIG_PAPR_SCM)		+= papr_scm.o
 obj-$(CONFIG_PPC_SPLPAR)	+= vphn.o
 obj-$(CONFIG_PPC_SVM)		+= svm.o
 obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
-obj-$(CONFIG_PSERIES_PLPKS)	+= plpks.o
+obj-$(CONFIG_PSERIES_PLPKS)	+= plpks.o plpks-sysfs.o
 obj-$(CONFIG_PPC_SECURE_BOOT)	+= plpks-secvar.o
 obj-$(CONFIG_PSERIES_PLPKS_SED)	+= plpks_sed_ops.o
 obj-$(CONFIG_SUSPEND)		+= suspend.o
diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc/platforms/pseries/plpks-secvar.c
index f9e9cc40c9d0..a50ff6943d80 100644
--- a/arch/powerpc/platforms/pseries/plpks-secvar.c
+++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
@@ -20,33 +20,6 @@
 #include <asm/secvar.h>
 #include <asm/plpks.h>
 
-// Config attributes for sysfs
-#define PLPKS_CONFIG_ATTR(name, fmt, func)			\
-	static ssize_t name##_show(struct kobject *kobj,	\
-				   struct kobj_attribute *attr,	\
-				   char *buf)			\
-	{							\
-		return sysfs_emit(buf, fmt, func());		\
-	}							\
-	static struct kobj_attribute attr_##name = __ATTR_RO(name)
-
-PLPKS_CONFIG_ATTR(version, "%u\n", plpks_get_version);
-PLPKS_CONFIG_ATTR(max_object_size, "%u\n", plpks_get_maxobjectsize);
-PLPKS_CONFIG_ATTR(total_size, "%u\n", plpks_get_totalsize);
-PLPKS_CONFIG_ATTR(used_space, "%u\n", plpks_get_usedspace);
-PLPKS_CONFIG_ATTR(supported_policies, "%08x\n", plpks_get_supportedpolicies);
-PLPKS_CONFIG_ATTR(signed_update_algorithms, "%016llx\n", plpks_get_signedupdatealgorithms);
-
-static const struct attribute *config_attrs[] = {
-	&attr_version.attr,
-	&attr_max_object_size.attr,
-	&attr_total_size.attr,
-	&attr_used_space.attr,
-	&attr_supported_policies.attr,
-	&attr_signed_update_algorithms.attr,
-	NULL,
-};
-
 static u32 get_policy(const char *name)
 {
 	if ((strcmp(name, "db") == 0) ||
@@ -225,7 +198,6 @@ static const struct secvar_operations plpks_secvar_ops_static = {
 	.set = plpks_set_variable,
 	.format = plpks_secvar_format,
 	.max_size = plpks_max_size,
-	.config_attrs = config_attrs,
 	.var_names = plpks_var_names_static,
 };
 
@@ -234,7 +206,6 @@ static const struct secvar_operations plpks_secvar_ops_dynamic = {
 	.set = plpks_set_variable,
 	.format = plpks_secvar_format,
 	.max_size = plpks_max_size,
-	.config_attrs = config_attrs,
 	.var_names = plpks_var_names_dynamic,
 };
 
diff --git a/arch/powerpc/platforms/pseries/plpks-sysfs.c b/arch/powerpc/platforms/pseries/plpks-sysfs.c
new file mode 100644
index 000000000000..01d526185783
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/plpks-sysfs.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 IBM Corporation, Srish Srinivasan <ssrish@linux.ibm.com>
+ *
+ * This code exposes PLPKS config to user via sysfs
+ */
+
+#define pr_fmt(fmt) "plpks-sysfs: "fmt
+
+#include <linux/init.h>
+#include <linux/printk.h>
+#include <linux/types.h>
+#include <asm/machdep.h>
+#include <asm/plpks.h>
+
+/* config attributes for sysfs */
+#define PLPKS_CONFIG_ATTR(name, fmt, func)			\
+	static ssize_t name##_show(struct kobject *kobj,	\
+				   struct kobj_attribute *attr,	\
+				   char *buf)			\
+	{							\
+		return sysfs_emit(buf, fmt, func());		\
+	}							\
+	static struct kobj_attribute attr_##name = __ATTR_RO(name)
+
+PLPKS_CONFIG_ATTR(version, "%u\n", plpks_get_version);
+PLPKS_CONFIG_ATTR(max_object_size, "%u\n", plpks_get_maxobjectsize);
+PLPKS_CONFIG_ATTR(total_size, "%u\n", plpks_get_totalsize);
+PLPKS_CONFIG_ATTR(used_space, "%u\n", plpks_get_usedspace);
+PLPKS_CONFIG_ATTR(supported_policies, "%08x\n", plpks_get_supportedpolicies);
+PLPKS_CONFIG_ATTR(signed_update_algorithms, "%016llx\n",
+		  plpks_get_signedupdatealgorithms);
+
+static const struct attribute *config_attrs[] = {
+	&attr_version.attr,
+	&attr_max_object_size.attr,
+	&attr_total_size.attr,
+	&attr_used_space.attr,
+	&attr_supported_policies.attr,
+	&attr_signed_update_algorithms.attr,
+	NULL,
+};
+
+static struct kobject *plpks_kobj, *plpks_config_kobj;
+
+int plpks_config_create_softlink(struct kobject *from)
+{
+	if (!plpks_config_kobj)
+		return -EINVAL;
+	return sysfs_create_link(from, plpks_config_kobj, "config");
+}
+
+static __init int plpks_sysfs_config(struct kobject *kobj)
+{
+	struct attribute_group config_group = {
+		.name = NULL,
+		.attrs = (struct attribute **)config_attrs,
+	};
+
+	return sysfs_create_group(kobj, &config_group);
+}
+
+static __init int plpks_sysfs_init(void)
+{
+	int rc;
+
+	if (!plpks_is_available())
+		return -ENODEV;
+
+	plpks_kobj = kobject_create_and_add("plpks", firmware_kobj);
+	if (!plpks_kobj) {
+		pr_err("Failed to create plpks kobj\n");
+		return -ENOMEM;
+	}
+
+	plpks_config_kobj = kobject_create_and_add("config", plpks_kobj);
+	if (!plpks_config_kobj) {
+		pr_err("Failed to create plpks config kobj\n");
+		kobject_put(plpks_kobj);
+		return -ENOMEM;
+	}
+
+	rc = plpks_sysfs_config(plpks_config_kobj);
+	if (rc) {
+		pr_err("Failed to create attribute group for plpks config\n");
+		kobject_put(plpks_config_kobj);
+		kobject_put(plpks_kobj);
+		return rc;
+	}
+
+	return 0;
+}
+
+machine_subsys_initcall(pseries, plpks_sysfs_init);
-- 
2.47.3


