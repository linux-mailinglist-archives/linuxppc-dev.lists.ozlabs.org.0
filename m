Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA666094F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 23:10:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Npcvw5m6jz3cdL
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 09:10:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=smtpbguseast2.qq.com (client-ip=54.204.34.130; helo=smtpbguseast2.qq.com; envelope-from=tong@infragraf.org; receiver=<UNKNOWN>)
X-Greylist: delayed 118720 seconds by postgrey-1.36 at boromir; Fri, 06 Jan 2023 23:07:56 AEDT
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NpMY80HWpz2xWg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Jan 2023 23:07:45 +1100 (AEDT)
X-QQ-mid: bizesmtp83t1673006726tm6ohk77
Received: from smtpclient.apple ( [1.202.165.115])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Jan 2023 20:05:23 +0800 (CST)
X-QQ-SSF: 01000000000000409000000A0000000
X-QQ-FEAT: aBJFcW+uBGYOrwCcechdHDjJA6m0WzMCM74Y/QJXHqCcuaYdmn1UtSJRBwiNE
	oypRm0lvgQhTPEOjY554H8fLfxHhHbPiEQj8O6YgbX0+W3D00RzEAh5b9wBhHer+oyp9Xhs
	9fPB2h1WaB5F14MLx1j8cbaGhcF2xte3wE1Mpo6K2iYIMdnXGUrsEQpBXEoae/7fEkxQO/E
	bpwvErft+3ONAzsvY4Etb5l+YpVqYO8y0d/spF36iMXJG4qtWfXMZQbXnPgNg/NhZVmEhwP
	OauDf/+QyFUrj4Zl8lYzfd5VG+BE96NuqhhYL1dsxNdqbif6nqJa+BpmYbCVwkaw2PHLDbD
	Tq26I1wwAX16TX/zrpgjtBpgD0KQYNRULaszPtwY4rJWbCpFBDRr7Co3WCzFC7vjeZ7W0KJ
	9+p2tGwhmciSR7z8qcaplQ==
X-QQ-GoodBg: 0
From: Tonghao Zhang <tong@infragraf.org>
Message-Id: <5B46D25A-6C27-4731-9DC5-F7676DF665DC@infragraf.org>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_808270E9-39BE-41A5-A04F-4122953F24D8"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
Date: Fri, 6 Jan 2023 20:05:22 +0800
In-Reply-To: <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexei Starovoitov <ast@kernel.org>
References: <20230105030614.26842-1-tong@infragraf.org>
 <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:infragraf.org:qybglogicsvr:qybglogicsvr5
X-Mailman-Approved-At: Sat, 07 Jan 2023 09:09:38 +1100
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
Cc: KP Singh <kpsingh@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Hao Luo <haoluo@google.com>, Song Liu <song@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Andrii Nakryiko <andrii@kernel.org>, Stanislav Fomichev <sdf@google.com>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Hou Tao <houtao1@huawei.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Yonghong Song <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-arm-kernel@lists.infradead.or" <linux-arm-kernel@lists.infradead.or>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_808270E9-39BE-41A5-A04F-4122953F24D8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jan 6, 2023, at 1:53 AM, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
>=20
>=20
> Le 05/01/2023 =C3=A0 04:06, tong@infragraf.org =
<mailto:tong@infragraf.org> a =C3=A9crit :
>> From: Tonghao Zhang <tong@infragraf.org>
>>=20
>> The x86_64 can't dump the valid insn in this way. A test BPF prog
>> which include subprog:
>>=20
>> $ llvm-objdump -d subprog.o
>> Disassembly of section .text:
>> 0000000000000000 <subprog>:
>>        0:       18 01 00 00 73 75 62 70 00 00 00 00 72 6f 67 00 r1 =3D =
29114459903653235 ll
>>        2:       7b 1a f8 ff 00 00 00 00 *(u64 *)(r10 - 8) =3D r1
>>        3:       bf a1 00 00 00 00 00 00 r1 =3D r10
>>        4:       07 01 00 00 f8 ff ff ff r1 +=3D -8
>>        5:       b7 02 00 00 08 00 00 00 r2 =3D 8
>>        6:       85 00 00 00 06 00 00 00 call 6
>>        7:       95 00 00 00 00 00 00 00 exit
>> Disassembly of section raw_tp/sys_enter:
>> 0000000000000000 <entry>:
>>        0:       85 10 00 00 ff ff ff ff call -1
>>        1:       b7 00 00 00 00 00 00 00 r0 =3D 0
>>        2:       95 00 00 00 00 00 00 00 exit
>>=20
>> kernel print message:
>> [  580.775387] flen=3D8 proglen=3D51 pass=3D3 image=3Dffffffffa000c20c =
from=3Dkprobe-load pid=3D1643
>> [  580.777236] JIT code: 00000000: cc cc cc cc cc cc cc cc cc cc cc =
cc cc cc cc cc
>> [  580.779037] JIT code: 00000010: cc cc cc cc cc cc cc cc cc cc cc =
cc cc cc cc cc
>> [  580.780767] JIT code: 00000020: cc cc cc cc cc cc cc cc cc cc cc =
cc cc cc cc cc
>> [  580.782568] JIT code: 00000030: cc cc cc
>>=20
>> $ bpf_jit_disasm
>> 51 bytes emitted from JIT compiler (pass:3, flen:8)
>> ffffffffa000c20c + <x>:
>>    0:   int3
>>    1:   int3
>>    2:   int3
>>    3:   int3
>>    4:   int3
>>    5:   int3
>>    ...
>>=20
>> Until bpf_jit_binary_pack_finalize is invoked, we copy rw_header to =
header
>> and then image/insn is valid. BTW, we can use the "bpftool prog dump" =
JITed instructions.
>=20
> NACK.
>=20
> Because the feature is buggy on x86_64, you remove it for all=20
> architectures ?
>=20
> On powerpc bpf_jit_enable =3D=3D 2 works and is very usefull.
>=20
> Last time I tried to use bpftool on powerpc/32 it didn't work. I don't=20=

> remember the details, I think it was an issue with endianess. Maybe it=20=

> is fixed now, but it needs to be verified.

I think bpftool may dump the jited insn too.
> So please, before removing a working and usefull feature, make sure=20
> there is an alternative available to it for all architectures in all=20=

> configurations.
>=20
> Also, I don't think bpftool is usable to dump kernel BPF selftests.=20
Why bpftool does=E2=80=99t work for you ? I think this is a core =
function for bpf. If you can dump the jited insn using bpf_jit_enable =3D=3D=
 2, you should
dump the inns tool, while in selftest case.

Alexei any thoughts?

