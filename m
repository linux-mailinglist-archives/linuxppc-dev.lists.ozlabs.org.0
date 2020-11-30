Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 669502C841E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 13:30:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cl4Lw48mwzDqPC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 23:30:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=207.211.30.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 315 seconds by postgrey-1.36 at bilbo;
 Mon, 30 Nov 2020 23:26:05 AEDT
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl4G53FLJzDqgD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 23:26:04 +1100 (AEDT)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-Mmcox3aAPuqo9iwFaxczOA-1; Mon, 30 Nov 2020 07:19:32 -0500
X-MC-Unique: Mmcox3aAPuqo9iwFaxczOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C607107ACFA;
 Mon, 30 Nov 2020 12:19:30 +0000 (UTC)
Received: from bahia.lan (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 881625D9D2;
 Mon, 30 Nov 2020 12:19:28 +0000 (UTC)
Subject: [PATCH] KVM: PPC: Book3S HV: XIVE: Fix vCPU id sanity check
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 30 Nov 2020 13:19:27 +0100
Message-ID: <160673876747.695514.1809676603724514920.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org,
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 062cfab7069f ("KVM: PPC: Book3S HV: XIVE: Make VP block size
configurable") updated kvmppc_xive_vcpu_id_valid() in a way that
allows userspace to trigger an assertion in skiboot and crash the host:

[  696.186248988,3] XIVE[ IC 08  ] eq_blk !=3D vp_blk (0 vs. 1) for target =
0x4300008c/0
[  696.186314757,0] Assert fail: hw/xive.c:2370:0
[  696.186342458,0] Aborting!
xive-kvCPU 0043 Backtrace:
 S: 0000000031e2b8f0 R: 0000000030013840   .backtrace+0x48
 S: 0000000031e2b990 R: 000000003001b2d0   ._abort+0x4c
 S: 0000000031e2ba10 R: 000000003001b34c   .assert_fail+0x34
 S: 0000000031e2ba90 R: 0000000030058984   .xive_eq_for_target.part.20+0xb0
 S: 0000000031e2bb40 R: 0000000030059fdc   .xive_setup_silent_gather+0x2c
 S: 0000000031e2bc20 R: 000000003005a334   .opal_xive_set_vp_info+0x124
 S: 0000000031e2bd20 R: 00000000300051a4   opal_entry+0x134
 --- OPAL call token: 0x8a caller R1: 0xc000001f28563850 ---

XIVE maintains the interrupt context state of non-dispatched vCPUs in
an internal VP structure. We allocate a bunch of those on startup to
accommodate all possible vCPUs. Each VP has an id, that we derive from
the vCPU id for efficiency:

static inline u32 kvmppc_xive_vp(struct kvmppc_xive *xive, u32 server)
{
=09return xive->vp_base + kvmppc_pack_vcpu_id(xive->kvm, server);
}

The KVM XIVE device used to allocate KVM_MAX_VCPUS VPs. This was
limitting the number of concurrent VMs because the VP space is
limited on the HW. Since most of the time, VMs run with a lot less
vCPUs, commit 062cfab7069f ("KVM: PPC: Book3S HV: XIVE: Make VP
block size configurable") gave the possibility for userspace to
tune the size of the VP block through the KVM_DEV_XIVE_NR_SERVERS
attribute.

The check in kvmppc_pack_vcpu_id() was changed from

=09cpu < KVM_MAX_VCPUS * xive->kvm->arch.emul_smt_mode

to

=09cpu < xive->nr_servers * xive->kvm->arch.emul_smt_mode

The previous check was based on the fact that the VP block had
KVM_MAX_VCPUS entries and that kvmppc_pack_vcpu_id() guarantees
that packed vCPU ids are below KVM_MAX_VCPUS. We've changed the
size of the VP block, but kvmppc_pack_vcpu_id() has nothing to
do with it and it certainly doesn't ensure that the packed vCPU
ids are below xive->nr_servers. kvmppc_xive_vcpu_id_valid() might
thus return true when the VM was configured with a non-standard
VSMT mode, even if the packed vCPU id is higher than what we
expect. We end up using an unallocated VP id, which confuses
OPAL. The assert in OPAL is probably abusive and should be
converted to a regular error that the kernel can handle, but
we shouldn't really use broken VP ids in the first place.

Fix kvmppc_xive_vcpu_id_valid() so that it checks the packed
vCPU id is below xive->nr_servers, which is explicitly what we
want.

Fixes: 062cfab7069f ("KVM: PPC: Book3S HV: XIVE: Make VP block size configu=
rable")
Cc: stable@vger.kernel.org # v5.5+
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 arch/powerpc/kvm/book3s_xive.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.=
c
index 85215e79db42..a0ebc29f30b2 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -1214,12 +1214,9 @@ void kvmppc_xive_cleanup_vcpu(struct kvm_vcpu *vcpu)
 static bool kvmppc_xive_vcpu_id_valid(struct kvmppc_xive *xive, u32 cpu)
 {
 =09/* We have a block of xive->nr_servers VPs. We just need to check
-=09 * raw vCPU ids are below the expected limit for this guest's
-=09 * core stride ; kvmppc_pack_vcpu_id() will pack them down to an
-=09 * index that can be safely used to compute a VP id that belongs
-=09 * to the VP block.
+=09 * packed vCPU ids are below that.
 =09 */
-=09return cpu < xive->nr_servers * xive->kvm->arch.emul_smt_mode;
+=09return kvmppc_pack_vcpu_id(xive->kvm, cpu) < xive->nr_servers;
 }
=20
 int kvmppc_xive_compute_vp_id(struct kvmppc_xive *xive, u32 cpu, u32 *vp)


