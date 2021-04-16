Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D754361FA4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 14:20:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMFdy2W0Zz3bVK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 22:20:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m724Hrg4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=m724Hrg4; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMFdP5QgMz3bTy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 22:19:37 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FMFd66r9jz9sVb;
 Fri, 16 Apr 2021 22:19:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618575564;
 bh=UHfql/y2BW+iWPWEbqHI6kWiIjvfmk8q8pCLl6y33sk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=m724Hrg4Qv39m4WfL3Lb91m/2exBtElfSbYdV18xx9FL14p5GrPUqdIeh+/wtaAPd
 XYVyKGH2PtrwbbNqjymVm/SmPPNGBuXRruJrZmK1grW3p5/HNH+uLODuAy9IovW6gw
 SJ0Q9D+kjWVF2gsTVNT/NgFGx0xG1PaoH591HuzGJcKjU9QSE5SLKOoeAonsl7s7nf
 NUVKbKhLKqsElHW45FSV/9+bO6AA7PBwlrhk7H2T6c27n81A5goOw5gG0LZG4WNrzY
 2zExtRusw2fjlRt6bu1V0e7evJp1tMNnsGnNMRCnVl9ehwZKLpuGfOFuycEr83eN8I
 ZUokiJgbxiE8A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dan Carpenter <dan.carpenter@oracle.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
In-Reply-To: <20210416080941.GO6048@kadam>
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au>
 <f82a9fe2-3254-3f25-616c-10e56103bdc6@csgroup.eu>
 <20210416080941.GO6048@kadam>
