Return-Path: <linuxppc-dev+bounces-16318-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GMEHWXReGmNtQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16318-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 15:53:25 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA98960E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 15:53:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0pLS3Q5fz30BR;
	Wed, 28 Jan 2026 01:53:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769525600;
	cv=none; b=lUSgCnsSlyImt7IKnWQGDs/jjfBkwkE3pdixxTHU03guTjDEhQOk55F1b9wcU43kLUID8zkFcvPr306OOZIR9ZMS4whfJUZR8KZZXzVVPteBEAtLQKuIp3ordXaKeeqsxa0lF7+CV9tHKoacEXVPaY/Ye7f6rkVd48BeJ/5/rLaOvUtU0Hq0HgBVNbFgkl0eOItmaJLCeJBwVTOzA617o9S3XTfR1LeEueNxs36kzRf2+Z/L0hEZn/zqziYMpj4wRYZa9XwiA/ARPfcBvsOD30elv5TDlBT/9MU5iOj7BJBpAFK/wuA0M7YmHlv0zxYxNbLiIX6DMdM7knOhSsf/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769525600; c=relaxed/relaxed;
	bh=xb5SJrpsUr6/RMJxxhVCuaDeY2htXoH3IpJC30FEMzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGC/mPy9ByKdbJQ1R4AA/1XH0IlLWZBwoVxWdSYJhz/1DMeKGE1eNEX38PUQpAS6gY/tPGsgb6d/HmH5/FgVYa+pe6c/klDBl52a+IYKNgiyxrbMbarGAFVbbmDkRCW2bNADt8iPSQ/ay8y2NN/Gg5eOGjWwU1WUTRs6u5NAUq40ltnp56uJ/y9X8YUp2mY7m1xACOCpZoYpDqkjPYnhobSgxHvKIHdlpNAYb1X6Kfn1y9fSQhbJA6WN1F/+l+XgYQrJXZoWTHFRj2MQdq6PSAPfUpxYKKHhsWeNiuZV7Gp0FcASQwqOIewp8FBjnH3CzSWyOxVL/nrB/cNko0Qi0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U7DSf0yb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U7DSf0yb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0pLR4JMFz2xXB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 01:53:19 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60R2MIU6006601;
	Tue, 27 Jan 2026 14:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=xb5SJrpsUr6/RMJxx
	hVCuaDeY2htXoH3IpJC30FEMzw=; b=U7DSf0ybFPJ+SSWYb2MO1tAKrZihKnxeW
	5YkX289hG90OCTfAaacGO7ttwT9YPN2TOChyFbKEKNdqHoIbGbL79H/U+mwC85I/
	WVoQQ4PcHaVm33VyViG9KyCDnRsUwxmHuPmk8yYoubEdl+bEqVE4T+ZkpEBOWp/N
	gQgivbNNwdeDav3lzh7TGOniXPNNCeY6O/flYTVdHvTpukuRbWpVHrIgFScr70g8
	gM8xAq8bbyqu3OW9aMlZf5ttSBLpcnfv9pTBZMSYE/Lcv1lr5IGpLc7M5bcp7vN1
	BeUyLAOVcsKfcxI+qvJwmyG+6s81lJv0GSjjFRPxV3l7yvIbQJspw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvkgmmf92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 14:52:58 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60REN4Zt012114;
	Tue, 27 Jan 2026 14:52:57 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvkgmmf90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 14:52:57 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60REgn1n023641;
	Tue, 27 Jan 2026 14:52:57 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bwamjrus9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 14:52:56 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60REqrVJ48824610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 14:52:53 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F06BC2004B;
	Tue, 27 Jan 2026 14:52:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1539D20040;
	Tue, 27 Jan 2026 14:52:49 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.124.210.108])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Jan 2026 14:52:48 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v5 3/6] pseries/plpks: expose PowerVM wrapping features via the sysfs
