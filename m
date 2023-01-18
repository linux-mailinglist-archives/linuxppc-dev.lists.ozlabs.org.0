Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B32672549
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 18:43:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxtQs5sTpz3fBp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 04:43:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W4GyWlsm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W4GyWlsm;
	dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxtPW291Mz3fDT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 04:42:22 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id ud5so85118105ejc.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 09:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpEuzue5d7ygPxB29FruCUnMnsWzWZ3lXy2MX+rDytc=;
        b=W4GyWlsm8ALFRSIsMwvrTySOOS9hTBdV1OpvndBADGEMCQmWskkBoGTZ10dO14lWCf
         9s1n4M/XC9OkFc3nvfoiyyKAMYrMlPJ0ppYyY+z8s2eN1loLgOBwv4z6v+2FLlrF90bv
         6ZQb0cEa3IV6p0ZdEwQIujwy2ozbVyqJAY7e6Yk5uyW9Llgr7+WvB5XW3wcqIg/dx2yT
         17z5d97RmSdOjf5TThzOxk0Us4hQ4yEz6sdImR7U3ItWvIdR8t6+FSY2EQHJLxcM+eqW
         5J2agrByKnKRNQN3SrcInPeeW4duGeXWPdMGDvkLB3GJ62GM7FerjTYlFLjh3dYLIy/B
         FVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpEuzue5d7ygPxB29FruCUnMnsWzWZ3lXy2MX+rDytc=;
        b=tA8ZWkNXnvnpWYAAevpxz/SZC+MzqeLSYo3FKv9Csj062ODLVmztTu1GnVXwyh5Pwa
         z0eo7wYmaIVpat7w9tne0oeSTvjPQX8Gn3hRsxRqFBpILomxFwai1w3DG3eC3jIvb4IK
         qwetvOjqWGVeVTO06EaQppjjl3B3v6PSekQnEdk6HdBYti+eNcTtjcHW9ZfzpZ5GoW4N
         077+6bbXIfQMGVdhrzBqr5LL4m1q30dpDnbz9LRhHjxSod4/jbimBb78PobSQc7Qcer3
         farq83ehJEyVbNLBe5tgGblKSAI683GLdR0JqzXucD8tp2mnG7a/QR4PVpK9jtC/rre4
         AwRQ==
X-Gm-Message-State: AFqh2kq3k7XsL/44lB7k9AAswU0YHJRy6irDvrU8fvdlVK5TddUWhlys
	L4P/OMzK5AJCbaTX4ADMYUPPEpvvgMf8i2h5lJU=
X-Google-Smtp-Source: AMrXdXuMaX0n1Hxu6XGSukmrVfG28F8T8Ib+RkX+SQ8+JvzXGjjDRpkDNnyAZVdVPrYouEW9ECCsgOvI5WFVc49eZlI=
X-Received: by 2002:a17:906:40d7:b0:836:e897:648a with SMTP id
 a23-20020a17090640d700b00836e897648amr470430ejk.94.1674063739084; Wed, 18 Jan
 2023 09:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20230105030614.26842-1-tong@infragraf.org> <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
 <71c83f39-f85f-d990-95b7-ab6068839e6c@iogearbox.net> <5836b464-290e-203f-00f2-fc6632c9f570@csgroup.eu>
 <147A796D-12C0-482F-B48A-16E67120622B@infragraf.org> <0b46b813-05f2-5083-9f2e-82d72970dae2@csgroup.eu>
 <4380D454-3ED0-43F4-9A79-102BB0E3577A@infragraf.org> <d91bbb9e-484b-d43d-e62d-0474ff21cf91@iogearbox.net>
 <7159E8F8-AE66-4563-8A29-D10D66EFAF3D@infragraf.org> <CAADnVQLf_UhRP76i9+OaLGrmuoM942QebMXT3OA3mgrP_UV0KA@mail.gmail.com>
 <d807b7fb-dbd2-8e4c-812c-48a1a01c190e@csgroup.eu>
