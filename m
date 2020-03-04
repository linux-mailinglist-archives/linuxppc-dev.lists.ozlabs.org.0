Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E729179431
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 17:00:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xdr32ynVzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 03:00:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Xdmc3HvYzDqVc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 02:57:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48XdmY6yzyz8tDY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 02:57:01 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48XdmY5bB1z9sSQ; Thu,  5 Mar 2020 02:57:01 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48XdmY0M2Yz9sQt
 for <linuxppc-dev@ozlabs.org>; Thu,  5 Mar 2020 02:57:00 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 024FuRpN059944
 for <linuxppc-dev@ozlabs.org>; Wed, 4 Mar 2020 10:56:59 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yhyxqyc9v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 04 Mar 2020 10:56:58 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Wed, 4 Mar 2020 15:56:57 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Mar 2020 15:56:54 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 024Fuq9027787402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Mar 2020 15:56:52 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 007DAA405D;
 Wed,  4 Mar 2020 15:56:52 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA117A405B;
 Wed,  4 Mar 2020 15:56:49 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.85.81.47])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 Mar 2020 15:56:49 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: skiboot@lists.ozlabs.org, oohall@gmail.com, mikey@neuling.org,
 npiggin@gmail.com, vaidy@linux.ibm.com, ego@linux.vnet.ibm.com,
 linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, psampat@linux.ibm.com, pratik.r.sampat@gmail.com
Subject: [RFC] Support stop state version quirk and firmware enabled stop
Date: Wed,  4 Mar 2020 21:26:48 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030415-0016-0000-0000-000002ED2A5E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030415-0017-0000-0000-0000335079B7
Message-Id: <20200304155648.11501-1-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_05:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003040117
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A concept patch in Skiboot to illustrate the case wherein handling of
stop states for different DD versions of a CPU can be achieved by a
simple modification in the list of cpu_features.
As an example idle-stop1 is defined which uses P9_CPU_DD1 to define the
cpu feature.

Along with that, an implementation is being worked upon the LE OPAL
series which helps OPAL handle the stop state entry and exit.

This patch advertises this capability of the firmware which can be
availed if the quirk-version-setting is not cognizable.

The firmware-enabled stop is being worked by Abhishek Goel
<huntbag@linux.vnet.ibm.com> building upon the LE OPAL series.

Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 core/cpufeatures.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/core/cpufeatures.c b/core/cpufeatures.c
index ec30c975..b9875e7b 100644
--- a/core/cpufeatures.c
+++ b/core/cpufeatures.c
@@ -510,6 +510,25 @@ static const struct cpu_feature cpu_features_table[] = {
 	-1, -1, -1,
 	NULL, },
 
+	/*
+	 * QUIRK for ISAv3.0B stop idle instructions and registers
+	 * Helps us determine if there are any quirks
+	 * XXX: Same of idle-stop
+	 */
+	{ "idle-stop-v1",
+	CPU_P9_DD1,
+	ISA_V3_0B, USABLE_HV|USABLE_OS,
+	HV_CUSTOM, OS_CUSTOM,
+	-1, -1, -1,
+	NULL, },
+
+	{ "firmware-stop-supported",
+	CPU_P9,
+	ISA_V3_0B, USABLE_HV|USABLE_OS,
+	HV_CUSTOM, OS_CUSTOM,
+	-1, -1, -1,
+	NULL, },
+
 	/*
 	 * ISAv3.0B Hypervisor Virtualization Interrupt
 	 * Also associated system registers, LPCR EE, HEIC, HVICE,
@@ -883,6 +902,9 @@ static void add_cpufeatures(struct dt_node *cpus,
 		const struct cpu_feature *f = &cpu_features_table[i];
 
 		if (f->cpus_supported & cpu_feature_cpu) {
+			if (!strcmp(f->name, "firmware-stop-supported") &&
+			    HAVE_BIG_ENDIAN)
+				continue;
 			DBG("  '%s'\n", f->name);
 			add_cpu_feature_nodeps(features, f);
 		}
-- 
2.24.1

