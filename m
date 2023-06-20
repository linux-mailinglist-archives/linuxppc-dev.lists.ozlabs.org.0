Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 279927363BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 08:47:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kIXbQPAN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qlccn09nVz30f7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 16:47:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kIXbQPAN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlcbv2tmrz2y1c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 16:46:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44F0461008;
	Tue, 20 Jun 2023 06:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089F0C433C8;
	Tue, 20 Jun 2023 06:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687243575;
	bh=qhJnpldHx9Ngi30rgQn2pavbmqnfNpLSyIzKTRd2o8U=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=kIXbQPANILwo9Y1wWYt6q3ChJF4DSI7gO8abNzUByovnraJeG4frzARCO/h7w2vGG
	 OdEwN7cDxxo0Nsy/aL9GTigRykijhUklQZJdeYIOACEfIJ0kUVzetlw/Pck5EGtn/s
	 pRFsD2QihkqL2ihuog8Hi/IBR9Tt0JBfyJHxiTInIWhESa2FbPXgPKvNM4tXEkVciA
	 ASsWswm4RFzo/SeZz43SmoPhwDUI2cOwxMLj7ko6Dr6maWzspK77D3gs7yee8/kXyL
	 +Jov0Fq6U99iC6vfw41o6yPWlCBdbbfxOyf0OaHG94EakuAWOPE4Pd/pUDs88bIVRR
	 CHOcb2bbxILjg==
Date: Tue, 20 Jun 2023 12:10:23 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH v1 2/3] powerpc: Mark all .S files invalid for objtool
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Josh Poimboeuf
	<jpoimboe@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
	Sathvika Vasireddy <sv@linux.ibm.com>
References: <cover.1686922583.git.christophe.leroy@csgroup.eu>
	<17feb760a05edd372984bdf148c760c6f279b401.1686922583.git.christophe.leroy@csgroup.eu>
	<1687240339.ekhpozhevo.naveen@kernel.org>
	<185a1734-80a3-08fd-18d2-08b24acace37@csgroup.eu>
In-Reply-To: <185a1734-80a3-08fd-18d2-08b24acace37@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1687242440.kuukzoknou.naveen@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 20/06/2023 =C3=A0 08:04, Naveen N Rao a =C3=A9crit=C2=A0:
>> Christophe Leroy wrote:
>>> A lot of work is required in .S files in order to get them ready
>>> for objtool checks.
>>>
>>> For the time being, exclude them from the checks.
>>>
>>> This is done with the script below:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0#!/bin/sh
>>> =C2=A0=C2=A0=C2=A0=C2=A0DIRS=3D`find arch/powerpc -name "*.S" -exec dir=
name {} \; | sort |=20
>>> uniq`
>>> =C2=A0=C2=A0=C2=A0=C2=A0for d in $DIRS
>>> =C2=A0=C2=A0=C2=A0=C2=A0do
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pushd $d
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo >> Makefile
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for f in *.S
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo=
 "OBJECT_FILES_NON_STANDARD_$f :=3D y" | sed s/"\.S"/".o"/g
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done >> Makefile
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 popd
>>> =C2=A0=C2=A0=C2=A0=C2=A0done
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>> =C2=A0arch/powerpc/boot/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++++++++
>>> =C2=A0arch/powerpc/crypto/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 +++++++
>>> =C2=A0arch/powerpc/kernel/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 44 +++++++++++++++++++++=
+
>>> =C2=A0arch/powerpc/kernel/trace/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
>>> =C2=A0arch/powerpc/kernel/vdso/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++
>>> =C2=A0arch/powerpc/kexec/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>>> =C2=A0arch/powerpc/kvm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 ++++++=
+
>>> =C2=A0arch/powerpc/lib/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 25 ++++++=
++++++
>>> =C2=A0arch/powerpc/mm/book3s32/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
>>> =C2=A0arch/powerpc/mm/nohash/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
>>> =C2=A0arch/powerpc/perf/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>>> =C2=A0arch/powerpc/platforms/44x/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +
>>> =C2=A0arch/powerpc/platforms/52xx/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 ++
>>> =C2=A0arch/powerpc/platforms/83xx/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
>>> =C2=A0arch/powerpc/platforms/cell/spufs/Makefile |=C2=A0 3 ++
>>> =C2=A0arch/powerpc/platforms/pasemi/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +
>>> =C2=A0arch/powerpc/platforms/powermac/Makefile=C2=A0=C2=A0 |=C2=A0 3 ++
>>> =C2=A0arch/powerpc/platforms/powernv/Makefile=C2=A0=C2=A0=C2=A0 |=C2=A0=
 3 ++
>>> =C2=A0arch/powerpc/platforms/ps3/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +
>>> =C2=A0arch/powerpc/platforms/pseries/Makefile=C2=A0=C2=A0=C2=A0 |=C2=A0=
 2 +
>>> =C2=A0arch/powerpc/purgatory/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
>>> =C2=A0arch/powerpc/sysdev/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
>>> =C2=A0arch/powerpc/xmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
>>> =C2=A023 files changed, 168 insertions(+)
>>>
>>=20
>> I think it might be better to have a config option so that architectures=
=20
>> can opt-in to skip objtool on asm files. We can then do:
>=20
> Well, the idea here was to initially opt out every file in order to=20
> quickly add support for objtool uaccess checking, and then opt-in back=20
> files one by one once they are ready for it.

That was my initial thought too.

>=20
> In most files,all we have to do is to replace all _GLOBAL() by=20
> SYM_FUNC_START(), add a SYM_FUNC_END() at the end of the function, then=20
> do the same with SYM_FUNC_START_LOCAL() with all non global functions.
>=20
> That's easy to do and worth it but it takes time, hence the idea of an=20
> incremental approach.

Right. But until that's done, I am not sure it is worth the churn to the=20
Makefiles.

Besides, it isn't clear to me that the existing features we are=20
targeting for objtool on powerpc need objtool to run on asm files (so,=20
an incremental approach may not really get us much). Objtool --mcount=20
doesn't care about .S files.  I suppose uaccess validation also doesn't=20
need it. It's likely just stack validation (should we choose to enable=20
it) that needs objtool to be run on asm files.

The first patch series converting much of our .S files can drop the=20
config option and exclude the remaining files.


- Naveen

