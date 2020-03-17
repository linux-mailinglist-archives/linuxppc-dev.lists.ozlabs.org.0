Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1478B18837F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 13:18:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hXHz70XgzDqfN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 23:18:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hW3Z6x4qzDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 22:22:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=R3suC07y; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48hW3W3wNXzB3t3;
 Tue, 17 Mar 2020 22:22:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584444136;
 bh=7m6xTV6ORC9fimP591QotV0DExi6ArwAslaYAD6a8gE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=R3suC07yLLownGnMiQtBzYlWQBjC2Y2Mr1fjgaMhi7I03Tw6ufjZw4WoaZXiqoW7X
 9w7zSb2LsfkCq8qcUn9o6JDfZtIASBH4sFz8ntWfjzvCQz05fGey3e+m483q7aENNl
 WTjER2R9FHM0pwErCXzPUaOlqszJZ/dyxvLAY/7h0QKpfmECwhSvG1su6e0j9+Ibat
 SXe0q3bo4rMn5DbePzxlsRagSr8oOu986j8OGuQrkaCUhpM00HGe9unpetpD+aO/eV
 wcdxLe1dn62eA00W63BAXp3KDbgrdVnAh5ByL/QW192YlMk3FeRuzPn7et6TB3Nz1X
 57yXL6Iyl5JEg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>
Subject: Re: [PATCH v3] powerpc/fsl-85xx: fix compile error
In-Reply-To: <AJUA5gAVCMaMlIkPsaTC0KqL.3.1584357605616.Hmail.wenhu.wang@vivo.com>
References: <AJUA5gAVCMaMlIkPsaTC0KqL.3.1584357605616.Hmail.wenhu.wang@vivo.com>
Date: Tue, 17 Mar 2020 22:22:13 +1100
Message-ID: <878sjzfcpm.fsf@mpe.ellerman.id.au>
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
Cc: trivial@kernel.org, kernel@vivo.com, linux-kernel@vger.kernel.org,
 stable <stable@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

=E7=8E=8B=E6=96=87=E8=99=8E <wenhu.wang@vivo.com> writes:
> From: Michael Ellerman <mpe@ellerman.id.au>
>  Date: 2020-03-16 17:41:12
> To:WANG Wenhu <wenhu.wang@vivo.com>,Benjamin Herrenschmidt <benh@kernel.c=
rashing.org>,Paul Mackerras <paulus@samba.org>,WANG Wenhu <wenhu.wang@vivo.=
com>,Allison Randal <allison@lohutok.net>,Richard Fontana <rfontana@redhat.=
com>,Greg Kroah-Hartman <gregkh@linuxfoundation.org>,Thomas Gleixner <tglx@=
linutronix.de>,linuxppc-dev@lists.ozlabs.org,linux-kernel@vger.kernel.org
>  cc: trivial@kernel.org,kernel@vivo.com,stable <stable@vger.kernel.org>
> Subject: Re: [PATCH v3] powerpc/fsl-85xx: fix compile error>WANG Wenhu <w=
enhu.wang@vivo.com> writes:
>>> Include "linux/of_address.h" to fix the compile error for
>>> mpc85xx_l2ctlr_of_probe() when compiling fsl_85xx_cache_sram.c.
>>>
>>>   CC      arch/powerpc/sysdev/fsl_85xx_l2ctlr.o
>>> arch/powerpc/sysdev/fsl_85xx_l2ctlr.c: In function =E2=80=98mpc85xx_l2c=
tlr_of_probe=E2=80=99:
>>> arch/powerpc/sysdev/fsl_85xx_l2ctlr.c:90:11: error: implicit declaratio=
n of function =E2=80=98of_iomap=E2=80=99; did you mean =E2=80=98pci_iomap=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>>>   l2ctlr =3D of_iomap(dev->dev.of_node, 0);
>>>            ^~~~~~~~
>>>            pci_iomap
>>> arch/powerpc/sysdev/fsl_85xx_l2ctlr.c:90:9: error: assignment makes poi=
nter from integer without a cast [-Werror=3Dint-conversion]
>>>   l2ctlr =3D of_iomap(dev->dev.of_node, 0);
>>>          ^
>>> cc1: all warnings being treated as errors
>>> scripts/Makefile.build:267: recipe for target 'arch/powerpc/sysdev/fsl_=
85xx_l2ctlr.o' failed
>>> make[2]: *** [arch/powerpc/sysdev/fsl_85xx_l2ctlr.o] Error 1
>>>
>>> Fixes: commit 6db92cc9d07d ("powerpc/85xx: add cache-sram support")
>>
>>The syntax is:
>>
>>Fixes: 6db92cc9d07d ("powerpc/85xx: add cache-sram support")
>>
>>> Cc: stable <stable@vger.kernel.org>
>>
>>The commit above went into v2.6.37.
>>
>>So no one has noticed this bug since then, how? Or did something else
>>change to expose the problem?
>
> Actually a hard question to answer cause it also left me scratching for l=
ong.
> However, I can not find right or definite answer.

Oh, actually it's fairly straight forward, the code can't be built at
all in upstream because CONFIG_FSL_85XX_CACHE_SRAM is not selectable or
selected by anything.

You sent a patch previously to make it selectable, which Scott thought
was a bad idea.

So this whole file is dead code as far as I'm concerned, so patches for
it definitely do not need to go to stable.

If you want to add a user for it then please send a series doing that,
and this commit can be the first.

cheers
