Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5424C487DF5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 22:04:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVwhR1HMJz3dkB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jan 2022 08:04:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N0Zk2TSX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N0Zk2TSX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVwbr52Qwz3bPX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jan 2022 08:00:40 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207Jg5HP020752; 
 Fri, 7 Jan 2022 21:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VwgpCstIPWtZogBME59/zB3/vE5WdaW4GaSwSX5LugU=;
 b=N0Zk2TSXsTJuz+ktUQSONRMEhsr5G87Ly6d476ZljYtwzD+So1/f1vGbxfj2qIqGRoar
 ULAFpCiQGhpA4cLNWXtK/xRyxgiVk+N+y1RIYjM4c4qfxNweECCajqm91jl9zmKOKcF/
 VhJEqZgYqamXVOij2RAku+PucDAFrlRjqF8RpVZIaJ75DKfdxPU/xZ+ox3xkvhu7AuwK
 8lEYndb4X5TUO+8zUr6XtgiusjYweIDV6UPWAMdUgfrtlVIkZaHJDmumZiVX0GnIyYYJ
 00dysRDfCDjcG2U1lvV4v2oyZQJzghyb5eC5Pm/voMVHei7wThSZRrVm3WLUfVWBOalX 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wg9jye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 21:00:31 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207Knlhv038371;
 Fri, 7 Jan 2022 21:00:31 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wg9jy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 21:00:31 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207KqSfx000536;
 Fri, 7 Jan 2022 21:00:30 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 3de5fqckw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 21:00:30 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207L0Shg31064362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 21:00:28 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94E3978066;
 Fri,  7 Jan 2022 21:00:28 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05D3E78063;
 Fri,  7 Jan 2022 21:00:27 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.174])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 21:00:26 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 4/6] KVM: PPC: mmio: Queue interrupt at kvmppc_emulate_mmio
Date: Fri,  7 Jan 2022 18:00:10 -0300
Message-Id: <20220107210012.4091153-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107210012.4091153-1-farosas@linux.ibm.com>
References: <20220107210012.4091153-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DJXczPn7RRW7VeDYOMTAewdRY3G21liL
X-Proofpoint-ORIG-GUID: mHOQHwLYdC6ggQybAwJVHprr-XbjeiYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_09,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 mlxlogscore=886
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201070125
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, aik@ozlabs.ru
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If MMIO emulation fails, we queue a Program interrupt to the
guest. Move that line up into kvmppc_emulate_mmio, which is where we
set RESUME_GUEST/HOST. This allows the removal of the 'advance'
variable.

No functional change, just separation of responsibilities.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/emulate_loadstore.c | 8 +-------
 arch/powerpc/kvm/powerpc.c           | 2 +-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
index 48272a9b9c30..4dec920fe4c9 100644
--- a/arch/powerpc/kvm/emulate_loadstore.c
+++ b/arch/powerpc/kvm/emulate_loadstore.c
@@ -73,7 +73,6 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 {
 	u32 inst;
 	enum emulation_result emulated = EMULATE_FAIL;
-	int advance = 1;
 	struct instruction_op op;
 
 	/* this default type might be overwritten by subcategories */
@@ -355,15 +354,10 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 		}
 	}
 
-	if (emulated == EMULATE_FAIL) {
-		advance = 0;
-		kvmppc_core_queue_program(vcpu, 0);
-	}
-
 	trace_kvm_ppc_instr(inst, kvmppc_get_pc(vcpu), emulated);
 
 	/* Advance past emulated instruction. */
-	if (advance)
+	if (emulated != EMULATE_FAIL)
 		kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) + 4);
 
 	return emulated;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 4d7d0d080232..6daeea4a7de1 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -307,7 +307,7 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
 		u32 last_inst;
 
 		kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
-		/* XXX Deliver Program interrupt to guest. */
+		kvmppc_core_queue_program(vcpu, 0);
 		pr_info("%s: emulation failed (%08x)\n", __func__, last_inst);
 		r = RESUME_HOST;
 		break;
-- 
2.33.1

