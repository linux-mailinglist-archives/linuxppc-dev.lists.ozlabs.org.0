Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F694875F1F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 09:09:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BC6wF7/K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trf32624bz3dwG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 19:09:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BC6wF7/K;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Trf2F5sF2z3cGY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 19:08:53 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Trf2F5Jvcz4wcT; Fri,  8 Mar 2024 19:08:53 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709885333;
	bh=YrGQd3s9byg31P8HSHYZhQh4xPfJV7b0sz0oQ776QnQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BC6wF7/KxlJ7OFDUPtKowDWlr5MsgwTJisZwgtGYAUW9s7BL/NCOtEvolas30IftE
	 o4/lkZW1E5Z7CeVsdTCJfkbCiSlzQorpLNDGoICeYFzGE8Gpvj2HRhwberiPTpyWRG
	 FlXLv8o6//RDGv27lGO1MpTMwJBJ4zhDBa722Jx9JaWqgEl49By2Pnm1F5Qm0BwPPj
	 UqkjuuK16C8df9l37NYLcEZ6D3Gd/0txcSvdQtfWJj6vQJd5UUlmk1YnqVQj6UvYyc
	 6VbJ4XOnEExyD4I3+OPE7L4eUQVwoIlQbYBLRJsoKuMD2PeSLyFGS4C8HGDqIDaz6i
	 Z8mWFSAeQNdEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Trf2F4Tc5z4wc5;
	Fri,  8 Mar 2024 19:08:53 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, Mahesh Salgaonkar
 <mahesh@linux.ibm.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v4] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
In-Reply-To: <8d973907-8e86-4b9f-8995-cf3a8621f6b6@linux.ibm.com>
References: <20240214095146.1527369-1-mahesh@linux.ibm.com>
 <87edcmnu7o.fsf@mail.lhotse>
 <8d973907-8e86-4b9f-8995-cf3a8621f6b6@linux.ibm.com>
Date: Fri, 08 Mar 2024 19:08:50 +1100
Message-ID: <874jdhno19.fsf@mail.lhotse>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K V <aneesh.kumar@linux.ibm.com> writes:
> On 3/7/24 5:13 PM, Michael Ellerman wrote:
>> Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
>>> nmi_enter()/nmi_exit() touches per cpu variables which can lead to kern=
el
>>> crash when invoked during real mode interrupt handling (e.g. early HMI/=
MCE
>>> interrupt handler) if percpu allocation comes from vmalloc area.
>>>
>>> Early HMI/MCE handlers are called through DEFINE_INTERRUPT_HANDLER_NMI()
>>> wrapper which invokes nmi_enter/nmi_exit calls. We don't see any issue =
when
>>> percpu allocation is from the embedded first chunk. However with
>>> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there are chances where pe=
rcpu
>>> allocation can come from the vmalloc area.
>>>
>>> With kernel command line "percpu_alloc=3Dpage" we can force percpu allo=
cation
>>> to come from vmalloc area and can see kernel crash in machine_check_ear=
ly:
>>>
>>> [    1.215714] NIP [c000000000e49eb4] rcu_nmi_enter+0x24/0x110
>>> [    1.215717] LR [c0000000000461a0] machine_check_early+0xf0/0x2c0
>>> [    1.215719] --- interrupt: 200
>>> [    1.215720] [c000000fffd73180] [0000000000000000] 0x0 (unreliable)
>>> [    1.215722] [c000000fffd731b0] [0000000000000000] 0x0
>>> [    1.215724] [c000000fffd73210] [c000000000008364] machine_check_earl=
y_common+0x134/0x1f8
>>>
>>> Fix this by avoiding use of nmi_enter()/nmi_exit() in real mode if perc=
pu
>>> first chunk is not embedded.
>>=20
>> My system (powernv) doesn't even boot with percpu_alloc=3Dpage.
>
>
> Can you share the crash details?

Yes but it's not pretty :)

  [    1.725257][  T714] systemd-journald[714]: Collecting audit messages i=
