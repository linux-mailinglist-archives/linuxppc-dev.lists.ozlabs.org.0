Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 017BB8FCE75
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 15:09:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rtWUhHBk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvSTf0fyhz3bTt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 23:09:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rtWUhHBk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvSRZ71ywz30VY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 23:07:22 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455Cv73r032125;
	Wed, 5 Jun 2024 13:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=65kRB3COaqAUVvLza2YlzCjywkZSYYviDgHfYjK4FJQ=;
 b=rtWUhHBkGtrinlAuQZ6y0rS8hMQC0TR31szIRJyflDO5luyQvodE/RhZvFtgV9CSfDuC
 vsistNmQLKtIAsclf8T/1aA3c9sv5bi4LZKio4O3Cy+1vgOcvNUwJE088wW4rjvBJtGk
 1wvAFV6PWBwqx69pfOTVDzY003rKbX+Nyjsjkml1mXU5XEXEEYxgKCkYUa+bhqxAXUTA
 6Qohfa/YTI82Q8kDBOH37tEUcZDorND9h9XJH+Fvn3Jt8UTFDbS42wcmHIzMY39kBl7A
 3ZmznWGnmi+YBbo7jCrfp2NPkER4Y+aIk1nAa+CdaiCd28BbTRo6fSo69osbG34RPhXt Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjrfn80s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 13:07:14 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 455D7DSA016116;
	Wed, 5 Jun 2024 13:07:13 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjrfn80s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 13:07:13 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455CMtXS008468;
	Wed, 5 Jun 2024 13:07:12 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec0ve7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 13:07:12 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455D76Sw49807720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 13:07:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73EB320040;
	Wed,  5 Jun 2024 13:07:06 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 897392004B;
	Wed,  5 Jun 2024 13:07:04 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.175])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 13:07:04 +0000 (GMT)
Subject: [PATCH v2 4/8] KVM: PPC: Book3S HV nestedv2: Keep nested guest DEXCR
 in sync
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Date: Wed, 05 Jun 2024 13:07:04 +0000
Message-ID: <171759281060.1480.654592298305141881.stgit@linux.ibm.com>
In-Reply-To: <171759276071.1480.9356137231993600304.stgit@linux.ibm.com>
References: <171759276071.1480.9356137231993600304.stgit@linux.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: d-QnL1F6SFNwTvmNCisfgUqSQYQNSca-
X-Proofpoint-GUID: 9qDg-aPxDAZFStNZWqAg9C3r8j_sOg1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 mlxlogscore=909
 mlxscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050099
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
Cc: atrajeev@linux.vnet.ibm.com, sbhat@linux.ibm.com, corbet@lwn.net, linux-kernel@vger.kernel.org, npiggin@gmail.com, namhyung@kernel.org, naveen.n.rao@linux.ibm.com, pbonzini@redhat.com, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The nestedv2 APIs has the guest state element defined for DEXCR
for the save-restore with L0. However, its ignored in the code.

The patch takes care of this for the DEXCR GSID.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_nestedv2.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/book3s_hv_nestedv2.c
index 1091f7a83b25..d207a6d936ff 100644
--- a/arch/powerpc/kvm/book3s_hv_nestedv2.c
+++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
@@ -193,6 +193,9 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs_buff *gsb,
 		case KVMPPC_GSID_DAWRX1:
 			rc = kvmppc_gse_put_u32(gsb, iden, vcpu->arch.dawrx1);
 			break;
+		case KVMPPC_GSID_DEXCR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.dexcr);
+			break;
 		case KVMPPC_GSID_CIABR:
 			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.ciabr);
 			break;
@@ -441,6 +444,9 @@ static int gs_msg_ops_vcpu_refresh_info(struct kvmppc_gs_msg *gsm,
 		case KVMPPC_GSID_DAWRX1:
 			vcpu->arch.dawrx1 = kvmppc_gse_get_u32(gse);
 			break;
+		case KVMPPC_GSID_DEXCR:
+			vcpu->arch.dexcr = kvmppc_gse_get_u64(gse);
+			break;
 		case KVMPPC_GSID_CIABR:
 			vcpu->arch.ciabr = kvmppc_gse_get_u64(gse);
 			break;


