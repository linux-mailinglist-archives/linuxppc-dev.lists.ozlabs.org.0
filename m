Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952D22DFB7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 16:31:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BF53M1yw4zF0mR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 00:31:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BF4zD5ZbxzDrhp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 00:27:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BF4yz68Hxz9v1qF;
 Sun, 26 Jul 2020 16:27:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2zRZtQ7hFE-t; Sun, 26 Jul 2020 16:27:39 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BF4yz57Pnz9v1qD;
 Sun, 26 Jul 2020 16:27:39 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 1FEAB2487; Sun, 26 Jul 2020 16:29:02 +0200 (CEST)
Received: from 37-166-97-133.coucou-networks.fr
 (37-166-97-133.coucou-networks.fr [37.166.97.133]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Sun, 26 Jul 2020 16:29:02 +0200
Date: Sun, 26 Jul 2020 16:29:02 +0200
Message-ID: <20200726162902.Horde.TCqHYaODbkzEpM-rFzDd8A2@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 0/9] powerpc: delete duplicated words
In-Reply-To: <20200726003809.20454-1-rdunlap@infradead.org>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> a =C3=A9crit=C2=A0:

> Drop duplicated words in arch/powerpc/ header files.

How did you detect them ? Do you have some script for tgat, or you=20=20
just=20read all comments ?

>
> Cc: Michael Ellerman <mpe@ellerman.id.au>

You say you Cc Michael, but in fact you don't ... Allthough he is the=20=20
powerpc=20maintainer

Christophe

> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
>
>  arch/powerpc/include/asm/book3s/64/mmu-hash.h |    2 +-
>  arch/powerpc/include/asm/book3s/64/radix-4k.h |    2 +-
>  arch/powerpc/include/asm/cputime.h            |    2 +-
>  arch/powerpc/include/asm/epapr_hcalls.h       |    4 ++--
>  arch/powerpc/include/asm/hw_breakpoint.h      |    2 +-
>  arch/powerpc/include/asm/ppc_asm.h            |    2 +-
>  arch/powerpc/include/asm/reg.h                |    2 +-
>  arch/powerpc/include/asm/smu.h                |    2 +-
>  arch/powerpc/platforms/powernv/pci.h          |    2 +-
>  9 files changed, 10 insertions(+), 10 deletions(-)


