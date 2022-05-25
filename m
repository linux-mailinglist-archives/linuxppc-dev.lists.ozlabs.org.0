Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (unknown [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95775533CF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 14:50:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7WBg3BFpz3bmg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 22:50:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SZ7bVD63;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SZ7bVD63; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7W9y5Rq3z2xt3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 22:49:58 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PCVxLK008743;
 Wed, 25 May 2022 12:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8i3uCjNg/TlLB3w/LawcqDfPG9jPeyfE6w2ueO9zrLU=;
 b=SZ7bVD63vC7ZVlF0v+bHLAiV6HmV+i7GnXZdnp8CGJzPbxm2i1sTN+xLQW3iGTttToRG
 sBgOVGCkMDW6N3xpQCmLW+YkeCcjEZQh/Zin8sXLaHjp+88dj4iayqnfpFtAnumBabMY
 Jts1gyHAPf00RgFRZcRF7p3tjUEk8GvXG7bKN408G/9Q8ltUPSA3/aRD1b8xG4NB0ZYj
 qnE4ZEsKO2Hcm+qz9UbMyWFzYzBAAOgcp6F9YwI2v23NFPnUov0cu1ipZ+pofJ57/ujr
 jbigYlX/c8ursKf8P2uoFzRFiaYLEUUFYMXSP7vtbFL5jDLPgr66A7z8FSNPsL2gAeWZ fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9grkvuvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 12:49:49 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24PChMTL010710;
 Wed, 25 May 2022 12:49:49 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9grkvuv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 12:49:49 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24PCiAXg019510;
 Wed, 25 May 2022 12:49:48 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 3g93uue026-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 12:49:48 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24PCnm9x43975154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 12:49:48 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65CA3AC060;
 Wed, 25 May 2022 12:49:48 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10D1FAC05F;
 Wed, 25 May 2022 12:49:47 +0000 (GMT)
Received: from li-4707e44c-227d-11b2-a85c-f336a85283d9.ibm.com.com (unknown
 [9.160.108.97]) by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 12:49:46 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: PPC: Align pt_regs in kvm_vcpu_arch structure
Date: Wed, 25 May 2022 09:49:44 -0300
Message-Id: <20220525124944.2613333-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QeE_3ZWYPc5UiH7lUmQcCvBZkKgTONs3
X-Proofpoint-ORIG-GUID: fFiYEBZUAPe8KOutTezBGxmUTYe6evPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_03,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 spamscore=0
 impostorscore=0 mlxlogscore=899 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2205250063
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

The H_ENTER_NESTED hypercall receives as second parameter the address
of a region of memory containing the values for the nested guest
privileged registers. We currently use the pt_regs structure contained
within kvm_vcpu_arch for that end.

Most hypercalls that receive a memory address expect that region to
not cross a 4k page boundary. We would want H_ENTER_NESTED to follow
the same pattern so this patch ensures the pt_regs structure sits
within a page.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_host.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index faf301d0dec0..87eba60f2920 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -519,7 +519,11 @@ struct kvm_vcpu_arch {
 	struct kvmppc_book3s_shadow_vcpu *shadow_vcpu;
 #endif
 
-	struct pt_regs regs;
+	/*
+	 * This is passed along to the HV via H_ENTER_NESTED. Align to
+	 * prevent it crossing a real 4K page.
+	 */
+	struct pt_regs regs __aligned(512);
 
 	struct thread_fp_state fp;
 
-- 
2.35.1

