Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE83878072
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 14:22:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qXwQ89WW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtcsD0mRYz3vXS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 00:22:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qXwQ89WW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ttcpw2QHgz3bX9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 00:20:56 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42BCXN1N021451;
	Mon, 11 Mar 2024 13:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9Q+aNdf4aY1ZWQIbQqm5mKOU85sMqxIoieARj6LXs68=;
 b=qXwQ89WW7X+BQKSDUt55gMXYWEyVAP+ocOlgkO7NQ0Hxbvo2FB+08QpTnRaAASUE9nLV
 MqmKh0K4DkopA2FwEU60tkcKAFn687p4qlL3m7stFr1Y3x6X2jcp6938NB/IMUuayaZ2
 9L6cgXmEdvEaogLbe8c6/kXHO+hvwEtciBVEQdpy7xYAw6br2aG/njxx0Sso7v4tVDZR
 qDmspBR0pS7sbmpX12IdAc8b5NQ/AnNp/j2gb9eGPjSx/iwIcnEcKoTUxa7LM3I5WNuJ
 BerFb5UTO3tMAHmiPBg4mPQUUJaTmOH/9smBXTe1fC17RkeuyshOVWUr55RAlrLwvX9o ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wt2290yc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 13:20:47 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42BCYYDX024875;
	Mon, 11 Mar 2024 13:20:47 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wt2290yc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 13:20:47 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42BCZ5bl018133;
	Mon, 11 Mar 2024 13:20:46 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ws23t0wdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 13:20:46 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42BDKhFi31130030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Mar 2024 13:20:46 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D47F65806C;
	Mon, 11 Mar 2024 13:20:43 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 418DB58056;
	Mon, 11 Mar 2024 13:20:43 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 11 Mar 2024 13:20:43 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: mpe@ellerman.id.au, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 3/3] tpm: of: If available use linux,sml-log to get the log and its size
Date: Mon, 11 Mar 2024 09:20:30 -0400
Message-ID: <20240311132030.1103122-4-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240311132030.1103122-1-stefanb@linux.ibm.com>
References: <20240311132030.1103122-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vRub7t0aVGig_2UvQXSQrKNVntS_a5Gn
X-Proofpoint-ORIG-GUID: GJwB-jDVg_6K6X6mXZ_I0GwqJ864FEmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=930 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403110100
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
Cc: devicetree@vger.kernel.org, rnsastry@linux.ibm.com, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, jarkko@kernel.org, peterhuewe@gmx.de, viparash@in.ibm.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If linux,sml-log is available use it to get the TPM log rather than the
pointer found in linux,sml-base. This resolves an issue on PowerVM and KVM
on Power where after a kexec the memory pointed to by linux,sml-base may
have become inaccessible or corrupted. Also, linux,sml-log has replaced
linux,sml-base and linux,sml-size on these two platforms.

Keep the handling of linux,sml-base/sml-size for powernv platforms that
provide the two properties via skiboot.

Fixes: c5df39262dd5 ("drivers/char/tpm: Add securityfs support for event log")
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 drivers/char/tpm/eventlog/of.c | 36 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/char/tpm/eventlog/of.c b/drivers/char/tpm/eventlog/of.c
index 930fe43d5daf..dbd837d65264 100644
--- a/drivers/char/tpm/eventlog/of.c
+++ b/drivers/char/tpm/eventlog/of.c
@@ -54,8 +54,8 @@ int tpm_read_log_of(struct tpm_chip *chip)
 	const u32 *sizep;
 	const u64 *basep;
 	struct tpm_bios_log *log;
+	const void *logp;
 	u32 size;
-	u64 base;
 
 	log = &chip->log;
 	if (chip->dev.parent && chip->dev.parent->of_node)
@@ -66,37 +66,23 @@ int tpm_read_log_of(struct tpm_chip *chip)
 	if (of_property_read_bool(np, "powered-while-suspended"))
 		chip->flags |= TPM_CHIP_FLAG_ALWAYS_POWERED;
 
-	sizep = of_get_property(np, "linux,sml-size", NULL);
-	basep = of_get_property(np, "linux,sml-base", NULL);
-	if (sizep == NULL && basep == NULL)
-		return tpm_read_log_memory_region(chip);
-	if (sizep == NULL || basep == NULL)
-		return -EIO;
-
-	/*
-	 * For both vtpm/tpm, firmware has log addr and log size in big
-	 * endian format. But in case of vtpm, there is a method called
-	 * sml-handover which is run during kernel init even before
-	 * device tree is setup. This sml-handover function takes care
-	 * of endianness and writes to sml-base and sml-size in little
-	 * endian format. For this reason, vtpm doesn't need conversion
-	 * but physical tpm needs the conversion.
-	 */
-	if (of_property_match_string(np, "compatible", "IBM,vtpm") < 0 &&
-	    of_property_match_string(np, "compatible", "IBM,vtpm20") < 0) {
+	logp = of_get_property(np, "linux,sml-log", &size);
+	if (logp == NULL) {
+		sizep = of_get_property(np, "linux,sml-size", NULL);
+		basep = of_get_property(np, "linux,sml-base", NULL);
+		if (sizep == NULL && basep == NULL)
+			return tpm_read_log_memory_region(chip);
+		if (sizep == NULL || basep == NULL)
+			return -EIO;
 		size = be32_to_cpup((__force __be32 *)sizep);
-		base = be64_to_cpup((__force __be64 *)basep);
-	} else {
-		size = *sizep;
-		base = *basep;
+		logp = __va(be64_to_cpup((__force __be64 *)basep));
 	}
-
 	if (size == 0) {
 		dev_warn(&chip->dev, "%s: Event log area empty\n", __func__);
 		return -EIO;
 	}
 
-	log->bios_event_log = devm_kmemdup(&chip->dev, __va(base), size, GFP_KERNEL);
+	log->bios_event_log = devm_kmemdup(&chip->dev, logp, size, GFP_KERNEL);
 	if (!log->bios_event_log)
 		return -ENOMEM;
 
-- 
2.43.0

