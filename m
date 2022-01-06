Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62673486ADB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 21:04:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVHPg2R2nz3bdF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 07:04:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XPGkTkWC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XPGkTkWC; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVHNC6ZKYz2yZt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 07:03:23 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206HVvKk016837; 
 Thu, 6 Jan 2022 20:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=D729H6qKmUNbmToCIhVwh/rKuoaDvSyvps9gAYATpLA=;
 b=XPGkTkWC2uPnDR1xlJgJiM/cUuUYwfghEOGBhUnagwePP0k0R5YeCHAX6mS20DxX+8bO
 GAAENJh+MvOYcf1jl0LA250t/gbd4AvRMBCQJfwaor+LwVcu8sTlBfNBGTazbq1hxm1I
 ggZfibp0EBCb1qNg072U95GuSS7p1uHT7LowrwXU05A5bPf6svklM8tuL3BWunvglqsL
 Qt5MgjlpuVoVGZ7OkG90PTG0VqbOSA9zimrImCwe8UJmHtyO4LTF1YFEKNVfMk2fXTli
 5m8df76SNzc/ZaDR7PhqEWas9BqKJSoha3HNdwKk1i3q3Te/LP+tEX9odtlH7XUMHLJ9 TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wg2fq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 20:03:17 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 206JQhv7025973;
 Thu, 6 Jan 2022 20:03:16 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wg2fpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 20:03:16 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 206JwCwf021878;
 Thu, 6 Jan 2022 20:03:15 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 3de5hnhmng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 20:03:15 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 206K3E1O30933456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 20:03:14 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8535DBE05A;
 Thu,  6 Jan 2022 20:03:14 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDFDCBE054;
 Thu,  6 Jan 2022 20:03:12 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.150.192])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 20:03:12 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 1/7] KVM: PPC: Book3S HV: Stop returning internal values to
 userspace
Date: Thu,  6 Jan 2022 17:02:58 -0300
Message-Id: <20220106200304.4070825-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106200304.4070825-1-farosas@linux.ibm.com>
References: <20220106200304.4070825-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xXPpUZjGuuLq5kywVsbqzmr1QPlUUtjI
X-Proofpoint-GUID: 0EofXQLPK_zRl2Nd4whJdnLyq24-RZdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_08,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201060126
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

Our kvm_arch_vcpu_ioctl_run currently returns the RESUME_HOST values
to userspace, against the API of the KVM_RUN ioctl which returns 0 on
success.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
This was noticed while enabling the kvm selftests for powerpc. There's
an assert at the _vcpu_run function when we return a value different
from the expected.
---
 arch/powerpc/kvm/powerpc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index a72920f4f221..1e130bb087c4 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1849,6 +1849,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 #ifdef CONFIG_ALTIVEC
 out:
 #endif
+
+	/*
+	 * We're already returning to userspace, don't pass the
+	 * RESUME_HOST flags along.
+	 */
+	if (r > 0)
+		r = 0;
+
 	vcpu_put(vcpu);
 	return r;
 }
-- 
2.33.1

