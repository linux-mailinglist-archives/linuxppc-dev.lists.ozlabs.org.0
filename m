Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E502C3869
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 06:21:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgq440GnszDq96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:21:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bYcQRqrz; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgpzL17hkzDqPk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 16:17:01 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AP52o0c075662; Wed, 25 Nov 2020 00:16:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=acjDKGK3vhfzqtBJ7XBLIJPZscfCGisORxa83+ivs08=;
 b=bYcQRqrzp4fy13L9pQ3Ydq6BQaPp7xv/68+HV7nfz/e6fdDIk48GZ/zjyMsgAIal4VJp
 7sTwf4A0L1tFJ7ZNYzMGwND7kCLkWAwjnL4i9Yq6CPdEY4Dar9C9sKWYArd2jZCGgL4J
 XO2G+JgnVAvu4c7JecHdqvkiw3FdcOsL0P9FXYekj79pst/pKy8/XW4uNdNxiR29eqxg
 SE5xoDJm8dY5ZCgjCvRzkptJBlNWI0rDgD/UN6JW3xybZj2lJHnO9ycoZErdKpLmgIBI
 SaY85c8v3VgCqs/QCGZEJmG6YszkGIZ5JniQkf7TW5YfKTsMHFQqsIjssJcIlrzGyA7g 0g== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350vbvxw7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 00:16:56 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AP5D6HL019129;
 Wed, 25 Nov 2020 05:16:55 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 34xtha42fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 05:16:55 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AP5Gtud21169010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 05:16:55 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1F0412405C;
 Wed, 25 Nov 2020 05:16:54 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9464A124054;
 Wed, 25 Nov 2020 05:16:53 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.195.3])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 05:16:53 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 02/22] KVM: PPC: BOOK3S: PR: Ignore UAMOR SPR
Date: Wed, 25 Nov 2020 10:46:14 +0530
Message-Id: <20201125051634.509286-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_07:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 mlxlogscore=989 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240121
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
2.28.0

