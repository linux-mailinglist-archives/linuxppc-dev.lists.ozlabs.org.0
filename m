Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C43365CBB2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 02:56:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nmt4p1lRSz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 12:56:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infragraf.org (client-ip=43.154.221.58; helo=bg4.exmail.qq.com; envelope-from=xxmy@infragraf.org; receiver=<UNKNOWN>)
X-Greylist: delayed 44602 seconds by postgrey-1.36 at boromir; Wed, 04 Jan 2023 12:56:11 AEDT
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nmt4C1pMXz2yJT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 12:56:07 +1100 (AEDT)
X-QQ-mid: bizesmtp80t1672797303tpxq3we0
Received: from [172.24.140.10] ( [1.202.165.115])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Jan 2023 09:55:00 +0800 (CST)
X-QQ-SSF: 00000000000000205000000A0000000
X-QQ-FEAT: kExHUVduNfMHXYoAZ0KwordvHWIS8zW8ykQ1uHIaKwO6NGGijqcCUgQN0DrdQ
	l8d/bG7BCFKtphlIojBeiwGMriuC3L+o+8cMGXf7oSaSi9vuHMrHJjCBF0hBq/FJQRxWDO7
	HPdNNhSEh/EppxubL8H4SFiXL4kjZ/WBQ3SHKVxxGZmvK9xJaCBFJliBVxgkSQQayaO0yuH
	u346JiXohp9+dgzg5ynFlCkulLL0ezmGcpQfhr567evjLy/hXC3EMFPnQAGf08yW7d/4b5o
	5/zC7wd2TYz/OnP+FG4HNzT/cJAlH5mb1Hl6oLoL6hp32FZEfBmGcpg2ENpAyAl0uZRQn7C
	H6mZqfp46KYrBNxj2Dam/vcpx/qEnLNo/s5TFR6
X-QQ-GoodBg: 0
User-Agent: Microsoft-MacOutlook/16.66.22102801
Date: Wed, 04 Jan 2023 09:54:59 +0800
Subject: Re: [bpf-next v1] bpf: drop deprecated bpf_jit_enable == 2
From: Tonghao Zhang <xxmy@infragraf.org>
To: Daniel Borkmann <daniel@iogearbox.net>,
	<bpf@vger.kernel.org>,
	<netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.or>,
	<loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>,
	<sparclinux@vger.kernel.org>
Message-ID: <95D9D9F97BCE5963+4FF780FB-E30D-44F1-A7B4-BB40E96E4515@infragraf.org>
Thread-Topic: [bpf-next v1] bpf: drop deprecated bpf_jit_enable == 2
References: <20230103132454.94242-1-xxmy@infragraf.org>
 <cf475fe0-9961-d768-fae3-04f640855dab@iogearbox.net>
In-Reply-To: <cf475fe0-9961-d768-fae3-04f640855dab@iogearbox.net>
Mime-version: 1.0
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:infragraf.org:qybglogicsvr:qybglogicsvr6
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
Cc: Hao Luo <haoluo@google.com>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>, Hou Tao <houtao1@huawei.com>, KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



=EF=BB=BF=E5=9C=A8 2023/1/3 =E4=B8=8B=E5=8D=8811:42=EF=BC=8C=E2=80=9CDaniel Borkmann=E2=80=9D<daniel@iogearbox.net> =E5=
=86=99=E5=85=A5:

    On 1/3/23 2:24 PM, xxmy@infragraf.org wrote:
    > From: Tonghao Zhang <xxmy@infragraf.org>
    >=20
    > The x86_64 can't dump the valid insn in this way. A test BPF prog
    > which include subprog:
    >=20
    > $ llvm-objdump -d subprog.o
    > Disassembly of section .text:
    > 0000000000000000 <subprog>:
    >         0:	18 01 00 00 73 75 62 70 00 00 00 00 72 6f 67 00	r1 =3D 29114=
459903653235 ll
    >         2:	7b 1a f8 ff 00 00 00 00	*(u64 *)(r10 - 8) =3D r1
    >         3:	bf a1 00 00 00 00 00 00	r1 =3D r10
    >         4:	07 01 00 00 f8 ff ff ff	r1 +=3D -8
    >         5:	b7 02 00 00 08 00 00 00	r2 =3D 8
    >         6:	85 00 00 00 06 00 00 00	call 6
    >         7:	95 00 00 00 00 00 00 00	exit
    > Disassembly of section raw_tp/sys_enter:
    > 0000000000000000 <entry>:
    >         0:	85 10 00 00 ff ff ff ff	call -1
    >         1:	b7 00 00 00 00 00 00 00	r0 =3D 0
    >         2:	95 00 00 00 00 00 00 00	exit
    >=20
    > kernel print message:
    > [  580.775387] flen=3D8 proglen=3D51 pass=3D3 image=3Dffffffffa000c20c from=3Dk=
probe-load pid=3D1643
    > [  580.777236] JIT code: 00000000: cc cc cc cc cc cc cc cc cc cc cc c=
c cc cc cc cc
    > [  580.779037] JIT code: 00000010: cc cc cc cc cc cc cc cc cc cc cc c=
c cc cc cc cc
    > [  580.780767] JIT code: 00000020: cc cc cc cc cc cc cc cc cc cc cc c=
c cc cc cc cc
    > [  580.782568] JIT code: 00000030: cc cc cc
    >=20
    > $ bpf_jit_disasm
    > 51 bytes emitted from JIT compiler (pass:3, flen:8)
    > ffffffffa000c20c + <x>:
    >     0:	int3
    >     1:	int3
    >     2:	int3
    >     3:	int3
    >     4:	int3
    >     5:	int3
    >     ...
    >=20
    > Until bpf_jit_binary_pack_finalize is invoked, we copy rw_header to h=