Date: Tue, 27 Jan 2026 20:22:25 +0530
Message-ID: <20260127145228.48320-4-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127145228.48320-1-ssrish@linux.ibm.com>
References: <20260127145228.48320-1-ssrish@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Gr1PO01C c=1 sm=1 tr=0 ts=6978d14a cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=z7cUUKlKUSfJ7xv5IYMA:9
X-Proofpoint-GUID: 1SNBvMGQx0hK2bnxD5iIb-_xVsLtDteo
X-Proofpoint-ORIG-GUID: lRm3PORmYgCtaPKqaE5BtkZe3djJt-hN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMSBTYWx0ZWRfX7m02MwOf8QnL
 vg/Smml79IGjKz0OihZDt2xLBD6TcVVLtDp0vGSFBTcrDCJQv+ri/UgxDIaTcEDMnZtf/B0wcdg
 +mUNk0LQu9fTGRWlFiM9PiRsCoyhnAtYuWNxrAVIiPWwuuGqcP8UyumKZlFU//yrin/qotunK8V
 LmhMaicAEkhqWx/BIKOl4RmqIT2ZgXAr1mzDkAGQvXdTvyVx0NvIUJPqM4yDSTXzJMUgo7LBFvW
 liwuVhpQPffcZA/dEVBJOJm43ImGKqQ4zzvxIhoLt8ROMeJPXq1h3lQMyttZwlM+195LrAdjJFz
 Pp1mN9M0u36Geyu2YvGSd/p78gT9AMqQmCunsGT2BcnWR0p8BARvmX5ruS7v8v7/l0g8iq+OGz/
 VJY/kcMCT6MW3GUbCV9kzWVGTAIhLi+IOZfEUgByhhbuoO0IXeheWoQKi099ToSvYAUuRHIgmyD
 K3N0WzGr8iauabEZ7Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601270121
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-integrity@vger.kernel.org,m:keyrings@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:James.Bottomley@HansenPartnership.com,m:jarkko@kernel.org,m:zohar@linux.ibm.com,m:nayna@linux.ibm.com,m:rnsastry@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:ssrish@linux.ibm.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,HansenPartnership.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16318-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.988];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: BEA98960E7
X-Rspamd-Action: no action

Starting with Power11, PowerVM supports a new feature called "Key Wrapping"
that protects user secrets by wrapping them using a hypervisor generated
wrapping key. The status of this feature can be read by the
H_PKS_GET_CONFIG HCALL.

Expose the Power LPAR Platform KeyStore (PLPKS) wrapping features config
via the sysfs file /sys/firmware/plpks/config/wrapping_features.

Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
Reviewed-by: Nayna Jain <nayna@linux.ibm.com>
---
 .../ABI/testing/sysfs-firmware-plpks          |  8 ++++++++
 arch/powerpc/include/asm/hvcall.h             |  4 +++-
 arch/powerpc/include/asm/plpks.h              |  3 +++
 arch/powerpc/platforms/pseries/plpks-sysfs.c  |  2 ++
 arch/powerpc/platforms/pseries/plpks.c        | 20 +++++++++++++++++++
 5 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-firmware-plpks b/Documentation/ABI/testing/sysfs-firmware-plpks
index af0353f34115..cba061e4eee2 100644
--- a/Documentation/ABI/testing/sysfs-firmware-plpks
+++ b/Documentation/ABI/testing/sysfs-firmware-plpks
@@ -48,3 +48,11 @@ Description:	Bitmask of flags indicating which algorithms the hypervisor
 		supports for signed update of objects, represented as a 16 byte
 		hexadecimal ASCII string. Consult the hypervisor documentation
 		for what these flags mean.
+
+What:		/sys/firmware/plpks/config/wrapping_features
+Date:		November 2025
+Contact:	Srish Srinivasan <ssrish@linux.ibm.com>
+Description:	Bitmask of the wrapping features indicating the wrapping
+		algorithms that are supported for the H_PKS_WRAP_OBJECT requests
+		, represented as a 8 byte hexadecimal ASCII string. Consult the
+		hypervisor documentation for what these flags mean.
diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 9aef16149d92..dff90a7d7f70 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -360,7 +360,9 @@
 #define H_GUEST_RUN_VCPU	0x480
 #define H_GUEST_COPY_MEMORY	0x484
 #define H_GUEST_DELETE		0x488
-#define MAX_HCALL_OPCODE	H_GUEST_DELETE
+#define H_PKS_WRAP_OBJECT	0x490
+#define H_PKS_UNWRAP_OBJECT	0x494
+#define MAX_HCALL_OPCODE	H_PKS_UNWRAP_OBJECT
 
 /* Scope args for H_SCM_UNBIND_ALL */
 #define H_UNBIND_SCOPE_ALL (0x1)
diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
index 8829a13bfda0..8f034588fdf7 100644
--- a/arch/powerpc/include/asm/plpks.h
+++ b/arch/powerpc/include/asm/plpks.h
@@ -23,6 +23,7 @@
 #define PLPKS_IMMUTABLE		PPC_BIT32(5) // Once written, object cannot be removed
 #define PLPKS_TRANSIENT		PPC_BIT32(6) // Object does not persist through reboot
 #define PLPKS_SIGNEDUPDATE	PPC_BIT32(7) // Object can only be modified by signed updates
+#define PLPKS_WRAPPINGKEY	PPC_BIT32(8) // Object contains a wrapping key
 #define PLPKS_HVPROVISIONED	PPC_BIT32(28) // Hypervisor has provisioned this object
 
 // Signature algorithm flags from signed_update_algorithms
@@ -103,6 +104,8 @@ u32 plpks_get_maxlargeobjectsize(void);
 
 u64 plpks_get_signedupdatealgorithms(void);
 
+u64 plpks_get_wrappingfeatures(void);
+
 u16 plpks_get_passwordlen(void);
 
 void plpks_early_init_devtree(void);
diff --git a/arch/powerpc/platforms/pseries/plpks-sysfs.c b/arch/powerpc/platforms/pseries/plpks-sysfs.c
index 01d526185783..c2ebcbb41ae3 100644
--- a/arch/powerpc/platforms/pseries/plpks-sysfs.c
+++ b/arch/powerpc/platforms/pseries/plpks-sysfs.c
@@ -30,6 +30,7 @@ PLPKS_CONFIG_ATTR(used_space, "%u\n", plpks_get_usedspace);
 PLPKS_CONFIG_ATTR(supported_policies, "%08x\n", plpks_get_supportedpolicies);
 PLPKS_CONFIG_ATTR(signed_update_algorithms, "%016llx\n",
 		  plpks_get_signedupdatealgorithms);
+PLPKS_CONFIG_ATTR(wrapping_features, "%016llx\n", plpks_get_wrappingfeatures);
 
 static const struct attribute *config_attrs[] = {
 	&attr_version.attr,
@@ -38,6 +39,7 @@ static const struct attribute *config_attrs[] = {
 	&attr_used_space.attr,
 	&attr_supported_policies.attr,
 	&attr_signed_update_algorithms.attr,
+	&attr_wrapping_features.attr,
 	NULL,
 };
 
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 03722fabf9c3..4a08f51537c8 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -38,6 +38,7 @@ static u32 usedspace;
 static u32 supportedpolicies;
 static u32 maxlargeobjectsize;
 static u64 signedupdatealgorithms;
+static u64 wrappingfeatures;
 
 struct plpks_auth {
 	u8 version;
@@ -248,6 +249,7 @@ static int _plpks_get_config(void)
 		__be32 supportedpolicies;
 		__be32 maxlargeobjectsize;
 		__be64 signedupdatealgorithms;
+		__be64 wrappingfeatures;
 		u8 rsvd1[476];
 	} __packed * config;
 	size_t size;
@@ -280,6 +282,7 @@ static int _plpks_get_config(void)
 	supportedpolicies = be32_to_cpu(config->supportedpolicies);
 	maxlargeobjectsize = be32_to_cpu(config->maxlargeobjectsize);
 	signedupdatealgorithms = be64_to_cpu(config->signedupdatealgorithms);
+	wrappingfeatures = be64_to_cpu(config->wrappingfeatures);
 
 	// Validate that the numbers we get back match the requirements of the spec
 	if (maxpwsize < 32) {
@@ -472,6 +475,23 @@ u64 plpks_get_signedupdatealgorithms(void)
 	return signedupdatealgorithms;
 }
 
+/**
+ * plpks_get_wrappingfeatures() - Returns a bitmask of the wrapping features
+ * supported by the hypervisor.
+ *
+ * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
+ * reads a bitmask of the wrapping features supported by the hypervisor into the
+ * file local static wrappingfeatures variable. This is valid only when the
+ * PLPKS config structure version >= 3.
+ *
+ * Return:
+ *	bitmask of the wrapping features supported by the hypervisor
+ */
+u64 plpks_get_wrappingfeatures(void)
+{
+	return wrappingfeatures;
+}
+
 /**
  * plpks_get_passwordlen() - Get the length of the PLPKS password in bytes.
  *
-- 
2.47.3


