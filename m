Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0742B974E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 17:08:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcPkG2gdZzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 03:08:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=N7F647Sh; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=N7F647Sh; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcPbX65gGzDqq0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 03:03:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605801780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BsFZ0hQNQRNmuGnSwAh2380F9EOTYHnybWt5Ieopw9A=;
 b=N7F647ShfLWyNzmgZeUAmoDjzvoguV7a58iB+A2ahShYPPP9OhTuD9FfNQtGOExLzY43+K
 dlRj2cTIqiS3rDgSPNBE8pu1JzlLcHANJn3czNBJzxuo0RtI31wVaJOx+aElNDBnR0H+ZE
 X91ScLT2mlQky/N44jEnuUUnVDxYIAA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605801780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BsFZ0hQNQRNmuGnSwAh2380F9EOTYHnybWt5Ieopw9A=;
 b=N7F647ShfLWyNzmgZeUAmoDjzvoguV7a58iB+A2ahShYPPP9OhTuD9FfNQtGOExLzY43+K
 dlRj2cTIqiS3rDgSPNBE8pu1JzlLcHANJn3czNBJzxuo0RtI31wVaJOx+aElNDBnR0H+ZE
 X91ScLT2mlQky/N44jEnuUUnVDxYIAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-37pkQnoHPu-nnk6oAV5kEA-1; Thu, 19 Nov 2020 11:02:55 -0500
X-MC-Unique: 37pkQnoHPu-nnk6oAV5kEA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4606518C43D0;
 Thu, 19 Nov 2020 16:02:54 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.164])
 by smtp.corp.redhat.com (Postfix) with SMTP id E02B51002382;
 Thu, 19 Nov 2020 16:02:48 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Thu, 19 Nov 2020 17:02:53 +0100 (CET)
Date: Thu, 19 Nov 2020 17:02:47 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Subject: [PATCH v3 2/2] powerpc/ptrace: Hard wire PT_SOFTE value to 1 in
 gpr_get() too
Message-ID: <20201119160247.GB5188@redhat.com>
References: <20201119160154.GA5183@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119160154.GA5183@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

The commit a8a4b03ab95f ("powerpc: Hard wire PT_SOFTE value to 1 in
ptrace & signals") changed ptrace_get_reg(PT_SOFTE) to report 0x1,
but PTRACE_GETREGS still copies pt_regs->softe as is.

This is not consistent and this breaks the user-regs-peekpoke test
from https://sourceware.org/systemtap/wiki/utrace/tests/

Reported-by: Jan Kratochvil <jan.kratochvil@redhat.com>
Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 arch/powerpc/kernel/ptrace/ptrace-tm.c   | 8 +++++++-
 arch/powerpc/kernel/ptrace/ptrace-view.c | 8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-tm.c b/arch/powerpc/kernel/ptrace/ptrace-tm.c
index f8fcbd85d4cb..d0d339f86e61 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-tm.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-tm.c
@@ -87,6 +87,10 @@ int tm_cgpr_get(struct task_struct *target, const struct user_regset *regset,
 		struct membuf to)
 {
 	struct membuf to_msr = membuf_at(&to, offsetof(struct pt_regs, msr));
+#ifdef CONFIG_PPC64
+	struct membuf to_softe = membuf_at(&to,
+					offsetof(struct pt_regs, softe));
+#endif
 
 	if (!cpu_has_feature(CPU_FTR_TM))
 		return -ENODEV;
@@ -102,7 +106,9 @@ int tm_cgpr_get(struct task_struct *target, const struct user_regset *regset,
 				sizeof(struct user_pt_regs));
 
 	membuf_store(&to_msr, get_user_ckpt_msr(target));
-
+#ifdef CONFIG_PPC64
+	membuf_store(&to_softe, 0x1ul);
+#endif
 	return membuf_zero(&to, ELF_NGREG * sizeof(unsigned long) -
 				sizeof(struct user_pt_regs));
 }
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 39686ede40b3..f554ccfcbfae 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -218,6 +218,10 @@ static int gpr_get(struct task_struct *target, const struct user_regset *regset,
 		   struct membuf to)
 {
 	struct membuf to_msr = membuf_at(&to, offsetof(struct pt_regs, msr));
+#ifdef CONFIG_PPC64
+	struct membuf to_softe = membuf_at(&to,
+					offsetof(struct pt_regs, softe));
+#endif
 	int i;
 
 	if (target->thread.regs == NULL)
@@ -233,7 +237,9 @@ static int gpr_get(struct task_struct *target, const struct user_regset *regset,
 				sizeof(struct user_pt_regs));
 
 	membuf_store(&to_msr, get_user_msr(target));
-
+#ifdef CONFIG_PPC64
+	membuf_store(&to_softe, 0x1ul);
+#endif
 	return membuf_zero(&to, ELF_NGREG * sizeof(unsigned long) -
 				sizeof(struct user_pt_regs));
 }
-- 
2.25.1.362.g51ebf55


