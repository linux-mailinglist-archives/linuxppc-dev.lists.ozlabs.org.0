Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F559AEFF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 18:51:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SWJv2xCyzF0RK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 02:51:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SWGg0Ky6zDrQs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 02:49:45 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8AGljsL155762
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 12:49:41 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uxcvdnhs6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 12:49:40 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Tue, 10 Sep 2019 17:49:38 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 17:49:35 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8AGnYPm31261136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 16:49:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80C704203F;
 Tue, 10 Sep 2019 16:49:34 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3565042049;
 Tue, 10 Sep 2019 16:49:34 +0000 (GMT)
Received: from bahia.tls.ibm.com (unknown [9.101.4.41])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Sep 2019 16:49:34 +0000 (GMT)
Subject: [PATCH] KVM: PPC: Book3S HV: Tunable to configure maximum # of
 vCPUs per VM
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Date: Tue, 10 Sep 2019 18:49:34 +0200
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091016-4275-0000-0000-000003640AE4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091016-4276-0000-0000-000038766001
Message-Id: <156813417397.1880979.6162333671088177553.stgit@bahia.tls.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100161
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
Cc: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
 =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Each vCPU of a VM allocates a XIVE VP in OPAL which is associated with
8 event queue (EQ) descriptors, one for each priority. A POWER9 socket
can handle a maximum of 1M event queues.

The powernv platform allocates NR_CPUS (== 2048) VPs for the hypervisor,
and each XIVE KVM device allocates KVM_MAX_VCPUS (== 2048) VPs. This means
that on a bi-socket system, we can create at most:

(2 * 1M) / (8 * 2048) - 1 == 127 XIVE or XICS-on-XIVE KVM devices

ie, start at most 127 VMs benefiting from an in-kernel interrupt controller.
Subsequent VMs need to rely on much slower userspace emulated XIVE device in
QEMU.

This is problematic as one can legitimately expect to start the same
number of mono-CPU VMs as the number of HW threads available on the
system (eg, 144 on Witherspoon).

I'm not aware of any userspace supporting more that 1024 vCPUs. It thus
seem overkill to consume that many VPs per VM. Ideally we would even
want userspace to be able to tell KVM about the maximum number of vCPUs
when creating the VM.

For now, provide a module parameter to configure the maximum number of
vCPUs per VM. While here, reduce the default value to 1024 to match the
current limit in QEMU. This number is only used by the XIVE KVM devices,
but some more users of KVM_MAX_VCPUS could possibly be converted.

With this change, I could successfully run 230 mono-CPU VMs on a
Witherspoon system using the official skiboot-6.3.

I could even run more VMs by using upstream skiboot containing this
fix, that allows to better spread interrupts between sockets:

e97391ae2bb5 ("xive: fix return value of opal_xive_allocate_irq()")

MAX VPCUS | MAX VMS
----------+---------
     1024 |     255
      512 |     511
      256 |    1023 (*)

(*) the system was barely usable because of the extreme load and
    memory exhaustion but the VMs did start.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 arch/powerpc/include/asm/kvm_host.h   |    1 +
 arch/powerpc/kvm/book3s_hv.c          |   32 ++++++++++++++++++++++++++++++++
 arch/powerpc/kvm/book3s_xive.c        |    2 +-
 arch/powerpc/kvm/book3s_xive_native.c |    2 +-
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 6fb5fb4779e0..17582ce38788 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -335,6 +335,7 @@ struct kvm_arch {
 	struct kvm_nested_guest *nested_guests[KVM_MAX_NESTED_GUESTS];
 	/* This array can grow quite large, keep it at the end */
 	struct kvmppc_vcore *vcores[KVM_MAX_VCORES];
+	unsigned int max_vcpus;
 #endif
 };
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index f8975c620f41..393d8a1ce9d8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -125,6 +125,36 @@ static bool nested = true;
 module_param(nested, bool, S_IRUGO | S_IWUSR);
 MODULE_PARM_DESC(nested, "Enable nested virtualization (only on POWER9)");
 
+#define MIN(x, y) (((x) < (y)) ? (x) : (y))
+
+static unsigned int max_vcpus = MIN(KVM_MAX_VCPUS, 1024);
+
+static int set_max_vcpus(const char *val, const struct kernel_param *kp)
+{
+	unsigned int new_max_vcpus;
+	int ret;
+
+	ret = kstrtouint(val, 0, &new_max_vcpus);
+	if (ret)
+		return ret;
+
+	if (new_max_vcpus > KVM_MAX_VCPUS)
+		return -EINVAL;
+
+	max_vcpus = new_max_vcpus;
+
+	return 0;
+}
+
+static struct kernel_param_ops max_vcpus_ops = {
+	.set = set_max_vcpus,
+	.get = param_get_uint,
+};
+
+module_param_cb(max_vcpus, &max_vcpus_ops, &max_vcpus, S_IRUGO | S_IWUSR);
+MODULE_PARM_DESC(max_vcpus, "Maximum number of vCPUS per VM (max = "
+		 __stringify(KVM_MAX_VCPUS) ")");
+
 static inline bool nesting_enabled(struct kvm *kvm)
 {
 	return kvm->arch.nested_enable && kvm_is_radix(kvm);
@@ -4918,6 +4948,8 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 	if (radix_enabled())
 		kvmhv_radix_debugfs_init(kvm);
 
+	kvm->arch.max_vcpus = max_vcpus;
+
 	return 0;
 }
 
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 2ef43d037a4f..0fea31b64564 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -2026,7 +2026,7 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
 		xive->q_page_order = xive->q_order - PAGE_SHIFT;
 
 	/* Allocate a bunch of VPs */
-	xive->vp_base = xive_native_alloc_vp_block(KVM_MAX_VCPUS);
+	xive->vp_base = xive_native_alloc_vp_block(kvm->arch.max_vcpus);
 	pr_devel("VP_Base=%x\n", xive->vp_base);
 
 	if (xive->vp_base == XIVE_INVALID_VP)
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 84a354b90f60..20314010da56 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -1095,7 +1095,7 @@ static int kvmppc_xive_native_create(struct kvm_device *dev, u32 type)
 	 * a default. Getting the max number of CPUs the VM was
 	 * configured with would improve our usage of the XIVE VP space.
 	 */
-	xive->vp_base = xive_native_alloc_vp_block(KVM_MAX_VCPUS);
+	xive->vp_base = xive_native_alloc_vp_block(kvm->arch.max_vcpus);
 	pr_devel("VP_Base=%x\n", xive->vp_base);
 
 	if (xive->vp_base == XIVE_INVALID_VP)

