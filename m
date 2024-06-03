Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C17818D80C1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 13:17:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cUdyOBoe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtB5G6W3kz3cWf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 21:17:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cUdyOBoe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtB2f1zcHz3cTh
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2024 21:14:50 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 453BBCsS020633;
	Mon, 3 Jun 2024 11:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=FLo9ijcfDE9qph2G96Ru6rXYR6O6qbOufXPAJVeiFdQ=;
 b=cUdyOBoe2JFxYmiH+fNrNGygJNXdgS9XDYJj6ELWQ7V04oCiKumy5veK+BCIaDanjrBl
 mbIrJr4Lfa+sCjBO4XDYcEROw6UVvUiTkPblJRcLULFMd2zRANQGrX2sCV/+bTd5eTXK
 PTD4gD1yuOcu8Ak/CAvmHFuTik+w5hoIJnh5NPg+SAP5svIy0rPhzFT3KL6Q9B6yGuYc
 5VDxGxq7dprPcCE59lq5j2P3ms42V58S9CgyS5ONmAT3FhnFoEuFrDvLsaDsZCSmNHEs
 H4hW2Y2+508YZ0h7iBy/l/WbUzRiqp9LMSzJqVhObPIJFSVB1NHpCbwf2Y23g+5l+4f3 JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yhadh0bb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 11:14:40 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 453BEep6027458;
	Mon, 3 Jun 2024 11:14:40 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yhadh0bb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 11:14:40 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4538XHl2008501;
	Mon, 3 Jun 2024 11:14:39 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec0fndp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 11:14:39 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 453BEXOr46399828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Jun 2024 11:14:35 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B30CC20063;
	Mon,  3 Jun 2024 11:14:33 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC3F32004E;
	Mon,  3 Jun 2024 11:14:31 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.175])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Jun 2024 11:14:31 +0000 (GMT)
Subject: [PATCH 3/6] KVM: PPC: Book3S HV nestedv2: Keep nested guest DEXCR in
 sync
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Date: Mon, 03 Jun 2024 11:14:31 +0000
Message-ID: <171741326679.6631.5332298610543769487.stgit@linux.ibm.com>
In-Reply-To: <171741323521.6631.11242552089199677395.stgit@linux.ibm.com>
References: <171741323521.6631.11242552089199677395.stgit@linux.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OQjbPXLNv_X-59ZS1fr02P3KAhwHSyVm
X-Proofpoint-ORIG-GUID: h1XlCMRvDjI1MKkjK_LIQx5ML529FP1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_07,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=833 lowpriorityscore=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406030094
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
---
 arch/powerpc/include/asm/kvm_host.h   |    1 +
 arch/powerpc/kvm/book3s_hv.h          |    1 +
 arch/powerpc/kvm/book3s_hv_nestedv2.c |    6 ++++++
 3 files changed, 8 insertions(+)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 8abac532146e..1e2fdcbecffd 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -599,6 +599,7 @@ struct kvm_vcpu_arch {
 	ulong dawrx0;
 	ulong dawr1;
 	ulong dawrx1;
+	ulong dexcr;
 	ulong ciabr;
 	ulong cfar;
 	ulong ppr;
diff --git a/arch/powerpc/kvm/book3s_hv.h b/arch/powerpc/kvm/book3s_hv.h
index 47b2c815641e..7b0fd282fe95 100644
--- a/arch/powerpc/kvm/book3s_hv.h
+++ b/arch/powerpc/kvm/book3s_hv.h
@@ -116,6 +116,7 @@ KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawr0, 64, KVMPPC_GSID_DAWR0)
 KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawr1, 64, KVMPPC_GSID_DAWR1)
 KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawrx0, 64, KVMPPC_GSID_DAWRX0)
 KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawrx1, 64, KVMPPC_GSID_DAWRX1)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dexcr, 64, KVMPPC_GSID_DEXCR)
 KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ciabr, 64, KVMPPC_GSID_CIABR)
 KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(wort, 64, KVMPPC_GSID_WORT)
 KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ppr, 64, KVMPPC_GSID_PPR)
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


