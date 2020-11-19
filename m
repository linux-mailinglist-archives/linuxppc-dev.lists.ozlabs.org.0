Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C6C2B9746
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 17:06:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcPg76xlWzDqwy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 03:06:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=KSpJ1ebW; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=KSpJ1ebW; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcPb50v2BzDqnB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 03:02:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605801758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vg7/y2C8Tl2E1kWC5s1i5HxVqewxBng3nB4i5mKcMo8=;
 b=KSpJ1ebWdAziSrkUU8QVxCVbJbDl5qdoMnpU2BfwqINZq/smtiIhzINSCPthrDppeVpehF
 X/a4B4TnDO/RdLjdTJtcgHGXiX2mo90asJ10dirqN8vAIcufqgrr53Uehdqr8c5Ue/6Z5z
 MlOFALQ2djYy6uISZyMntaS8IM4FCXk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605801758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vg7/y2C8Tl2E1kWC5s1i5HxVqewxBng3nB4i5mKcMo8=;
 b=KSpJ1ebWdAziSrkUU8QVxCVbJbDl5qdoMnpU2BfwqINZq/smtiIhzINSCPthrDppeVpehF
 X/a4B4TnDO/RdLjdTJtcgHGXiX2mo90asJ10dirqN8vAIcufqgrr53Uehdqr8c5Ue/6Z5z
 MlOFALQ2djYy6uISZyMntaS8IM4FCXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-VEYUBObsMDmN0mj0ozlGgg-1; Thu, 19 Nov 2020 11:02:33 -0500
X-MC-Unique: VEYUBObsMDmN0mj0ozlGgg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23CF3101C7D9;
 Thu, 19 Nov 2020 16:02:31 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.164])
 by smtp.corp.redhat.com (Postfix) with SMTP id 6CE715D76F;
 Thu, 19 Nov 2020 16:02:22 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Thu, 19 Nov 2020 17:02:30 +0100 (CET)
Date: Thu, 19 Nov 2020 17:02:21 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Subject: [PATCH v3 1/2] powerpc/ptrace: simplify gpr_get/tm_cgpr_get
Message-ID: <20201119160221.GA5188@redhat.com>
References: <20201119160154.GA5183@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119160154.GA5183@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Jan Kratochvil <jan.kratochvil@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

gpr_get() does membuf_write() twice to override pt_regs->msr in between.
We can call membuf_write() once and change ->msr in the kernel buffer,
this simplifies the code and the next fix.

The patch adds a new simple helper, membuf_at(offs), it returns the new
membuf which can be safely used after membuf_write().

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 arch/powerpc/kernel/ptrace/ptrace-tm.c   | 13 +++++--------
 arch/powerpc/kernel/ptrace/ptrace-view.c | 13 +++++--------
 include/linux/regset.h                   | 12 ++++++++++++
 3 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-tm.c b/arch/powerpc/kernel/ptrace/ptrace-tm.c
index 54f2d076206f..f8fcbd85d4cb 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-tm.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-tm.c
@@ -86,6 +86,8 @@ int tm_cgpr_active(struct task_struct *target, const struct user_regset *regset)
 int tm_cgpr_get(struct task_struct *target, const struct user_regset *regset,
 		struct membuf to)
 {
+	struct membuf to_msr = membuf_at(&to, offsetof(struct pt_regs, msr));
+
 	if (!cpu_has_feature(CPU_FTR_TM))
 		return -ENODEV;
 
@@ -97,17 +99,12 @@ int tm_cgpr_get(struct task_struct *target, const struct user_regset *regset,
 	flush_altivec_to_thread(target);
 
 	membuf_write(&to, &target->thread.ckpt_regs,
-			offsetof(struct pt_regs, msr));
-	membuf_store(&to, get_user_ckpt_msr(target));
+				sizeof(struct user_pt_regs));
 
-	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
-		     offsetof(struct pt_regs, msr) + sizeof(long));
+	membuf_store(&to_msr, get_user_ckpt_msr(target));
 
-	membuf_write(&to, &target->thread.ckpt_regs.orig_gpr3,
-			sizeof(struct user_pt_regs) -
-			offsetof(struct pt_regs, orig_gpr3));
 	return membuf_zero(&to, ELF_NGREG * sizeof(unsigned long) -
-			sizeof(struct user_pt_regs));
+				sizeof(struct user_pt_regs));
 }
 
 /*
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 7e6478e7ed07..39686ede40b3 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -217,6 +217,7 @@ int ptrace_put_reg(struct task_struct *task, int regno, unsigned long data)
 static int gpr_get(struct task_struct *target, const struct user_regset *regset,
 		   struct membuf to)
 {
+	struct membuf to_msr = membuf_at(&to, offsetof(struct pt_regs, msr));
 	int i;
 
 	if (target->thread.regs == NULL)
@@ -228,17 +229,13 @@ static int gpr_get(struct task_struct *target, const struct user_regset *regset,
 			target->thread.regs->gpr[i] = NV_REG_POISON;
 	}
 
-	membuf_write(&to, target->thread.regs, offsetof(struct pt_regs, msr));
-	membuf_store(&to, get_user_msr(target));
+	membuf_write(&to, target->thread.regs,
+				sizeof(struct user_pt_regs));
 
-	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
-		     offsetof(struct pt_regs, msr) + sizeof(long));
+	membuf_store(&to_msr, get_user_msr(target));
 
-	membuf_write(&to, &target->thread.regs->orig_gpr3,
-			sizeof(struct user_pt_regs) -
-			offsetof(struct pt_regs, orig_gpr3));
 	return membuf_zero(&to, ELF_NGREG * sizeof(unsigned long) -
-				 sizeof(struct user_pt_regs));
+				sizeof(struct user_pt_regs));
 }
 
 static int gpr_set(struct task_struct *target, const struct user_regset *regset,
diff --git a/include/linux/regset.h b/include/linux/regset.h
index c3403f328257..a00765f0e8cf 100644
--- a/include/linux/regset.h
+++ b/include/linux/regset.h
@@ -46,6 +46,18 @@ static inline int membuf_write(struct membuf *s, const void *v, size_t size)
 	return s->left;
 }
 
+static inline struct membuf membuf_at(const struct membuf *s, size_t offs)
+{
+	struct membuf n = *s;
+
+	if (offs > n.left)
+		offs = n.left;
+	n.p += offs;
+	n.left -= offs;
+
+	return n;
+}
+
 /* current s->p must be aligned for v; v must be a scalar */
 #define membuf_store(s, v)				\
 ({							\
-- 
2.25.1.362.g51ebf55


