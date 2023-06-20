Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB10736367
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 08:07:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GOz3afpX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qlbkb4msGz3bY2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 16:07:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GOz3afpX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlbjj4zWBz300H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 16:06:17 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C9BFB60FD7;
	Tue, 20 Jun 2023 06:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7812BC433C8;
	Tue, 20 Jun 2023 06:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687241175;
	bh=7p04urdhVL/vDoH4p/S4/xKQGCuV22rFwM8xbFUKSMQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=GOz3afpXEx+Ylkp/ORnzsKThtqNE7h9DkY/jQezs8DZEuLLk03CyLoEqQwidAG2J7
	 dUxiYdZOWZa7F9Jh53hRNPeHfsor7fVGZQZpjWqimVDFkxlzdvKgQowoed15enaaxm
	 9O4wviAanDStf+T/pdsld1+F2Juwi4Bn9HTO83AYCk5pjEtiCM3+vATPLh4q1v3xj5
	 E0u/JZHEj9252LmqS/KjxEnI6S5kRZG7Yb/p88F1OfUUrvRZAt13tC7sJBuF+iSOPV
	 wUqEHNuMbCZvvnxm2sanyzc1zQtgCV8n5bgNJeYnTPWgIXmIbAUk+XnOQpIHIpcQIa
	 eZ11TPWr+7z2g==
Date: Tue, 20 Jun 2023 11:34:34 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH v1 2/3] powerpc: Mark all .S files invalid for objtool
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Josh Poimboeuf
	<jpoimboe@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
	Sathvika Vasireddy <sv@linux.ibm.com>
References: <cover.1686922583.git.christophe.leroy@csgroup.eu>
	<17feb760a05edd372984bdf148c760c6f279b401.1686922583.git.christophe.leroy@csgroup.eu>
In-Reply-To: <17feb760a05edd372984bdf148c760c6f279b401.1686922583.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1687240339.ekhpozhevo.naveen@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> A lot of work is required in .S files in order to get them ready
> for objtool checks.
>=20
> For the time being, exclude them from the checks.
>=20
> This is done with the script below:
>=20
> 	#!/bin/sh
> 	DIRS=3D`find arch/powerpc -name "*.S" -exec dirname {} \; | sort | uniq`
> 	for d in $DIRS
> 	do
> 		pushd $d
> 		echo >> Makefile
> 		for f in *.S
> 		do
> 			echo "OBJECT_FILES_NON_STANDARD_$f :=3D y" | sed s/"\.S"/".o"/g
> 		done >> Makefile
> 		popd
> 	done
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/boot/Makefile                 | 17 +++++++++
>  arch/powerpc/crypto/Makefile               | 13 +++++++
>  arch/powerpc/kernel/Makefile               | 44 ++++++++++++++++++++++
>  arch/powerpc/kernel/trace/Makefile         |  4 ++
>  arch/powerpc/kernel/vdso/Makefile          | 11 ++++++
>  arch/powerpc/kexec/Makefile                |  2 +
>  arch/powerpc/kvm/Makefile                  | 13 +++++++
>  arch/powerpc/lib/Makefile                  | 25 ++++++++++++
>  arch/powerpc/mm/book3s32/Makefile          |  3 ++
>  arch/powerpc/mm/nohash/Makefile            |  3 ++
>  arch/powerpc/perf/Makefile                 |  2 +
>  arch/powerpc/platforms/44x/Makefile        |  2 +
>  arch/powerpc/platforms/52xx/Makefile       |  3 ++
>  arch/powerpc/platforms/83xx/Makefile       |  2 +
>  arch/powerpc/platforms/cell/spufs/Makefile |  3 ++
>  arch/powerpc/platforms/pasemi/Makefile     |  2 +
>  arch/powerpc/platforms/powermac/Makefile   |  3 ++
>  arch/powerpc/platforms/powernv/Makefile    |  3 ++
>  arch/powerpc/platforms/ps3/Makefile        |  2 +
>  arch/powerpc/platforms/pseries/Makefile    |  2 +
>  arch/powerpc/purgatory/Makefile            |  3 ++
>  arch/powerpc/sysdev/Makefile               |  3 ++
>  arch/powerpc/xmon/Makefile                 |  3 ++
>  23 files changed, 168 insertions(+)
>

I think it might be better to have a config option so that architectures=20
can opt-in to skip objtool on asm files. We can then do:

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 9f94fc83f08652..878027cf4faf37 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -359,7 +359,11 @@ $(obj)/%.s: $(src)/%.S FORCE
        $(call if_changed_dep,cpp_s_S)
=20
 quiet_cmd_as_o_S =3D AS $(quiet_modtag)  $@
+ifndef CONFIG_ARCH_OBJTOOL_SKIP_ASM
       cmd_as_o_S =3D $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
+else
+      cmd_as_o_S =3D $(CC) $(a_flags) -c -o $@ $<
+endif
=20
 ifdef CONFIG_ASM_MODVERSIONS
=20


- Naveen