s disabled.
  [    1.729401][    T1] systemd[1]: Finished systemd-tmpfiles-setup-dev.se=
rvice - Create Static Device Nodes in /dev.
  [^[[0;32m  OK  ^[[0m] Finished ^[[0;1;39msystemd-tmpfiles-=E2=80=A6reate =
Static Device Nodes in /dev.
  [    1.773902][   C22] Disabling lock debugging due to kernel taint
  [    1.773905][   C23] Oops: Machine check, sig: 7 [#1]
  [    1.773911][   C23] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 =
NUMA PowerNV
  [    1.773916][   C23] Modules linked in:
  [    1.773920][   C23] CPU: 23 PID: 0 Comm: swapper/23 Tainted: G   M    =
           6.8.0-rc7-02500-g23515c370cbb #1
  [    1.773924][   C23] Hardware name: 8335-GTH POWER9 0x4e1202 opal:skibo=
ot-v6.5.3-35-g1851b2a06 PowerNV
  [    1.773926][   C23] NIP:  0000000000000000 LR: 0000000000000000 CTR: 0=
000000000000000
  [    1.773929][   C23] REGS: c000000fffa6ef50 TRAP: 0000   Tainted: G   M=
                (6.8.0-rc7-02500-g23515c370cbb)
  [    1.773932][   C23] MSR:  0000000000000000 <>  CR: 00000000  XER: 0000=
0000
  [    1.773937][   C23] CFAR: 0000000000000000 IRQMASK: 3=20
  [    1.773937][   C23] GPR00: 0000000000000000 c000000fffa6efe0 c000000ff=
fa6efb0 0000000000000000=20
  [    1.773937][   C23] GPR04: c00000000003d8c0 c000000001f5f000 000000000=
0000000 0000000000000103=20
  [    1.773937][   C23] GPR08: 0000000000000003 653a0d962a590300 000000000=
0000000 0000000000000000=20
  [    1.773937][   C23] GPR12: c000000fffa6f280 0000000000000000 c00000000=
00084a4 0000000000000000=20
  [    1.773937][   C23] GPR16: 0000000053474552 0000000000000000 c00000000=
003d8c0 c000000fffa6f280=20
  [    1.773937][   C23] GPR20: c000000001f5f000 c000000fffa6f340 c000000ff=
fa6f2e8 0000000000000000=20
  [    1.773937][   C23] GPR24: 0007fffffecf0000 c0000000065bbb80 000000000=
0550102 c000000002172b20=20
  [    1.773937][   C23] GPR28: 0000000000000000 0000000053474552 000000000=
0000000 c000000ffffc6d80=20
  [    1.773982][   C23] NIP [0000000000000000] 0x0
  [    1.773988][   C23] LR [0000000000000000] 0x0
  [    1.773990][   C23] Call Trace:
  [    1.773991][   C23] [c000000fffa6efe0] [c000000001f5f000] .TOC.+0x0/0x=
a1000 (unreliable)
  [    1.773999][   C23] Code: XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX=
 XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XX=
XXXXXX XXXXXXXX XXXXXXXX=20
  [    1.774021][   C23] ---[ end trace 0000000000000000 ]---

Something has gone badly wrong.

That was a test kernel with some other commits, but nothing that should
cause that. Removing percpu_alloc=3Dpage fix it.

It's based on fddff98e83b4b4d54470902ea0d520c4d423ca3b.

>> AFAIK the only reason we added support for it was to handle 4K kernels
>> with HPT. See commit eb553f16973a ("powerpc/64/mm: implement page
>> mapping percpu first chunk allocator").
>>=20
>> So I wonder if we should change the Kconfig to only offer it as an
>> option in that case, and change the logic in setup_per_cpu_areas() to
>> only use it as a last resort.
>>=20
>> I guess we probably still need this commit though, even if just for 4K H=
PT.
>>=20
>>
> We have also observed some error when we have large gap between the start=
 memory of
> NUMA nodes. That made the percpu offset really large causing boot failure=
s even on 64K.

Yeah, I have vague memories of that :)

cheers
