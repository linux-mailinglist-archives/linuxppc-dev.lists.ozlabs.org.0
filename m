Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D180B4967E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 23:29:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgYvq52xLz3ccT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 09:29:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g7PwtvlV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=g7PwtvlV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgYrr5fRmz3bVx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 09:26:52 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LLgVGe019040; 
 Fri, 21 Jan 2022 22:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=oIvRuCN4MXl4s1cNDNRxeZcgUkvifwIGOZtgC1V1LR4=;
 b=g7PwtvlVrLV0kbn8/vTmVHQssdR4IqFQHNfLTVTgUNW6xEJ7YDnjOnaPQ1a6NaY1OV05
 mjvQH/YR0HayFtuS4lcglmppOEwlPZMIpMx8W8DotUdjJGuSsaelzcQ6iDJRqH9y196k
 4GPje6suP5BylmVYlB+qmV0S25y+WzMKRSqXQhr0vUu/2JRbfHDgoOwe98s0zyhimAo6
 eXEiEXxpCC4Zi1wQEja7GGoyT8AZ9WeHDB0YFOgIV3aLpNTxptiazp5SOF98zuymDhmt
 ygnTseQ0mWukBegL7JR9zn/h7Y8ola54kw3x5lHXYJyb5vbdkt8CTQKnlLcmRJ+1awE6 wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dr4yrrp7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 22:26:47 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20LMLCKX014492;
 Fri, 21 Jan 2022 22:26:47 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dr4yrrp7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 22:26:47 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20LMM95J012860;
 Fri, 21 Jan 2022 22:26:46 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 3dqj1fcb3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 22:26:46 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20LMQjJR29491530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 22:26:45 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FA63AE060;
 Fri, 21 Jan 2022 22:26:45 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89B78AE062;
 Fri, 21 Jan 2022 22:26:42 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.81.234])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jan 2022 22:26:42 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 3/5] KVM: PPC: mmio: Reject instructions that access more
 than mmio.data size
Date: Fri, 21 Jan 2022 19:26:24 -0300
Message-Id: <20220121222626.972495-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121222626.972495-1-farosas@linux.ibm.com>
References: <20220121222626.972495-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fPKu3aGr6102OJidTz9DbfijQvcvRWqr
X-Proofpoint-GUID: 4cqtcJuqngWN2m3U5eem4PTwDwpvD2jA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_10,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=827 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210140
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