In-Reply-To: <d807b7fb-dbd2-8e4c-812c-48a1a01c190e@csgroup.eu>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 18 Jan 2023 09:42:07 -0800
Message-ID: <CAADnVQKAAhbL-9qGPfRFsfw3oh6KnrEpeYLnfhrKUSzX8VmFuQ@mail.gmail.com>
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hou Tao <houtao1@huawei.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Tonghao Zhang <tong@infragraf.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, Yonghong Song <yhs@fb.com>, "linux-arm-kernel@lists.infradead.or" <linux-arm-kernel@lists.infradead.or>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, KP Singh <kpsingh@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Hao Luo <haoluo@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, "bpf@vger.kernel.org" <bpf@vger.k
 ernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 11:36 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 18/01/2023 =C3=A0 03:21, Alexei Starovoitov a =C3=A9crit :
> > On Tue, Jan 17, 2023 at 6:13 PM Tonghao Zhang <tong@infragraf.org> wrot=
e:
> >>
> >>
> >>
> >>> On Jan 17, 2023, at 11:59 PM, Daniel Borkmann <daniel@iogearbox.net> =
wrote:
> >>>
> >>> On 1/17/23 3:22 PM, Tonghao Zhang wrote:
> >>>>> On Jan 17, 2023, at 3:30 PM, Christophe Leroy <christophe.leroy@csg=
roup.eu> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> Le 17/01/2023 =C3=A0 06:30, Tonghao Zhang a =C3=A9crit :
> >>>>>>
> >>>>>>
> >>>>>>> On Jan 9, 2023, at 4:15 PM, Christophe Leroy <christophe.leroy@cs=
group.eu> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> Le 06/01/2023 =C3=A0 16:37, Daniel Borkmann a =C3=A9crit :
> >>>>>>>> On 1/5/23 6:53 PM, Christophe Leroy wrote:
> >>>>>>>>> Le 05/01/2023 =C3=A0 04:06, tong@infragraf.org a =C3=A9crit :
> >>>>>>>>>> From: Tonghao Zhang <tong@infragraf.org>
> >>>>>>>>>>
> >>>>>>>>>> The x86_64 can't dump the valid insn in this way. A test BPF p=
rog
> >>>>>>>>>> which include subprog:
> >>>>>>>>>>
> >>>>>>>>>> $ llvm-objdump -d subprog.o
> >>>>>>>>>> Disassembly of section .text:
> >>>>>>>>>> 0000000000000000 <subprog>:
> >>>>>>>>>>           0:       18 01 00 00 73 75 62 70 00 00 00 00 72 6f 6=
7 00 r1
> >>>>>>>>>> =3D 29114459903653235 ll
> >>>>>>>>>>           2:       7b 1a f8 ff 00 00 00 00 *(u64 *)(r10 - 8) =
=3D r1
> >>>>>>>>>>           3:       bf a1 00 00 00 00 00 00 r1 =3D r10
> >>>>>>>>>>           4:       07 01 00 00 f8 ff ff ff r1 +=3D -8
> >>>>>>>>>>           5:       b7 02 00 00 08 00 00 00 r2 =3D 8
> >>>>>>>>>>           6:       85 00 00 00 06 00 00 00 call 6
> >>>>>>>>>>           7:       95 00 00 00 00 00 00 00 exit
> >>>>>>>>>> Disassembly of section raw_tp/sys_enter:
> >>>>>>>>>> 0000000000000000 <entry>:
> >>>>>>>>>>           0:       85 10 00 00 ff ff ff ff call -1
> >>>>>>>>>>           1:       b7 00 00 00 00 00 00 00 r0 =3D 0
> >>>>>>>>>>           2:       95 00 00 00 00 00 00 00 exit
> >>>>>>>>>>
> >>>>>>>>>> kernel print message:
> >>>>>>>>>> [  580.775387] flen=3D8 proglen=3D51 pass=3D3 image=3Dffffffff=
a000c20c
> >>>>>>>>>> from=3Dkprobe-load pid=3D1643
> >>>>>>>>>> [  580.777236] JIT code: 00000000: cc cc cc cc cc cc cc cc cc =
cc cc
> >>>>>>>>>> cc cc cc cc cc
> >>>>>>>>>> [  580.779037] JIT code: 00000010: cc cc cc cc cc cc cc cc cc =
cc cc
> >>>>>>>>>> cc cc cc cc cc
> >>>>>>>>>> [  580.780767] JIT code: 00000020: cc cc cc cc cc cc cc cc cc =
cc cc
> >>>>>>>>>> cc cc cc cc cc
> >>>>>>>>>> [  580.782568] JIT code: 00000030: cc cc cc
> >>>>>>>>>>
> >>>>>>>>>> $ bpf_jit_disasm
> >>>>>>>>>> 51 bytes emitted from JIT compiler (pass:3, flen:8)
> >>>>>>>>>> ffffffffa000c20c + <x>:
> >>>>>>>>>>       0:   int3
> >>>>>>>>>>       1:   int3
> >>>>>>>>>>       2:   int3
> >>>>>>>>>>       3:   int3
> >>>>>>>>>>       4:   int3
> >>>>>>>>>>       5:   int3
> >>>>>>>>>>       ...
> >>>>>>>>>>
> >>>>>>>>>> Until bpf_jit_binary_pack_finalize is invoked, we copy rw_head=
er to
> >>>>>>>>>> header
> >>>>>>>>>> and then image/insn is valid. BTW, we can use the "bpftool pro=
g dump"
> >>>>>>>>>> JITed instructions.
> >>>>>>>>>
> >>>>>>>>> NACK.
> >>>>>>>>>
> >>>>>>>>> Because the feature is buggy on x86_64, you remove it for all
> >>>>>>>>> architectures ?
> >>>>>>>>>
> >>>>>>>>> On powerpc bpf_jit_enable =3D=3D 2 works and is very usefull.
> >>>>>>>>>
> >>>>>>>>> Last time I tried to use bpftool on powerpc/32 it didn't work. =
I don't
> >>>>>>>>> remember the details, I think it was an issue with endianess. M=
aybe it
> >>>>>>>>> is fixed now, but it needs to be verified.
> >>>>>>>>>
> >>>>>>>>> So please, before removing a working and usefull feature, make =
sure
> >>>>>>>>> there is an alternative available to it for all architectures i=
n all
> >>>>>>>>> configurations.
> >>>>>>>>>
> >>>>>>>>> Also, I don't think bpftool is usable to dump kernel BPF selfte=
sts.
> >>>>>>>>> That's vital when a selftest fails if you want to have a chance=
 to
