Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E30DDC04C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 14:01:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fr4N3JlkzDqwv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 22:01:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fqvY5pKMzDqjp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 21:54:01 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8RBkjdW019769
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 07:53:58 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v9gbakkg8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 07:53:57 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Fri, 27 Sep 2019 12:53:56 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 27 Sep 2019 12:53:51 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8RBrMjj27459966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 11:53:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 538664C044;
 Fri, 27 Sep 2019 11:53:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E08284C058;
 Fri, 27 Sep 2019 11:53:49 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.172.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 27 Sep 2019 11:53:49 +0000 (GMT)
Subject: [PATCH v2 3/6] KVM: PPC: Book3S HV: XIVE: Show VP id in debugfs
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Date: Fri, 27 Sep 2019 13:53:49 +0200
In-Reply-To: <156958521220.1503771.2119482814236775333.stgit@bahia.lan>
References: <156958521220.1503771.2119482814236775333.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19092711-0028-0000-0000-000003A336A5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092711-0029-0000-0000-000024655857
Message-Id: <156958522955.1503771.11724507735868652914.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-27_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=758 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909270112
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
Cc: kvm@vger.kernel.org, Radim =?utf-8?b?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 kvm-ppc@vger.kernel.org, =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Print out the VP id of each connected vCPU, this allow to see:
- the VP block base in which OPAL encodes information that may be
  useful when debugging
- the packed vCPU id which may differ from the raw vCPU id if the
  latter is >= KVM_MAX_VCPUS (2048)

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 arch/powerpc/kvm/book3s_xive.c        |    4 ++--
 arch/powerpc/kvm/book3s_xive_native.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index baa740815b3c..0b7859e40f66 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -2107,9 +2107,9 @@ static int xive_debug_show(struct seq_file *m, void *private)
 		if (!xc)
 			continue;
 
-		seq_printf(m, "cpu server %#x CPPR:%#x HWCPPR:%#x"
+		seq_printf(m, "cpu server %#x VP:%#x CPPR:%#x HWCPPR:%#x"
 			   " MFRR:%#x PEND:%#x h_xirr: R=%lld V=%lld\n",
-			   xc->server_num, xc->cppr, xc->hw_cppr,
+			   xc->server_num, xc->vp_id, xc->cppr, xc->hw_cppr,
 			   xc->mfrr, xc->pending,
 			   xc->stat_rm_h_xirr, xc->stat_vm_h_xirr);
 
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index ebb4215baf45..43a86858390a 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -1204,8 +1204,8 @@ static int xive_native_debug_show(struct seq_file *m, void *private)
 		if (!xc)
 			continue;
 
-		seq_printf(m, "cpu server %#x NSR=%02x CPPR=%02x IBP=%02x PIPR=%02x w01=%016llx w2=%08x\n",
-			   xc->server_num,
+		seq_printf(m, "cpu server %#x VP=%#x NSR=%02x CPPR=%02x IBP=%02x PIPR=%02x w01=%016llx w2=%08x\n",
+			   xc->server_num, xc->vp_id,
 			   vcpu->arch.xive_saved_state.nsr,
 			   vcpu->arch.xive_saved_state.cppr,
 			   vcpu->arch.xive_saved_state.ipb,

