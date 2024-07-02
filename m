Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ED191EE2E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 07:14:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mLr5seH8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCrgL5vMxz3cG6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 15:14:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mLr5seH8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCrdF73Vrz3cVl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 15:12:33 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4624u0QT001032;
	Tue, 2 Jul 2024 05:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=pk3xPJVNLS003
	ml+9aeazey8+AZ/42clfJ+8vt3m/UU=; b=mLr5seH8VOLVrk3y1Ue3pXiRom8Ms
	1yhJLJbEQKEzFyHbcDjJvNBT9fvCDv3/NtajB+fSN5z5vK1Z8Q47dDDcfmnYa8vs
	rYo2mW0RjFxVZEHcH6BftqyFMgq1sbCYXQJ8gMPKOhfFqbprurafYhiecHDvdBGp
	aBkVjbZLkQbjs/bOqtdxVxrUI+1vtp84HCAjMJ8DAprSNjfsksymQyZol4FAwhQ6
	SPkF9z8yYvgus6fjngqMmn/TUEDZu5AjXi0qMxKmf0A6JIY/EkdbYs/a+4cd9NwZ
	vkU1cKOVzc29XOrM+9rgpALbOvxTPYNx83AfNRuSsKEEHyxuksG9/me3Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 404ajrg2vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 05:12:26 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4625CPLj028645;
	Tue, 2 Jul 2024 05:12:25 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 404ajrg2ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 05:12:25 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4624LdXM009529;
	Tue, 2 Jul 2024 05:12:25 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 402xtmjt3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 05:12:24 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4625CJbq10813816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jul 2024 05:12:21 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78A8420040;
	Tue,  2 Jul 2024 05:12:19 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E71EE2004E;
	Tue,  2 Jul 2024 05:12:16 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.124.209.194])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Jul 2024 05:12:16 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 3/3] powerpc: Document details on H_HTM hcall
Date: Tue,  2 Jul 2024 10:41:45 +0530
Message-ID: <20240702051145.251267-3-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702051145.251267-1-maddy@linux.ibm.com>
References: <20240702051145.251267-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n9ZazsXX_TWU6PQhUMMWsK6xgQ_u9ALh
X-Proofpoint-ORIG-GUID: RHmzKp5w_KEGSMSWC-VuLz3X1cZTkzN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_01,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020033
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, christophe.leroy@csgroup.eu, Madhavan Srinivasan <maddy@linux.ibm.com>, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add documentation to 'papr_hcalls.rst' describing the
input, output and return values of the H_HTM hcall as
per the internal specification.

With patch series applied and booted, list of files in debugfs path

# pwd
/sys/kernel/debug/powerpc/htmdump
# ls
coreindexonchip  htmtype  nodalchipindex  nodeindex  trace

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Updated commit message to include htmdump folder files 

 Documentation/arch/powerpc/papr_hcalls.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/arch/powerpc/papr_hcalls.rst b/Documentation/arch/powerpc/papr_hcalls.rst
index 80d2c0aadab5..805e1cb9bab9 100644
--- a/Documentation/arch/powerpc/papr_hcalls.rst
+++ b/Documentation/arch/powerpc/papr_hcalls.rst
@@ -289,6 +289,17 @@ to be issued multiple times in order to be completely serviced. The
 subsequent hcalls to the hypervisor until the hcall is completely serviced
 at which point H_SUCCESS or other error is returned by the hypervisor.
 
+**H_HTM**
+
+| Input: flags, target, operation (op), op-param1, op-param2, op-param3
+| Out: *dumphtmbufferdata*
+| Return Value: *H_Success,H_Busy,H_LongBusyOrder,H_Partial,H_Parameter,
+		 H_P2,H_P3,H_P4,H_P5,H_P6,H_State,H_Not_Available,H_Authority*
+
+H_HTM supports setup, configuration, control and dumping of Hardware Trace
+Macro (HTM) function and its data. HTM buffer stores tracing data for functions
+like core instruction, core LLAT and nest.
+
 References
 ==========
 .. [1] "Power Architecture Platform Reference"
-- 
2.45.2

