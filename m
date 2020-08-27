Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 091AA253C7E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 06:15:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcTsg4Hq2zDqTk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 14:15:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VInjLyTu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcTlk2TzxzDqP4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 14:10:09 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R43n1a085561; Thu, 27 Aug 2020 00:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eifKVsDbRbopsP0ZUb864SiZ0JrW+hOdop5VB2jUFlU=;
 b=VInjLyTua3fhpPu1W+om6ZnH94Yv425xfOotJf2g/Sai31L/rxAcTDqWS74qpYm3NDt1
 QB5ZLc6natwKDtOSK3XsKOMRRx1uzbPsr25uoI/EyXDUESvoil0Za/Wt83lQpZv08Tpq
 DM7lyLNI3IEO7V7uhfarnQmL8j83PldXp2TkVoFEPTIzG6PyCgwk/hDvLwslRwLdhhJj
 nf2+chZMAlif6ozfopUDMnl757/DgXD8rKyqKkXpqWZNAysFMDTRvtVnL0RwlhiEjUyN
 sFC9YuopXw7ShG6aMRaK4kNCSNm6Rpn9virv+EmykXRwnCYA88AZ51Aqh9ykMBCAjWBr WQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3364a89v2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 00:10:06 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R47aYC001975;
 Thu, 27 Aug 2020 04:10:05 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 332ujrgrdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:10:05 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R4A46l27853234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 04:10:04 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FCFC2805C;
 Thu, 27 Aug 2020 04:10:04 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26F8E28059;
 Thu, 27 Aug 2020 04:10:03 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.74.195])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 04:10:02 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 02/23] KVM: PPC: BOOK3S: PR: Ignore UAMOR SPR
Date: Thu, 27 Aug 2020 09:39:10 +0530
Message-Id: <20200827040931.297759-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_14:2020-08-26,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=964 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270033
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With power7 and above we expect the cpu to support keys. The
number of keys are firmware controlled based on device tree.
PR KVM do not expose key details via device tree. Hence when running with PR KVM
we do run with MMU_FTR_KEY support disabled. But we can still
get updates on UAMOR. Hence ignore access to them and for mfstpr return
0 indicating no AMR/IAMR update is no allowed.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_emulate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_emulate.c b/arch/powerpc/kvm/book3s_emulate.c
index 0effd48c8f4d..b08cc15f31c7 100644
--- a/arch/powerpc/kvm/book3s_emulate.c
+++ b/arch/powerpc/kvm/book3s_emulate.c
@@ -840,6 +840,9 @@ int kvmppc_core_emulate_mtspr_pr(struct kvm_vcpu *vcpu, int sprn, ulong spr_val)
 	case SPRN_MMCR1:
 	case SPRN_MMCR2:
 	case SPRN_UMMCR2:
+	case SPRN_UAMOR:
+	case SPRN_IAMR:
+	case SPRN_AMR:
 #endif
 		break;
 unprivileged:
@@ -1004,6 +1007,9 @@ int kvmppc_core_emulate_mfspr_pr(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val
 	case SPRN_MMCR2:
 	case SPRN_UMMCR2:
 	case SPRN_TIR:
+	case SPRN_UAMOR:
+	case SPRN_IAMR:
+	case SPRN_AMR:
 #endif
 		*spr_val = 0;
 		break;
-- 
2.26.2