eader
    > and then image/insn is valid. BTW, we can use the "bpftool prog dump"=
 JITed instructions.
    >=20
    > * clean up the doc
    > * remove bpf_jit_disasm tool
    > * set bpf_jit_enable only 0 or 1.
    >=20
    > Signed-off-by: Tonghao Zhang <xxmy@infragraf.org>
    > Suggested-by: Alexei Starovoitov <ast@kernel.org>
    > Cc: Alexei Starovoitov <ast@kernel.org>
    > Cc: Daniel Borkmann <daniel@iogearbox.net>
    > Cc: Andrii Nakryiko <andrii@kernel.org>
    > Cc: Martin KaFai Lau <martin.lau@linux.dev>
    > Cc: Song Liu <song@kernel.org>
    > Cc: Yonghong Song <yhs@fb.com>
    > Cc: John Fastabend <john.fastabend@gmail.com>
    > Cc: KP Singh <kpsingh@kernel.org>
    > Cc: Stanislav Fomichev <sdf@google.com>
    > Cc: Hao Luo <haoluo@google.com>
    > Cc: Jiri Olsa <jolsa@kernel.org>
    > Cc: Hou Tao <houtao1@huawei.com>
    > ---
    >   Documentation/admin-guide/sysctl/net.rst |   2 +-
    >   Documentation/networking/filter.rst      |  98 +------
    >   arch/arm/net/bpf_jit_32.c                |   4 -
    >   arch/arm64/net/bpf_jit_comp.c            |   4 -
    >   arch/loongarch/net/bpf_jit.c             |   4 -
    >   arch/mips/net/bpf_jit_comp.c             |   3 -
    >   arch/powerpc/net/bpf_jit_comp.c          |  11 -
    >   arch/riscv/net/bpf_jit_core.c            |   3 -
    >   arch/s390/net/bpf_jit_comp.c             |   4 -
    >   arch/sparc/net/bpf_jit_comp_32.c         |   3 -
    >   arch/sparc/net/bpf_jit_comp_64.c         |  13 -
    >   arch/x86/net/bpf_jit_comp.c              |   3 -
    >   arch/x86/net/bpf_jit_comp32.c            |   3 -
    >   net/core/sysctl_net_core.c               |  14 +-
    >   tools/bpf/.gitignore                     |   1 -
    >   tools/bpf/Makefile                       |  10 +-
    >   tools/bpf/bpf_jit_disasm.c               | 332 --------------------=
---
    >   17 files changed, 8 insertions(+), 504 deletions(-)
    >   delete mode 100644 tools/bpf/bpf_jit_disasm.c
    >=20
    > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation=
/admin-guide/sysctl/net.rst
    > index 6394f5dc2303..45d3d965276c 100644
    > --- a/Documentation/admin-guide/sysctl/net.rst
    > +++ b/Documentation/admin-guide/sysctl/net.rst
    > @@ -87,7 +87,7 @@ Values:
    >  =20
    >   	- 0 - disable the JIT (default value)
    >   	- 1 - enable the JIT
    > -	- 2 - enable the JIT and ask the compiler to emit traces on kernel =
log.
    > +	- 2 - deprecated in linux 6.2

    I'd make it more clear in the docs and reword it as follows (also, it'l=
l be in 6.3, not 6.2):

    	- 2 - enable the JIT and ask the compiler to emit traces on kernel log=
.
    	      (deprecated since v6.3, use ``bpftool prog dump jited id <id>`` =
instead)

    >  =20
    >   bpf_jit_harden
    >   --------------
    [...]
    > diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
    > index 5b1ce656baa1..731a2eb0f68e 100644
    > --- a/net/core/sysctl_net_core.c
    > +++ b/net/core/sysctl_net_core.c
    > @@ -275,16 +275,8 @@ static int proc_dointvec_minmax_bpf_enable(struc=
t ctl_table *table, int write,
    >  =20
    >   	tmp.data =3D &jit_enable;
    >   	ret =3D proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
    > -	if (write && !ret) {
    > -		if (jit_enable < 2 ||
    > -		    (jit_enable =3D=3D 2 && bpf_dump_raw_ok(current_cred()))) {
    > -			*(int *)table->data =3D jit_enable;
    > -			if (jit_enable =3D=3D 2)
    > -				pr_warn("bpf_jit_enable =3D 2 was set! NEVER use this in productio=
n, only for JIT debugging!\n");
    > -		} else {
    > -			ret =3D -EPERM;
    > -		}
    > -	}
    > +	if (write && !ret)
    > +		*(int *)table->data =3D jit_enable;
    >  =20
    >   	if (write && ret && min =3D=3D max)
    >   		pr_info_once("CONFIG_BPF_JIT_ALWAYS_ON is enabled, bpf_jit_enable=
 is permanently set to 1.\n");
    > @@ -395,7 +387,7 @@ static struct ctl_table net_core_table[] =3D {
    >   		.extra2		=3D SYSCTL_ONE,
    >   # else
    >   		.extra1		=3D SYSCTL_ZERO,
    > -		.extra2		=3D SYSCTL_TWO,
    > +		.extra2		=3D SYSCTL_ONE,

    I'd leave it at SYSCTL_TWO to avoid breakage, just that the semantics o=
f 2 will be the same
    as 1 going forward.
Thanks Daniel, v2 will fix that.
    >   # endif
    >   	},
    >   # ifdef CONFIG_HAVE_EBPF_JIT