> >>>>>>>>> understand why it fails.
> >>>>>>>>
> >>>>>>>> If this is actively used by JIT developers and considered useful=
, I'd be
> >>>>>>>> ok to leave it for the time being. Overall goal is to reach feat=
ure parity
> >>>>>>>> among (at least major arch) JITs and not just have most function=
ality only
> >>>>>>>> available on x86-64 JIT. Could you however check what is not wor=
king with
> >>>>>>>> bpftool on powerpc/32? Perhaps it's not too much effort to just =
fix it,
> >>>>>>>> but details would be useful otherwise 'it didn't work' is too fu=
zzy.
> >>>>>>>
> >>>>>>> Sure I will try to test bpftool again in the coming days.
> >>>>>>>
> >>>>>>> Previous discussion about that subject is here:
> >>>>>>> https://patchwork.kernel.org/project/linux-riscv/patch/2021041509=
3250.3391257-1-Jianlin.Lv@arm.com/#24176847=3D
> >>>>>> Hi Christophe
> >>>>>> Any progress? We discuss to deprecate the bpf_jit_enable =3D=3D 2 =
in 2021, but bpftool can not run on powerpc.
> >>>>>> Now can we fix this issue?
> >>>>>
> >>>>> Hi Tong,
> >>>>>
> >>>>> I have started to look at it but I don't have any fruitfull feedbac=
k yet.
> >>>>>
> >>>>> In the meantime, were you able to confirm that bpftool can also be =
used
> >>>>> to dump jitted tests from test_bpf.ko module on x86_64 ? In that ca=
n you
> >>>>> tell me how to proceed ?
> >>>> Now I do not test, but we can dump the insn after bpf_prog_select_ru=
ntime in test_bpf.ko. bpf_map_get_info_by_fd can copy the insn to userspace=
, but we can
> >>>> dump them in test_bpf.ko in the same way.
> >>>
> >>> Issue is that these progs are not consumable from userspace (and ther=
efore not bpftool).
> >>> it's just simple bpf_prog_alloc + copy of test insns + bpf_prog_selec=
t_runtime() to test
> >>> JITs (see generate_filter()). Some of them could be converted over to=
 test_verifier, but
