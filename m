Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0939671424
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 07:30:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxbVl5ZJgz3fhV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 17:30:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fTOYWFVn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fTOYWFVn;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxb4G1bVrz3bVf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 17:11:25 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I3mCMX028883;
	Wed, 18 Jan 2023 06:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mkAI3uIQ9yV9PNhHRzDDGrjQklI07AEWIgiptDKoL6Q=;
 b=fTOYWFVnbZqHvDJFW7wiDsOUjhcWp1H1i5wHMgiciQY+sRTpuY5LycoiovIZVGc2EyBs
 kl/2kypNui87yIrlUk9QbXWXIujTEVkxLfAgYk3Td2uaocMpcVJdVh4sBkBKSvs+k5aK
 segL+vWCWmfDFk1AgKVhzAQ4zqd58/uKG7acAzg0msyHxBfARR0MxvLK+5YSSLctC17L
 njPIcHnxMcD6a3bhTYsLoWry6kjWQCVSZZvf3/C6uzm3K/7LP7moUR2wf2lbF5+07Vh8
 UwIVJ3W+yCo5KFHiGDx75rl28UVgufgYhK0J0WhMTkGGUJTDujPCluPIhlUc/xu2Yhs+ mA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n696dah4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 06:11:19 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HMNxWs004735;
	Wed, 18 Jan 2023 06:11:18 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3n3m16mtnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 06:11:18 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30I6BFn022545024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jan 2023 06:11:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A980B20040;
	Wed, 18 Jan 2023 06:11:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3D3A2004B;
	Wed, 18 Jan 2023 06:11:14 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Jan 2023 06:11:14 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7CE206096D;
	Wed, 18 Jan 2023 17:11:08 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v3 16/24] powerpc/pseries: Implement signed update for PLPKS objects
Date: Wed, 18 Jan 2023 17:10:41 +1100
Message-Id: <20230118061049.1006141-17-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061049.1006141-1-ajd@linux.ibm.com>
References: <20230118061049.1006141-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PRrhUTnQhsbSoj2ky06DQqmOKSPAS4RI
X-Proofpoint-ORIG-GUID: PRrhUTnQhsbSoj2ky06DQqmOKSPAS4RI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_01,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301180051
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
Cc: sudhakar@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nayna Jain <nayna@linux.ibm.com>

The Platform Keystore provides a signed update interface which can be used
to create, replace or append to certain variables in the PKS in a secure
fashion, with the hypervisor requiring that the update be signed using the
Platform Key.

Implement an interface to the H_PKS_SIGNED_UPDATE hcall in the plpks
driver to allow signed updates to PKS objects.

(The plpks driver doesn't need to do any cryptography or otherwise handle
the actual signed variable contents - that will be handled by userspace
tooling.)

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
[ajd: split patch, add timeout handling and misc cleanups]
Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Russell Currey <ruscur@russell.cc>

---

v3: Merge plpks fixes and signed update series with secvar series

    Fix error code handling in plpks_confirm_object_flushed() (ruscur)

    Pass plpks_var struct to plpks_signed_update_var() by reference (mpe)

    Consistent constant naming scheme (ruscur)
---
 arch/powerpc/include/asm/hvcall.h      |  3 +-
 arch/powerpc/include/asm/plpks.h       |  5 ++
 arch/powerpc/platforms/pseries/plpks.c | 71 ++++++++++++++++++++++++--
 3 files changed, 73 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 95fd7f9485d5..33b26c0cb69b 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -336,7 +336,8 @@
 #define H_SCM_FLUSH		0x44C
 #define H_GET_ENERGY_SCALE_INFO	0x450
 #define H_WATCHDOG		0x45C
-#define MAX_HCALL_OPCODE	H_WATCHDOG
+#define H_PKS_SIGNED_UPDATE	0x454
+#define MAX_HCALL_OPCODE	H_PKS_SIGNED_UPDATE
 
 /* Scope args for H_SCM_UNBIND_ALL */
 #define H_UNBIND_SCOPE_ALL (0x1)
diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
index 7c5f51a9af7c..e7204e6c0ca4 100644
--- a/arch/powerpc/include/asm/plpks.h
+++ b/arch/powerpc/include/asm/plpks.h
@@ -68,6 +68,11 @@ struct plpks_var_name_list {
 	struct plpks_var_name varlist[];
 };
 