Date: Fri, 16 Apr 2021 22:19:19 +1000
Message-ID: <87lf9ie81k.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 robh@kernel.org, Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bauerman@linux.ibm.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Carpenter <dan.carpenter@oracle.com> writes:
> On Fri, Apr 16, 2021 at 09:00:12AM +0200, Christophe Leroy wrote:
>> Le 16/04/2021 =C3=A0 08:44, Daniel Axtens a =C3=A9crit=C2=A0:
>> > > On 4/15/21 12:14 PM, Lakshmi Ramasubramanian wrote:
>> > >=20
>> > > > There are a few "goto out;" statements before the local variable "=
fdt"
>> > > > is initialized through the call to of_kexec_alloc_and_setup_fdt() =
in
>> > > > elf64_load(). This will result in an uninitialized "fdt" being pas=
sed
>> > > > to kvfree() in this function if there is an error before the call =
to
>> > > > of_kexec_alloc_and_setup_fdt().
>> > > >=20
>> > > > Initialize the local variable "fdt" to NULL.
>> > > >=20
>> > I'm a huge fan of initialising local variables! But I'm struggling to
>> > find the code path that will lead to an uninit fdt being returned...
>> >=20
>> > The out label reads in part:
>> >=20
>> > 	/* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
>> > 	return ret ? ERR_PTR(ret) : fdt;
>> >=20
>> > As far as I can tell, any time we get a non-zero ret, we're going to
>> > return an error pointer rather than the uninitialised value...
>>=20
>> I don't think GCC is smart enough to detect that.
>>=20
>
> We disabled uninitialized variable checking for GCC.

We disabled -Wmaybe-uninitialized, but that doesn't disable *all*
uninitialized warnings does it?

I wish we hadn't disabled it, it's already led to bugs slipping through.

> But actually is something that has been on my mind recently.  Smatch is
> supposed to parse this correctly but there is a bug that affects powerpc
> and I don't know how to debug it.  The kbuild bot is doing cross
> platform compiles but I don't have one set up on myself.  Could someone
> with Smatch installed test something for me?
>
> Or if you don't have Smatch installed then you should definitely install
> it.  :P
> https://www.spinics.net/lists/smatch/msg00568.html

I have smatch installed, and even run it sometimes ;)


> Apply the patch from below and edit the path to point to the correct
> directory.  Then run kchecker and email me the output?

That gave me:

    CC      arch/powerpc/kernel/hw_breakpoint.o
  /home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c: In function =E2=
=80=98task_bps_add=E2=80=99:
  /home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:176:16: error: pa=
ssing argument 1 of =E2=80=98__smatch_about=E2=80=99 makes integer from poi=
nter without a cast [-Werror=3Dint-conversion]
    176 | __smatch_about(tmp);
        |                ^~~
        |                |
        |                struct breakpoint *
  In file included from /home/michael/linux/arch/powerpc/kernel/hw_breakpoi=
nt.c:170:
  /home/michael/smatch/check_debug.h:4:40: note: expected =E2=80=98long int=
=E2=80=99 but argument is of type =E2=80=98struct breakpoint *=E2=80=99
      4 | static inline void __smatch_about(long var){}
        |                                   ~~~~~^~~
  /home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:180:21: error: pa=
ssing argument 1 of =E2=80=98__smatch_about=E2=80=99 makes integer from poi=
nter without a cast [-Werror=3Dint-conversion]
    180 |      __smatch_about(tmp);
        |                     ^~~
        |                     |
        |                     struct breakpoint *
  In file included from /home/michael/linux/arch/powerpc/kernel/hw_breakpoi=
nt.c:170:
  /home/michael/smatch/check_debug.h:4:40: note: expected =E2=80=98long int=
=E2=80=99 but argument is of type =E2=80=98struct breakpoint *=E2=80=99
      4 | static inline void __smatch_about(long var){}
        |                                   ~~~~~^~~
  cc1: all warnings being treated as errors


Which looks like it didn't work.

Right, needs tmp cast to long.

Output below, hope it helps. Happy to test other things.

cheers


  GEN     Makefile
  CHECK   /home/michael/linux/scripts/mod/empty.c
  CALL    /home/michael/linux/scripts/checksyscalls.sh
  CALL    /home/michael/linux/scripts/atomic/check-atomics.sh
  CHECK   /home/michael/linux/arch/powerpc/kernel/vdso64/vgettimeofday.c
  CC      arch/powerpc/kernel/hw_breakpoint.o
  CHECK   /home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
---- about ----
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
implied: tmp =3D 's64min-(-4096),(-12),4096-s64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
buf size: 'tmp' 0 elements, 0 bytes (rl =3D (-1),32)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
strlen: 'tmp'  characters
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
real absolute: tmp =3D 's64min-(-4096),(-12),4096-s64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
mtag =3D 0 offset =3D 0 rl =3D ''
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
[register_smatch_extra] tmp =3D '4096-ptr_max,(-12)' [merged] (4096-ptr_max=
,(-12), 4096-ptr_max, (-12), 4096-ptr_max, (-12))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
[register_modification_hooks] tmp =3D 'tmp =3D alloc_breakpoint(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
[register_buf_size] tmp =3D '(-1),32' [merged] ((-1), (-1),32, 32)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
[register_comparison_links] tmp =3D '__fake_param_0x7da6ac1c7450_0 vs tmp, =
return 0x7da6ac1c7360 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
[register_fresh_alloc] tmp =3D 'undefined'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
[check_deref] tmp =3D 'ok'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
[check_uninitialized] tmp =3D 'initialized' [merged]
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
[register_assigned_expr] tmp =3D 'alloc_breakpoint(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:177 task_bps_add() =
[register_assigned_expr_links] tmp =3D '__fake_param_0x7da6ac1c7450_0'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:178 task_bps_add() =
set_state change [register_definition_db_callbacks] 'db_incomplete' incompl=
ete =3D> incomplete
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:178 task_bps_add() =
__set_sm change [register_definition_db_callbacks] db_incomplete =3D 'incom=
plete' (was incomplete)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_statement_count] 'stmts' 10 =3D> 11
179 in __split_whole_condition
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
179 in split_conditions (IS_ERR(tmp))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_buf_size] '__fake_param_0x7da6ac1c7630_0' (-1),32
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0' 4096-=
ptr_max,(-12)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] __fake_param_0x7da6ac1c7630_0 =3D '=
4096-ptr_max,(-12)' [merged] (4096-ptr_max,(-12), 4096-ptr_max, (-12), 4096=
-ptr_max, (-12)) (was 4096-ptr_max,(-12))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] tmp =3D '4096-ptr_max,(-12)' [merge=
d] (4096-ptr_max,(-12), 4096-ptr_max, (-12), 4096-ptr_max, (-12)) (was 4096=
-ptr_max,(-12))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] __fake_param_0x7da6ac1c7630_0 =3D '=
4096-ptr_max,(-12)' [merged] (4096-ptr_max,(-12), 4096-ptr_max, (-12), 4096=
-ptr_max, (-12)) (was 4096-ptr_max,(-12))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_comparison] '__fake_param_0x7da6ac1c7630_0 vs retur=
n 0x7da6ac1c7360' =3D=3D
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_comparison_links] '__fake_param_0x7da6ac1c7630_0' _=
_fake_param_0x7da6ac1c7630_0 vs return 0x7da6ac1c7360
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_comparison] '__fake_param_0x7da6ac1c7630_0 vs tmp' =
=3D=3D
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_comparison_links] '__fake_param_0x7da6ac1c7630_0=
' __fake_param_0x7da6ac1c7630_0 vs return 0x7da6ac1c7360 =3D> __fake_param_=
0x7da6ac1c7630_0 vs return 0x7da6ac1c7360, __fake_param_0x7da6ac1c7630_0 vs=
 tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_comparison_links] 'tmp' __fake_param_0x7da6ac1c7=
450_0 vs tmp, return 0x7da6ac1c7360 vs tmp =3D> __fake_param_0x7da6ac1c7450=
_0 vs tmp, __fake_param_0x7da6ac1c7630_0 vs tmp, return 0x7da6ac1c7360 vs t=
mp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_assigned_expr] '__fake_param_0x7da6ac1c7630_0' tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_assigned_expr_links] 'tmp' __fake_param_0x7da6ac=
1c7450_0 =3D> __fake_param_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0
debug: insert into caller_info values ('/home/michael/linux/arch/powerpc/ke=
rnel/hw_breakpoint.c', 'task_bps_add', 'IS_ERR', 138154805589552, 1, 0, -1,=
 '%call_marker%', 'bool(*)(void*)');
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
insert into caller_info values ('/home/michael/linux/arch/powerpc/kernel/hw=
_breakpoint.c', 'task_bps_add', 'IS_ERR', 138154805589552, 1, 0, -1, '%call=
_marker%', 'bool(*)(void*)');
debug: insert into caller_info values ('/home/michael/linux/arch/powerpc/ke=
rnel/hw_breakpoint.c', 'task_bps_add', 'IS_ERR', 138154805589552, 1, 1001, =
0, '$', '4096-ptr_max,(-12)');
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
insert into caller_info values ('/home/michael/linux/arch/powerpc/kernel/hw=
_breakpoint.c', 'task_bps_add', 'IS_ERR', 138154805589552, 1, 1001, 0, '$',=
 '4096-ptr_max,(-12)');
debug: insert into caller_info values ('/home/michael/linux/arch/powerpc/ke=
rnel/hw_breakpoint.c', 'task_bps_add', 'IS_ERR', 138154805589552, 1, 1014, =
0, '$', 'r alloc_breakpoint');
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
insert into caller_info values ('/home/michael/linux/arch/powerpc/kernel/hw=
_breakpoint.c', 'task_bps_add', 'IS_ERR', 138154805589552, 1, 1014, 0, '$',=
 'r alloc_breakpoint');
debug: insert into caller_info values ('/home/michael/linux/arch/powerpc/ke=
rnel/hw_breakpoint.c', 'task_bps_add', 'IS_ERR', 138154805589552, 1, 1002, =
0, '$', '(-1),32');
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
insert into caller_info values ('/home/michael/linux/arch/powerpc/kernel/hw=
_breakpoint.c', 'task_bps_add', 'IS_ERR', 138154805589552, 1, 1002, 0, '$',=
 '(-1),32');
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_modification_hooks] '*tmp' __smatch_about(tmp) =
=3D> IS_ERR(tmp)
inline function:  IS_ERR
/home/michael/linux/include/linux/err.h:34 IS_ERR() set_state new [internal=
] 'unnull_path' true
debug: select call_id, type, parameter, key, value from caller_info where c=
all_id =3D 138154805589552;
/home/michael/linux/include/linux/err.h:34 IS_ERR() select call_id, type, p=
arameter, key, value from caller_info where call_id =3D 138154805589552;
138154805589552, 0, -1, %call_marker%, bool(*)(void*)
138154805589552, 1001, 0, $, 4096-ptr_max,(-12)
138154805589552, 1014, 0, $, r alloc_breakpoint
138154805589552, 1002, 0, $, (-1),32
/home/michael/linux/include/linux/err.h:34 IS_ERR() set_state new [register=
_kernel_user_data2] 'this_function' called
/home/michael/linux/include/linux/err.h:34 IS_ERR() set_state new [register=
_smatch_extra] 'ptr' 4096-ptr_max,(-12)
/home/michael/linux/include/linux/err.h:34 IS_ERR() set_state new [register=
_buf_size] 'ptr' (-1),32
/home/michael/linux/include/linux/err.h:34 IS_ERR() __set_sm new [register_=
smatch_extra] ptr =3D '4096-ptr_max,(-12)'
/home/michael/linux/include/linux/err.h:34 IS_ERR() __set_sm new [register_=
buf_size] ptr =3D '(-1),32'
/home/michael/linux/include/linux/err.h:34 IS_ERR() __set_sm new [register_=
kernel_user_data2] this_function =3D 'called'
mem-db: insert into function_type values ('/home/michael/linux/arch/powerpc=
/kernel/hw_breakpoint.c', 'IS_ERR', 1, 0, 'void*');
/home/michael/linux/include/linux/err.h:34 IS_ERR() set_state new [check_de=
references_param] 'ptr' param
/home/michael/linux/include/linux/err.h:34 IS_ERR() set_state new [register=
_comparison] 'ptr vs ptr orig' =3D=3D
/home/michael/linux/include/linux/err.h:34 IS_ERR() set_state new [register=
_comparison_links] 'ptr' ptr vs ptr orig
/home/michael/linux/include/linux/err.h:34 IS_ERR() set_state new [register=
_statement_count] 'stmts' 1
/home/michael/linux/include/linux/err.h:36 IS_ERR() set_state change [regis=
ter_statement_count] 'stmts' 1 =3D> 2
36 in __handle_condition_assigns
/home/michael/linux/include/linux/err.h:36 IS_ERR() 36 in split_conditions =
(!!((ptr) >=3D -4095))
/home/michael/linux/include/linux/err.h:36 IS_ERR() 36 in split_conditions =
(!((ptr) >=3D -4095))
/home/michael/linux/include/linux/err.h:36 IS_ERR() 36 in split_conditions =
(((ptr) >=3D -4095))
/home/michael/linux/include/linux/err.h:36 IS_ERR() set_true_false_states [=
register_smatch_extra] 'ptr'.  Was 4096-ptr_max,(-12).  Now T:(-12) F:4096-=
ptr_max
/home/michael/linux/include/linux/err.h:36 IS_ERR() set_true_false_states [=
register_parsed_conditions] 'condition 0x7da6aed21be0'.  Was (null).  Now T=
:true_path F:false_path
/home/michael/linux/include/linux/err.h:36 IS_ERR() set_state new [register=
_smatch_extra] '__sm_fake_0x7da6aed219b0' 1
/home/michael/linux/include/linux/err.h:36 IS_ERR() set_state new [register=
_smatch_extra] '__sm_fake_0x7da6aed219b0' 0
/home/michael/linux/include/linux/err.h:36 IS_ERR() merge [register_smatch_=
extra] 'ptr' 4096-ptr_max(L 36) + (-12)(L 36) =3D> 4096-ptr_max,(-12) (4096=
-ptr_max,(-12), (-12), 4096-ptr_max)
/home/michael/linux/include/linux/err.h:36 IS_ERR() merge [register_parsed_=
conditions] 'condition 0x7da6aed21be0' false_path(L 36) + true_path(L 36) =
=3D> merged (merged, false_path, true_path)
/home/michael/linux/include/linux/err.h:36 IS_ERR() merge [register_smatch_=
extra] '__sm_fake_0x7da6aed219b0' 1(L 36) + 0(L 36) =3D> 0-1 (0-1, 0, 1)
/home/michael/linux/include/linux/err.h:36 IS_ERR() merge [register_smatch_=
extra] 'ptr' (-12)(L 36) + 4096-ptr_max(L 36) =3D> 4096-ptr_max,(-12) (4096=
-ptr_max,(-12), 4096-ptr_max, (-12))
/home/michael/linux/include/linux/err.h:36 IS_ERR() merge [register_parsed_=
conditions] 'condition 0x7da6aed21be0' true_path(L 36) + false_path(L 36) =
=3D> merged (merged, false_path, true_path)
/home/michael/linux/include/linux/err.h:36 IS_ERR() __set_sm new [register_=
smatch_extra] __sm_fake_0x7da6aed219b0 =3D '0-1' [merged] (0-1, 0, 1, 0, 1)
/home/michael/linux/include/linux/err.h:36 IS_ERR() __set_sm change [regist=
er_smatch_extra] ptr =3D '4096-ptr_max,(-12)' [merged] (4096-ptr_max,(-12),=
 4096-ptr_max, (-12), 4096-ptr_max, (-12)) (was 4096-ptr_max,(-12))
/home/michael/linux/include/linux/err.h:36 IS_ERR() __set_sm change [regist=
er_parsed_conditions] condition 0x7da6aed21be0 =3D 'merged' [merged] (merge=
d, false_path, true_path) (was merged)
36 done __handle_condition_assigns
/home/michael/linux/include/linux/err.h:36 IS_ERR() set_state new [register=
_assigned_expr] '__sm_fake_0x7da6aed219b0' !!((ptr) >=3D -4095)
36 in __split_whole_condition
/home/michael/linux/include/linux/err.h:36 IS_ERR() 36 in split_conditions =
(!!((ptr) >=3D -4095))
/home/michael/linux/include/linux/err.h:36 IS_ERR() 36 in split_conditions =
(!((ptr) >=3D -4095))
/home/michael/linux/include/linux/err.h:36 IS_ERR() 36 in split_conditions =
(((ptr) >=3D -4095))
/home/michael/linux/include/linux/err.h:36 IS_ERR() __set_true_false_sm [re=
gister_smatch_extra] '__sm_fake_0x7da6aed219b0'.  Was 0-1.  Now T:1 F:(null)
/home/michael/linux/include/linux/err.h:36 IS_ERR() __set_true_false_sm [re=
gister_smatch_extra] 'ptr'.  Was 4096-ptr_max,(-12).  Now T:(-12) F:(null)
/home/michael/linux/include/linux/err.h:36 IS_ERR() __set_true_false_sm [re=
gister_parsed_conditions] 'condition 0x7da6aed21be0'.  Was merged.  Now T:t=
rue_path F:(null)
/home/michael/linux/include/linux/err.h:36 IS_ERR() __set_true_false_sm [re=
gister_smatch_extra] '__sm_fake_0x7da6aed219b0'.  Was 0-1.  Now T:(null) F:0
/home/michael/linux/include/linux/err.h:36 IS_ERR() __set_true_false_sm [re=
gister_smatch_extra] 'ptr'.  Was 4096-ptr_max,(-12).  Now T:(null) F:4096-p=
tr_max
/home/michael/linux/include/linux/err.h:36 IS_ERR() __set_true_false_sm [re=
gister_parsed_conditions] 'condition 0x7da6aed21be0'.  Was merged.  Now T:(=
null) F:false_path
/home/michael/linux/include/linux/err.h:36 IS_ERR() set_true_false_states [=
register_smatch_extra] 'ptr'.  Was 4096-ptr_max,(-12).  Now T:(-12) F:4096-=
ptr_max
/home/michael/linux/include/linux/err.h:36 IS_ERR() set_true_false_states [=
register_parsed_conditions] 'condition 0x7da6aed21be0'.  Was merged.  Now T=
:true_path F:false_path
36 done __split_whole_condition
/home/michael/linux/include/linux/err.h:36 IS_ERR() set_state new [register=
_returns_early] 'return_ranges' 1
mem-db: insert into return_states values ('/home/michael/linux/arch/powerpc=
/kernel/hw_breakpoint.c', 'IS_ERR', 138154805589552, 93, '1', 1, 0, -1, '',=
 'bool(*)(void*)');
mem-db: insert into return_states values ('/home/michael/linux/arch/powerpc=
/kernel/hw_breakpoint.c', 'IS_ERR', 138154805589552, 93, '1', 1, 103, 0, '$=
', '(-12)');
mem-db: insert into return_states values ('/home/michael/linux/arch/powerpc=
/kernel/hw_breakpoint.c', 'IS_ERR', 138154805589552, 93, '1', 1, 1037, -1, =
'', '2');
/home/michael/linux/include/linux/err.h:36 IS_ERR() set_state new [register=
_returns_early] 'return_ranges' 0
mem-db: insert into return_states values ('/home/michael/linux/arch/powerpc=
/kernel/hw_breakpoint.c', 'IS_ERR', 138154805589552, 94, '0', 1, 0, -1, '',=
 'bool(*)(void*)');
/home/michael/linux/include/linux/err.h:36 IS_ERR() merge [register_smatch_=
extra] '__sm_fake_0x7da6aed219b0' 1(L 36) + 0(L 36) =3D> 0-1 (0-1, 0, 1)
/home/michael/linux/include/linux/err.h:36 IS_ERR() merge [register_smatch_=
extra] 'ptr' (-12)(L 36) + 4096-ptr_max(L 36) =3D> 4096-ptr_max,(-12) (4096=
-ptr_max,(-12), 4096-ptr_max, (-12))
/home/michael/linux/include/linux/err.h:36 IS_ERR() merge [register_returns=
_early] 'return_ranges' 1(L 36) + 0(L 36) =3D> merged (0, 1, merged)
/home/michael/linux/include/linux/err.h:36 IS_ERR() merge [register_parsed_=
conditions] 'condition 0x7da6aed21be0' true_path(L 36) + false_path(L 36) =
=3D> merged (merged, false_path, true_path)
mem-db: insert into return_states values ('/home/michael/linux/arch/powerpc=
/kernel/hw_breakpoint.c', 'IS_ERR', 138154805589552, 94, '0', 1, 103, 0, '$=
', '4096-ptr_max');
mem-db: insert into return_states values ('/home/michael/linux/arch/powerpc=
/kernel/hw_breakpoint.c', 'IS_ERR', 138154805589552, 94, '0', 1, 1037, -1, =
'', '2');
/home/michael/linux/include/linux/err.h:36 IS_ERR() merge [register_smatch_=
extra] '__sm_fake_0x7da6aed219b0' 0(L 36) + 1(L 36) =3D> 0-1 (0-1, 1, 0)
/home/michael/linux/include/linux/err.h:36 IS_ERR() merge [register_smatch_=
extra] 'ptr' 4096-ptr_max(L 36) + (-12)(L 36) =3D> 4096-ptr_max,(-12) (4096=
-ptr_max,(-12), (-12), 4096-ptr_max)
/home/michael/linux/include/linux/err.h:36 IS_ERR() merge [register_returns=
_early] 'return_ranges' 0(L 36) + 1(L 36) =3D> merged (0, 1, merged)
/home/michael/linux/include/linux/err.h:36 IS_ERR() merge [register_parsed_=
conditions] 'condition 0x7da6aed21be0' false_path(L 36) + true_path(L 36) =
=3D> merged (merged, false_path, true_path)
debug: select function, type, parameter, key, value from return_implies whe=
re call_id =3D '138154805589552';
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
select function, type, parameter, key, value from return_implies where call=
_id =3D '138154805589552';
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_smatch_extra] __fake_param_0x7da6ac1c7630_0 =3D '409=
6-ptr_max,(-12)' [merged] (4096-ptr_max,(-12), 4096-ptr_max, (-12), 4096-pt=
r_max, (-12))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0'=
.  Was 4096-ptr_max,(-12).  Now T:4096-ptr_max,(-12) F:4096-ptr_max,(-12)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] tmp =3D '4096-ptr_max,(-12)' [merge=
d] (4096-ptr_max,(-12), 4096-ptr_max, (-12), 4096-ptr_max, (-12)) (was 4096=
-ptr_max,(-12))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] 'tmp'.  Was 4096-ptr_max,(-12).=
  Now T:4096-ptr_max,(-12) F:4096-ptr_max,(-12)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_modification_hooks] *tmp =3D 'IS_ERR(tmp)' (was _=
_smatch_about(tmp))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_modification_hooks] '*tmp'.  Was IS_ERR(tmp).=
  Now T:IS_ERR(tmp) F:IS_ERR(tmp)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_buf_size] __fake_param_0x7da6ac1c7630_0 =3D '(-1),32'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_buf_size] '__fake_param_0x7da6ac1c7630_0'.  W=
as (-1),32.  Now T:(-1),32 F:(-1),32
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_comparison] __fake_param_0x7da6ac1c7630_0 vs return =
0x7da6ac1c7360 =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_comparison] '__fake_param_0x7da6ac1c7630_0 vs=
 return 0x7da6ac1c7360'.  Was =3D=3D.  Now T:=3D=3D F:=3D=3D
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_comparison] __fake_param_0x7da6ac1c7630_0 vs tmp =3D=
 '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_comparison] '__fake_param_0x7da6ac1c7630_0 vs=
 tmp'.  Was =3D=3D.  Now T:=3D=3D F:=3D=3D
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_comparison_links] __fake_param_0x7da6ac1c7630_0 =3D =
'__fake_param_0x7da6ac1c7630_0 vs return 0x7da6ac1c7360, __fake_param_0x7da=
6ac1c7630_0 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_comparison_links] '__fake_param_0x7da6ac1c763=
0_0'.  Was __fake_param_0x7da6ac1c7630_0 vs return 0x7da6ac1c7360, __fake_p=
aram_0x7da6ac1c7630_0 vs tmp.  Now T:__fake_param_0x7da6ac1c7630_0 vs retur=
n 0x7da6ac1c7360, __fake_param_0x7da6ac1c7630_0 vs tmp F:__fake_param_0x7da=
6ac1c7630_0 vs return 0x7da6ac1c7360, __fake_param_0x7da6ac1c7630_0 vs tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_comparison_links] tmp =3D '__fake_param_0x7da6ac1=
c7450_0 vs tmp, __fake_param_0x7da6ac1c7630_0 vs tmp, return 0x7da6ac1c7360=
 vs tmp' (was __fake_param_0x7da6ac1c7450_0 vs tmp, return 0x7da6ac1c7360 v=
s tmp)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_comparison_links] 'tmp'.  Was __fake_param_0x=
7da6ac1c7450_0 vs tmp, __fake_param_0x7da6ac1c7630_0 vs tmp, return 0x7da6a=
c1c7360 vs tmp.  Now T:__fake_param_0x7da6ac1c7450_0 vs tmp, __fake_param_0=
x7da6ac1c7630_0 vs tmp, return 0x7da6ac1c7360 vs tmp F:__fake_param_0x7da6a=
c1c7450_0 vs tmp, __fake_param_0x7da6ac1c7630_0 vs tmp, return 0x7da6ac1c73=
60 vs tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_assigned_expr] __fake_param_0x7da6ac1c7630_0 =3D 'tm=
p'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_assigned_expr] '__fake_param_0x7da6ac1c7630_0=
'.  Was tmp.  Now T:tmp F:tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_assigned_expr_links] tmp =3D '__fake_param_0x7da6=
ac1c7450_0, __fake_param_0x7da6ac1c7630_0' (was __fake_param_0x7da6ac1c7450=
_0)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_assigned_expr_links] 'tmp'.  Was __fake_param=
_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0.  Now T:__fake_param_0x7da=
6ac1c7450_0, __fake_param_0x7da6ac1c7630_0 F:__fake_param_0x7da6ac1c7450_0,=
 __fake_param_0x7da6ac1c7630_0
debug: select distinct return from return_states where call_id =3D '1381548=
05589552';
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
select distinct return from return_states where call_id =3D '13815480558955=
2';
1
0
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [check_err_ptr_deref] 'tmp' err_ptr
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [check_err_ptr_deref] 'tmp' checked
debug: select return_id, return, type, parameter, key, value from return_st=
ates where call_id =3D '138154805589552' order by return_id, type;
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
select return_id, return, type, parameter, key, value from return_states wh=
ere call_id =3D '138154805589552' order by return_id, type;
93, 1, 0, -1, , bool(*)(void*)
93, 1, 103, 0, $, (-12)
93, 1, 1037, -1, , 2
94, 0, 0, -1, , bool(*)(void*)
94, 0, 103, 0, $, 4096-ptr_max
94, 0, 1037, -1, , 2
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [internal] 'unnull_path' true =3D> true
'tmp =3D (-12)' from 176 is true. [leaf][stree 3]
'tmp =3D 4096-ptr_max' from 176 is false. [leaf][stree 4]
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_fake_stree change [register_smatch_extra] __fake_param_0x7da6ac1c7=
630_0 =3D '(-12)' [merged] (was 4096-ptr_max,(-12))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_fake_stree change [register_smatch_extra] tmp->bp =3D '' [merged] =
(was 0-u64max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_fake_stree change [register_smatch_extra] tmp->list.next =3D '' [m=
erged] (was 0)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_fake_stree change [register_smatch_extra] tmp->list.prev =3D '' [m=
erged] (was 0)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_fake_stree change [register_untracked_param] bp =3D 'undefined' [m=
erged] (was merged)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_smatch_extra_links] 'tmp' tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0' 40=
96-ptr_max,(-12) =3D> (-12)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_smatch_extra] 'tmp' 4096-ptr_max,(-12) =3D> (-12)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0' (-=
12) =3D> (-12)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_smatch_extra_links] 'tmp' tmp =3D> __fake_param_=
0x7da6ac1c7630_0, tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0' (-=
12) =3D> (-12)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] tmp =3D '(-12)' [merged] (was (-12))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_buf_size] tmp =3D '(-1)' [merged] (was (-1),32)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [check_uninitialized] tmp =3D 'initialized' [merged] (was i=
nitialized)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_statement_count] 'stmts' 11 =3D> 13
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [internal] 'unnull_path' true
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] __fake_param_0x7da6ac1c7630_=
0 =3D '4096-ptr_max,(-12)' [merged] (4096-ptr_max,(-12), 4096-ptr_max, (-12=
), 4096-ptr_max, (-12))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] tmp =3D '4096-ptr_max,(-12)'=
 [merged] (4096-ptr_max,(-12), 4096-ptr_max, (-12), 4096-ptr_max, (-12))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] tmp->bp =3D '0-u64max' [merg=
ed] (0-u64max, 0-u64max, , 0-u64max, )
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] tmp->list.next =3D '0' [merg=
ed] (0, 0, , 0, )
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] tmp->list.prev =3D '0' [merg=
ed] (0, 0, , 0, )
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *bp =3D 'alloc_breakpo=
int(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *tmp =3D 'IS_ERR(tmp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] tmp =3D 'tmp =3D alloc=
_breakpoint(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_definition_db_callbacks] db_incomplete =3D=
 'incomplete'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_untracked_param] bp =3D 'merged' [merged] =
(untracked, merged, undefined)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_buf_size] __fake_param_0x7da6ac1c7630_0 =
=3D '(-1),32'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_buf_size] tmp =3D '(-1),32' [merged] ((-1)=
, (-1),32, 32)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] __fake_param_0x7da6ac1c7630_0 =
vs return 0x7da6ac1c7360 =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] __fake_param_0x7da6ac1c7630_0 =
vs tmp =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] bp vs bp orig =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] return 0x7da6ac1c7360 vs tmp =
=3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] __fake_param_0x7da6ac1c7=
630_0 =3D '__fake_param_0x7da6ac1c7630_0 vs return 0x7da6ac1c7360, __fake_p=
aram_0x7da6ac1c7630_0 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] bp =3D 'bp vs bp orig'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] return 0x7da6ac1c7360 =
=3D 'return 0x7da6ac1c7360 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] tmp =3D '__fake_param_0x=
7da6ac1c7450_0 vs tmp, __fake_param_0x7da6ac1c7630_0 vs tmp, return 0x7da6a=
c1c7360 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_statement_count] stmts =3D '11'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_fresh_alloc] tmp =3D 'undefined'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_deref] tmp =3D 'ok'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_dereferences_param] bp =3D 'param'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_uninitialized] tmp =3D 'initialized' [merged]
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] __fake_param_0x7da6ac1c7630=
_0 =3D 'tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] tmp =3D 'alloc_breakpoint(b=
p)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr_links] tmp =3D '__fake_param=
_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree change [internal] unnull_path =3D 'true' [merged] (was t=
rue)
debug: select return_id, return, type, parameter, key, value from return_st=
ates where call_id =3D '138154805589552' order by return_id, type;
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
select return_id, return, type, parameter, key, value from return_states wh=
ere call_id =3D '138154805589552' order by return_id, type;
93, 1, 0, -1, , bool(*)(void*)
93, 1, 103, 0, $, (-12)
93, 1, 1037, -1, , 2
94, 0, 0, -1, , bool(*)(void*)
94, 0, 103, 0, $, 4096-ptr_max
94, 0, 1037, -1, , 2
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [internal] 'unnull_path' true =3D> true
'tmp =3D (-12)' from 176 is false. [leaf][stree 3]
'tmp =3D 4096-ptr_max' from 176 is true. [leaf][stree 4]
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_fake_stree change [register_smatch_extra] __fake_param_0x7da6ac1c7=
630_0 =3D '4096-ptr_max' [merged] (was 4096-ptr_max,(-12))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_fake_stree change [register_smatch_extra] tmp->bp =3D '0-u64max' [=
merged] (was 0-u64max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_fake_stree change [register_smatch_extra] tmp->list.next =3D '0' [=
merged] (was 0)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_fake_stree change [register_smatch_extra] tmp->list.prev =3D '0' [=
merged] (was 0)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_fake_stree change [register_untracked_param] bp =3D 'untracked' [m=
erged] (was merged)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_smatch_extra_links] 'tmp' tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0' 40=
96-ptr_max,(-12) =3D> 4096-ptr_max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_smatch_extra] 'tmp' 4096-ptr_max,(-12) =3D> 4096=
-ptr_max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0' 40=
96-ptr_max =3D> 4096-ptr_max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_smatch_extra_links] 'tmp' tmp =3D> __fake_param_=
0x7da6ac1c7630_0, tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0' 40=
96-ptr_max =3D> 4096-ptr_max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] tmp =3D '4096-ptr_max' [merged] (wa=
s 4096-ptr_max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_buf_size] tmp =3D '32' [merged] (was (-1),32)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [check_uninitialized] tmp =3D 'initialized' [merged] (was i=
nitialized)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_statement_count] 'stmts' 11 =3D> 13
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [internal] 'unnull_path' true
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] __fake_param_0x7da6ac1c7630_=
0 =3D '4096-ptr_max,(-12)' [merged] (4096-ptr_max,(-12), 4096-ptr_max, (-12=
), 4096-ptr_max, (-12))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] tmp =3D '4096-ptr_max,(-12)'=
 [merged] (4096-ptr_max,(-12), 4096-ptr_max, (-12), 4096-ptr_max, (-12))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] tmp->bp =3D '0-u64max' [merg=
ed] (0-u64max, 0-u64max, , 0-u64max, )
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] tmp->list.next =3D '0' [merg=
ed] (0, 0, , 0, )
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] tmp->list.prev =3D '0' [merg=
ed] (0, 0, , 0, )
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *bp =3D 'alloc_breakpo=
int(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *tmp =3D 'IS_ERR(tmp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] tmp =3D 'tmp =3D alloc=
_breakpoint(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_definition_db_callbacks] db_incomplete =3D=
 'incomplete'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_untracked_param] bp =3D 'merged' [merged] =
(untracked, merged, undefined)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_buf_size] __fake_param_0x7da6ac1c7630_0 =
=3D '(-1),32'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_buf_size] tmp =3D '(-1),32' [merged] ((-1)=
, (-1),32, 32)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] __fake_param_0x7da6ac1c7630_0 =
vs return 0x7da6ac1c7360 =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] __fake_param_0x7da6ac1c7630_0 =
vs tmp =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] bp vs bp orig =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] return 0x7da6ac1c7360 vs tmp =
=3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] __fake_param_0x7da6ac1c7=
630_0 =3D '__fake_param_0x7da6ac1c7630_0 vs return 0x7da6ac1c7360, __fake_p=
aram_0x7da6ac1c7630_0 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] bp =3D 'bp vs bp orig'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] return 0x7da6ac1c7360 =
=3D 'return 0x7da6ac1c7360 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] tmp =3D '__fake_param_0x=
7da6ac1c7450_0 vs tmp, __fake_param_0x7da6ac1c7630_0 vs tmp, return 0x7da6a=
c1c7360 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_statement_count] stmts =3D '11'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_fresh_alloc] tmp =3D 'undefined'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_deref] tmp =3D 'ok'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_dereferences_param] bp =3D 'param'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_uninitialized] tmp =3D 'initialized' [merged]
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] __fake_param_0x7da6ac1c7630=
_0 =3D 'tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] tmp =3D 'alloc_breakpoint(b=
p)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr_links] tmp =3D '__fake_param=
_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree change [internal] unnull_path =3D 'true' [merged] (was t=
rue)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0'=
.  Was 4096-ptr_max,(-12).  Now T:(-12) F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] 'tmp'.  Was 4096-ptr_max,(-12).=
  Now T:(-12) F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] 'tmp->bp'.  Was 0-u64max.  Now =
T: F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] 'tmp->list.next'.  Was 0.  Now =
T: F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] 'tmp->list.prev'.  Was 0.  Now =
T: F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra_links] 'tmp'.  Was (null).  Now =
T:__fake_param_0x7da6ac1c7630_0, tmp F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_untracked_param] 'bp'.  Was merged.  Now T:un=
defined F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_buf_size] 'tmp'.  Was (-1),32.  Now T:(-1) F:=
(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_statement_count] 'stmts'.  Was 11.  Now T:13 =
F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [check_uninitialized] 'tmp'.  Was initialized.  Now T:i=
nitialized F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [internal] 'unnull_path'.  Was true.  Now T:true F:(nul=
l)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0'=
.  Was 4096-ptr_max,(-12).  Now T:(null) F:4096-ptr_max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] 'tmp'.  Was 4096-ptr_max,(-12).=
  Now T:(null) F:4096-ptr_max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] 'tmp->bp'.  Was 0-u64max.  Now =
T:(null) F:0-u64max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] 'tmp->list.next'.  Was 0.  Now =
T:(null) F:0
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] 'tmp->list.prev'.  Was 0.  Now =
T:(null) F:0
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra_links] 'tmp'.  Was (null).  Now =
T:(null) F:__fake_param_0x7da6ac1c7630_0, tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_untracked_param] 'bp'.  Was merged.  Now T:(n=
ull) F:untracked
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_buf_size] 'tmp'.  Was (-1),32.  Now T:(null) =
F:32
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_statement_count] 'stmts'.  Was 11.  Now T:(nu=
ll) F:13
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [check_uninitialized] 'tmp'.  Was initialized.  Now T:(=
null) F:initialized
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [internal] 'unnull_path'.  Was true.  Now T:(null) F:tr=
ue
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [check_err_ptr_deref] 'tmp'.  Was (null).  Now T:err_pt=
r F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [check_err_ptr_deref] 'tmp'.  Was (null).  Now T:(null)=
 F:checked
debug: select distinct return from return_states where call_id =3D '1381548=
05589552';
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
select distinct return from return_states where call_id =3D '13815480558955=
2';
1
0
debug: select distinct return from return_states where call_id =3D '1381548=
05589552';
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
select distinct return from return_states where call_id =3D '13815480558955=
2';
1
0
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_true_false_states [register_parsed_conditions] 'condition 0x7da6ac1c763=
0'.  Was (null).  Now T:true_path F:false_path
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [internal] unnull_path =3D 'true' (was true)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [internal] 'unnull_path'.  Was true.  Now T:true F:true
179 done __split_whole_condition
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_statement_count] 'stmts' 13 =3D> 14
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:180 task_bps_add() =
set_state change [register_statement_count] 'stmts' 14 =3D> 15
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
---- about ----
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
implied: tmp =3D '(-12)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
buf size: 'tmp' 0 elements, 0 bytes
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
strlen: 'tmp'  characters
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
real absolute: tmp =3D '(-12)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
mtag =3D 0 offset =3D 0 rl =3D ''
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
[register_smatch_extra] tmp =3D '(-12)' [merged]
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
[register_smatch_extra_links] tmp =3D '__fake_param_0x7da6ac1c7630_0, tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
[register_modification_hooks] tmp =3D 'tmp =3D alloc_breakpoint(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
[register_buf_size] tmp =3D '(-1)' [merged]
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
[register_comparison_links] tmp =3D '__fake_param_0x7da6ac1c7450_0 vs tmp, =
__fake_param_0x7da6ac1c7630_0 vs tmp, __fake_param_0x7da6ac1c77c0_0 vs tmp,=
 return 0x7da6ac1c7360 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
[register_fresh_alloc] tmp =3D 'undefined'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
[check_deref] tmp =3D 'ok'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
[check_uninitialized] tmp =3D 'initialized' [merged]
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
[check_err_ptr_deref] tmp =3D 'err_ptr'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
[register_assigned_expr] tmp =3D 'alloc_breakpoint(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:181 task_bps_add() =
[register_assigned_expr_links] tmp =3D '__fake_param_0x7da6ac1c7450_0, __fa=
ke_param_0x7da6ac1c7630_0, __fake_param_0x7da6ac1c77c0_0'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:178 task_bps_add() =
set_state change [register_definition_db_callbacks] 'db_incomplete' incompl=
ete =3D> incomplete
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:178 task_bps_add() =
__set_sm change [register_definition_db_callbacks] db_incomplete =3D 'incom=
plete' (was incomplete)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_statement_count] 'stmts' 5 =3D> 6
179 in __split_whole_condition
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
179 in split_conditions (IS_ERR(tmp))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0' 0-u64=
max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] __fake_param_0x7da6ac1c7630_0 =3D '=
0-u64max' (was 0-u64max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] tmp =3D '0-u64max' (was 0-u64max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] __fake_param_0x7da6ac1c7630_0 =3D '=
0-u64max' (was 0-u64max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_assigned_expr] '__fake_param_0x7da6ac1c7630_0' tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_assigned_expr_links] 'tmp' __fake_param_0x7da6ac=
1c7450_0 =3D> __fake_param_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_modification_hooks] '*tmp' __smatch_about(tmp) =
=3D> IS_ERR(tmp)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_smatch_extra] __fake_param_0x7da6ac1c7630_0 =3D '0-u=
64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0'=
.  Was 0-u64max.  Now T:0-u64max F:0-u64max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] tmp =3D '0-u64max' (was 0-u64max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] 'tmp'.  Was 0-u64max.  Now T:0-=
u64max F:0-u64max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_modification_hooks] *tmp =3D 'IS_ERR(tmp)' (was _=
_smatch_about(tmp))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_modification_hooks] '*tmp'.  Was IS_ERR(tmp).=
  Now T:IS_ERR(tmp) F:IS_ERR(tmp)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_assigned_expr] __fake_param_0x7da6ac1c7630_0 =3D 'tm=
p'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_assigned_expr] '__fake_param_0x7da6ac1c7630_0=
'.  Was tmp.  Now T:tmp F:tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_assigned_expr_links] tmp =3D '__fake_param_0x7da6=
ac1c7450_0, __fake_param_0x7da6ac1c7630_0' (was __fake_param_0x7da6ac1c7450=
_0)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_assigned_expr_links] 'tmp'.  Was __fake_param=
_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0.  Now T:__fake_param_0x7da=
6ac1c7450_0, __fake_param_0x7da6ac1c7630_0 F:__fake_param_0x7da6ac1c7450_0,=
 __fake_param_0x7da6ac1c7630_0
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [check_err_ptr_deref] 'tmp' err_ptr
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [check_err_ptr_deref] 'tmp' checked
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_definition_db_callbacks] 'db_incomplete' incompl=
ete =3D> incomplete
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [internal] 'unnull_path' true
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] __fake_param_0x7da6ac1c7630_=
0 =3D '0-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp =3D '4096-ptr_max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp->overflow_handler =3D '40=
96-ptr_max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] tmp =3D '0-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *bp =3D 'alloc_breakpo=
int(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *tmp =3D 'IS_ERR(tmp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] tmp =3D 'tmp =3D alloc=
_breakpoint(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_definition_db_callbacks] db_incomplete =3D=
 'incomplete'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_untracked_param] bp =3D 'untracked'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] bp vs bp orig =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] bp =3D 'bp vs bp orig'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_statement_count] stmts =3D '6'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_kernel_user_data2] this_function =3D 'call=
ed'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_deref] tmp =3D 'ok'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_dereferences_param] bp =3D 'param'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_uninitialized] tmp =3D 'initialized'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] __fake_param_0x7da6ac1c7630=
_0 =3D 'tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] tmp =3D 'alloc_breakpoint(b=
p)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr_links] tmp =3D '__fake_param=
_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree change [internal] unnull_path =3D 'true' (was true)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_definition_db_callbacks] 'db_incomplete' incompl=
ete =3D> incomplete
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [internal] 'unnull_path' true
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] __fake_param_0x7da6ac1c7630_=
0 =3D '0-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp =3D '4096-ptr_max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp->overflow_handler =3D '40=
96-ptr_max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] tmp =3D '0-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *bp =3D 'alloc_breakpo=
int(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *tmp =3D 'IS_ERR(tmp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] tmp =3D 'tmp =3D alloc=
_breakpoint(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_definition_db_callbacks] db_incomplete =3D=
 'incomplete'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_untracked_param] bp =3D 'untracked'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] bp vs bp orig =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] bp =3D 'bp vs bp orig'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_statement_count] stmts =3D '6'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_kernel_user_data2] this_function =3D 'call=
ed'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_deref] tmp =3D 'ok'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_dereferences_param] bp =3D 'param'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_uninitialized] tmp =3D 'initialized'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] __fake_param_0x7da6ac1c7630=
_0 =3D 'tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] tmp =3D 'alloc_breakpoint(b=
p)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr_links] tmp =3D '__fake_param=
_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree change [internal] unnull_path =3D 'true' (was true)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_definition_db_callbacks] 'db_incomplete'.  Wa=
s incomplete.  Now T:incomplete F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_definition_db_callbacks] 'db_incomplete'.  Wa=
s incomplete.  Now T:(null) F:incomplete
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_untracked_param] 'tmp' untracked
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [check_err_ptr_deref] 'tmp'.  Was (null).  Now T:err_pt=
r F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [check_err_ptr_deref] 'tmp'.  Was (null).  Now T:(null)=
 F:checked
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_true_false_states [register_parsed_conditions] 'condition 0x7da6ac1c763=
0'.  Was (null).  Now T:true_path F:false_path
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_untracked_param] tmp =3D 'untracked'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_untracked_param] 'tmp'.  Was untracked.  Now =
T:untracked F:untracked
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [internal] unnull_path =3D 'true' (was true)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [internal] 'unnull_path'.  Was true.  Now T:true F:true
179 done __split_whole_condition
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_statement_count] 'stmts' 6 =3D> 7
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:180 task_bps_add() =
set_state change [register_statement_count] 'stmts' 7 =3D> 8
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:178 task_bps_add() =
set_state change [register_definition_db_callbacks] 'db_incomplete' incompl=
ete =3D> incomplete
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:178 task_bps_add() =
__set_sm change [register_definition_db_callbacks] db_incomplete =3D 'incom=
plete' (was incomplete)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_statement_count] 'stmts' 5 =3D> 6
179 in __split_whole_condition
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
179 in split_conditions (IS_ERR(tmp))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0' 0-u64=
max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] __fake_param_0x7da6ac1c7630_0 =3D '=
0-u64max' (was 0-u64max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] tmp =3D '0-u64max' (was 0-u64max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] __fake_param_0x7da6ac1c7630_0 =3D '=
0-u64max' (was 0-u64max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_assigned_expr] '__fake_param_0x7da6ac1c7630_0' tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_assigned_expr_links] 'tmp' __fake_param_0x7da6ac=
1c7450_0 =3D> __fake_param_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_modification_hooks] '*tmp' __smatch_about(tmp) =
=3D> IS_ERR(tmp)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_smatch_extra] __fake_param_0x7da6ac1c7630_0 =3D '0-u=
64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0'=
.  Was 0-u64max.  Now T:0-u64max F:0-u64max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] tmp =3D '0-u64max' (was 0-u64max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] 'tmp'.  Was 0-u64max.  Now T:0-=
u64max F:0-u64max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_modification_hooks] *tmp =3D 'IS_ERR(tmp)' (was _=
_smatch_about(tmp))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_modification_hooks] '*tmp'.  Was IS_ERR(tmp).=
  Now T:IS_ERR(tmp) F:IS_ERR(tmp)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_assigned_expr] __fake_param_0x7da6ac1c7630_0 =3D 'tm=
p'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_assigned_expr] '__fake_param_0x7da6ac1c7630_0=
'.  Was tmp.  Now T:tmp F:tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_assigned_expr_links] tmp =3D '__fake_param_0x7da6=
ac1c7450_0, __fake_param_0x7da6ac1c7630_0' (was __fake_param_0x7da6ac1c7450=
_0)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_assigned_expr_links] 'tmp'.  Was __fake_param=
_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0.  Now T:__fake_param_0x7da=
6ac1c7450_0, __fake_param_0x7da6ac1c7630_0 F:__fake_param_0x7da6ac1c7450_0,=
 __fake_param_0x7da6ac1c7630_0
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [check_err_ptr_deref] 'tmp' err_ptr
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [check_err_ptr_deref] 'tmp' checked
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_definition_db_callbacks] 'db_incomplete' incompl=
ete =3D> incomplete
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [internal] 'unnull_path' true
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] __fake_param_0x7da6ac1c7630_=
0 =3D '0-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp =3D '4096-ptr_max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp->attr.bp_addr =3D '0-1383=
5058055282163711'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp->cpu =3D '(-1)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp->hw.target =3D '1-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp->overflow_handler =3D '0-=
4644892087836254207,4644892087836254209-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] tmp =3D '0-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *bp =3D 'alloc_breakpo=
int(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *tmp =3D 'IS_ERR(tmp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] tmp =3D 'tmp =3D alloc=
_breakpoint(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_definition_db_callbacks] db_incomplete =3D=
 'incomplete'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_untracked_param] bp =3D 'untracked'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_capped] bp->hw.target =3D 'capped'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] bp vs bp orig =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] bp =3D 'bp vs bp orig'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_statement_count] stmts =3D '6'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_kernel_user_data2] this_function =3D 'call=
ed'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_deref] tmp =3D 'ok'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_dereferences_param] bp =3D 'param'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_uninitialized] tmp =3D 'initialized'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] __fake_param_0x7da6ac1c7630=
_0 =3D 'tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] tmp =3D 'alloc_breakpoint(b=
p)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr_links] tmp =3D '__fake_param=
_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree change [internal] unnull_path =3D 'true' (was true)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_definition_db_callbacks] 'db_incomplete' incompl=
ete =3D> incomplete
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [internal] 'unnull_path' true
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] __fake_param_0x7da6ac1c7630_=
0 =3D '0-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp =3D '4096-ptr_max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp->attr.bp_addr =3D '0-1383=
5058055282163711'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp->cpu =3D '(-1)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp->hw.target =3D '1-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp->overflow_handler =3D '0-=
4644892087836254207,4644892087836254209-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] tmp =3D '0-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *bp =3D 'alloc_breakpo=
int(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *tmp =3D 'IS_ERR(tmp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] tmp =3D 'tmp =3D alloc=
_breakpoint(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_definition_db_callbacks] db_incomplete =3D=
 'incomplete'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_untracked_param] bp =3D 'untracked'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_capped] bp->hw.target =3D 'capped'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] bp vs bp orig =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] bp =3D 'bp vs bp orig'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_statement_count] stmts =3D '6'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_kernel_user_data2] this_function =3D 'call=
ed'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_deref] tmp =3D 'ok'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_dereferences_param] bp =3D 'param'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_uninitialized] tmp =3D 'initialized'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] __fake_param_0x7da6ac1c7630=
_0 =3D 'tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] tmp =3D 'alloc_breakpoint(b=
p)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr_links] tmp =3D '__fake_param=
_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree change [internal] unnull_path =3D 'true' (was true)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_definition_db_callbacks] 'db_incomplete'.  Wa=
s incomplete.  Now T:incomplete F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_definition_db_callbacks] 'db_incomplete'.  Wa=
s incomplete.  Now T:(null) F:incomplete
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_untracked_param] 'tmp' untracked
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [check_err_ptr_deref] 'tmp'.  Was (null).  Now T:err_pt=
r F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [check_err_ptr_deref] 'tmp'.  Was (null).  Now T:(null)=
 F:checked
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_true_false_states [register_parsed_conditions] 'condition 0x7da6ac1c763=
0'.  Was (null).  Now T:true_path F:false_path
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_untracked_param] tmp =3D 'untracked'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_untracked_param] 'tmp'.  Was untracked.  Now =
T:untracked F:untracked
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [internal] unnull_path =3D 'true' (was true)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [internal] 'unnull_path'.  Was true.  Now T:true F:true
179 done __split_whole_condition
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_statement_count] 'stmts' 6 =3D> 7
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:180 task_bps_add() =
set_state change [register_statement_count] 'stmts' 7 =3D> 8
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:178 task_bps_add() =
set_state change [register_definition_db_callbacks] 'db_incomplete' incompl=
ete =3D> incomplete
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:178 task_bps_add() =
__set_sm change [register_definition_db_callbacks] db_incomplete =3D 'incom=
plete' (was incomplete)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_statement_count] 'stmts' 5 =3D> 6
179 in __split_whole_condition
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
179 in split_conditions (IS_ERR(tmp))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0' 0-u64=
max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] __fake_param_0x7da6ac1c7630_0 =3D '=
0-u64max' (was 0-u64max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] tmp =3D '0-u64max' (was 0-u64max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] __fake_param_0x7da6ac1c7630_0 =3D '=
0-u64max' (was 0-u64max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_comparison] '__fake_param_0x7da6ac1c7630_0 vs retur=
n 0x7da6ac1c7360' =3D=3D
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_comparison_links] '__fake_param_0x7da6ac1c7630_0' _=
_fake_param_0x7da6ac1c7630_0 vs return 0x7da6ac1c7360
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_comparison] '__fake_param_0x7da6ac1c7630_0 vs tmp' =
=3D=3D
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_comparison_links] '__fake_param_0x7da6ac1c7630_0=
' __fake_param_0x7da6ac1c7630_0 vs return 0x7da6ac1c7360 =3D> __fake_param_=
0x7da6ac1c7630_0 vs return 0x7da6ac1c7360, __fake_param_0x7da6ac1c7630_0 vs=
 tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_comparison_links] 'tmp' __fake_param_0x7da6ac1c7=
450_0 vs tmp, return 0x7da6ac1c7360 vs tmp =3D> __fake_param_0x7da6ac1c7450=
_0 vs tmp, __fake_param_0x7da6ac1c7630_0 vs tmp, return 0x7da6ac1c7360 vs t=
mp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_assigned_expr] '__fake_param_0x7da6ac1c7630_0' tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_assigned_expr_links] 'tmp' __fake_param_0x7da6ac=
1c7450_0 =3D> __fake_param_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_modification_hooks] '*tmp' __smatch_about(tmp) =
=3D> IS_ERR(tmp)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_smatch_extra] __fake_param_0x7da6ac1c7630_0 =3D '0-u=
64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] '__fake_param_0x7da6ac1c7630_0'=
.  Was 0-u64max.  Now T:0-u64max F:0-u64max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_smatch_extra] tmp =3D '0-u64max' (was 0-u64max)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_smatch_extra] 'tmp'.  Was 0-u64max.  Now T:0-=
u64max F:0-u64max
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_modification_hooks] *tmp =3D 'IS_ERR(tmp)' (was _=
_smatch_about(tmp))
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_modification_hooks] '*tmp'.  Was IS_ERR(tmp).=
  Now T:IS_ERR(tmp) F:IS_ERR(tmp)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_comparison] __fake_param_0x7da6ac1c7630_0 vs return =
0x7da6ac1c7360 =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_comparison] '__fake_param_0x7da6ac1c7630_0 vs=
 return 0x7da6ac1c7360'.  Was =3D=3D.  Now T:=3D=3D F:=3D=3D
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_comparison] __fake_param_0x7da6ac1c7630_0 vs tmp =3D=
 '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_comparison] '__fake_param_0x7da6ac1c7630_0 vs=
 tmp'.  Was =3D=3D.  Now T:=3D=3D F:=3D=3D
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_comparison_links] __fake_param_0x7da6ac1c7630_0 =3D =
'__fake_param_0x7da6ac1c7630_0 vs return 0x7da6ac1c7360, __fake_param_0x7da=
6ac1c7630_0 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_comparison_links] '__fake_param_0x7da6ac1c763=
0_0'.  Was __fake_param_0x7da6ac1c7630_0 vs return 0x7da6ac1c7360, __fake_p=
aram_0x7da6ac1c7630_0 vs tmp.  Now T:__fake_param_0x7da6ac1c7630_0 vs retur=
n 0x7da6ac1c7360, __fake_param_0x7da6ac1c7630_0 vs tmp F:__fake_param_0x7da=
6ac1c7630_0 vs return 0x7da6ac1c7360, __fake_param_0x7da6ac1c7630_0 vs tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_comparison_links] tmp =3D '__fake_param_0x7da6ac1=
c7450_0 vs tmp, __fake_param_0x7da6ac1c7630_0 vs tmp, return 0x7da6ac1c7360=
 vs tmp' (was __fake_param_0x7da6ac1c7450_0 vs tmp, return 0x7da6ac1c7360 v=
s tmp)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_comparison_links] 'tmp'.  Was __fake_param_0x=
7da6ac1c7450_0 vs tmp, __fake_param_0x7da6ac1c7630_0 vs tmp, return 0x7da6a=
c1c7360 vs tmp.  Now T:__fake_param_0x7da6ac1c7450_0 vs tmp, __fake_param_0=
x7da6ac1c7630_0 vs tmp, return 0x7da6ac1c7360 vs tmp F:__fake_param_0x7da6a=
c1c7450_0 vs tmp, __fake_param_0x7da6ac1c7630_0 vs tmp, return 0x7da6ac1c73=
60 vs tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_assigned_expr] __fake_param_0x7da6ac1c7630_0 =3D 'tm=
p'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_assigned_expr] '__fake_param_0x7da6ac1c7630_0=
'.  Was tmp.  Now T:tmp F:tmp
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [register_assigned_expr_links] tmp =3D '__fake_param_0x7da6=
ac1c7450_0, __fake_param_0x7da6ac1c7630_0' (was __fake_param_0x7da6ac1c7450=
_0)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_assigned_expr_links] 'tmp'.  Was __fake_param=
_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0.  Now T:__fake_param_0x7da=
6ac1c7450_0, __fake_param_0x7da6ac1c7630_0 F:__fake_param_0x7da6ac1c7450_0,=
 __fake_param_0x7da6ac1c7630_0
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [check_err_ptr_deref] 'tmp' err_ptr
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [check_err_ptr_deref] 'tmp' checked
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_definition_db_callbacks] 'db_incomplete' incompl=
ete =3D> incomplete
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [internal] 'unnull_path' true
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] __fake_param_0x7da6ac1c7630_=
0 =3D '0-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp =3D '4096-ptr_max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp->attr.bp_addr =3D '0-1383=
5058055282163711'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp->overflow_handler =3D '0-=
4644892087836254207,4644892087836254209-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] tmp =3D '0-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *bp =3D 'alloc_breakpo=
int(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *tmp =3D 'IS_ERR(tmp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] tmp =3D 'tmp =3D alloc=
_breakpoint(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_definition_db_callbacks] db_incomplete =3D=
 'incomplete'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_untracked_param] bp =3D 'untracked'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] __fake_param_0x7da6ac1c7630_0 =
vs return 0x7da6ac1c7360 =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] __fake_param_0x7da6ac1c7630_0 =
vs tmp =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] bp vs bp orig =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] return 0x7da6ac1c7360 vs tmp =
=3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] __fake_param_0x7da6ac1c7=
630_0 =3D '__fake_param_0x7da6ac1c7630_0 vs return 0x7da6ac1c7360, __fake_p=
aram_0x7da6ac1c7630_0 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] bp =3D 'bp vs bp orig'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] return 0x7da6ac1c7360 =
=3D 'return 0x7da6ac1c7360 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] tmp =3D '__fake_param_0x=
7da6ac1c7450_0 vs tmp, __fake_param_0x7da6ac1c7630_0 vs tmp, return 0x7da6a=
c1c7360 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_statement_count] stmts =3D '6'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_kernel_user_data2] this_function =3D 'call=
ed'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_deref] tmp =3D 'ok'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_dereferences_param] bp =3D 'param'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_uninitialized] tmp =3D 'initialized'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] __fake_param_0x7da6ac1c7630=
_0 =3D 'tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] tmp =3D 'alloc_breakpoint(b=
p)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr_links] tmp =3D '__fake_param=
_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree change [internal] unnull_path =3D 'true' (was true)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_definition_db_callbacks] 'db_incomplete' incompl=
ete =3D> incomplete
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [internal] 'unnull_path' true
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] __fake_param_0x7da6ac1c7630_=
0 =3D '0-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp =3D '4096-ptr_max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp->attr.bp_addr =3D '0-1383=
5058055282163711'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] bp->overflow_handler =3D '0-=
4644892087836254207,4644892087836254209-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_smatch_extra] tmp =3D '0-u64max'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *bp =3D 'alloc_breakpo=
int(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] *tmp =3D 'IS_ERR(tmp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_modification_hooks] tmp =3D 'tmp =3D alloc=
_breakpoint(bp)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_definition_db_callbacks] db_incomplete =3D=
 'incomplete'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_untracked_param] bp =3D 'untracked'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] __fake_param_0x7da6ac1c7630_0 =
vs return 0x7da6ac1c7360 =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] __fake_param_0x7da6ac1c7630_0 =
vs tmp =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] bp vs bp orig =3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison] return 0x7da6ac1c7360 vs tmp =
=3D '=3D=3D'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] __fake_param_0x7da6ac1c7=
630_0 =3D '__fake_param_0x7da6ac1c7630_0 vs return 0x7da6ac1c7360, __fake_p=
aram_0x7da6ac1c7630_0 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] bp =3D 'bp vs bp orig'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] return 0x7da6ac1c7360 =
=3D 'return 0x7da6ac1c7360 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_comparison_links] tmp =3D '__fake_param_0x=
7da6ac1c7450_0 vs tmp, __fake_param_0x7da6ac1c7630_0 vs tmp, return 0x7da6a=
c1c7360 vs tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_statement_count] stmts =3D '6'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_kernel_user_data2] this_function =3D 'call=
ed'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_deref] tmp =3D 'ok'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_dereferences_param] bp =3D 'param'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [check_uninitialized] tmp =3D 'initialized'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] __fake_param_0x7da6ac1c7630=
_0 =3D 'tmp'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr] tmp =3D 'alloc_breakpoint(b=
p)'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree new [register_assigned_expr_links] tmp =3D '__fake_param=
_0x7da6ac1c7450_0, __fake_param_0x7da6ac1c7630_0'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm_cur_stree change [internal] unnull_path =3D 'true' (was true)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_definition_db_callbacks] 'db_incomplete'.  Wa=
s incomplete.  Now T:incomplete F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_definition_db_callbacks] 'db_incomplete'.  Wa=
s incomplete.  Now T:(null) F:incomplete
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state new [register_untracked_param] 'tmp' untracked
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [check_err_ptr_deref] 'tmp'.  Was (null).  Now T:err_pt=
r F:(null)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [check_err_ptr_deref] 'tmp'.  Was (null).  Now T:(null)=
 F:checked
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_true_false_states [register_parsed_conditions] 'condition 0x7da6ac1c763=
0'.  Was (null).  Now T:true_path F:false_path
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm new [register_untracked_param] tmp =3D 'untracked'
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [register_untracked_param] 'tmp'.  Was untracked.  Now =
T:untracked F:untracked
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_sm change [internal] unnull_path =3D 'true' (was true)
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
__set_true_false_sm [internal] 'unnull_path'.  Was true.  Now T:true F:true
179 done __split_whole_condition
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:179 task_bps_add() =
set_state change [register_statement_count] 'stmts' 6 =3D> 7
/home/michael/linux/arch/powerpc/kernel/hw_breakpoint.c:180 task_bps_add() =
set_state change [register_statement_count] 'stmts' 7 =3D> 8