> >>> not all might actually pass verifier, iirc. Don't think it's a good i=
dea to allow exposing
> >>> them via fd tbh.
> >> Hi
> >> I mean that, can we invoke the bpf_jit_dump in test_bpf.ko directly ?.=
 bpf_prog_get_info_by_fd copy the insn to userspace, but we only dump insn =
in test_bpf.ko
> >>
> >>                  if (bpf_dump_raw_ok(file->f_cred)) {// code copied fr=
om bpf_prog_get_info_by_fd, not tested
> >>
> >>                          /* for multi-function programs, copy the JITe=
d
> >>                           * instructions for all the functions
> >>                           */
> >>                          if (prog->aux->func_cnt) {
> >>                                  for (i =3D 0; i < prog->aux->func_cnt=
; i++) {
> >>                                          len =3D prog->aux->func[i]->j=
ited_len;
> >>                                          img =3D (u8 *) prog->aux->fun=
c[i]->bpf_func;
> >>                                          bpf_jit_dump(1, len, 1, img);
> >>                                  }
> >>                          } else {
> >>                                  bpf_jit_dump(1, ulen, 1, prog->bpf_fu=
nc);
> >>                          }
> >>                  }
> >
> > Let's not reinvent the wheel.
> > bpftool prog dump jited
> > is our supported command.
> > ppc issue with bpftool is related to endianness of embedded skeleton.
> > which means that none of the bpftool prog commands work on ppc.
> > It's a bigger issue to address with cross compilation of bpftool.
> >
> > bpftool supports gnu and llvm disassembler. It retrieves and
> > prints BTF, line info and source code along with asm.
> > The user experience is at different level comparing to bpf_jit_dump.
>
> Hi Alexei,
>
> Fair enough, we are going to try and fix bpftool.
>
> But for test_bpf.ko module, how do you use bpftool to dump the BPF tests
> ? Even on x86 I have not been able to use bpftool for that until now.
> Can you tell me how you do ?

test_bpf.ko is useful to JIT developers when they're starting
to work on it, but its test coverage is inadequate for real
world bpf usage comparing to selftests/bpf.
Johan Almbladh did some great additions to test_bpf.ko back in 2021.
Since then there wasn't much.

Here it's important to distinguish the target user.
Is it a kernel JIT developer or user space bpf prog developer?
When it's a kernel developer they can easily
add print_hex_dump() in the right places.
That's what I did when I was developing bpf trampoline.
bpf is more than just JIT. There are trampoline, kfuncs, dispatch.
The kernel devs should not add a debug code.
Long ago bpf_jit_enable=3D2 was useful to user space bpf developers.
They wanted to see how JITed code look like to optimize it and what not.
Now 'perf record' captures bpf asm and annotates it in 'perf report',
so performance analysis problem is solved that way.
bpftool prog dump jit addressed the needs of users and admins who
want to understand what bpf progs are loaded and what are they doing.
Both 'dump jited' and 'dump xlated' are useful for this case.
So bpf_jit_enable=3D2 remained useful to kernel developers only and
in that sense it become a kernel debug feature for a narrow set of
JIT developers. On x86 bpf_jit_dump() was neglected and broken.
I suspect the other archs will follow the same fate. If not already.
Having a sysctl for kernel developers is not something the kernel
developers should have around. Hence the cleanup of this patch.
