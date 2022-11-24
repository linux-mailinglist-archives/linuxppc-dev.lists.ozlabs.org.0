Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B87637696
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 11:38:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHvbF23klz3dvM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 21:38:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WTQM3Tmv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHvZJ2zNZz3045
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 21:37:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WTQM3Tmv;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NHvZF2rbqz4xGK;
	Thu, 24 Nov 2022 21:37:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669286230;
	bh=qw+Z/V+WEes04qNv/mzj8igXJLhyM6g0KYA314bdhzs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WTQM3TmvCQjU8d1/xLc6gcRqiJ82JqVe8B0saYWpj+F2ImP+TrxQknHUto7rgp/9A
	 DKVXcKEsYhxN/RKsQqzpKcRPu4FmJ5eN4D84ltSBeQ3JCoNcxc27/Z0rghjisSq52Y
	 VcW7n+6rAi5pyFqupaSQ4YSjARQAXDJDAvCDngWERMunE0odEKMZiDSO7Zqdpy3UUx
	 Fgr/Blk+ViSvMHXUBjz3md6spYizJ+4aJMdIyed79zn2H57k+w7EeFfgKOWiT8pZKs
	 Sk4kiJU9FzD4r60dLhTY7/9qA1OFyscvJJH3/Ols9/t+opFXTGYHhOkB6iaq9TLwo+
	 Hodp0cB3S3O/A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the tip tree with the
 powerpc-objtool tree
In-Reply-To: <de806b36-2b5c-3040-22c2-129bc9b5ddd4@csgroup.eu>
References: <20221124122931.266df8c7@canb.auug.org.au>
 <de806b36-2b5c-3040-22c2-129bc9b5ddd4@csgroup.eu>
Date: Thu, 24 Nov 2022 21:37:06 +1100
Message-ID: <878rk0d4fh.fsf@mpe.ellerman.id.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 24/11/2022 =C3=A0 02:29, Stephen Rothwell a =C3=A9crit=C2=A0:
>> Hi all,
>>=20
>> Today's linux-next merge of the tip tree got a conflict in:
>>=20
>>    tools/objtool/check.c
>>=20
>> between commit:
>>=20
>>    efb11fdb3e1a ("objtool: Fix SEGFAULT")
>>=20
>> from the powerpc-objtool tree and commit:
>>=20
>>    dbcdbdfdf137 ("objtool: Rework instruction -> symbol mapping")
>>=20
>> from the tip tree.
>>=20
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>=20
>
> Maybe it would be better to perform the check of insn inside the new=20
> insn_func() then ?

I don't think it would.

Many of the other uses of insn_func() know that insn is not NULL,
because they've already checked it or have dereferenced some other
member of insn before the call. So in those cases checking it in
insn_func() would be redundant.

But ultimately up to the objtool maintainers.

cheers
