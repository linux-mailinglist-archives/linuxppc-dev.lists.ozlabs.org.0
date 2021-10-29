Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E008C43F4A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 03:51:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgQQM67lZz3c7q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 12:51:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=k7nE+Vbr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgQPg4s3Fz2xrm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 12:51:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=k7nE+Vbr; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HgQPd6QCNz4xYy;
 Fri, 29 Oct 2021 12:51:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635472263;
 bh=wmANmsRuASHCQHaz7QWRHhQxlaXvm3wDVWXitsA8xxU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=k7nE+Vbr2pEF9UfeAQQyh6z/iW03s/mt4EHnKSFFZz+hBUwgB7/+sPbL+UUzYvwXL
 4CYAcfWnYSocPoFgg9P7z6JzggGChqSkAQPC+K32pOqPYoWhLSTFkPL6GjnSr+mnfz
 mS5crCCfBHTU6SJu4PYXO/lfxwq3ULO/dkgV2gF8VtVR4fDzIGx/FDwuGiiabyOHDn
 B9RQREbhSyeeLdZQpfW39tNzqBTpCztnGXaF4WqOoWB/opPbpsZOOuCRRLxgkEKwqZ
 SmNj9iAB1JPPl0zZxl3KqEOVE+9Hz/gyuerIyCTYFzMrPWwEyXdHF3mGoz82LyadCD
 EFatR9mT4aA1A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Borkmann <daniel@iogearbox.net>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, ast@kernel.org, christophe.leroy@csgroup.eu,
 Hari Bathini <hbathini@linux.ibm.com>, jniethe5@gmail.com
Subject: Re: [PATCH] powerpc/bpf: fix write protecting JIT code
In-Reply-To: <c8d7390b-c07c-75cd-e9e9-4b8f0b786cc6@iogearbox.net>
References: <20211025055649.114728-1-hbathini@linux.ibm.com>
 <1635142354.46h6w5c2rx.naveen@linux.ibm.com>
 <c8d7390b-c07c-75cd-e9e9-4b8f0b786cc6@iogearbox.net>
Date: Fri, 29 Oct 2021 12:50:57 +1100
Message-ID: <87zgqs8upq.fsf@mpe.ellerman.id.au>
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
Cc: songliubraving@fb.com, netdev@vger.kernel.org, john.fastabend@gmail.com,
 kpsingh@kernel.org, stable@vger.kernel.org, andrii@kernel.org,
 paulus@samba.org, yhs@fb.com, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kafai@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Borkmann <daniel@iogearbox.net> writes:
> On 10/25/21 8:15 AM, Naveen N. Rao wrote:
>> Hari Bathini wrote:
>>> Running program with bpf-to-bpf function calls results in data access
>>> exception (0x300) with the below call trace:
>>>
>>> =C2=A0=C2=A0=C2=A0 [c000000000113f28] bpf_int_jit_compile+0x238/0x750 (=
unreliable)
>>> =C2=A0=C2=A0=C2=A0 [c00000000037d2f8] bpf_check+0x2008/0x2710
>>> =C2=A0=C2=A0=C2=A0 [c000000000360050] bpf_prog_load+0xb00/0x13a0
>>> =C2=A0=C2=A0=C2=A0 [c000000000361d94] __sys_bpf+0x6f4/0x27c0
>>> =C2=A0=C2=A0=C2=A0 [c000000000363f0c] sys_bpf+0x2c/0x40
>>> =C2=A0=C2=A0=C2=A0 [c000000000032434] system_call_exception+0x164/0x330
>>> =C2=A0=C2=A0=C2=A0 [c00000000000c1e8] system_call_vectored_common+0xe8/=
0x278
>>>
>>> as bpf_int_jit_compile() tries writing to write protected JIT code
>>> location during the extra pass.
>>>
>>> Fix it by holding off write protection of JIT code until the extra
>>> pass, where branch target addresses fixup happens.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 62e3d4210ac9 ("powerpc/bpf: Write protect JIT code")
>>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>>> ---
>>> =C2=A0arch/powerpc/net/bpf_jit_comp.c | 2 +-
>>> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> Thanks for the fix!
>>=20
>> Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>
> LGTM, I presume this fix will be routed via Michael.

Thanks for reviewing, I've picked it up.

> BPF selftests have plenty of BPF-to-BPF calls in there, too bad this was
> caught so late. :/

Yeah :/

STRICT_KERNEL_RWX is not on by default in all our defconfigs, so that's
probably why no one caught it.

I used to run the BPF selftests but they stopped building for me a while
back, I'll see if I can get them going again.

cheers
