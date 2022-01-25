Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0AD49BE18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 22:59:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jk13s3j3kz3ck2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 08:59:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YarEAzkY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YarEAzkY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jk10r2qFDz30Kp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 08:57:16 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PLfbMb021495; 
 Tue, 25 Jan 2022 21:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Aiz1bX4xmP1r2cYhQZ8fhakTEz4fzcaDJ+9oZqQAZdc=;
 b=YarEAzkYXo7OhGAagQ9sj7MyTAFdRsnAWWYDwatOdI3GnVgJONuNgx64AiT0sTo3OT51
 tG/ROVv92VKuov2hcCSC6w1AVFsHhrrh6ahICW29jCm09fBGJqOiy2Zm5krltlXko+IS
 L/y3kpsVbcwxxUZHVSqd/2Dn/buOJXoAXiEkvg5NqnAWSxoKT/zMolDszNGIdBI2ZRKp
 NMtF0gELZ+gB48aaWweCpoEYd9BiLrFufBRlPX3fpwuvUQaqMiIozUTzyGtHTcsEO7xS
 uhCOww0xGEOxOV0y1pmMuxfXUh+j7UQ9ram9iHnwiKQWdvKnAJ7bv67DzmIo16IWZ5v9 Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dtsbe87jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 21:57:10 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20PLhEFe028255;
 Tue, 25 Jan 2022 21:57:10 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dtsbe87jg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 21:57:10 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20PLroSo028544;
 Tue, 25 Jan 2022 21:57:09 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 3dr9ja6cfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 21:57:09 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20PLv8mD15991118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 21:57:08 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BECFC6065;
 Tue, 25 Jan 2022 21:57:08 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DDC6C6059;
 Tue, 25 Jan 2022 21:57:07 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.21.20])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jan 2022 21:57:06 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 3/5] KVM: PPC: mmio: Reject instructions that access more
 than mmio.data size
Date: Tue, 25 Jan 2022 18:56:53 -0300
Message-Id: <20220125215655.1026224-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125215655.1026224-1-farosas@linux.ibm.com>
References: <20220125215655.1026224-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RRIzHsYNzIcodQP7lQBzPJ5oCR57zBlF
X-Proofpoint-GUID: rS6DEXh6x7XhhmrdjCuQcHQ2cEDMuMev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_05,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 mlxlogscore=813 spamscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250128
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

The MMIO interface between the kernel and userspace uses a structure
that supports a maximum of 8-bytes of data. Instructions that access
more than that need to be emulated in parts.

We currently don't have generic support for splitting the emulation in
parts and each set of instructions needs to be explicitly included.

There's already an error message being printed when a load or store
exceeds the mmio.data buffer but we don't fail the emulation until
later at kvmppc_complete_mmio_load and even then we allow userspace to
make a partial copy of the data, which ends up overwriting some fields
of the mmio structure.

This patch makes the emulation fail earlier at kvmppc_handle_load|store,
which will send a Program interrupt to the guest. This is better than
allowing the guest to proceed with partial data.

Note that this was caught in a somewhat artificial scenario using
quadword instructions (lq/stq), there's no account of an actual guest
in the wild running instructions that are not properly emulated.

(While here, remove the "bad MMIO" messages. The caller already has an
error message.)

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/powerpc.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index c2bd29e90314..27fb2b70f631 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1114,10 +1114,8 @@ static void kvmppc_complete_mmio_load(struct kvm_vcpu *vcpu)
 	struct kvm_run *run = vcpu->run;
 	u64 gpr;
 
-	if (run->mmio.len > sizeof(gpr)) {
-		printk(KERN_ERR "bad MMIO length: %d\n", run->mmio.len);
+	if (run->mmio.len > sizeof(gpr))
 		return;
-	}
 
 	if (!vcpu->arch.mmio_host_swabbed) {
 		switch (run->mmio.len) {
@@ -1236,10 +1234,8 @@ static int __kvmppc_handle_load(struct kvm_vcpu *vcpu,
 		host_swabbed = !is_default_endian;
 	}
 
-	if (bytes > sizeof(run->mmio.data)) {
-		printk(KERN_ERR "%s: bad MMIO length: %d\n", __func__,
-		       run->mmio.len);
-	}
+	if (bytes > sizeof(run->mmio.data))
+		return EMULATE_FAIL;
 
 	run->mmio.phys_addr = vcpu->arch.paddr_accessed;
 	run->mmio.len = bytes;
@@ -1325,10 +1321,8 @@ int kvmppc_handle_store(struct kvm_vcpu *vcpu,
 		host_swabbed = !is_default_endian;
 	}
 
-	if (bytes > sizeof(run->mmio.data)) {
-		printk(KERN_ERR "%s: bad MMIO length: %d\n", __func__,
-		       run->mmio.len);
-	}
+	if (bytes > sizeof(run->mmio.data))
+		return EMULATE_FAIL;
 
 	run->mmio.phys_addr = vcpu->arch.paddr_accessed;
 	run->mmio.len = bytes;
-- 
2.34.1

