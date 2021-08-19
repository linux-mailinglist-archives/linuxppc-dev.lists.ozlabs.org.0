Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E59223F19D8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 14:58:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gr4Z66Gn2z3dFN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 22:58:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gr4YG2SK6z308w
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 22:57:21 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17JCYUtl060999; Thu, 19 Aug 2021 08:57:07 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agp1q5ekr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 08:57:06 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17JCmjQj021442;
 Thu, 19 Aug 2021 12:57:05 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3ae5f8g9hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 12:57:05 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17JCv25651511552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Aug 2021 12:57:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A782AA4053;
 Thu, 19 Aug 2021 12:57:02 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69A45A4040;
 Thu, 19 Aug 2021 12:57:02 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 19 Aug 2021 12:57:02 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.93.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id ADFFC22003E;
 Thu, 19 Aug 2021 14:57:01 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] KVM: PPC: Book3S PR: Declare kvmppc_handle_exit_pr()
Date: Thu, 19 Aug 2021 14:56:53 +0200
Message-Id: <20210819125656.14498-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819125656.14498-1-clg@kaod.org>
References: <20210819125656.14498-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: riVBH7UhdTANzYjf4yK1DhKe4U1eb1If
X-Proofpoint-ORIG-GUID: riVBH7UhdTANzYjf4yK1DhKe4U1eb1If
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-19_04:2021-08-17,
 2021-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxlogscore=751
 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108190072
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes a compile error with W=3D1.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/kvm/book3s.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kvm/book3s.h b/arch/powerpc/kvm/book3s.h
index 740e51def5a5..c08f93b7f523 100644
--- a/arch/powerpc/kvm/book3s.h
+++ b/arch/powerpc/kvm/book3s.h
@@ -24,6 +24,7 @@ extern int kvmppc_core_emulate_mfspr_pr(struct kvm_vcpu=
 *vcpu,
 					int sprn, ulong *spr_val);
 extern int kvmppc_book3s_init_pr(void);
 extern void kvmppc_book3s_exit_pr(void);
+extern int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exi=
t_nr);
=20
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 extern void kvmppc_emulate_tabort(struct kvm_vcpu *vcpu, int ra_val);
--=20
2.31.1

