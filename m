Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9264970A9CE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 20:21:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNsV830Frz3fGF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 May 2023 04:21:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XRKxWRwI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XRKxWRwI;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNsTG0tmsz3c4w
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 May 2023 04:20:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 817086069A;
	Sat, 20 May 2023 18:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D9DC433D2;
	Sat, 20 May 2023 18:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684606829;
	bh=3DjWuqqa9Q8ueIdmo4+6EMhJRBWhSpB77ZH/7UAhzD0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=XRKxWRwInit0Koank6UKTCoHvzrdS210nB83+Tg/8M3UoguAOvbvtxfttGEQOPEmk
	 65YhVOqFifRmb5DfnsWTTPKMrhSKER4LD/osYtEagdQlD9yEgdCV97jYqwhj/9nt4o
	 g3kWm+OGlMDkT4XvKjj0MCSZGfUEBxBisNx+mmo59hbq6Rkp+dFgp+h2MFsZIxnZcH
	 3kD8ltgzWP9iLrARUKmjhfudRBxsuzTyQ3+3/FBm5kLqPRArHzYEQbVP2kPj1GbEC+
	 Rc+iiEale3grMzNytIZlyF0J9cX8oyDrpVk5EC/6rHzU2AGoa+j/UwotNo/CCdU9lJ
	 7GQ6pZN5VJ8IA==
Date: Sat, 20 May 2023 23:47:22 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH] powerpc/ftrace: Refactoring and support for
 -fpatchable-function-entry
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20230519192600.2593506-1-naveen@kernel.org>
	<3527b8d2-275e-29d8-fd3b-4002a4a901fd@csgroup.eu>
	<85460820-e5e0-57e3-68a7-dd7a562c9eb0@csgroup.eu>