> That's vital when a selftest fails if you want to have a chance to=20
> understand why it fails.
> Thanks
> Christophe
>=20
>>=20
>> Signed-off-by: Tonghao Zhang <tong@infragraf.org>
>> Suggested-by: Alexei Starovoitov <ast@kernel.org>
>> Cc: Alexei Starovoitov <ast@kernel.org>
>> Cc: Daniel Borkmann <daniel@iogearbox.net>
>> Cc: Andrii Nakryiko <andrii@kernel.org>
>> Cc: Martin KaFai Lau <martin.lau@linux.dev>
>> Cc: Song Liu <song@kernel.org>
>> Cc: Yonghong Song <yhs@fb.com>
>> Cc: John Fastabend <john.fastabend@gmail.com>
>> Cc: KP Singh <kpsingh@kernel.org>
>> Cc: Stanislav Fomichev <sdf@google.com>
>> Cc: Hao Luo <haoluo@google.com>
>> Cc: Jiri Olsa <jolsa@kernel.org>
>> Cc: Hou Tao <houtao1@huawei.com>
>> ---
>>  Documentation/admin-guide/sysctl/net.rst |   1 +
>>  Documentation/networking/filter.rst      |  98 +------
>>  arch/arm/net/bpf_jit_32.c                |   4 -
>>  arch/arm64/net/bpf_jit_comp.c            |   4 -
>>  arch/loongarch/net/bpf_jit.c             |   4 -
>>  arch/mips/net/bpf_jit_comp.c             |   3 -
>>  arch/powerpc/net/bpf_jit_comp.c          |  11 -
>>  arch/riscv/net/bpf_jit_core.c            |   3 -
>>  arch/s390/net/bpf_jit_comp.c             |   4 -
>>  arch/sparc/net/bpf_jit_comp_32.c         |   3 -
>>  arch/sparc/net/bpf_jit_comp_64.c         |  13 -
>>  arch/x86/net/bpf_jit_comp.c              |   3 -
>>  arch/x86/net/bpf_jit_comp32.c            |   3 -
>>  net/core/sysctl_net_core.c               |  12 +-
>>  tools/bpf/.gitignore                     |   1 -
>>  tools/bpf/Makefile                       |  10 +-
>>  tools/bpf/bpf_jit_disasm.c               | 332 =
-----------------------
>>  17 files changed, 9 insertions(+), 500 deletions(-)
>>  delete mode 100644 tools/bpf/bpf_jit_disasm.c
>>=20
>> diff --git a/Documentation/admin-guide/sysctl/net.rst =
b/Documentation/admin-guide/sysctl/net.rst
>> index 6394f5dc2303..82ca05ca6ed0 100644
>> --- a/Documentation/admin-guide/sysctl/net.rst
>> +++ b/Documentation/admin-guide/sysctl/net.rst
>> @@ -88,6 +88,7 @@ Values:
>>         - 0 - disable the JIT (default value)
>>         - 1 - enable the JIT
>>         - 2 - enable the JIT and ask the compiler to emit traces on =
kernel log.
>> +              (deprecated since v6.3, use ``bpftool prog dump jited =
id <id>`` instead)
>>=20
>>  bpf_jit_harden
>>  --------------
>> diff --git a/Documentation/networking/filter.rst =
b/Documentation/networking/filter.rst
>> index f69da5074860..5f51c050e88f 100644
>> --- a/Documentation/networking/filter.rst
>> +++ b/Documentation/networking/filter.rst
>> @@ -520,102 +520,8 @@ been previously enabled by root::
>>=20
>>    echo 1 > /proc/sys/net/core/bpf_jit_enable
>>=20
>> -For JIT developers, doing audits etc, each compile run can output =
the generated
>> -opcode image into the kernel log via::
>> -
>> -  echo 2 > /proc/sys/net/core/bpf_jit_enable
>> -
>> -Example output from dmesg::
>> -
>> -    [ 3389.935842] flen=3D6 proglen=3D70 pass=3D3 =
image=3Dffffffffa0069c8f
>> -    [ 3389.935847] JIT code: 00000000: 55 48 89 e5 48 83 ec 60 48 89 =
5d f8 44 8b 4f 68
>> -    [ 3389.935849] JIT code: 00000010: 44 2b 4f 6c 4c 8b 87 d8 00 00 =
00 be 0c 00 00 00
>> -    [ 3389.935850] JIT code: 00000020: e8 1d 94 ff e0 3d 00 08 00 00 =
75 16 be 17 00 00
>> -    [ 3389.935851] JIT code: 00000030: 00 e8 28 94 ff e0 83 f8 01 75 =
07 b8 ff ff 00 00
>> -    [ 3389.935852] JIT code: 00000040: eb 02 31 c0 c9 c3
>> -
>> -When CONFIG_BPF_JIT_ALWAYS_ON is enabled, bpf_jit_enable is =
permanently set to 1 and
>> -setting any other value than that will return in failure. This is =
even the case for
>> -setting bpf_jit_enable to 2, since dumping the final JIT image into =
the kernel log
>> -is discouraged and introspection through bpftool (under =
tools/bpf/bpftool/) is the
>> -generally recommended approach instead.
>> -
>> -In the kernel source tree under tools/bpf/, there's bpf_jit_disasm =
for
>> -generating disassembly out of the kernel log's hexdump::
>> -
>> -       # ./bpf_jit_disasm
>> -       70 bytes emitted from JIT compiler (pass:3, flen:6)
>> -       ffffffffa0069c8f + <x>:
>> -       0:      push   %rbp
>> -       1:      mov    %rsp,%rbp
>> -       4:      sub    $0x60,%rsp
>> -       8:      mov    %rbx,-0x8(%rbp)
>> -       c:      mov    0x68(%rdi),%r9d
>> -       10:     sub    0x6c(%rdi),%r9d
>> -       14:     mov    0xd8(%rdi),%r8
>> -       1b:     mov    $0xc,%esi
>> -       20:     callq  0xffffffffe0ff9442
>> -       25:     cmp    $0x800,%eax
>> -       2a:     jne    0x0000000000000042
>> -       2c:     mov    $0x17,%esi
>> -       31:     callq  0xffffffffe0ff945e
>> -       36:     cmp    $0x1,%eax
>> -       39:     jne    0x0000000000000042
>> -       3b:     mov    $0xffff,%eax
>> -       40:     jmp    0x0000000000000044
>> -       42:     xor    %eax,%eax
>> -       44:     leaveq
>> -       45:     retq
>> -
>> -       Issuing option `-o` will "annotate" opcodes to resulting =
assembler
>> -       instructions, which can be very useful for JIT developers:
>> -
>> -       # ./bpf_jit_disasm -o
>> -       70 bytes emitted from JIT compiler (pass:3, flen:6)
>> -       ffffffffa0069c8f + <x>:
>> -       0:      push   %rbp
>> -               55
>> -       1:      mov    %rsp,%rbp
>> -               48 89 e5
>> -       4:      sub    $0x60,%rsp
>> -               48 83 ec 60
>> -       8:      mov    %rbx,-0x8(%rbp)
>> -               48 89 5d f8
>> -       c:      mov    0x68(%rdi),%r9d
>> -               44 8b 4f 68
>> -       10:     sub    0x6c(%rdi),%r9d
>> -               44 2b 4f 6c
>> -       14:     mov    0xd8(%rdi),%r8
>> -               4c 8b 87 d8 00 00 00
>> -       1b:     mov    $0xc,%esi
>> -               be 0c 00 00 00
>> -       20:     callq  0xffffffffe0ff9442
>> -               e8 1d 94 ff e0
>> -       25:     cmp    $0x800,%eax
>> -               3d 00 08 00 00
>> -       2a:     jne    0x0000000000000042
>> -               75 16
>> -       2c:     mov    $0x17,%esi
>> -               be 17 00 00 00
>> -       31:     callq  0xffffffffe0ff945e
>> -               e8 28 94 ff e0
>> -       36:     cmp    $0x1,%eax
>> -               83 f8 01
>> -       39:     jne    0x0000000000000042
>> -               75 07
>> -       3b:     mov    $0xffff,%eax
>> -               b8 ff ff 00 00
>> -       40:     jmp    0x0000000000000044
>> -               eb 02
>> -       42:     xor    %eax,%eax
>> -               31 c0
>> -       44:     leaveq
>> -               c9
>> -       45:     retq
>> -               c3
>> -
>> -For BPF JIT developers, bpf_jit_disasm, bpf_asm and bpf_dbg provides =
a useful
>> -toolchain for developing and testing the kernel's JIT compiler.
>> +For JIT developers, doing audits etc, should use `bpftool prog dump` =
to
>> +veiw the JIT generated opcode image.
>>=20
>>  BPF kernel internals
>>  --------------------
>> diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
>> index 6a1c9fca5260..39301d59b537 100644
>> --- a/arch/arm/net/bpf_jit_32.c
>> +++ b/arch/arm/net/bpf_jit_32.c
>> @@ -1999,10 +1999,6 @@ struct bpf_prog *bpf_int_jit_compile(struct =
bpf_prog *prog)
>>         }
>>         flush_icache_range((u32)header, (u32)(ctx.target + ctx.idx));
>>=20
>> -       if (bpf_jit_enable > 1)
>> -               /* there are 2 passes here */
>> -               bpf_jit_dump(prog->len, image_size, 2, ctx.target);
>> -
>>         bpf_jit_binary_lock_ro(header);
>>         prog->bpf_func =3D (void *)ctx.target;
>>         prog->jited =3D 1;
>> diff --git a/arch/arm64/net/bpf_jit_comp.c =
b/arch/arm64/net/bpf_jit_comp.c
>> index 62f805f427b7..59c35b4d77b7 100644
>> --- a/arch/arm64/net/bpf_jit_comp.c
>> +++ b/arch/arm64/net/bpf_jit_comp.c
>> @@ -1567,10 +1567,6 @@ struct bpf_prog *bpf_int_jit_compile(struct =
bpf_prog *prog)
>>                 goto out_off;
>>         }
>>=20
>> -       /* And we're done. */
>> -       if (bpf_jit_enable > 1)
>> -               bpf_jit_dump(prog->len, prog_size, 2, ctx.image);
>> -
>>         bpf_flush_icache(header, ctx.image + ctx.idx);
>>=20
>>         if (!prog->is_func || extra_pass) {
>> diff --git a/arch/loongarch/net/bpf_jit.c =
b/arch/loongarch/net/bpf_jit.c
>> index bdcd0c7719a9..ea37f52faa6e 100644
>> --- a/arch/loongarch/net/bpf_jit.c
>> +++ b/arch/loongarch/net/bpf_jit.c
>> @@ -1123,10 +1123,6 @@ struct bpf_prog *bpf_int_jit_compile(struct =
bpf_prog *prog)
>>                 goto out_offset;
>>         }
>>=20
>> -       /* And we're done */
>> -       if (bpf_jit_enable > 1)
>> -               bpf_jit_dump(prog->len, image_size, 2, ctx.image);
>> -
>>         /* Update the icache */
>>         flush_icache_range((unsigned long)header, (unsigned =
long)(ctx.image + ctx.idx));
>>=20
>> diff --git a/arch/mips/net/bpf_jit_comp.c =
b/arch/mips/net/bpf_jit_comp.c
>> index b17130d510d4..ccbb7c231cb0 100644
>> --- a/arch/mips/net/bpf_jit_comp.c
>> +++ b/arch/mips/net/bpf_jit_comp.c
>> @@ -1012,9 +1012,6 @@ struct bpf_prog *bpf_int_jit_compile(struct =
bpf_prog *prog)
>>         flush_icache_range((unsigned long)header,
>>                            (unsigned =
long)&ctx.target[ctx.jit_index]);
>>=20
>> -       if (bpf_jit_enable > 1)
>> -               bpf_jit_dump(prog->len, image_size, 2, ctx.target);
>> -
>>         prog->bpf_func =3D (void *)ctx.target;
>>         prog->jited =3D 1;
>>         prog->jited_len =3D image_size;
>> diff --git a/arch/powerpc/net/bpf_jit_comp.c =
b/arch/powerpc/net/bpf_jit_comp.c
>> index 43e634126514..f0f7d8ff2022 100644
>> --- a/arch/powerpc/net/bpf_jit_comp.c
>> +++ b/arch/powerpc/net/bpf_jit_comp.c
>> @@ -262,20 +262,9 @@ struct bpf_prog *bpf_int_jit_compile(struct =
bpf_prog *fp)
>>                         goto out_addrs;
>>                 }
>>                 bpf_jit_build_epilogue(code_base, &cgctx);
>> -
>> -               if (bpf_jit_enable > 1)
>> -                       pr_info("Pass %d: shrink =3D %d, seen =3D =
0x%x\n", pass,
>> -                               proglen - (cgctx.idx * 4), =
cgctx.seen);
>>         }
>>=20
>>  skip_codegen_passes:
>> -       if (bpf_jit_enable > 1)
>> -               /*
>> -                * Note that we output the base address of the =
code_base
>> -                * rather than image, since opcodes are in code_base.
>> -                */
>> -               bpf_jit_dump(flen, proglen, pass, code_base);
>> -
>>  #ifdef CONFIG_PPC64_ELF_ABI_V1
>>         /* Function descriptor nastiness: Address + TOC */
>>         ((u64 *)image)[0] =3D (u64)code_base;
>> diff --git a/arch/riscv/net/bpf_jit_core.c =
b/arch/riscv/net/bpf_jit_core.c
>> index 737baf8715da..ff168c50d46a 100644
>> --- a/arch/riscv/net/bpf_jit_core.c
>> +++ b/arch/riscv/net/bpf_jit_core.c
>> @@ -151,9 +151,6 @@ struct bpf_prog *bpf_int_jit_compile(struct =
bpf_prog *prog)
>>         }
>>         bpf_jit_build_epilogue(ctx);
>>=20
>> -       if (bpf_jit_enable > 1)
>> -               bpf_jit_dump(prog->len, prog_size, pass, ctx->insns);
>> -
>>         prog->bpf_func =3D (void *)ctx->insns;
>>         prog->jited =3D 1;
>>         prog->jited_len =3D prog_size;
>> diff --git a/arch/s390/net/bpf_jit_comp.c =
b/arch/s390/net/bpf_jit_comp.c
>> index af35052d06ed..13d996e27602 100644
>> --- a/arch/s390/net/bpf_jit_comp.c
>> +++ b/arch/s390/net/bpf_jit_comp.c
>> @@ -1831,10 +1831,6 @@ struct bpf_prog *bpf_int_jit_compile(struct =
bpf_prog *fp)
>>                 fp =3D orig_fp;
>>                 goto free_addrs;
>>         }
>> -       if (bpf_jit_enable > 1) {
>> -               bpf_jit_dump(fp->len, jit.size, pass, jit.prg_buf);
>> -               print_fn_code(jit.prg_buf, jit.size_prg);
>> -       }
>>         if (!fp->is_func || extra_pass) {
>>                 bpf_jit_binary_lock_ro(header);
>>         } else {
>> diff --git a/arch/sparc/net/bpf_jit_comp_32.c =
b/arch/sparc/net/bpf_jit_comp_32.c
>> index a74e5004c6c8..08de0ed84831 100644
>> --- a/arch/sparc/net/bpf_jit_comp_32.c
>> +++ b/arch/sparc/net/bpf_jit_comp_32.c
>> @@ -743,9 +743,6 @@ cond_branch:                        f_offset =3D =
addrs[i + filter[i].jf];
>>                 oldproglen =3D proglen;
>>         }
>>=20
>> -       if (bpf_jit_enable > 1)
>> -               bpf_jit_dump(flen, proglen, pass + 1, image);
>> -
>>         if (image) {
>>                 fp->bpf_func =3D (void *)image;
>>                 fp->jited =3D 1;
>> diff --git a/arch/sparc/net/bpf_jit_comp_64.c =
b/arch/sparc/net/bpf_jit_comp_64.c
>> index fa0759bfe498..14c9e5ce4100 100644
>> --- a/arch/sparc/net/bpf_jit_comp_64.c
>> +++ b/arch/sparc/net/bpf_jit_comp_64.c
>> @@ -1549,16 +1549,6 @@ struct bpf_prog *bpf_int_jit_compile(struct =
bpf_prog *prog)
>>                 }
>>                 build_epilogue(&ctx);
>>=20
>> -               if (bpf_jit_enable > 1)
>> -                       pr_info("Pass %d: size =3D %u, seen =3D =
[%c%c%c%c%c%c]\n", pass,
>> -                               ctx.idx * 4,
>> -                               ctx.tmp_1_used ? '1' : ' ',
>> -                               ctx.tmp_2_used ? '2' : ' ',
>> -                               ctx.tmp_3_used ? '3' : ' ',
>> -                               ctx.saw_frame_pointer ? 'F' : ' ',
>> -                               ctx.saw_call ? 'C' : ' ',
>> -                               ctx.saw_tail_call ? 'T' : ' ');
>> -
>>                 if (ctx.idx * 4 =3D=3D prev_image_size)
>>                         break;
>>                 prev_image_size =3D ctx.idx * 4;
>> @@ -1596,9 +1586,6 @@ struct bpf_prog *bpf_int_jit_compile(struct =
bpf_prog *prog)
>>                 goto out_off;
>>         }
>>=20
>> -       if (bpf_jit_enable > 1)
>> -               bpf_jit_dump(prog->len, image_size, pass, ctx.image);
>> -
>>         bpf_flush_icache(header, (u8 *)header + header->size);
>>=20
>>         if (!prog->is_func || extra_pass) {
>> diff --git a/arch/x86/net/bpf_jit_comp.c =
b/arch/x86/net/bpf_jit_comp.c
>> index e3e2b57e4e13..197ff8651a56 100644
>> --- a/arch/x86/net/bpf_jit_comp.c
>> +++ b/arch/x86/net/bpf_jit_comp.c
>> @@ -2551,9 +2551,6 @@ struct bpf_prog *bpf_int_jit_compile(struct =
bpf_prog *prog)
>>                 cond_resched();
>>         }
>>=20
>> -       if (bpf_jit_enable > 1)
>> -               bpf_jit_dump(prog->len, proglen, pass + 1, image);
>> -
>>         if (image) {
>>                 if (!prog->is_func || extra_pass) {
>>                         /*
>> diff --git a/arch/x86/net/bpf_jit_comp32.c =
b/arch/x86/net/bpf_jit_comp32.c
>> index 429a89c5468b..ca53f20aca73 100644
>> --- a/arch/x86/net/bpf_jit_comp32.c
>> +++ b/arch/x86/net/bpf_jit_comp32.c
>> @@ -2597,9 +2597,6 @@ struct bpf_prog *bpf_int_jit_compile(struct =
bpf_prog *prog)
>>                 cond_resched();
>>         }
>>=20
>> -       if (bpf_jit_enable > 1)
>> -               bpf_jit_dump(prog->len, proglen, pass + 1, image);
>> -
>>         if (image) {
>>                 bpf_jit_binary_lock_ro(header);
>>                 prog->bpf_func =3D (void *)image;
>> diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
>> index 5b1ce656baa1..562ace48e1c9 100644
>> --- a/net/core/sysctl_net_core.c
>> +++ b/net/core/sysctl_net_core.c
>> @@ -276,14 +276,10 @@ static int =
proc_dointvec_minmax_bpf_enable(struct ctl_table *table, int write,
>>         tmp.data =3D &jit_enable;
>>         ret =3D proc_dointvec_minmax(&tmp, write, buffer, lenp, =
ppos);
>>         if (write && !ret) {
>> -               if (jit_enable < 2 ||
>> -                   (jit_enable =3D=3D 2 && =
bpf_dump_raw_ok(current_cred()))) {
>> -                       *(int *)table->data =3D jit_enable;
>> -                       if (jit_enable =3D=3D 2)
>> -                               pr_warn("bpf_jit_enable =3D 2 was =
set! NEVER use this in production, only for JIT debugging!\n");
>> -               } else {
>> -                       ret =3D -EPERM;
>> -               }
>> +               *(int *)table->data =3D jit_enable;
>> +
>> +               if (jit_enable =3D=3D 2)
>> +                       pr_warn_once("bpf_jit_enable =3D=3D 2 was =
deprecated! Use bpftool prog dump instead.\n");
>>         }
>>=20
>>         if (write && ret && min =3D=3D max)
>> diff --git a/tools/bpf/.gitignore b/tools/bpf/.gitignore
>> index cf53342175e7..5c70cfb9092e 100644
>> --- a/tools/bpf/.gitignore
>> +++ b/tools/bpf/.gitignore
>> @@ -4,4 +4,3 @@ feature
>>  bpf_asm
>>  bpf_dbg
>>  bpf_exp.yacc.*
>> -bpf_jit_disasm
>> diff --git a/tools/bpf/Makefile b/tools/bpf/Makefile
>> index 243b79f2b451..9264d7b0edf6 100644
>> --- a/tools/bpf/Makefile
>> +++ b/tools/bpf/Makefile
>> @@ -74,14 +74,10 @@ $(OUTPUT)%.yacc.o: $(OUTPUT)%.yacc.c
>>  $(OUTPUT)%.lex.o: $(OUTPUT)%.lex.c
>>         $(QUIET_CC)$(CC) $(CFLAGS) -c -o $@ $<
>>=20
>> -PROGS =3D $(OUTPUT)bpf_jit_disasm $(OUTPUT)bpf_dbg $(OUTPUT)bpf_asm
>> +PROGS =3D $(OUTPUT)bpf_dbg $(OUTPUT)bpf_asm
>>=20
>>  all: $(PROGS) bpftool runqslower
>>=20
>> -$(OUTPUT)bpf_jit_disasm: CFLAGS +=3D -DPACKAGE=3D'bpf_jit_disasm'
>> -$(OUTPUT)bpf_jit_disasm: $(OUTPUT)bpf_jit_disasm.o
>> -       $(QUIET_LINK)$(CC) $(CFLAGS) -o $@ $^ -lopcodes -lbfd -ldl
>> -
>>  $(OUTPUT)bpf_dbg: $(OUTPUT)bpf_dbg.o
>>         $(QUIET_LINK)$(CC) $(CFLAGS) -o $@ $^ -lreadline
>>=20
>> @@ -94,16 +90,14 @@ $(OUTPUT)bpf_exp.lex.o: $(OUTPUT)bpf_exp.lex.c
>>=20
>>  clean: bpftool_clean runqslower_clean resolve_btfids_clean
>>         $(call QUIET_CLEAN, bpf-progs)
>> -       $(Q)$(RM) -r -- $(OUTPUT)*.o $(OUTPUT)bpf_jit_disasm =
$(OUTPUT)bpf_dbg \
>> +       $(Q)$(RM) -r -- $(OUTPUT)*.o $(OUTPUT)bpf_dbg \
>>                $(OUTPUT)bpf_asm $(OUTPUT)bpf_exp.yacc.* =
$(OUTPUT)bpf_exp.lex.*
>>         $(call QUIET_CLEAN, core-gen)
>>         $(Q)$(RM) -- $(OUTPUT)FEATURE-DUMP.bpf
>>         $(Q)$(RM) -r -- $(OUTPUT)feature
>>=20
>>  install: $(PROGS) bpftool_install
>> -       $(call QUIET_INSTALL, bpf_jit_disasm)
>>         $(Q)$(INSTALL) -m 0755 -d $(DESTDIR)$(prefix)/bin
>> -       $(Q)$(INSTALL) $(OUTPUT)bpf_jit_disasm =
$(DESTDIR)$(prefix)/bin/bpf_jit_disasm
>>         $(call QUIET_INSTALL, bpf_dbg)
>>         $(Q)$(INSTALL) $(OUTPUT)bpf_dbg =
$(DESTDIR)$(prefix)/bin/bpf_dbg
>>         $(call QUIET_INSTALL, bpf_asm)
>> diff --git a/tools/bpf/bpf_jit_disasm.c b/tools/bpf/bpf_jit_disasm.c
>> deleted file mode 100644
>> index a90a5d110f92..000000000000
>> --- a/tools/bpf/bpf_jit_disasm.c
>> +++ /dev/null
>> @@ -1,332 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -/*
>> - * Minimal BPF JIT image disassembler
>> - *
>> - * Disassembles BPF JIT compiler emitted opcodes back to asm insn's =
for
>> - * debugging or verification purposes.
>> - *
>> - * To get the disassembly of the JIT code, do the following:
>> - *
>> - *  1) `echo 2 > /proc/sys/net/core/bpf_jit_enable`
>> - *  2) Load a BPF filter (e.g. `tcpdump -p -n -s 0 -i eth1 host =
192.168.20.0/24`)
>> - *  3) Run e.g. `bpf_jit_disasm -o` to read out the last JIT code
>> - *
>> - * Copyright 2013 Daniel Borkmann <borkmann@redhat.com>
>> - */
>> -
>> -#include <stdint.h>
>> -#include <stdio.h>
>> -#include <stdlib.h>
>> -#include <assert.h>
>> -#include <unistd.h>
>> -#include <string.h>
>> -#include <bfd.h>
>> -#include <dis-asm.h>
>> -#include <regex.h>
>> -#include <fcntl.h>
>> -#include <sys/klog.h>
>> -#include <sys/types.h>
>> -#include <sys/stat.h>
>> -#include <limits.h>
>> -#include <tools/dis-asm-compat.h>
>> -
>> -#define CMD_ACTION_SIZE_BUFFER         10
>> -#define CMD_ACTION_READ_ALL            3
>> -
>> -static void get_exec_path(char *tpath, size_t size)
>> -{
>> -       char *path;
>> -       ssize_t len;
>> -
>> -       snprintf(tpath, size, "/proc/%d/exe", (int) getpid());
>> -       tpath[size - 1] =3D 0;
>> -
>> -       path =3D strdup(tpath);
>> -       assert(path);
>> -
>> -       len =3D readlink(path, tpath, size);
>> -       tpath[len] =3D 0;
>> -
>> -       free(path);
>> -}
>> -
>> -static void get_asm_insns(uint8_t *image, size_t len, int opcodes)
>> -{
>> -       int count, i, pc =3D 0;
>> -       char tpath[PATH_MAX];
>> -       struct disassemble_info info;
>> -       disassembler_ftype disassemble;
>> -       bfd *bfdf;
>> -
>> -       memset(tpath, 0, sizeof(tpath));
>> -       get_exec_path(tpath, sizeof(tpath));
>> -
>> -       bfdf =3D bfd_openr(tpath, NULL);
>> -       assert(bfdf);
>> -       assert(bfd_check_format(bfdf, bfd_object));
>> -
>> -       init_disassemble_info_compat(&info, stdout,
>> -                                    (fprintf_ftype) fprintf,
>> -                                    fprintf_styled);
>> -       info.arch =3D bfd_get_arch(bfdf);
>> -       info.mach =3D bfd_get_mach(bfdf);
>> -       info.buffer =3D image;
>> -       info.buffer_length =3D len;
>> -
>> -       disassemble_init_for_target(&info);
>> -
>> -#ifdef DISASM_FOUR_ARGS_SIGNATURE
>> -       disassemble =3D disassembler(info.arch,
>> -                                  bfd_big_endian(bfdf),
>> -                                  info.mach,
>> -                                  bfdf);
>> -#else
>> -       disassemble =3D disassembler(bfdf);
>> -#endif
>> -       assert(disassemble);
>> -
>> -       do {
>> -               printf("%4x:\t", pc);
>> -
>> -               count =3D disassemble(pc, &info);
>> -
>> -               if (opcodes) {
>> -                       printf("\n\t");
>> -                       for (i =3D 0; i < count; ++i)
>> -                               printf("%02x ", (uint8_t) image[pc + =
i]);
>> -               }
>> -               printf("\n");
>> -
>> -               pc +=3D count;
>> -       } while(count > 0 && pc < len);
>> -
>> -       bfd_close(bfdf);
>> -}
>> -
>> -static char *get_klog_buff(unsigned int *klen)
>> -{
>> -       int ret, len;
>> -       char *buff;
>> -
>> -       len =3D klogctl(CMD_ACTION_SIZE_BUFFER, NULL, 0);
>> -       if (len < 0)
>> -               return NULL;
>> -
>> -       buff =3D malloc(len);
>> -       if (!buff)
>> -               return NULL;
>> -
>> -       ret =3D klogctl(CMD_ACTION_READ_ALL, buff, len);
>> -       if (ret < 0) {
>> -               free(buff);
>> -               return NULL;
>> -       }
>> -
>> -       *klen =3D ret;
>> -       return buff;
>> -}
>> -
>> -static char *get_flog_buff(const char *file, unsigned int *klen)
>> -{
>> -       int fd, ret, len;
>> -       struct stat fi;
>> -       char *buff;
>> -
>> -       fd =3D open(file, O_RDONLY);
>> -       if (fd < 0)
>> -               return NULL;
>> -
>> -       ret =3D fstat(fd, &fi);
>> -       if (ret < 0 || !S_ISREG(fi.st_mode))
>> -               goto out;
>> -
>> -       len =3D fi.st_size + 1;
>> -       buff =3D malloc(len);
>> -       if (!buff)
>> -               goto out;
>> -
>> -       memset(buff, 0, len);
>> -       ret =3D read(fd, buff, len - 1);
>> -       if (ret <=3D 0)
>> -               goto out_free;
>> -
>> -       close(fd);
>> -       *klen =3D ret;
>> -       return buff;
>> -out_free:
>> -       free(buff);
>> -out:
>> -       close(fd);
>> -       return NULL;
>> -}
>> -
>> -static char *get_log_buff(const char *file, unsigned int *klen)
>> -{
>> -       return file ? get_flog_buff(file, klen) : =
get_klog_buff(klen);
>> -}
>> -
>> -static void put_log_buff(char *buff)
>> -{
>> -       free(buff);
>> -}
>> -
>> -static uint8_t *get_last_jit_image(char *haystack, size_t hlen,
>> -                                  unsigned int *ilen)
>> -{
>> -       char *ptr, *pptr, *tmp;
>> -       off_t off =3D 0;
>> -       unsigned int proglen;
>> -       int ret, flen, pass, ulen =3D 0;
>> -       regmatch_t pmatch[1];
>> -       unsigned long base;
>> -       regex_t regex;
>> -       uint8_t *image;
>> -
>> -       if (hlen =3D=3D 0)
>> -               return NULL;
>> -
>> -       ret =3D regcomp(&regex, "flen=3D[[:alnum:]]+ =
proglen=3D[[:digit:]]+ "
>> -                     "pass=3D[[:digit:]]+ image=3D[[:xdigit:]]+", =
REG_EXTENDED);
>> -       assert(ret =3D=3D 0);
>> -
>> -       ptr =3D haystack;
>> -       memset(pmatch, 0, sizeof(pmatch));
>> -
>> -       while (1) {
>> -               ret =3D regexec(&regex, ptr, 1, pmatch, 0);
>> -               if (ret =3D=3D 0) {
>> -                       ptr +=3D pmatch[0].rm_eo;
>> -                       off +=3D pmatch[0].rm_eo;
>> -                       assert(off < hlen);
>> -               } else
>> -                       break;
>> -       }
>> -
>> -       ptr =3D haystack + off - (pmatch[0].rm_eo - pmatch[0].rm_so);
>> -       ret =3D sscanf(ptr, "flen=3D%d proglen=3D%u pass=3D%d =
image=3D%lx",
>> -                    &flen, &proglen, &pass, &base);
>> -       if (ret !=3D 4) {
>> -               regfree(&regex);
>> -               return NULL;
>> -       }
>> -       if (proglen > 1000000) {
>> -               printf("proglen of %d too big, stopping\n", proglen);
>> -               return NULL;
>> -       }
>> -
>> -       image =3D malloc(proglen);
>> -       if (!image) {
>> -               printf("Out of memory\n");
>> -               return NULL;
>> -       }
>> -       memset(image, 0, proglen);
>> -
>> -       tmp =3D ptr =3D haystack + off;
>> -       while ((ptr =3D strtok(tmp, "\n")) !=3D NULL && ulen < =
proglen) {
>> -               tmp =3D NULL;
>> -               if (!strstr(ptr, "JIT code"))
>> -                       continue;
>> -               pptr =3D ptr;
>> -               while ((ptr =3D strstr(pptr, ":")))
>> -                       pptr =3D ptr + 1;
>> -               ptr =3D pptr;
>> -               do {
>> -                       image[ulen++] =3D (uint8_t) strtoul(pptr, =
&pptr, 16);
>> -                       if (ptr =3D=3D pptr) {
>> -                               ulen--;
>> -                               break;
>> -                       }
>> -                       if (ulen >=3D proglen)
>> -                               break;
>> -                       ptr =3D pptr;
>> -               } while (1);
>> -       }
>> -
>> -       assert(ulen =3D=3D proglen);
>> -       printf("%u bytes emitted from JIT compiler (pass:%d, =
flen:%d)\n",
>> -              proglen, pass, flen);
>> -       printf("%lx + <x>:\n", base);
>> -
>> -       regfree(&regex);
>> -       *ilen =3D ulen;
>> -       return image;
>> -}
>> -
>> -static void usage(void)
>> -{
>> -       printf("Usage: bpf_jit_disasm [...]\n");
>> -       printf("       -o          Also display related opcodes =
(default: off).\n");
>> -       printf("       -O <file>   Write binary image of code to =
file, don't disassemble to stdout.\n");
>> -       printf("       -f <file>   Read last image dump from file or =
stdin (default: klog).\n");
>> -       printf("       -h          Display this help.\n");
>> -}
>> -
>> -int main(int argc, char **argv)
>> -{
>> -       unsigned int len, klen, opt, opcodes =3D 0;
>> -       char *kbuff, *file =3D NULL;
>> -       char *ofile =3D NULL;
>> -       int ofd;
>> -       ssize_t nr;
>> -       uint8_t *pos;
>> -       uint8_t *image =3D NULL;
>> -
>> -       while ((opt =3D getopt(argc, argv, "of:O:")) !=3D -1) {
>> -               switch (opt) {
>> -               case 'o':
>> -                       opcodes =3D 1;
>> -                       break;
>> -               case 'O':
>> -                       ofile =3D optarg;
>> -                       break;
>> -               case 'f':
>> -                       file =3D optarg;
>> -                       break;
>> -               default:
>> -                       usage();
>> -                       return -1;
>> -               }
>> -       }
>> -
>> -       bfd_init();
>> -
>> -       kbuff =3D get_log_buff(file, &klen);
>> -       if (!kbuff) {
>> -               fprintf(stderr, "Could not retrieve log buffer!\n");
>> -               return -1;
>> -       }
>> -
>> -       image =3D get_last_jit_image(kbuff, klen, &len);
>> -       if (!image) {
>> -               fprintf(stderr, "No JIT image found!\n");
>> -               goto done;
>> -       }
>> -       if (!ofile) {
>> -               get_asm_insns(image, len, opcodes);
>> -               goto done;
>> -       }
>> -
>> -       ofd =3D open(ofile, O_WRONLY | O_CREAT | O_TRUNC, =
DEFFILEMODE);
>> -       if (ofd < 0) {
>> -               fprintf(stderr, "Could not open file %s for writing: =
", ofile);
>> -               perror(NULL);
>> -               goto done;
>> -       }
>> -       pos =3D image;
>> -       do {
>> -               nr =3D write(ofd, pos, len);
>> -               if (nr < 0) {
>> -                       fprintf(stderr, "Could not write data to %s: =
", ofile);
>> -                       perror(NULL);
>> -                       goto done;
>> -               }
>> -               len -=3D nr;
>> -               pos +=3D nr;
>> -       } while (len);
>> -       close(ofd);
>> -
>> -done:
>> -       put_log_buff(kbuff);
>> -       free(image);
>> -       return 0;
>> -}
>> --
>> 2.27.0


--Apple-Mail=_808270E9-39BE-41A5-A04F-4122953F24D8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jan 6, 2023, at 1:53 AM, Christophe Leroy &lt;<a =
href=3D"mailto:christophe.leroy@csgroup.eu" =
class=3D"">christophe.leroy@csgroup.eu</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Le 05/01/2023 =C3=A0 04:06,<span =
class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"mailto:tong@infragraf.org" style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">tong@infragraf.org</a><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D""><span =
class=3D"Apple-converted-space">&nbsp;</span>a =C3=A9crit&nbsp;:</span><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">From: =
Tonghao Zhang &lt;<a href=3D"mailto:tong@infragraf.org" =
class=3D"">tong@infragraf.org</a>&gt;<br class=3D""><br class=3D"">The =
x86_64 can't dump the valid insn in this way. A test BPF prog<br =
class=3D"">which include subprog:<br class=3D""><br class=3D"">$ =
llvm-objdump -d subprog.o<br class=3D"">Disassembly of section .text:<br =
class=3D"">0000000000000000 &lt;subprog&gt;:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;18 01 00 00 73 75 62 70 00 00 00 00 =
72 6f 67 00 r1 =3D 29114459903653235 ll<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7b 1a f8 ff 00 00 00 00 *(u64 *)(r10 =
- 8) =3D r1<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bf a1 00 00 00 00 00 00 r1 =3D =
r10<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;07 01 00 00 f8 ff ff ff r1 +=3D =
-8<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b7 02 00 00 08 00 00 00 r2 =3D 8<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;85 00 00 00 06 00 00 00 call 6<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;95 00 00 00 00 00 00 00 exit<br =
class=3D"">Disassembly of section raw_tp/sys_enter:<br =
class=3D"">0000000000000000 &lt;entry&gt;:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;85 10 00 00 ff ff ff ff call -1<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b7 00 00 00 00 00 00 00 r0 =3D 0<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;95 00 00 00 00 00 00 00 exit<br =
class=3D""><br class=3D"">kernel print message:<br class=3D"">[ =
&nbsp;580.775387] flen=3D8 proglen=3D51 pass=3D3 image=3Dffffffffa000c20c =
from=3Dkprobe-load pid=3D1643<br class=3D"">[ &nbsp;580.777236] JIT =
code: 00000000: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc<br =
class=3D"">[ &nbsp;580.779037] JIT code: 00000010: cc cc cc cc cc cc cc =
cc cc cc cc cc cc cc cc cc<br class=3D"">[ &nbsp;580.780767] JIT code: =
00000020: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc<br class=3D"">[ =
&nbsp;580.782568] JIT code: 00000030: cc cc cc<br class=3D""><br =
class=3D"">$ bpf_jit_disasm<br class=3D"">51 bytes emitted from JIT =
compiler (pass:3, flen:8)<br class=3D"">ffffffffa000c20c + &lt;x&gt;:<br =
class=3D"">&nbsp;&nbsp;&nbsp;0: &nbsp;&nbsp;int3<br =
class=3D"">&nbsp;&nbsp;&nbsp;1: &nbsp;&nbsp;int3<br =
class=3D"">&nbsp;&nbsp;&nbsp;2: &nbsp;&nbsp;int3<br =
class=3D"">&nbsp;&nbsp;&nbsp;3: &nbsp;&nbsp;int3<br =
class=3D"">&nbsp;&nbsp;&nbsp;4: &nbsp;&nbsp;int3<br =
class=3D"">&nbsp;&nbsp;&nbsp;5: &nbsp;&nbsp;int3<br =
class=3D"">&nbsp;&nbsp;&nbsp;...<br class=3D""><br class=3D"">Until =
bpf_jit_binary_pack_finalize is invoked, we copy rw_header to header<br =
class=3D"">and then image/insn is valid. BTW, we can use the "bpftool =
prog dump" JITed instructions.<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">NACK.</span><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Because the =
feature is buggy on x86_64, you remove it for all<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">architectures =
?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">On powerpc =
bpf_jit_enable =3D=3D 2 works and is very usefull.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Last time I =
tried to use bpftool on powerpc/32 it didn't work. I don't<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">remember the =
details, I think it was an issue with endianess. Maybe it<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">is fixed now, =
but it needs to be verified.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>I think bpftool may dump the&nbsp;jited insn too.<br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">So please, =
before removing a working and usefull feature, make sure<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">there is an =
alternative available to it for all architectures in all<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">configurations.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Also, I don't think bpftool is usable to dump kernel BPF =
selftests.<span class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div>Why bpftool does=E2=80=99t =
work for you ? I think this is a core function for bpf. If you can dump =
the jited insn using bpf_jit_enable =3D=3D 2, you should</div><div>dump =
the inns tool, while in&nbsp;<font face=3D"Menlo-Regular" class=3D""><span=
 style=3D"font-size: 11px;" =
class=3D"">selftest</span></font>&nbsp;case.</div><div><br =
class=3D""></div><div>Alexei&nbsp;any thoughts?</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">That's vital =
when a selftest fails if you want to have a chance to<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">understand =
why it fails.</span></div></blockquote><blockquote type=3D"cite" =
class=3D""><div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Thanks</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Christophe</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br class=3D"">Signed-off-by: Tonghao =
Zhang &lt;<a href=3D"mailto:tong@infragraf.org" =
class=3D"">tong@infragraf.org</a>&gt;<br class=3D"">Suggested-by: Alexei =
Starovoitov &lt;<a href=3D"mailto:ast@kernel.org" =
class=3D"">ast@kernel.org</a>&gt;<br class=3D"">Cc: Alexei Starovoitov =
&lt;<a href=3D"mailto:ast@kernel.org" class=3D"">ast@kernel.org</a>&gt;<br=
 class=3D"">Cc: Daniel Borkmann &lt;<a =
href=3D"mailto:daniel@iogearbox.net" =
class=3D"">daniel@iogearbox.net</a>&gt;<br class=3D"">Cc: Andrii =
Nakryiko &lt;<a href=3D"mailto:andrii@kernel.org" =
class=3D"">andrii@kernel.org</a>&gt;<br class=3D"">Cc: Martin KaFai Lau =
&lt;<a href=3D"mailto:martin.lau@linux.dev" =
class=3D"">martin.lau@linux.dev</a>&gt;<br class=3D"">Cc: Song Liu =
&lt;<a href=3D"mailto:song@kernel.org" =
class=3D"">song@kernel.org</a>&gt;<br class=3D"">Cc: Yonghong Song =
&lt;<a href=3D"mailto:yhs@fb.com" class=3D"">yhs@fb.com</a>&gt;<br =
class=3D"">Cc: John Fastabend &lt;<a =
href=3D"mailto:john.fastabend@gmail.com" =
class=3D"">john.fastabend@gmail.com</a>&gt;<br class=3D"">Cc: KP Singh =
&lt;<a href=3D"mailto:kpsingh@kernel.org" =
class=3D"">kpsingh@kernel.org</a>&gt;<br class=3D"">Cc: Stanislav =
Fomichev &lt;<a href=3D"mailto:sdf@google.com" =
class=3D"">sdf@google.com</a>&gt;<br class=3D"">Cc: Hao Luo &lt;<a =
href=3D"mailto:haoluo@google.com" class=3D"">haoluo@google.com</a>&gt;<br =
class=3D"">Cc: Jiri Olsa &lt;<a href=3D"mailto:jolsa@kernel.org" =
class=3D"">jolsa@kernel.org</a>&gt;<br class=3D"">Cc: Hou Tao &lt;<a =
href=3D"mailto:houtao1@huawei.com" =
class=3D"">houtao1@huawei.com</a>&gt;<br class=3D"">---<br =
class=3D"">&nbsp;Documentation/admin-guide/sysctl/net.rst | =
&nbsp;&nbsp;1 +<br class=3D"">&nbsp;Documentation/networking/filter.rst =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;98 +------<br =
class=3D"">&nbsp;arch/arm/net/bpf_jit_32.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;| &nbsp;&nbsp;4 -<br =
class=3D"">&nbsp;arch/arm64/net/bpf_jit_comp.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;&nbsp;4 -<br class=3D"">&nbsp;arch/loongarch/net/bpf_jit.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;&nbsp;4 -<br class=3D"">&nbsp;arch/mips/net/bpf_jit_comp.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;&nbsp;3 -<br class=3D"">&nbsp;arch/powerpc/net/bpf_jit_comp.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;11 -<br =
class=3D"">&nbsp;arch/riscv/net/bpf_jit_core.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;&nbsp;3 -<br class=3D"">&nbsp;arch/s390/net/bpf_jit_comp.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;&nbsp;4 -<br class=3D"">&nbsp;arch/sparc/net/bpf_jit_comp_32.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;3 -<br =
class=3D"">&nbsp;arch/sparc/net/bpf_jit_comp_64.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;13 -<br =
class=3D"">&nbsp;arch/x86/net/bpf_jit_comp.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;| &nbsp;&nbsp;3 -<br class=3D"">&nbsp;arch/x86/net/bpf_jit_comp32.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;&nbsp;3 -<br class=3D"">&nbsp;net/core/sysctl_net_core.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| &nbsp;12 +-<br class=3D"">&nbsp;tools/bpf/.gitignore =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;1 -<br =
class=3D"">&nbsp;tools/bpf/Makefile =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;10 =
+-<br class=3D"">&nbsp;tools/bpf/bpf_jit_disasm.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| 332 -----------------------<br class=3D"">&nbsp;17 files =
changed, 9 insertions(+), 500 deletions(-)<br class=3D"">&nbsp;delete =
mode 100644 tools/bpf/bpf_jit_disasm.c<br class=3D""><br class=3D"">diff =
--git a/Documentation/admin-guide/sysctl/net.rst =
b/Documentation/admin-guide/sysctl/net.rst<br class=3D"">index =
6394f5dc2303..82ca05ca6ed0 100644<br class=3D"">--- =
a/Documentation/admin-guide/sysctl/net.rst<br class=3D"">+++ =
b/Documentation/admin-guide/sysctl/net.rst<br class=3D"">@@ -88,6 +88,7 =
@@ Values:<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-=
 0 - disable the JIT (default value)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 1 - enable =
the JIT<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- =
2 - enable the JIT and ask the compiler to emit traces on kernel log.<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;(deprecated since v6.3, use ``bpftool prog dump jited id =
&lt;id&gt;`` instead)<br class=3D""><br class=3D"">&nbsp;bpf_jit_harden<br=
 class=3D"">&nbsp;--------------<br class=3D"">diff --git =
a/Documentation/networking/filter.rst =
b/Documentation/networking/filter.rst<br class=3D"">index =
f69da5074860..5f51c050e88f 100644<br class=3D"">--- =
a/Documentation/networking/filter.rst<br class=3D"">+++ =
b/Documentation/networking/filter.rst<br class=3D"">@@ -520,102 +520,8 =
@@ been previously enabled by root::<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;echo 1 &gt; =
/proc/sys/net/core/bpf_jit_enable<br class=3D""><br class=3D"">-For JIT =
developers, doing audits etc, each compile run can output the =
generated<br class=3D"">-opcode image into the kernel log via::<br =
class=3D"">-<br class=3D"">- &nbsp;echo 2 &gt; =
/proc/sys/net/core/bpf_jit_enable<br class=3D"">-<br class=3D"">-Example =
output from dmesg::<br class=3D"">-<br class=3D"">- &nbsp;&nbsp;&nbsp;[ =
3389.935842] flen=3D6 proglen=3D70 pass=3D3 image=3Dffffffffa0069c8f<br =
class=3D"">- &nbsp;&nbsp;&nbsp;[ 3389.935847] JIT code: 00000000: 55 48 =
89 e5 48 83 ec 60 48 89 5d f8 44 8b 4f 68<br class=3D"">- =
&nbsp;&nbsp;&nbsp;[ 3389.935849] JIT code: 00000010: 44 2b 4f 6c 4c 8b =
87 d8 00 00 00 be 0c 00 00 00<br class=3D"">- &nbsp;&nbsp;&nbsp;[ =
3389.935850] JIT code: 00000020: e8 1d 94 ff e0 3d 00 08 00 00 75 16 be =
17 00 00<br class=3D"">- &nbsp;&nbsp;&nbsp;[ 3389.935851] JIT code: =
00000030: 00 e8 28 94 ff e0 83 f8 01 75 07 b8 ff ff 00 00<br class=3D"">- =
&nbsp;&nbsp;&nbsp;[ 3389.935852] JIT code: 00000040: eb 02 31 c0 c9 =
c3<br class=3D"">-<br class=3D"">-When CONFIG_BPF_JIT_ALWAYS_ON is =
enabled, bpf_jit_enable is permanently set to 1 and<br class=3D"">-setting=
 any other value than that will return in failure. This is even the case =
for<br class=3D"">-setting bpf_jit_enable to 2, since dumping the final =
JIT image into the kernel log<br class=3D"">-is discouraged and =
introspection through bpftool (under tools/bpf/bpftool/) is the<br =
class=3D"">-generally recommended approach instead.<br class=3D"">-<br =
class=3D"">-In the kernel source tree under tools/bpf/, there's =
bpf_jit_disasm for<br class=3D"">-generating disassembly out of the =
kernel log's hexdump::<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# ./bpf_jit_disasm<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;70 bytes emitted from JIT compiler =
(pass:3, flen:6)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ffffffffa0069c8f + &lt;x&gt;:<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;push &nbsp;&nbsp;%rbp<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mov =
&nbsp;&nbsp;&nbsp;%rsp,%rbp<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sub =
&nbsp;&nbsp;&nbsp;$0x60,%rsp<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mov =
&nbsp;&nbsp;&nbsp;%rbx,-0x8(%rbp)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mov =
&nbsp;&nbsp;&nbsp;0x68(%rdi),%r9d<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10: &nbsp;&nbsp;&nbsp;&nbsp;sub =
&nbsp;&nbsp;&nbsp;0x6c(%rdi),%r9d<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;14: &nbsp;&nbsp;&nbsp;&nbsp;mov =
&nbsp;&nbsp;&nbsp;0xd8(%rdi),%r8<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1b: &nbsp;&nbsp;&nbsp;&nbsp;mov =
&nbsp;&nbsp;&nbsp;$0xc,%esi<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20: &nbsp;&nbsp;&nbsp;&nbsp;callq =
&nbsp;0xffffffffe0ff9442<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;25: &nbsp;&nbsp;&nbsp;&nbsp;cmp =
&nbsp;&nbsp;&nbsp;$0x800,%eax<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2a: &nbsp;&nbsp;&nbsp;&nbsp;jne =
&nbsp;&nbsp;&nbsp;0x0000000000000042<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2c: &nbsp;&nbsp;&nbsp;&nbsp;mov =
&nbsp;&nbsp;&nbsp;$0x17,%esi<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;31: &nbsp;&nbsp;&nbsp;&nbsp;callq =
&nbsp;0xffffffffe0ff945e<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;36: &nbsp;&nbsp;&nbsp;&nbsp;cmp =
&nbsp;&nbsp;&nbsp;$0x1,%eax<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;39: &nbsp;&nbsp;&nbsp;&nbsp;jne =
&nbsp;&nbsp;&nbsp;0x0000000000000042<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3b: &nbsp;&nbsp;&nbsp;&nbsp;mov =
&nbsp;&nbsp;&nbsp;$0xffff,%eax<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;40: &nbsp;&nbsp;&nbsp;&nbsp;jmp =
&nbsp;&nbsp;&nbsp;0x0000000000000044<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;42: &nbsp;&nbsp;&nbsp;&nbsp;xor =
&nbsp;&nbsp;&nbsp;%eax,%eax<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;44: =
&nbsp;&nbsp;&nbsp;&nbsp;leaveq<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;45: &nbsp;&nbsp;&nbsp;&nbsp;retq<br =
class=3D"">-<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Issuing =
option `-o` will "annotate" opcodes to resulting assembler<br class=3D"">-=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;instructions, which can be very =
useful for JIT developers:<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# ./bpf_jit_disasm -o<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;70 bytes emitted from JIT compiler =
(pass:3, flen:6)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ffffffffa0069c8f + &lt;x&gt;:<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;push &nbsp;&nbsp;%rbp<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;55<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mov &nbsp;&nbsp;&nbsp;%rsp,%rbp<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;48 89 e5<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sub =
&nbsp;&nbsp;&nbsp;$0x60,%rsp<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;48 83 ec 60<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mov =
&nbsp;&nbsp;&nbsp;%rbx,-0x8(%rbp)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;48 89 5d f8<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mov =
&nbsp;&nbsp;&nbsp;0x68(%rdi),%r9d<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;44 8b 4f 68<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10: &nbsp;&nbsp;&nbsp;&nbsp;sub =
&nbsp;&nbsp;&nbsp;0x6c(%rdi),%r9d<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;44 2b 4f 6c<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;14: &nbsp;&nbsp;&nbsp;&nbsp;mov =
&nbsp;&nbsp;&nbsp;0xd8(%rdi),%r8<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;4c 8b 87 d8 00 00 00<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1b: &nbsp;&nbsp;&nbsp;&nbsp;mov =
&nbsp;&nbsp;&nbsp;$0xc,%esi<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;be 0c 00 00 00<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20: &nbsp;&nbsp;&nbsp;&nbsp;callq =
&nbsp;0xffffffffe0ff9442<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;e8 1d 94 ff e0<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;25: &nbsp;&nbsp;&nbsp;&nbsp;cmp =
&nbsp;&nbsp;&nbsp;$0x800,%eax<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;3d 00 08 00 00<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2a: &nbsp;&nbsp;&nbsp;&nbsp;jne =
&nbsp;&nbsp;&nbsp;0x0000000000000042<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;75 16<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2c: =
&nbsp;&nbsp;&nbsp;&nbsp;mov &nbsp;&nbsp;&nbsp;$0x17,%esi<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;be 17 00 00 00<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;31: &nbsp;&nbsp;&nbsp;&nbsp;callq =
&nbsp;0xffffffffe0ff945e<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;e8 28 94 ff e0<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;36: &nbsp;&nbsp;&nbsp;&nbsp;cmp =
&nbsp;&nbsp;&nbsp;$0x1,%eax<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;83 f8 01<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;39: &nbsp;&nbsp;&nbsp;&nbsp;jne =
&nbsp;&nbsp;&nbsp;0x0000000000000042<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;75 07<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3b: =
&nbsp;&nbsp;&nbsp;&nbsp;mov &nbsp;&nbsp;&nbsp;$0xffff,%eax<br class=3D"">-=
 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;b8 ff ff 00 00<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;40: &nbsp;&nbsp;&nbsp;&nbsp;jmp =
&nbsp;&nbsp;&nbsp;0x0000000000000044<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;eb 02<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;42: =
&nbsp;&nbsp;&nbsp;&nbsp;xor &nbsp;&nbsp;&nbsp;%eax,%eax<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;31 c0<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;44: =
&nbsp;&nbsp;&nbsp;&nbsp;leaveq<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;c9<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;45: =
&nbsp;&nbsp;&nbsp;&nbsp;retq<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;c3<br class=3D"">-<br class=3D"">-For BPF JIT developers, =
bpf_jit_disasm, bpf_asm and bpf_dbg provides a useful<br =
class=3D"">-toolchain for developing and testing the kernel's JIT =
compiler.<br class=3D"">+For JIT developers, doing audits etc, should =
use `bpftool prog dump` to<br class=3D"">+veiw the JIT generated opcode =
image.<br class=3D""><br class=3D"">&nbsp;BPF kernel internals<br =
class=3D"">&nbsp;--------------------<br class=3D"">diff --git =
a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c<br =
class=3D"">index 6a1c9fca5260..39301d59b537 100644<br class=3D"">--- =
a/arch/arm/net/bpf_jit_32.c<br class=3D"">+++ =
b/arch/arm/net/bpf_jit_32.c<br class=3D"">@@ -1999,10 +1999,6 @@ struct =
bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;flush_icache_ra=
nge((u32)header, (u32)(ctx.target + ctx.idx));<br class=3D""><br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (bpf_jit_enable &gt; =
1)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;/* there are 2 passes here */<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;bpf_jit_dump(prog-&gt;len, image_size, 2, ctx.target);<br =
class=3D"">-<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bpf_jit_binary_=
lock_ro(header);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prog-&gt;bpf_fu=
nc =3D (void *)ctx.target;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prog-&gt;jited =
=3D 1;<br class=3D"">diff --git a/arch/arm64/net/bpf_jit_comp.c =
b/arch/arm64/net/bpf_jit_comp.c<br class=3D"">index =
62f805f427b7..59c35b4d77b7 100644<br class=3D"">--- =
a/arch/arm64/net/bpf_jit_comp.c<br class=3D"">+++ =
b/arch/arm64/net/bpf_jit_comp.c<br class=3D"">@@ -1567,10 +1567,6 @@ =
struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto out_off;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D""><br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* And =
we're done. */<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(bpf_jit_enable &gt; 1)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;bpf_jit_dump(prog-&gt;len, prog_size, 2, ctx.image);<br =
class=3D"">-<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bpf_flush_icach=
e(header, ctx.image + ctx.idx);<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(!prog-&gt;is_func || extra_pass) {<br class=3D"">diff --git =
a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c<br =
class=3D"">index bdcd0c7719a9..ea37f52faa6e 100644<br class=3D"">--- =
a/arch/loongarch/net/bpf_jit.c<br class=3D"">+++ =
b/arch/loongarch/net/bpf_jit.c<br class=3D"">@@ -1123,10 +1123,6 @@ =
struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto out_offset;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D""><br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* And =
we're done */<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(bpf_jit_enable &gt; 1)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;bpf_jit_dump(prog-&gt;len, image_size, 2, ctx.image);<br =
class=3D"">-<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Update the =
icache */<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;flush_icache_ra=
nge((unsigned long)header, (unsigned long)(ctx.image + ctx.idx));<br =
class=3D""><br class=3D"">diff --git a/arch/mips/net/bpf_jit_comp.c =
b/arch/mips/net/bpf_jit_comp.c<br class=3D"">index =
b17130d510d4..ccbb7c231cb0 100644<br class=3D"">--- =
a/arch/mips/net/bpf_jit_comp.c<br class=3D"">+++ =
b/arch/mips/net/bpf_jit_comp.c<br class=3D"">@@ -1012,9 +1012,6 @@ =
struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;flush_icache_ra=
nge((unsigned long)header,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;(unsigned =
long)&amp;ctx.target[ctx.jit_index]);<br class=3D""><br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (bpf_jit_enable &gt; 1)<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;bpf_jit_dump(prog-&gt;len, image_size, 2, ctx.target);<br =
class=3D"">-<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prog-&gt;bpf_fu=
nc =3D (void *)ctx.target;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prog-&gt;jited =
=3D 1;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prog-&gt;jited_=
len =3D image_size;<br class=3D"">diff --git =
a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c<br =
class=3D"">index 43e634126514..f0f7d8ff2022 100644<br class=3D"">--- =
a/arch/powerpc/net/bpf_jit_comp.c<br class=3D"">+++ =
b/arch/powerpc/net/bpf_jit_comp.c<br class=3D"">@@ -262,20 +262,9 @@ =
struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;goto out_addrs;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bpf_jit_build_epilogue(code_base, =
&amp;cgctx);<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;if (bpf_jit_enable &gt; 1)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pr_info("Pass =
%d: shrink =3D %d, seen =3D 0x%x\n", pass,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proglen - (cgctx.idx * 4), =
cgctx.seen);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D""><br class=3D"">&nbsp;skip_codegen_passes:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (bpf_jit_enable &gt; 1)<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;/*<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;* Note that we output the base address of the =
code_base<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;* rather than image, since opcodes are in code_base.<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;*/<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;bpf_jit_dump(flen, proglen, pass, code_base);<br class=3D"">-<br=
 class=3D"">&nbsp;#ifdef CONFIG_PPC64_ELF_ABI_V1<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Function =
descriptor nastiness: Address + TOC */<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;((u64 =
*)image)[0] =3D (u64)code_base;<br class=3D"">diff --git =
a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c<br =
class=3D"">index 737baf8715da..ff168c50d46a 100644<br class=3D"">--- =
a/arch/riscv/net/bpf_jit_core.c<br class=3D"">+++ =
b/arch/riscv/net/bpf_jit_core.c<br class=3D"">@@ -151,9 +151,6 @@ struct =
bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bpf_jit_build_e=
pilogue(ctx);<br class=3D""><br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (bpf_jit_enable &gt; 1)<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;bpf_jit_dump(prog-&gt;len, prog_size, pass, ctx-&gt;insns);<br =
class=3D"">-<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prog-&gt;bpf_fu=
nc =3D (void *)ctx-&gt;insns;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prog-&gt;jited =
=3D 1;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prog-&gt;jited_=
len =3D prog_size;<br class=3D"">diff --git =
a/arch/s390/net/bpf_jit_comp.c b/arch/s390/net/bpf_jit_comp.c<br =
class=3D"">index af35052d06ed..13d996e27602 100644<br class=3D"">--- =
a/arch/s390/net/bpf_jit_comp.c<br class=3D"">+++ =
b/arch/s390/net/bpf_jit_comp.c<br class=3D"">@@ -1831,10 +1831,6 @@ =
struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fp =3D orig_fp;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto free_addrs;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (bpf_jit_enable &gt; =
1) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;bpf_jit_dump(fp-&gt;len, jit.size, pass, jit.prg_buf);<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;print_fn_code(jit.prg_buf, jit.size_prg);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(!fp-&gt;is_func || extra_pass) {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bpf_jit_binary_lock_ro(header);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} else {<br =
class=3D"">diff --git a/arch/sparc/net/bpf_jit_comp_32.c =
b/arch/sparc/net/bpf_jit_comp_32.c<br class=3D"">index =
a74e5004c6c8..08de0ed84831 100644<br class=3D"">--- =
a/arch/sparc/net/bpf_jit_comp_32.c<br class=3D"">+++ =
b/arch/sparc/net/bpf_jit_comp_32.c<br class=3D"">@@ -743,9 +743,6 @@ =
cond_branch: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f_offset =
=3D addrs[i + filter[i].jf];<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;oldproglen =3D proglen;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D""><br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(bpf_jit_enable &gt; 1)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;bpf_jit_dump(flen, proglen, pass + 1, image);<br class=3D"">-<br=
 class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (image) =
{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fp-&gt;bpf_func =3D (void *)image;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fp-&gt;jited =3D 1;<br class=3D"">diff =
--git a/arch/sparc/net/bpf_jit_comp_64.c =
b/arch/sparc/net/bpf_jit_comp_64.c<br class=3D"">index =
fa0759bfe498..14c9e5ce4100 100644<br class=3D"">--- =
a/arch/sparc/net/bpf_jit_comp_64.c<br class=3D"">+++ =
b/arch/sparc/net/bpf_jit_comp_64.c<br class=3D"">@@ -1549,16 +1549,6 @@ =
struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;build_epilogue(&amp;ctx);<br =
class=3D""><br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;if (bpf_jit_enable &gt; 1)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pr_info("Pass =
%d: size =3D %u, seen =3D [%c%c%c%c%c%c]\n", pass,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctx.idx * 4,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctx.tmp_1_used ? '1' : ' ',<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctx.tmp_2_used ? '2' : ' ',<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctx.tmp_3_used ? '3' : ' ',<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctx.saw_frame_pointer ? 'F' : ' ',<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctx.saw_call ? 'C' : ' ',<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctx.saw_tail_call ? 'T' : ' ');<br =
class=3D"">-<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ctx.idx * 4 =3D=3D =
prev_image_size)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;break;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prev_image_size =3D ctx.idx * 4;<br =
class=3D"">@@ -1596,9 +1586,6 @@ struct bpf_prog =
*bpf_int_jit_compile(struct bpf_prog *prog)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto out_off;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D""><br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(bpf_jit_enable &gt; 1)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;bpf_jit_dump(prog-&gt;len, image_size, pass, ctx.image);<br =
class=3D"">-<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bpf_flush_icach=
e(header, (u8 *)header + header-&gt;size);<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(!prog-&gt;is_func || extra_pass) {<br class=3D"">diff --git =
a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c<br =
class=3D"">index e3e2b57e4e13..197ff8651a56 100644<br class=3D"">--- =
a/arch/x86/net/bpf_jit_comp.c<br class=3D"">+++ =
b/arch/x86/net/bpf_jit_comp.c<br class=3D"">@@ -2551,9 +2551,6 @@ struct =
bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cond_resched();<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D""><br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(bpf_jit_enable &gt; 1)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;bpf_jit_dump(prog-&gt;len, proglen, pass + 1, image);<br =
class=3D"">-<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (image) =
{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!prog-&gt;is_func || extra_pass) =
{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;/*<br class=3D"">diff --git a/arch/x86/net/bpf_jit_comp32.c =
b/arch/x86/net/bpf_jit_comp32.c<br class=3D"">index =
429a89c5468b..ca53f20aca73 100644<br class=3D"">--- =
a/arch/x86/net/bpf_jit_comp32.c<br class=3D"">+++ =
b/arch/x86/net/bpf_jit_comp32.c<br class=3D"">@@ -2597,9 +2597,6 @@ =
struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cond_resched();<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D""><br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(bpf_jit_enable &gt; 1)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;bpf_jit_dump(prog-&gt;len, proglen, pass + 1, image);<br =
class=3D"">-<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (image) =
{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bpf_jit_binary_lock_ro(header);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prog-&gt;bpf_func =3D (void *)image;<br =
class=3D"">diff --git a/net/core/sysctl_net_core.c =
b/net/core/sysctl_net_core.c<br class=3D"">index =
5b1ce656baa1..562ace48e1c9 100644<br class=3D"">--- =
a/net/core/sysctl_net_core.c<br class=3D"">+++ =
b/net/core/sysctl_net_core.c<br class=3D"">@@ -276,14 +276,10 @@ static =
int proc_dointvec_minmax_bpf_enable(struct ctl_table *table, int =
write,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tmp.data =3D =
&amp;jit_enable;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret =3D =
proc_dointvec_minmax(&amp;tmp, write, buffer, lenp, ppos);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (write =
&amp;&amp; !ret) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;if (jit_enable &lt; 2 ||<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(jit_enable =3D=3D 2 &amp;&amp; =
bpf_dump_raw_ok(current_cred()))) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*(int =
*)table-&gt;data =3D jit_enable;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (jit_enable =
=3D=3D 2)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pr_warn("bpf_jit_enable =3D 2 was set! =
NEVER use this in production, only for JIT debugging!\n");<br class=3D"">-=
 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;} else {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret =3D =
-EPERM;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;}<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;*(int *)table-&gt;data =3D jit_enable;<br class=3D"">+<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;if (jit_enable =3D=3D 2)<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pr_warn_once("bp=
f_jit_enable =3D=3D 2 was deprecated! Use bpftool prog dump =
instead.\n");<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (write =
&amp;&amp; ret &amp;&amp; min =3D=3D max)<br class=3D"">diff --git =
a/tools/bpf/.gitignore b/tools/bpf/.gitignore<br class=3D"">index =
cf53342175e7..5c70cfb9092e 100644<br class=3D"">--- =
a/tools/bpf/.gitignore<br class=3D"">+++ b/tools/bpf/.gitignore<br =
class=3D"">@@ -4,4 +4,3 @@ feature<br class=3D"">&nbsp;bpf_asm<br =
class=3D"">&nbsp;bpf_dbg<br class=3D"">&nbsp;bpf_exp.yacc.*<br =
class=3D"">-bpf_jit_disasm<br class=3D"">diff --git a/tools/bpf/Makefile =
b/tools/bpf/Makefile<br class=3D"">index 243b79f2b451..9264d7b0edf6 =
100644<br class=3D"">--- a/tools/bpf/Makefile<br class=3D"">+++ =
b/tools/bpf/Makefile<br class=3D"">@@ -74,14 +74,10 @@ =
$(OUTPUT)%.yacc.o: $(OUTPUT)%.yacc.c<br class=3D"">&nbsp;$(OUTPUT)%.lex.o:=
 $(OUTPUT)%.lex.c<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(QUIET_CC)$(CC=
) $(CFLAGS) -c -o $@ $&lt;<br class=3D""><br class=3D"">-PROGS =3D =
$(OUTPUT)bpf_jit_disasm $(OUTPUT)bpf_dbg $(OUTPUT)bpf_asm<br =
class=3D"">+PROGS =3D $(OUTPUT)bpf_dbg $(OUTPUT)bpf_asm<br class=3D""><br =
class=3D"">&nbsp;all: $(PROGS) bpftool runqslower<br class=3D""><br =
class=3D"">-$(OUTPUT)bpf_jit_disasm: CFLAGS +=3D =
-DPACKAGE=3D'bpf_jit_disasm'<br class=3D"">-$(OUTPUT)bpf_jit_disasm: =
$(OUTPUT)bpf_jit_disasm.o<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(QUIET_LINK)$(CC) $(CFLAGS) -o $@ =
$^ -lopcodes -lbfd -ldl<br class=3D"">-<br =
class=3D"">&nbsp;$(OUTPUT)bpf_dbg: $(OUTPUT)bpf_dbg.o<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(QUIET_LINK)$(=
CC) $(CFLAGS) -o $@ $^ -lreadline<br class=3D""><br class=3D"">@@ -94,16 =
+90,14 @@ $(OUTPUT)bpf_exp.lex.o: $(OUTPUT)bpf_exp.lex.c<br class=3D""><br=
 class=3D"">&nbsp;clean: bpftool_clean runqslower_clean =
resolve_btfids_clean<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(call =
QUIET_CLEAN, bpf-progs)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(Q)$(RM) -r -- $(OUTPUT)*.o =
$(OUTPUT)bpf_jit_disasm $(OUTPUT)bpf_dbg \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(Q)$(RM) -r -- $(OUTPUT)*.o =
$(OUTPUT)bpf_dbg \<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;$(OUTPUT)bpf_asm $(OUTPUT)bpf_exp.yacc.* =
$(OUTPUT)bpf_exp.lex.*<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(call =
QUIET_CLEAN, core-gen)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(Q)$(RM) -- =
$(OUTPUT)FEATURE-DUMP.bpf<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(Q)$(RM) -r =
-- $(OUTPUT)feature<br class=3D""><br class=3D"">&nbsp;install: $(PROGS) =
bpftool_install<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(call QUIET_INSTALL, =
bpf_jit_disasm)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(Q)$(INSTALL) =
-m 0755 -d $(DESTDIR)$(prefix)/bin<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(Q)$(INSTALL) =
$(OUTPUT)bpf_jit_disasm $(DESTDIR)$(prefix)/bin/bpf_jit_disasm<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(call =
QUIET_INSTALL, bpf_dbg)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(Q)$(INSTALL) =
$(OUTPUT)bpf_dbg $(DESTDIR)$(prefix)/bin/bpf_dbg<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(call =
QUIET_INSTALL, bpf_asm)<br class=3D"">diff --git =
a/tools/bpf/bpf_jit_disasm.c b/tools/bpf/bpf_jit_disasm.c<br =
class=3D"">deleted file mode 100644<br class=3D"">index =
a90a5d110f92..000000000000<br class=3D"">--- =
a/tools/bpf/bpf_jit_disasm.c<br class=3D"">+++ /dev/null<br class=3D"">@@ =
-1,332 +0,0 @@<br class=3D"">-// SPDX-License-Identifier: =
GPL-2.0-only<br class=3D"">-/*<br class=3D"">- * Minimal BPF JIT image =
disassembler<br class=3D"">- *<br class=3D"">- * Disassembles BPF JIT =
compiler emitted opcodes back to asm insn's for<br class=3D"">- * =
debugging or verification purposes.<br class=3D"">- *<br class=3D"">- * =
To get the disassembly of the JIT code, do the following:<br class=3D"">- =
*<br class=3D"">- * &nbsp;1) `echo 2 &gt; =
/proc/sys/net/core/bpf_jit_enable`<br class=3D"">- * &nbsp;2) Load a BPF =
filter (e.g. `tcpdump -p -n -s 0 -i eth1 host 192.168.20.0/24`)<br =
class=3D"">- * &nbsp;3) Run e.g. `bpf_jit_disasm -o` to read out the =
last JIT code<br class=3D"">- *<br class=3D"">- * Copyright 2013 Daniel =
Borkmann &lt;<a href=3D"mailto:borkmann@redhat.com" =
class=3D"">borkmann@redhat.com</a>&gt;<br class=3D"">- */<br =
class=3D"">-<br class=3D"">-#include &lt;stdint.h&gt;<br =
class=3D"">-#include &lt;stdio.h&gt;<br class=3D"">-#include =
&lt;stdlib.h&gt;<br class=3D"">-#include &lt;assert.h&gt;<br =
class=3D"">-#include &lt;unistd.h&gt;<br class=3D"">-#include =
&lt;string.h&gt;<br class=3D"">-#include &lt;bfd.h&gt;<br =
class=3D"">-#include &lt;dis-asm.h&gt;<br class=3D"">-#include =
&lt;regex.h&gt;<br class=3D"">-#include &lt;fcntl.h&gt;<br =
class=3D"">-#include &lt;sys/klog.h&gt;<br class=3D"">-#include =
&lt;sys/types.h&gt;<br class=3D"">-#include &lt;sys/stat.h&gt;<br =
class=3D"">-#include &lt;limits.h&gt;<br class=3D"">-#include =
&lt;tools/dis-asm-compat.h&gt;<br class=3D"">-<br class=3D"">-#define =
CMD_ACTION_SIZE_BUFFER =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10<br class=3D"">-#define =
CMD_ACTION_READ_ALL =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3<br =
class=3D"">-<br class=3D"">-static void get_exec_path(char *tpath, =
size_t size)<br class=3D"">-{<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char *path;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ssize_t len;<br class=3D"">-<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;snprintf(tpath, size, =
"/proc/%d/exe", (int) getpid());<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tpath[size - 1] =3D 0;<br =
class=3D"">-<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;path =3D =
strdup(tpath);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;assert(path);<br class=3D"">-<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;len =3D readlink(path, =
tpath, size);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tpath[len] =3D 0;<br class=3D"">-<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;free(path);<br =
class=3D"">-}<br class=3D"">-<br class=3D"">-static void =
get_asm_insns(uint8_t *image, size_t len, int opcodes)<br class=3D"">-{<br=
 class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int count, i, pc =3D =
0;<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char =
tpath[PATH_MAX];<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct disassemble_info info;<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;disassembler_ftype =
disassemble;<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bfd =
*bfdf;<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;memset(tpath, 0, sizeof(tpath));<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;get_exec_path(tpath, =
sizeof(tpath));<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bfdf =3D bfd_openr(tpath, NULL);<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;assert(bfdf);<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;assert(bfd_check_format(bfdf, =
bfd_object));<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;init_disassemble_info_compat(&amp;info=
, stdout,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(fprintf_fty=
pe) fprintf,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fprintf_styl=
ed);<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info.arch =3D =
bfd_get_arch(bfdf);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info.mach =3D bfd_get_mach(bfdf);<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info.buffer =3D =
image;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info.buffer_length =3D len;<br =
class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;disassemble_init_for_target(&amp;info)=
;<br class=3D"">-<br class=3D"">-#ifdef DISASM_FOUR_ARGS_SIGNATURE<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;disassemble =3D =
disassembler(info.arch,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bfd_big_endian(bfdf),<br=
 class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info.mach,<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bfdf);<br =
class=3D"">-#else<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;disassemble =3D =
disassembler(bfdf);<br class=3D"">-#endif<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;assert(disassemble);<br =
class=3D"">-<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;do {<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;printf("%4x:\t", pc);<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;count =3D disassemble(pc, &amp;info);<br class=3D"">-<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;if (opcodes) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("\n\t");<=
br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for (i =3D 0; =
i &lt; count; ++i)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%02x ", (uint8_t) image[pc + =
i]);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;printf("\n");<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;pc +=3D count;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} while(count &gt; 0 &amp;&amp; pc =
&lt; len);<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bfd_close(bfdf);<br class=3D"">-}<br =
class=3D"">-<br class=3D"">-static char *get_klog_buff(unsigned int =
*klen)<br class=3D"">-{<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int ret, len;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char *buff;<br class=3D"">-<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;len =3D =
klogctl(CMD_ACTION_SIZE_BUFFER, NULL, 0);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (len &lt; 0)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;return NULL;<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;buff =3D malloc(len);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!buff)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;return NULL;<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret =3D klogctl(CMD_ACTION_READ_ALL, =
buff, len);<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret =
&lt; 0) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;free(buff);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;return NULL;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*klen =3D ret;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return buff;<br class=3D"">-}<br =
class=3D"">-<br class=3D"">-static char *get_flog_buff(const char *file, =
unsigned int *klen)<br class=3D"">-{<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int fd, ret, len;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct stat fi;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char *buff;<br class=3D"">-<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fd =3D open(file, =
O_RDONLY);<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (fd =
&lt; 0)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;return NULL;<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret =3D fstat(fd, &amp;fi);<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret &lt; 0 || =
!S_ISREG(fi.st_mode))<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;goto out;<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;len =3D fi.st_size + 1;<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;buff =3D =
malloc(len);<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(!buff)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;goto out;<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;memset(buff, 0, len);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret =3D read(fd, buff, len - 1);<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret &lt;=3D 0)<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;goto out_free;<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;close(fd);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*klen =3D ret;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return buff;<br =
class=3D"">-out_free:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;free(buff);<br class=3D"">-out:<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;close(fd);<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return NULL;<br =
class=3D"">-}<br class=3D"">-<br class=3D"">-static char =
*get_log_buff(const char *file, unsigned int *klen)<br class=3D"">-{<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return file ? =
get_flog_buff(file, klen) : get_klog_buff(klen);<br class=3D"">-}<br =
class=3D"">-<br class=3D"">-static void put_log_buff(char *buff)<br =
class=3D"">-{<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;free(buff);<br class=3D"">-}<br =
class=3D"">-<br class=3D"">-static uint8_t *get_last_jit_image(char =
*haystack, size_t hlen,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int *ilen)<br =
class=3D"">-{<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char =
*ptr, *pptr, *tmp;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;off_t off =3D 0;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int proglen;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int ret, flen, pass, ulen =3D 0;<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;regmatch_t =
pmatch[1];<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned =
long base;<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;regex_t =
regex;<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint8_t =
*image;<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (hlen =3D=3D 0)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;return NULL;<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret =3D regcomp(&amp;regex, =
"flen=3D[[:alnum:]]+ proglen=3D[[:digit:]]+ "<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"pass=3D[[:digit:]]+ =
image=3D[[:xdigit:]]+", REG_EXTENDED);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;assert(ret =3D=3D 0);<br =
class=3D"">-<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ptr =3D =
haystack;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;memset(pmatch, 0, =
sizeof(pmatch));<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;while (1) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;ret =3D regexec(&amp;regex, ptr, 1, pmatch, 0);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;if (ret =3D=3D 0) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ptr +=3D =
pmatch[0].rm_eo;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;off +=3D =
pmatch[0].rm_eo;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;assert(off =
&lt; hlen);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;} else<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">-<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ptr =3D haystack + off =
- (pmatch[0].rm_eo - pmatch[0].rm_so);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret =3D sscanf(ptr, "flen=3D%d =
proglen=3D%u pass=3D%d image=3D%lx",<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;flen, &amp;proglen, =
&amp;pass, &amp;base);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret !=3D 4) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;regfree(&amp;regex);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;return NULL;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (proglen &gt; 1000000) {<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;printf("proglen of %d too big, stopping\n", proglen);<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;return NULL;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;image =3D malloc(proglen);<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!image) {<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;printf("Out of memory\n");<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;return NULL;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;memset(image, 0, proglen);<br =
class=3D"">-<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tmp =3D =
ptr =3D haystack + off;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;while ((ptr =3D strtok(tmp, "\n")) =
!=3D NULL &amp;&amp; ulen &lt; proglen) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;tmp =3D NULL;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;if (!strstr(ptr, "JIT code"))<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;continue;<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;pptr =3D ptr;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;while ((ptr =3D strstr(pptr, ":")))<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pptr =3D ptr + =
1;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;ptr =3D pptr;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;do {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;image[ulen++] =
=3D (uint8_t) strtoul(pptr, &amp;pptr, 16);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ptr =3D=3D =
pptr) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ulen--;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ulen &gt;=3D=
 proglen)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ptr =3D =
pptr;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;} while (1);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;assert(ulen =3D=3D proglen);<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%u bytes =
emitted from JIT compiler (pass:%d, flen:%d)\n",<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;proglen, pass, flen);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%lx + &lt;x&gt;:\n", =
base);<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;regfree(&amp;regex);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*ilen =3D ulen;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return image;<br class=3D"">-}<br =
class=3D"">-<br class=3D"">-static void usage(void)<br class=3D"">-{<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("Usage: =
bpf_jit_disasm [...]\n");<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf(" =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-o =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Also display =
related opcodes (default: off).\n");<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf(" =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-O &lt;file&gt; &nbsp;&nbsp;Write =
binary image of code to file, don't disassemble to stdout.\n");<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf(" =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-f &lt;file&gt; &nbsp;&nbsp;Read =
last image dump from file or stdin (default: klog).\n");<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf(" =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Display this =
help.\n");<br class=3D"">-}<br class=3D"">-<br class=3D"">-int main(int =
argc, char **argv)<br class=3D"">-{<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int len, klen, opt, opcodes =
=3D 0;<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char *kbuff, =
*file =3D NULL;<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char =
*ofile =3D NULL;<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int =
ofd;<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ssize_t nr;<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint8_t *pos;<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint8_t *image =3D =
NULL;<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;while ((opt =3D getopt(argc, argv, =
"of:O:")) !=3D -1) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;switch (opt) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;case 'o':<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;opcodes =3D =
1;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;case 'O':<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ofile =3D =
optarg;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;case 'f':<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;file =3D =
optarg;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;default:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;usage();<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return -1;<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;}<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bfd_init();<br class=3D"">-<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kbuff =3D =
get_log_buff(file, &amp;klen);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!kbuff) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;fprintf(stderr, "Could not retrieve log buffer!\n");<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;return -1;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;image =3D get_last_jit_image(kbuff, =
klen, &amp;len);<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(!image) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;fprintf(stderr, "No JIT image found!\n");<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;goto done;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!ofile) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;get_asm_insns(image, len, opcodes);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;goto done;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">-<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ofd =3D open(ofile, O_WRONLY | =
O_CREAT | O_TRUNC, DEFFILEMODE);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ofd &lt; 0) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;fprintf(stderr, "Could not open file %s for writing: ", =
ofile);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;perror(NULL);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;goto done;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pos =3D image;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;do {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;nr =3D write(ofd, pos, len);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;if (nr &lt; 0) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fprintf(stderr, =
"Could not write data to %s: ", ofile);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;perror(NULL);<br=
 class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto done;<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;len -=3D nr;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;pos +=3D nr;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} while (len);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;close(ofd);<br class=3D"">-<br =
class=3D"">-done:<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;put_log_buff(kbuff);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;free(image);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 0;<br class=3D"">-}<br =
class=3D"">--<br =
class=3D"">2.27.0</blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_808270E9-39BE-41A5-A04F-4122953F24D8--
