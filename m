Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2879CB65
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 10:16:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H4bn4D9pzDqbt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 18:16:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H4Yc11J7zDqZW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 18:15:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="aUeXEFmQ"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 46H4Yb2p7Zz9sN4; Mon, 26 Aug 2019 18:14:59 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 46H4Yb1nHqz9sBF; Mon, 26 Aug 2019 18:14:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1566807299; bh=4YBpWCa0qHZ3ULuoBl2RuWy1RhuSnNm3HEuyOK5cDew=;
 h=Date:From:To:Cc:Subject:From;
 b=aUeXEFmQEuUNsMdxMjs+42Tyu4AuTeSMYdo18sG0oRt37GyCIGUl2MOKsTWpNBQXj
 gUGtvIUodNo6Mu9nhv/3LqkYbwKVAMj1l9H0824UQGOAv0tEjIv6fIv6d48fHlglYt
 VcVu6/Bwpmfq5x93Ip4HDvXQvxkEqxLgGUMBPytr7hVHp//BehN2zC5akkfF1AyzHc
 Rb7VIgF1KpfPfVY9l0+lQeTUa9RUO0AW9BKbhRZGNQ80PLkZZJsKT7PTetqt0hlol2
 CJwSKpRh+U2YvhbzlZi3d5++HtXuZ0sbRdmVPTc7C+4NijCPXiChgKxfYpW0erOC14
 KOC1N/tiMipsQ==
Date: Mon, 26 Aug 2019 18:14:55 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: kvm@vger.kernel.org, linuxppc-dev@ozlabs.org
Subject: [PATCH] KVM: PPC: Book3S: Enable XIVE native capability only if OPAL
 has required functions
Message-ID: <20190826081455.GA7402@blackberry>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are some POWER9 machines where the OPAL firmware does not support
the OPAL_XIVE_GET_QUEUE_STATE and OPAL_XIVE_SET_QUEUE_STATE calls.
The impact of this is that a guest using XIVE natively will not be able
to be migrated successfully.  On the source side, the get_attr operation
on the KVM native device for the KVM_DEV_XIVE_GRP_EQ_CONFIG attribute
will fail; on the destination side, the set_attr operation for the same
attribute will fail.

This adds tests for the existence of the OPAL get/set queue state
functions, and if they are not supported, the XIVE-native KVM device
is not created and the KVM_CAP_PPC_IRQ_XIVE capability returns false.
Userspace can then either provide a software emulation of XIVE, or
else tell the guest that it does not have a XIVE controller available
to it.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/include/asm/kvm_ppc.h    | 1 +
 arch/powerpc/include/asm/xive.h       | 1 +
 arch/powerpc/kvm/book3s.c             | 8 +++++---
 arch/powerpc/kvm/book3s_xive_native.c | 5 +++++
 arch/powerpc/kvm/powerpc.c            | 3 ++-
 arch/powerpc/sysdev/xive/native.c     | 7 +++++++
 6 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 2484e6a..8e8514e 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -598,6 +598,7 @@ extern int kvmppc_xive_native_get_vp(struct kvm_vcpu *vcpu,
 				     union kvmppc_one_reg *val);
 extern int kvmppc_xive_native_set_vp(struct kvm_vcpu *vcpu,
 				     union kvmppc_one_reg *val);
+extern bool kvmppc_xive_native_supported(void);
 
 #else
 static inline int kvmppc_xive_set_xive(struct kvm *kvm, u32 irq, u32 server,
diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/xive.h
index efb0e59..818989e 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -135,6 +135,7 @@ extern int xive_native_get_queue_state(u32 vp_id, uint32_t prio, u32 *qtoggle,
 extern int xive_native_set_queue_state(u32 vp_id, uint32_t prio, u32 qtoggle,
 				       u32 qindex);
 extern int xive_native_get_vp_state(u32 vp_id, u64 *out_state);
+extern bool xive_native_has_queue_state_support(void);
 
 #else
 
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 9524d92..d7fcdfa 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -1083,9 +1083,11 @@ static int kvmppc_book3s_init(void)
 	if (xics_on_xive()) {
 		kvmppc_xive_init_module();
 		kvm_register_device_ops(&kvm_xive_ops, KVM_DEV_TYPE_XICS);
-		kvmppc_xive_native_init_module();
-		kvm_register_device_ops(&kvm_xive_native_ops,
-					KVM_DEV_TYPE_XIVE);
+		if (kvmppc_xive_native_supported()) {
+			kvmppc_xive_native_init_module();
+			kvm_register_device_ops(&kvm_xive_native_ops,
+						KVM_DEV_TYPE_XIVE);
+		}
 	} else
 #endif
 		kvm_register_device_ops(&kvm_xics_ops, KVM_DEV_TYPE_XICS);
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index f0cab43..248c1ea 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -1179,6 +1179,11 @@ int kvmppc_xive_native_set_vp(struct kvm_vcpu *vcpu, union kvmppc_one_reg *val)
 	return 0;
 }
 
+bool kvmppc_xive_native_supported(void)
+{
+	return xive_native_has_queue_state_support();
+}
+
 static int xive_native_debug_show(struct seq_file *m, void *private)
 {
 	struct kvmppc_xive *xive = m->private;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 0dba7eb..7012dd7 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -566,7 +566,8 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		 * a POWER9 processor) and the PowerNV platform, as
 		 * nested is not yet supported.
 		 */
-		r = xive_enabled() && !!cpu_has_feature(CPU_FTR_HVMODE);
+		r = xive_enabled() && !!cpu_has_feature(CPU_FTR_HVMODE) &&
+			kvmppc_xive_native_supported();
 		break;
 #endif
 
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 2f26b74..37987c8 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -800,6 +800,13 @@ int xive_native_set_queue_state(u32 vp_id, u32 prio, u32 qtoggle, u32 qindex)
 }
 EXPORT_SYMBOL_GPL(xive_native_set_queue_state);
 
+bool xive_native_has_queue_state_support(void)
+{
+	return opal_check_token(OPAL_XIVE_GET_QUEUE_STATE) &&
+		opal_check_token(OPAL_XIVE_SET_QUEUE_STATE);
+}
+EXPORT_SYMBOL_GPL(xive_native_has_queue_state_support);
+
 int xive_native_get_vp_state(u32 vp_id, u64 *out_state)
 {
 	__be64 state;
-- 
2.7.4