+/**
+ * Updates the authenticated variable. It expects NULL as the component.
+ */
+int plpks_signed_update_var(struct plpks_var *var, u64 flags);
+
 /**
  * Writes the specified var and its data to PKS.
  * Any caller of PKS driver should present a valid component type for
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 1189246b03dc..796ed5544ee5 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -81,6 +81,12 @@ static int pseries_status_to_err(int rc)
 		err = -ENOENT;
 		break;
 	case H_BUSY:
+	case H_LONG_BUSY_ORDER_1_MSEC:
+	case H_LONG_BUSY_ORDER_10_MSEC:
+	case H_LONG_BUSY_ORDER_100_MSEC:
+	case H_LONG_BUSY_ORDER_1_SEC:
+	case H_LONG_BUSY_ORDER_10_SEC:
+	case H_LONG_BUSY_ORDER_100_SEC:
 		err = -EBUSY;
 		break;
 	case H_AUTHORITY:
@@ -184,14 +190,17 @@ static struct label *construct_label(char *component, u8 varos, u8 *name,
 				     u16 namelen)
 {
 	struct label *label;
-	size_t slen;
+	size_t slen = 0;
 
 	if (!name || namelen > PLPKS_MAX_NAME_SIZE)
 		return ERR_PTR(-EINVAL);
 
-	slen = strlen(component);
-	if (component && slen > sizeof(label->attr.prefix))
-		return ERR_PTR(-EINVAL);
+	// Support NULL component for signed updates
+	if (component) {
+		slen = strlen(component);
+		if (slen > sizeof(label->attr.prefix))
+			return ERR_PTR(-EINVAL);
+	}
 
 	// The label structure must not cross a page boundary, so we align to the next power of 2
 	label = kzalloc(roundup_pow_of_two(sizeof(*label)), GFP_KERNEL);
@@ -397,6 +406,58 @@ static int plpks_confirm_object_flushed(struct label *label,
 	return pseries_status_to_err(rc);
 }
 
+int plpks_signed_update_var(struct plpks_var *var, u64 flags)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
+	int rc;
+	struct label *label;
+	struct plpks_auth *auth;
+	u64 continuetoken = 0;
+	u64 timeout = 0;
+
+	if (!var->data || var->datalen <= 0 || var->namelen > PLPKS_MAX_NAME_SIZE)
+		return -EINVAL;
+
+	if (!(var->policy & PLPKS_SIGNEDUPDATE))
+		return -EINVAL;
+
+	auth = construct_auth(PLPKS_OS_OWNER);
+	if (IS_ERR(auth))
+		return PTR_ERR(auth);
+
+	label = construct_label(var->component, var->os, var->name, var->namelen);
+	if (IS_ERR(label)) {
+		rc = PTR_ERR(label);
+		goto out;
+	}
+
+	do {
+		rc = plpar_hcall9(H_PKS_SIGNED_UPDATE, retbuf,
+				  virt_to_phys(auth), virt_to_phys(label),
+				  label->size, var->policy, flags,
+				  virt_to_phys(var->data), var->datalen,
+				  continuetoken);
+
+		continuetoken = retbuf[0];
+		if (pseries_status_to_err(rc) == -EBUSY) {
+			int delay_ms = get_longbusy_msecs(rc);
+			mdelay(delay_ms);
+			timeout += delay_ms;
+		}
+		rc = pseries_status_to_err(rc);
+	} while (rc == -EBUSY && timeout < PLPKS_MAX_TIMEOUT);
+
+	if (!rc)
+		rc = plpks_confirm_object_flushed(label, auth);
+
+	kfree(label);
+out:
+	kfree(auth);
+
+	return rc;
+}
+EXPORT_SYMBOL(plpks_signed_update_var);
+
 int plpks_write_var(struct plpks_var var)
 {
 	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
@@ -443,7 +504,7 @@ int plpks_remove_var(char *component, u8 varos, struct plpks_var_name vname)
 	struct label *label;
 	int rc;
 
-	if (!component || vname.namelen > PLPKS_MAX_NAME_SIZE)
+	if (vname.namelen > PLPKS_MAX_NAME_SIZE)
 		return -EINVAL;
 
 	auth = construct_auth(PLPKS_OS_OWNER);
-- 
2.39.0