In-Reply-To: <85460820-e5e0-57e3-68a7-dd7a562c9eb0@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1684605928.yl2udzpst9.naveen@kernel.org>
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
>=20
> Le 20/05/2023 =C3=A0 12:34, Christophe Leroy a =C3=A9crit=C2=A0:
>>=20
>>=20
>> Le 19/05/2023 =C3=A0 21:26, Naveen N Rao a =C3=A9crit=C2=A0:
>>> [Vous ne recevez pas souvent de courriers de naveen@kernel.org.=20
>>> D=C3=A9couvrez pourquoi ceci est important =C3=A0=20
>>> https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Refactor ftrace code and move to using ftrace_replace_code() to help
>>> simplify and make the code more maintainable.
>>>
>>> - The existing ftrace.c code is moved to a separate file so that ppc64
>>> =C2=A0=C2=A0 elfv1 and clang -pg only support continue. This makes it p=
ossible to
>>> =C2=A0=C2=A0 converge ppc32 and ppc64 support further.
>>> - Drop code to re-purpose compiler-generated long branches for ftrace
>>> =C2=A0=C2=A0 use in support of large kernels. We still retain the ftrac=
e stubs at
>>> =C2=A0=C2=A0 the end of .text, so we now support kernels upto ~64MB.
>>> - Add ftrace_init_nop() to keep boot-time validations and init separate
>>> =C2=A0=C2=A0 from runtime.
>>> - Implement ftrace_replace_code() to simplify overall ftrace setup. Thi=
s
>>> =C2=A0=C2=A0 will be especially useful when adding ability to nop out '=
mflr r0'
>>> =C2=A0=C2=A0 later, and for other subsequent ftrace features.
>>> - Add support for -fpatchable-function-entry. On ppc64, this needs gcc
>>> =C2=A0=C2=A0 v13.1 so that the nops are generated at LEP. This also mov=
es ppc32 to
>>> =C2=A0=C2=A0 using the same two-instruction sequence as that of ppc64.
>>>
>>> This applies atop patches 1-3 of Nick's series for elfv2 conversion, as
>>> well as Nick's patch enabling -mprofile-kernel for elfv2 BE:
>>> - https://lore.kernel.org/all/20230505071850.228734-1-npiggin@gmail.com=
/
>>> - https://lore.kernel.org/all/20230506011814.8766-1-npiggin@gmail.com/
>>>
>>> This builds for me and passes a quick test, posting this as an early
>>> RFC.
>>>
>>> Signed-off-by: Naveen N Rao <naveen@kernel.org>
>>=20
>> Looks good, works on PPC32 but I observed some performance degradation,=20
>> around 25% more time needed to activate function tracer and around 10%=20
>> more time needed to de-activate function tracer (by writting=20
>> function/nop into /sys/kernel/debug/tracing/current_tracer.

Thanks for the test!

I hadn't looked at the performance, though I was expecting it to be=20
better. On ppc64, I am actually not seeing much of a difference.

>=20
>=20
> perf record with your patch applied:
>=20
>      20.59%  echo     [kernel.kallsyms]      [k] ftrace_check_record
>      15.71%  echo     [kernel.kallsyms]      [k] patch_instruction
>       6.75%  echo     [kernel.kallsyms]      [k] ftrace_replace_code
>       4.30%  echo     [kernel.kallsyms]      [k] __ftrace_hash_rec_update
>       3.96%  echo     [kernel.kallsyms]      [k]=20
> __rb_reserve_next.constprop.0
>       3.20%  echo     [kernel.kallsyms]      [k] ftrace_get_call_inst.isr=
a.0
>       2.62%  echo     [kernel.kallsyms]      [k] ftrace_get_addr_new
>       2.44%  echo     [kernel.kallsyms]      [k] ftrace_rec_iter_next
>       2.15%  echo     [kernel.kallsyms]      [k] function_trace_call
>       2.09%  echo     [kernel.kallsyms]      [k] rb_commit
>       1.92%  echo     [kernel.kallsyms]      [k] ring_buffer_unlock_commi=
t
>       1.69%  echo     [kernel.kallsyms]      [k] ring_buffer_lock_reserve
>       1.63%  echo     [kernel.kallsyms]      [k] copy_page
>       1.45%  echo     [kernel.kallsyms]      [k]=20
> ftrace_create_branch_inst.constprop.0
>       1.40%  echo     [kernel.kallsyms]      [k] unmap_page_range
>       1.34%  echo     [kernel.kallsyms]      [k] mas_next_entry
>       1.28%  echo     ld-2.23.so             [.] do_lookup_x
>       1.22%  echo     [kernel.kallsyms]      [k] ftrace_call
>       1.05%  echo     [kernel.kallsyms]      [k] trace_function
>       0.99%  echo     [kernel.kallsyms]      [k] ftrace_caller
>       0.81%  echo     [kernel.kallsyms]      [k] ftrace_rec_iter_record
>=20
> perf record without your patch:
>=20
>      22.58%  echo     [kernel.kallsyms]  [k] patch_instruction
>      17.85%  echo     [kernel.kallsyms]  [k] ftrace_check_record
>      11.65%  echo     [kernel.kallsyms]  [k] ftrace_replace_code
>       6.76%  echo     [kernel.kallsyms]  [k] ftrace_make_call
>       6.68%  echo     [kernel.kallsyms]  [k] __ftrace_hash_rec_update
>       3.50%  echo     [kernel.kallsyms]  [k] ftrace_get_addr_curr
>       3.42%  echo     [kernel.kallsyms]  [k] ftrace_get_addr_new
>       2.36%  echo     [kernel.kallsyms]  [k] copy_page
>       1.22%  echo     [kernel.kallsyms]  [k] __rb_reserve_next.constprop.=
0
>       1.22%  echo     ld-2.23.so         [.] do_lookup_x
>       1.06%  echo     [kernel.kallsyms]  [k] ftrace_lookup_ip
>       0.73%  echo     ld-2.23.so         [.] _dl_relocate_object
>       0.65%  echo     [kernel.kallsyms]  [k] flush_dcache_icache_page
>       0.65%  echo     [kernel.kallsyms]  [k] function_trace_call

That suggests ftrace_test_record() as the likely cause. The below change=20
does improve performance on ppc64. Can you see if it makes a difference=20
on ppc32?

Upstream/before the below change (ftrace activation):
	0.15266 +- 0.00215 seconds time elapsed  ( +-  1.41% )
With the below change:
	0.14170 +- 0.00396 seconds time elapsed  ( +-  2.79% )


- Naveen

---
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index a9d57f338bd78e..8b2096ec77bba2 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -167,23 +167,22 @@ void ftrace_replace_code(int enable)
=20
        for_ftrace_rec_iter(iter) {
                rec =3D ftrace_rec_iter_record(iter);
-               update =3D ftrace_test_record(rec, enable);
                ip =3D rec->ip;
-               new_addr =3D 0;
+               addr =3D ftrace_get_addr_curr(rec);
+               new_addr =3D ftrace_get_addr_new(rec);
+               update =3D ftrace_update_record(rec, enable);
=20
                switch (update) {
                case FTRACE_UPDATE_IGNORE:
                default:
                        continue;
                case FTRACE_UPDATE_MODIFY_CALL:
-                       addr =3D ftrace_get_addr_curr(rec);
-                       new_addr =3D ftrace_get_addr_new(rec);
                        break;
                case FTRACE_UPDATE_MAKE_CALL:
-                       addr =3D ftrace_get_addr_new(rec);
-                       break;
+                       addr =3D new_addr;
+                       fallthrough;
                case FTRACE_UPDATE_MAKE_NOP:
-                       addr =3D ftrace_get_addr_curr(rec);
+                       new_addr =3D 0;
                        break;
                }
                nop_inst =3D ppc_inst(PPC_RAW_NOP());
@@ -213,7 +212,6 @@ void ftrace_replace_code(int enable)
                        ret =3D ftrace_modify_code(ip, old, new);
                if (ret)
                        goto out;
-               ftrace_update_record(rec, enable);
        }
=20
 out:

