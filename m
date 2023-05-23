Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2754B70D94C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 11:41:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQTpZ04ryz3f8H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 19:41:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rwwMnlo/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rwwMnlo/;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQTnj6C59z3bcT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 19:40:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF09661EB5;
	Tue, 23 May 2023 09:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B7CC433EF;
	Tue, 23 May 2023 09:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684834821;
	bh=aoJPzuZGmUXhQvVKQ1oFA01sfy5pIQx3hQz3f58+NQ0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=rwwMnlo/A+mnx0xYaQUiKZRFa6xZNk4+AMHbB/889LTPkZz5jQM4YtZpC9OLrdWVL
	 gSLKMOM9AS4YQ8LC7JhSeON+UFFcIlzkDIWXq2Xhuc+xexC5Zv41U+uknf97dOgZKX
	 NWp5fWTJi1pxBzSgzACpQdDMOi3L7WQ8QGWmeE9HljyEtYUT4dk76yp8ggH23NWBah
	 /t6Vp9/ceMU9mxNI9S5JfJJbi7LN3Bt3VxG29HrQrUON4FxcQ8CKInINaXt5GMkXmF
	 8LXjIPGIHQhCTy1XpRe1VMP9yPTc8Las37HoPI5SJgOVbOJ1qzRZV/cnYUgLSZ6mk1
	 RNd0zxac4yo/A==
Date: Tue, 23 May 2023 15:01:39 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH] powerpc/ftrace: Refactoring and support for
 -fpatchable-function-entry
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20230519192600.2593506-1-naveen@kernel.org>
	<3527b8d2-275e-29d8-fd3b-4002a4a901fd@csgroup.eu>
	<85460820-e5e0-57e3-68a7-dd7a562c9eb0@csgroup.eu>
	<1684605928.yl2udzpst9.naveen@kernel.org>
	<5463949f-289b-1eae-17c7-f77f63389f98@csgroup.eu>
In-Reply-To: <5463949f-289b-1eae-17c7-f77f63389f98@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1684833778.7ege0impv3.naveen@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
> That's better, but still more time than original implementation:
>=20
> +20% to activate function tracer (was +40% with your RFC)
> +21% to activate nop tracer (was +24% with your RFC)
>=20
> perf record (without strict kernel rwx) :
>=20
>      17.75%  echo     [kernel.kallsyms]   [k] ftrace_check_record
>       9.76%  echo     [kernel.kallsyms]   [k] ftrace_replace_code
>       6.53%  echo     [kernel.kallsyms]   [k] patch_instruction
>       5.21%  echo     [kernel.kallsyms]   [k] __ftrace_hash_rec_update
>       4.26%  echo     [kernel.kallsyms]   [k] ftrace_get_addr_curr
>       4.18%  echo     [kernel.kallsyms]   [k] ftrace_get_call_inst.isra.0
>       3.45%  echo     [kernel.kallsyms]   [k] ftrace_get_addr_new
>       3.08%  echo     [kernel.kallsyms]   [k] function_trace_call
>       2.20%  echo     [kernel.kallsyms]   [k] __rb_reserve_next.constprop=
.0
>       2.05%  echo     [kernel.kallsyms]   [k] copy_page
>       1.91%  echo     [kernel.kallsyms]   [k]=20
> ftrace_create_branch_inst.constprop.0
>       1.83%  echo     [kernel.kallsyms]   [k] ftrace_rec_iter_next
>       1.83%  echo     [kernel.kallsyms]   [k] rb_commit
>       1.69%  echo     [kernel.kallsyms]   [k] ring_buffer_lock_reserve
>       1.54%  echo     [kernel.kallsyms]   [k] trace_function
>       1.39%  echo     [kernel.kallsyms]   [k] __call_rcu_common.constprop=
.0
>       1.25%  echo     ld-2.23.so          [.] do_lookup_x
>       1.17%  echo     [kernel.kallsyms]   [k] ftrace_rec_iter_record
>       1.03%  echo     [kernel.kallsyms]   [k] unmap_page_range
>       0.95%  echo     [kernel.kallsyms]   [k] flush_dcache_icache_page
>       0.95%  echo     [kernel.kallsyms]   [k] ftrace_lookup_ip

Ok, I simplified this further, and this is as close to the previous fast=20
path as we can get (applies atop the original RFC). The only difference=20
left is the ftrace_rec iterator.


- Naveen

---
 arch/powerpc/kernel/trace/ftrace.c | 55 +++++++++++++-----------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index a9d57f338bd78e..4937651ecfafb0 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -96,13 +96,18 @@ static unsigned long find_ftrace_tramp(unsigned long ip=
)
=20
 static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr=
