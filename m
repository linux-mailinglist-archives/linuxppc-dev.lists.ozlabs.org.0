Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBF04AB30E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 02:19:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsSx25gX4z30Ly
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 12:19:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fVv9D5Fu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2404:9400:2221:ea00::3;
 helo=gandalf.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fVv9D5Fu; 
 dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsSwP0fhgz2xXW
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Feb 2022 12:19:16 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JsSwK1MWyz4xcZ;
 Mon,  7 Feb 2022 12:19:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1644196753;
 bh=DVo9TFj10WHnIMP3upbM4NlbZB2TC5ggS49NOyVsTQo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fVv9D5FuEvLaNhfgmXgjlmjX4g5lOMemZmfYENVGDoppdX2Jo87qwVgAkhSIW0EP0
 89Lc++67+OIoMEwNxjvC50RgrjFDElHcPnLgKXuA5z1ZQiM++i/WE+BI+matwTnW2P
 91Ie3ar6Hr7cTtJ21ddl+Mbkp3WJslga+XRknX57rBaj+Wt1/rbTxjyAQqrUiUMLyq
 69wA8R2wfhA4KR8xTZG8HD3WRA+dYQp8A8q5D5TWDPWcWDmNGi2ZrHqlZZAor3hGwP
 gBZUprAx+25T1ngXxDkvVI01Gokid1upCSXRiWM4/lXk81+HjumKOlIxOkqLRh8iAA
 xnZSLLukqnG4w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 5/5] powerpc: Select
 ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book3s/32 and 8xx
In-Reply-To: <9cab4adb-bd4b-48d5-d63c-33a0f25c97e4@csgroup.eu>
References: <cover.1643282353.git.christophe.leroy@csgroup.eu>
 <a20285472ad0a0a13a1d93c4707180be5b4fa092.1643282353.git.christophe.leroy@csgroup.eu>
 <YfsVhcpVTW0+YCl5@bombadil.infradead.org>
 <87h79gmrux.fsf@mpe.ellerman.id.au>
 <9cab4adb-bd4b-48d5-d63c-33a0f25c97e4@csgroup.eu>
Date: Mon, 07 Feb 2022 12:19:06 +1100
Message-ID: <877da7mq2d.fsf@mpe.ellerman.id.au>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 03/02/2022 =C3=A0 06:39, Michael Ellerman a =C3=A9crit=C2=A0:
>> Luis Chamberlain <mcgrof@kernel.org> writes:
>>> On Thu, Jan 27, 2022 at 11:28:12AM +0000, Christophe Leroy wrote:
>>>> book3s/32 and 8xx have a separate area for allocating modules,
>>>> defined by MODULES_VADDR / MODULES_END.
>>>>
>>>> On book3s/32, it is not possible to protect against execution
>>>> on a page basis. A full 256M segment is either Exec or NoExec.
>>>> The module area is in an Exec segment while vmalloc area is
>>>> in a NoExec segment.
>>>>
>>>> In order to protect module data against execution, select
>>>> ARCH_WANTS_MODULES_DATA_IN_VMALLOC.
>>>>
>>>> For the 8xx (and possibly other 32 bits platform in the future),
>>>> there is no such constraint on Exec/NoExec protection, however
>>>> there is a critical distance between kernel functions and callers
>>>> that needs to remain below 32Mbytes in order to avoid costly
>>>> trampolines. By allocating data outside of module area, we
>>>> increase the chance for module text to remain within acceptable
>>>> distance from kernel core text.
>>>>
>>>> So select ARCH_WANTS_MODULES_DATA_IN_VMALLOC for 8xx as well.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>>> Cc: Paul Mackerras <paulus@samba.org>
>>>
>>> Cc list first and then the SOB.
>>=20
>> Just delete the Cc: list, it's meaningless.
>>=20
>
> Was an easy way to copy you automatically with 'git send-email', but=20
> getting it through linuxppc-dev list is enough I guess ?

It's useful for making the tooling Cc the right people, it's fine to use
them for that.

But there's no value in committing them to the git history, I actively
strip them when applying. The fact that someone is Cc'ed on a patch
tells you nothing, given the volume of mail maintainers receive.

The link tag back to the original submission gives you the Cc list
anyway.

cheers
