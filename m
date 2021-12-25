Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 349A447F49F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 23:43:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLzVT1SFwz30Qv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 09:43:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ECKWTM9g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLzTq29NDz2xtj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Dec 2021 09:42:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ECKWTM9g; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JLzTj6CNfz4xps;
 Sun, 26 Dec 2021 09:42:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1640472170;
 bh=qiVqpRlRRXS0iAH2nX/AkQBYFrUOx2vQ2Vqp7kM0LCw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ECKWTM9gdi+sCsiy1dHQXyULGKSSWTz2ZLVhuUvcXREX9nG51Nm07U1fOp7KeiGI/
 WFmzX7vg/CXq/BsT5Q5iGJZGoAgB+IkGwm1Ig1mf4/7GC8PgX3M6JUSOvCJgySS9tN
 GMYrpOWwOCAt5rq1FE7zyCzfyPNMmEk1wQ3RZBRLaIvWVOoPU4dpwZAm4wDAvfxwfC
 IQo1vaVUXbCBblQbpa0a41VYClo3FWcRXlzbfHXhTugyjRyIz340RAK0gQly+D+vi9
 GGvp8MMYzz/6Ur5oTIViGAoSb8xsI6nAXfbZcD6MSW3rdh0CF/YT/7TFiJs34cefOd
 tgW+6sSNJ1pzQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: code conditional on non-existing PPC_EARLY_DEBUG_MICROWATT.
In-Reply-To: <27eefbf2-fc2c-7800-1397-8acfea7ed7e8@csgroup.eu>
References: <CAKXUXMxa6zuTncNjTVHeU7nJ9uvv3KqMtSDocMC7P5hxfrkakQ@mail.gmail.com>
 <27eefbf2-fc2c-7800-1397-8acfea7ed7e8@csgroup.eu>
Date: Sun, 26 Dec 2021 09:42:48 +1100
Message-ID: <87y2481f2v.fsf@mpe.ellerman.id.au>
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
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 23/12/2021 =C3=A0 11:21, Lukas Bulwahn a =C3=A9crit=C2=A0:
>> Dear Benjamin, dear Paul, dear Michael,
>>=20
>> with commit 48b545b8018d ("powerpc/microwatt: Use standard 16550 UART
>> for console"), you have some code in arch/powerpc/kernel/udbg_16550.c,
>> conditional on the Kconfig symbol PPC_EARLY_DEBUG_MICROWATT. However,
>> since then, the definition of this Kconfig symbol was never introduced
>> to the mainline repository or current linux-next, nor am I finding any
>> pending patch for that.
>>=20
>> Are you going to add this config definition soon? Or did you identify
>> that this setup code in udbg_16550.c is not actually needed and can we
>> simply drop this code again?
>>=20
>> This issue was identified with the script ./scripts/checkkconfigsymbols.=
py.
>>=20
>
> Was it forgotten when handling comments to=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200509050340.GD=
1464954@thinks.paulus.ozlabs.org/=20
> ?

Yes. I reported it internally to some folks but I guess they haven't had
time to send a fixup patch.

I'm pretty sure we just need the first three hunks of that patch, but it
would be good if someone with a Microwatt setup could test it.

cheers
