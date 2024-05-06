Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F908BD274
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 18:20:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zl5mrDT5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY67l6QmVz3cyc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 02:20:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zl5mrDT5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY65m6V15z30Vr
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 02:18:20 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 446FEDnQ006374;
	Mon, 6 May 2024 16:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kMBRKF0m+ZIYkax/WD20be0LrYx6C1oQnvg851lGN1U=;
 b=Zl5mrDT5E/gnrFcd57mYQEDskqCsM/DYWyxnlk24i+4JEDVhyia1Q97BdBvlS0xzHcto
 eJ/MnMWhpgyXjNs4RybzO79C5YblFikQfLIyJtWBYPoLXe0oiFiVXXDqbIdcJs9Frjvo
 nYSTaUffMQCneTNcN9luweU8m012XUePy2Pl0/ohLoBshkBJ9PwUF5N6h0uQnWe49590
 ovVyNuUfGzhex/XQWrwkld81agaDOUyGoPtLHPuZknLVVvlanRsgSsi7m5cl2qa4JTDd
 iy7yxHg37hcQdLrGmt7AWjTGAPEvnU9YFO0M0iZH8NJPoCeS6R0DkC4Dj5MYGtQR6zC+ SA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xy11k89ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 16:18:13 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 446GIDHe011646;
	Mon, 6 May 2024 16:18:13 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xy11k89nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 16:18:13 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 446G9qJ8010635;
	Mon, 6 May 2024 16:18:12 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xx0bp0vec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 16:18:12 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 446GI6Dj48103934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2024 16:18:08 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3D0C20043;
	Mon,  6 May 2024 16:18:06 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12A1D20040;
	Mon,  6 May 2024 16:18:00 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com.com (unknown [9.43.105.31])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 May 2024 16:17:58 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen.n.rao@linux.ibm.com
Subject: [PATCH 2/3] arch/powerpc/kvm: Optimize the server number -> ICP lookup
Date: Mon,  6 May 2024 21:47:30 +0530
Message-ID: <20240506161735.83358-3-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506161735.83358-1-gautam@linux.ibm.com>
References: <20240506161735.83358-1-gautam@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UU-kyuhKFyzoEfxvb1KalCQhcwB5PbDh
X-Proofpoint-ORIG-GUID: Br6O1nZSQbn2vhMdQCbldY1bQydJLiY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_11,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 lowpriorityscore=0
 mlxlogscore=220 impostorscore=0 mlxscore=1 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=1 malwarescore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405060114
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
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Given a server number, kvmppc_xics_find_server() does a linear search
over the vcpus of a VM. Optimize this logic by using an array to
maintain the mapping between server number -> icp.

Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_xics.c |  4 ++--
 arch/powerpc/kvm/book3s_xics.h | 10 ++--------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
index 12de526f04c4..1dc2f77571e7 100644
--- a/arch/powerpc/kvm/book3s_xics.c
+++ b/arch/powerpc/kvm/book3s_xics.c
@@ -47,8 +47,6 @@
  * TODO
  * ====
  *
- * - Speed up server# -> ICP lookup (array ? hash table ?)
- *
  * - Make ICS lockless as well, or at least a per-interrupt lock or hashed
  *   locks array to improve scalability
  */
@@ -1062,6 +1060,7 @@ static struct kvmppc_ics *kvmppc_xics_create_ics(struct kvm *kvm,
 static int kvmppc_xics_create_icp(struct kvm_vcpu *vcpu, unsigned long server_num)
 {
 	struct kvmppc_icp *icp;
+	struct kvm *kvm = vcpu->kvm;
 
 	if (!vcpu->kvm->arch.xics)
 		return -ENODEV;
@@ -1078,6 +1077,7 @@ static int kvmppc_xics_create_icp(struct kvm_vcpu *vcpu, unsigned long server_nu
 	icp->state.mfrr = MASKED;
 	icp->state.pending_pri = MASKED;
 	vcpu->arch.icp = icp;
+	kvm->arch.xics->icps[server_num] = icp;
 
 	XICS_DBG("created server for vcpu %d\n", vcpu->vcpu_id);
 
diff --git a/arch/powerpc/kvm/book3s_xics.h b/arch/powerpc/kvm/book3s_xics.h
index 8fcb34ea47a4..feeb0897d555 100644
--- a/arch/powerpc/kvm/book3s_xics.h
+++ b/arch/powerpc/kvm/book3s_xics.h
@@ -111,19 +111,13 @@ struct kvmppc_xics {
 	u32 err_noics;
 	u32 err_noicp;
 	struct kvmppc_ics *ics[KVMPPC_XICS_MAX_ICS_ID + 1];
+	DECLARE_FLEX_ARRAY(struct kvmppc_icp *, icps);
 };
 
 static inline struct kvmppc_icp *kvmppc_xics_find_server(struct kvm *kvm,
 							 u32 nr)
 {
-	struct kvm_vcpu *vcpu = NULL;
-	unsigned long i;
-
-	kvm_for_each_vcpu(i, vcpu, kvm) {
-		if (vcpu->arch.icp && nr == vcpu->arch.icp->server_num)
-			return vcpu->arch.icp;
-	}
-	return NULL;
+	return kvm->arch.xics->icps[nr];
 }
 
 static inline struct kvmppc_ics *kvmppc_xics_find_ics(struct kvmppc_xics *xics,
-- 
2.44.0

