Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B654CBE5F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 14:02:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8WN53CNyz3cdB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 00:01:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iQ8Fcqbp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8WMS48Bhz3bww
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Mar 2022 00:01:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iQ8Fcqbp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K8WMS1Rdcz4xPv;
 Fri,  4 Mar 2022 00:01:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646312484;
 bh=IiKxZmWbKsm/uHUC6bsx3ktSGA5E9rP7o9mL1M6iiik=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iQ8FcqbpLTxHJ6DYYFhgIxqhAW0CgYML/QjmCQ15yaDmm+hg7LSc2qZA4fhPK9PW4
 0vFzPeFFLYQNelOqabm0SmE6pY6bCQApliWputhyJMa5DJlcW9EZv2rhAm5yRtMdxb
 LOvo+CBulN4oO40dwX6TmIYXVRwfV7KflTYlwcmXTOOcaiAWeKR+bAvK9MG2q8RV0N
 dZZSEyI+8wKC46slxYFQl05Tw3fZ7hgZxChYPdqASy7sJjY+qjqMuxBYvVvC4gxPJr
 HzkKhMVuLKhRn+xyTViF7rQR0sn1jmHqS/d0ExFdjPYGcfr9QkacNo4c65/8Z4Cmkm
 CKoi4836zjP2g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/security: Provide stubs for when
 PPC_BARRIER_NOSPEC isn't enabled
In-Reply-To: <a6751b0c-23ad-0f22-218a-cc808ad1e92c@csgroup.eu>
References: <20220110100745.711970-1-naveen.n.rao@linux.vnet.ibm.com>
 <a6751b0c-23ad-0f22-218a-cc808ad1e92c@csgroup.eu>
Date: Fri, 04 Mar 2022 00:01:19 +1100
Message-ID: <87h78fnqao.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "lkp@intel.com" <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 10/01/2022 =C3=A0 11:07, Naveen N. Rao a =C3=A9crit=C2=A0:
>> kernel test robot reported the below build error with a randconfig:
>>    powerpc64-linux-ld: arch/powerpc/net/bpf_jit_comp64.o:(.toc+0x0):
>>    undefined reference to `powerpc_security_features'
>>=20
>> This can happen if CONFIG_PPC_BARRIER_NOSPEC is not enabled. Address
>> this by providing stub functions for security_ftr_enabled() and related
>> helpers when the config option is not enabled.
>
> Looks like this can happen only when E500 is not selected.
>
> But what kind of CPU do we have if it's not a E500 ?
>
> AFAICS in cputable.c, if not a PPC32 and not a BOOK3S_64 is must be a=20
> E500 otherwise there's just no CPU.

That's left over from when we still had support for "A2", the IBM Book3E
CPU that never shipped publicly.

See when it was removed in:
  fb5a515704d7 ("powerpc: Remove platforms/wsp and associated pieces")

> Should we make Kconfig stricter instead to avoid the Robot selecting a=20
> crazy config ?

Yeah.

We have a bit of maze of symbols related to all that eg, PPC_BOOK3E_64,
PPC_BOOK3E, PPC_FSL_BOOK3E, FSL_BOOKE, E500.

Some of them are clearly required, but I think some could be
rationalised, now that 64-bit Book3E implies FSL Book3E. But that will
be a bunch of work I suspect.

For this immediate problem, I think the patch below might be sufficient.
It just ensures that PPC_FSL_BOOK3E is always enabled when we're
building 64-bit Book3E.

I'll run it through some build tests.

cheers


diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platform=
s/Kconfig.cputype
index 87bc1929ee5a..e2e1fec91c6e 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -107,6 +107,7 @@ config PPC_BOOK3S_64
=20
 config PPC_BOOK3E_64
 	bool "Embedded processors"
+	select PPC_FSL_BOOK3E
 	select PPC_FPU # Make it a choice ?
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
@@ -295,7 +296,7 @@ config FSL_BOOKE
 config PPC_FSL_BOOK3E
 	bool
 	select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
-	select FSL_EMB_PERFMON
+	imply FSL_EMB_PERFMON
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
 	select PPC_KUEP


