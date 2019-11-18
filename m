Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D542100585
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 13:24:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Gp6y6lCvzDqXl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 23:24:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Gmmw1lpKzDqK5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:24:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Hs2bBVyJ"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47Gmmt4X8kz9sPW;
 Mon, 18 Nov 2019 22:23:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1574076238;
 bh=+m0WYc56ma1T5C9ucaT2dZi4UQCzolMchE10o+XuaYk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Hs2bBVyJgfMxyMAV2SGToHqrhgDVtlT7I4RfuZjOnYe9uUiPK/mLztGRh9ou2tej+
 dtfbsXfdcq7bLlalr27d8RprN2aMfVMZ4mLGzOSCOQDN2iGSKIVOsHWge/g69SbWK5
 b3/Zmlyn7FujzA4PETqB84UxRAjOAM2Q6lDkFynQmhNcI0cz0fSTGfdWVrGaJBEm/o
 IL2YulcasqRQ9FpURjV0wwbbIhIJv+jIhWBbe7V3kFepAbUFdAU9NOXpN4hSuaFAVU
 fqV8HeJcFr2q9rcyWMUUEfds5pDrWEKthzy5yVH/xu6XUKOs5rEtgzdjDFiAOGLXFK
 V36mhOe18CK6A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v4 2/2] powerpc/kexec: move kexec files into a dedicated
 subdir.
In-Reply-To: <afbef97ec6a978574a5cf91a4441000e0a9da42a.1572351221.git.christophe.leroy@c-s.fr>
References: <e235973a1198195763afd3b6baffa548a83f4611.1572351221.git.christophe.leroy@c-s.fr>
 <afbef97ec6a978574a5cf91a4441000e0a9da42a.1572351221.git.christophe.leroy@c-s.fr>
Date: Mon, 18 Nov 2019 22:23:56 +1100
Message-ID: <87pnhpctrn.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> arch/powerpc/kernel/ contains 8 files dedicated to kexec.
>
> Move them into a dedicated subdirectory.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>
> ---
> v2: moved crash.c as well as it's part of kexec suite.
> v3: renamed files to remove 'kexec' keyword from names.
> v4: removed a ifdef in kexec/Makefile
> ---
>  arch/powerpc/kernel/Makefile                       | 19 +---------------
>  arch/powerpc/kernel/kexec/Makefile                 | 25 ++++++++++++++++++++++
>  arch/powerpc/kernel/{ => kexec}/crash.c            |  0
>  .../kernel/{kexec_elf_64.c => kexec/elf_64.c}      |  0
>  arch/powerpc/kernel/{ima_kexec.c => kexec/ima.c}   |  0
>  .../kernel/{machine_kexec.c => kexec/machine.c}    |  0
>  .../{machine_kexec_32.c => kexec/machine_32.c}     |  0
>  .../{machine_kexec_64.c => kexec/machine_64.c}     |  0
>  .../machine_file_64.c}                             |  0
>  .../{kexec_relocate_32.S => kexec/relocate_32.S}   |  2 +-
>  10 files changed, 27 insertions(+), 19 deletions(-)
>  create mode 100644 arch/powerpc/kernel/kexec/Makefile
>  rename arch/powerpc/kernel/{ => kexec}/crash.c (100%)
>  rename arch/powerpc/kernel/{kexec_elf_64.c => kexec/elf_64.c} (100%)
>  rename arch/powerpc/kernel/{ima_kexec.c => kexec/ima.c} (100%)
>  rename arch/powerpc/kernel/{machine_kexec.c => kexec/machine.c} (100%)
>  rename arch/powerpc/kernel/{machine_kexec_32.c => kexec/machine_32.c} (100%)
>  rename arch/powerpc/kernel/{machine_kexec_64.c => kexec/machine_64.c} (100%)
>  rename arch/powerpc/kernel/{machine_kexec_file_64.c => kexec/machine_file_64.c} (100%)
>  rename arch/powerpc/kernel/{kexec_relocate_32.S => kexec/relocate_32.S} (99%)

I'm inclined to move the directory out of kernel, ie. up a level with mm
and so on.

And I also don't think the "machine" naming is useful anymore. It comes
from the naming of the arch functions, eg. machine_kexec(), which was
named to be analogous to machine_restart().

So how about:

  arch/powerpc/{kernel/machine_kexec.c => kexec/core.c}
  arch/powerpc/{kernel/machine_kexec_32.c => kexec/core_32.c}
  arch/powerpc/{kernel/machine_kexec_64.c => kexec/core_64.c}
  arch/powerpc/{kernel => kexec}/crash.c
  arch/powerpc/{kernel/kexec_elf_64.c => kexec/elf_64.c}
  arch/powerpc/{kernel/machine_kexec_file_64.c => kexec/file_load.c}
  arch/powerpc/{kernel/ima_kexec.c => kexec/ima.c}
  arch/powerpc/{kernel/kexec_relocate_32.S => kexec/relocate_32.S}

And we end up with:

  $ find arch/powerpc/kexec
  arch/powerpc/kexec/
  arch/powerpc/kexec/file_load.c
  arch/powerpc/kexec/relocate_32.S
  arch/powerpc/kexec/core_64.c
  arch/powerpc/kexec/ima.c
  arch/powerpc/kexec/core.c
  arch/powerpc/kexec/core_32.c
  arch/powerpc/kexec/Makefile
  arch/powerpc/kexec/crash.c
  arch/powerpc/kexec/elf_64.c


cheers
