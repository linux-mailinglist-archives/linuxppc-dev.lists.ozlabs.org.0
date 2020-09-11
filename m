Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5602265E67
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 12:56:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnt3n61zCzDqlW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 20:56:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=207.211.31.81;
 helo=us-smtp-1.mimecast.com; envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnt200y91zDqcx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 20:55:03 +1000 (AEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-OnADtvZ-MD-Qnyk_94E4sg-1; Fri, 11 Sep 2020 06:53:49 -0400
X-MC-Unique: OnADtvZ-MD-Qnyk_94E4sg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 121EB81CBE7;
 Fri, 11 Sep 2020 10:53:48 +0000 (UTC)
Received: from bahia.lan (ovpn-113-23.ams2.redhat.com [10.36.113.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D40D027BD0;
 Fri, 11 Sep 2020 10:53:45 +0000 (UTC)
Subject: [PATCH] KVM: PPC: Don't return -ENOTSUPP to userspace in ioctls
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 11 Sep 2020 12:53:45 +0200
Message-ID: <159982162511.459323.13495475646618845164.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0.002
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
Cc: trivial@kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ENOTSUPP is a linux only thingy, the value of which is unknown to
userspace, not to be confused with ENOTSUP which linux maps to
EOPNOTSUPP, as permitted by POSIX [1]:

[EOPNOTSUPP]
Operation not supported on socket. The type of socket (address family
or protocol) does not support the requested operation. A conforming
implementation may assign the same values for [EOPNOTSUPP] and [ENOTSUP].

Return -EOPNOTSUPP instead of -ENOTSUPP for the following ioctls:
- KVM_GET_FPU for Book3s and BookE
- KVM_SET_FPU for Book3s and BookE
- KVM_GET_DIRTY_LOG for BookE

This doesn't affect QEMU which doesn't call the KVM_GET_FPU and
KVM_SET_FPU ioctls on POWER anyway since they are not supported,
and _buggily_ ignores anything but -EPERM for KVM_GET_DIRTY_LOG.

[1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.ht=
ml

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 arch/powerpc/kvm/book3s.c |    4 ++--
 arch/powerpc/kvm/booke.c  |    6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 1fce9777af1c..44bf567b6589 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -558,12 +558,12 @@ int kvm_arch_vcpu_ioctl_set_regs(struct kvm_vcpu *vcp=
u, struct kvm_regs *regs)
=20
 int kvm_arch_vcpu_ioctl_get_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu=
)
 {
-=09return -ENOTSUPP;
+=09return -EOPNOTSUPP;
 }
=20
 int kvm_arch_vcpu_ioctl_set_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu=
)
 {
-=09return -ENOTSUPP;
+=09return -EOPNOTSUPP;
 }
=20
 int kvmppc_get_one_reg(struct kvm_vcpu *vcpu, u64 id,
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 3e1c9f08e302..b1abcb816439 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -1747,12 +1747,12 @@ int kvmppc_set_one_reg(struct kvm_vcpu *vcpu, u64 i=
d,
=20
 int kvm_arch_vcpu_ioctl_get_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu=
)
 {
-=09return -ENOTSUPP;
+=09return -EOPNOTSUPP;
 }
=20
 int kvm_arch_vcpu_ioctl_set_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu=
)
 {
-=09return -ENOTSUPP;
+=09return -EOPNOTSUPP;
 }
=20
 int kvm_arch_vcpu_ioctl_translate(struct kvm_vcpu *vcpu,
@@ -1773,7 +1773,7 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct =
kvm_memory_slot *memslot)
=20
 int kvm_vm_ioctl_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log)
 {
-=09return -ENOTSUPP;
+=09return -EOPNOTSUPP;
 }
=20
 void kvmppc_core_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slo=
t)


