Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE21533D60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 15:11:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Wff1g9Yz3dqF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 23:11:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pmt0mds4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Pmt0mds4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Wb5141fz2yXP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 23:08:16 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PADnvO031016;
 Wed, 25 May 2022 13:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vv5w6BgrXAZq46Vi3QPC78EeVojY2aj9GVMeO0Lha7E=;
 b=Pmt0mds42cgvgAJX7uumc99b3Fs9UQhKSU5c7um7v9AJTpUu1PhBuzgKiWRBI8WEJYSY
 p3YBV62dpzuVI2HUccLRBH8xI3787/yXRldUUryOYtTeMY1ZDtisx7ITR77rrcIJxb6u
 mN2xhdLhch71YLNAMyASwUFJlCAHZdtkUAFRVTWPX7kcckxakpg95gqs/Lj8vG3M4/ld
 0Mfjz+OxsFmSJ9X/urMBm9eS55TXTDXByl3GPSCUfxttTRZG5kZm+1T7y570r/IxZBzp
 VYOtcPZiMMePpIPUsdAhMW865Ea0v+EFzDzWN8L3Ef1LIl5AN0SMndMcoeL0ABLYThNu hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9jgxk6ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:13 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24PChjSG006457;
 Wed, 25 May 2022 13:08:12 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9jgxk6f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:12 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24PD23IA032221;
 Wed, 25 May 2022 13:08:11 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 3g93utfkwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:11 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24PD8BeK63963394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 13:08:11 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B052112064;
 Wed, 25 May 2022 13:08:11 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94995112061;
 Wed, 25 May 2022 13:08:09 +0000 (GMT)
Received: from li-4707e44c-227d-11b2-a85c-f336a85283d9.ibm.com.com (unknown
 [9.160.108.97]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 13:08:09 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] KVM: PPC: Book3S HV: Expose timing functions to module
 code
Date: Wed, 25 May 2022 10:05:53 -0300
Message-Id: <20220525130554.2614394-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525130554.2614394-1-farosas@linux.ibm.com>
References: <20220525130554.2614394-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DUvSat0oGC5fiGtf71zxhe8ILLGkl242
X-Proofpoint-ORIG-GUID: jGfmf8kyCqERUOX0_DXe_rcw6RSlC1H6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_03,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250067
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
Cc: npiggin@gmail.com, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The next patch adds new timing points to the P9 entry path, some of
which are in the module code, so we need to export the timing
functions.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv.h          | 10 ++++++++++
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 11 ++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.h b/arch/powerpc/kvm/book3s_hv.h
index 6b7f07d9026b..2f2e59d7d433 100644
--- a/arch/powerpc/kvm/book3s_hv.h
+++ b/arch/powerpc/kvm/book3s_hv.h
@@ -40,3 +40,13 @@ void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
 			    struct p9_host_os_sprs *host_os_sprs);
 void switch_pmu_to_host(struct kvm_vcpu *vcpu,
 			    struct p9_host_os_sprs *host_os_sprs);
+
+#ifdef CONFIG_KVM_BOOK3S_HV_P9_TIMING
+void accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next);
+#define start_timing(vcpu, next) accumulate_time(vcpu, next)
+#define end_timing(vcpu) accumulate_time(vcpu, NULL)
+#else
+#define accumulate_time(vcpu, next) do {} while (0)
+#define start_timing(vcpu, next) do {} while (0)
+#define end_timing(vcpu) do {} while (0)
+#endif
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index f8ce473149b7..8b2a9a360e4e 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -438,7 +438,7 @@ void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 EXPORT_SYMBOL_GPL(restore_p9_host_os_sprs);
 
 #ifdef CONFIG_KVM_BOOK3S_HV_P9_TIMING
-static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next)
+void accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	struct kvmhv_tb_accumulator *curr;
@@ -468,14 +468,7 @@ static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator
 	smp_wmb();
 	curr->seqcount = seq + 2;
 }
-
-#define start_timing(vcpu, next) __accumulate_time(vcpu, next)
-#define end_timing(vcpu) __accumulate_time(vcpu, NULL)
-#define accumulate_time(vcpu, next) __accumulate_time(vcpu, next)
-#else
-#define start_timing(vcpu, next) do {} while (0)
-#define end_timing(vcpu) do {} while (0)
-#define accumulate_time(vcpu, next) do {} while (0)
+EXPORT_SYMBOL_GPL(accumulate_time);
 #endif
 
 static inline u64 mfslbv(unsigned int idx)
-- 
2.35.1