, ppc_inst_t *call_inst)
 {
-	struct module *mod =3D rec->arch.mod;
 	unsigned long ip =3D rec->ip;
 	unsigned long stub;
=20
 	if (is_offset_in_branch_range(addr - ip)) {
 		/* Within range */
 		stub =3D addr;
+#ifdef CONFIG_MODULES
+	} else if (rec->arch.mod) {
+		/* Module code would be going to one of the module stubs */
+		stub =3D (addr =3D=3D (unsigned long)ftrace_caller ? rec->arch.mod->arch=
.tramp :
+							       rec->arch.mod->arch.tramp_regs);
+#endif
 	} else if (core_kernel_text(ip)) {
 		/* We would be branching to one of our ftrace stubs */
 		stub =3D find_ftrace_tramp(ip);
@@ -110,9 +115,6 @@ static int ftrace_get_call_inst(struct dyn_ftrace *rec,=
 unsigned long addr, ppc_
 			pr_err("0x%lx: No ftrace stubs reachable\n", ip);
 			return -EINVAL;
 		}
-	} else if (IS_ENABLED(CONFIG_MODULES)) {
-		/* Module code would be going to one of the module stubs */
-		stub =3D (addr =3D=3D (unsigned long)ftrace_caller ? mod->arch.tramp : m=
od->arch.tramp_regs);
 	} else {
 		return -EINVAL;
 	}
@@ -159,7 +161,8 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftra=
ce *rec, unsigned long ad
=20
 void ftrace_replace_code(int enable)
 {
-	ppc_inst_t old, new, nop_inst, call_inst, new_call_inst;
+	ppc_inst_t old, new, call_inst, new_call_inst;
+	ppc_inst_t nop_inst =3D ppc_inst(PPC_RAW_NOP());
 	unsigned long ip, new_addr, addr;
 	struct ftrace_rec_iter *iter;
 	struct dyn_ftrace *rec;
@@ -167,53 +170,41 @@ void ftrace_replace_code(int enable)
=20
 	for_ftrace_rec_iter(iter) {
 		rec =3D ftrace_rec_iter_record(iter);
-		update =3D ftrace_test_record(rec, enable);
 		ip =3D rec->ip;
-		new_addr =3D 0;
+
+		if (rec->flags & FTRACE_FL_DISABLED && !(rec->flags & FTRACE_FL_ENABLED)=
)
+			continue;
+
+		addr =3D ftrace_get_addr_curr(rec);
+		new_addr =3D ftrace_get_addr_new(rec);
+		update =3D ftrace_update_record(rec, enable);
=20
 		switch (update) {
 		case FTRACE_UPDATE_IGNORE:
 		default:
 			continue;
 		case FTRACE_UPDATE_MODIFY_CALL:
-			addr =3D ftrace_get_addr_curr(rec);
-			new_addr =3D ftrace_get_addr_new(rec);
-			break;
-		case FTRACE_UPDATE_MAKE_CALL:
-			addr =3D ftrace_get_addr_new(rec);
-			break;
-		case FTRACE_UPDATE_MAKE_NOP:
-			addr =3D ftrace_get_addr_curr(rec);
-			break;
-		}
-		nop_inst =3D ppc_inst(PPC_RAW_NOP());
-		ret =3D ftrace_get_call_inst(rec, addr, &call_inst);
-		if (!ret && new_addr)
 			ret =3D ftrace_get_call_inst(rec, new_addr, &new_call_inst);
-		if (ret)
-			goto out;
-
-		switch (update) {
-		case FTRACE_UPDATE_MODIFY_CALL:
+			ret |=3D ftrace_get_call_inst(rec, addr, &call_inst);
 			old =3D call_inst;
 			new =3D new_call_inst;
 			break;
+		case FTRACE_UPDATE_MAKE_NOP:
+			ret =3D ftrace_get_call_inst(rec, addr, &call_inst);
+			old =3D call_inst;
+			new =3D nop_inst;
+			break;
 		case FTRACE_UPDATE_MAKE_CALL:
+			ret =3D ftrace_get_call_inst(rec, new_addr, &call_inst);
 			old =3D nop_inst;
 			new =3D call_inst;
 			break;
-		case FTRACE_UPDATE_MAKE_NOP:
-			new =3D nop_inst;
-			old =3D call_inst;
-			break;
 		}
=20
-		/* old =3D=3D new when going to .ftrace.text stub for modify */
-		if (!ppc_inst_equal(old, new))
+		if (!ret)
 			ret =3D ftrace_modify_code(ip, old, new);
 		if (ret)
 			goto out;
-		ftrace_update_record(rec, enable);
 	}
=20
 out:

