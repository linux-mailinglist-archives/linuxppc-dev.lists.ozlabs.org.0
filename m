Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF62B19A217
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 00:49:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sPf44qf0zDqtS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 09:49:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sPbD2x3nzDqMh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 09:47:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=qGR8Yhzs; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 48sPbC4WyZz9sSM;
 Wed,  1 Apr 2020 09:47:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1585694823;
 bh=m/ZP5w0x2jnoUFhs7Xcocabx7105UdtqxxyPat2Esjg=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=qGR8YhzsvBJmWoZnvl3SjAAOtjpqZUYOSrnCPrVnH+kyj8Ijq9iJzUWS7mczRQ/XO
 J0SvclGzYu7hplHixQX9aVROcsmfY2XxkFQZsUkSmOU9GAZblRPR9g6vdyTmaRJnRE
 IiZA7HsWbK1bsT2HAf7WztaVkp26e0qauj9KOCo9+odjKywAH+IvC9R34ktI50hA37
 FkQJfxKZWX5zMkj4D+vZV7z08fSJY6AyBu8DO3Nv7jMOAzdYWFwUdZfjDXE75cHHMY
 n20e1tkxRxOK0AqzW0VYtQR4NDcnGu6zLyumdwi7grIIxdmiFQVK0ayd1VG1EAT9BB
 o7qeGhm51z4Mw==
Received: by neuling.org (Postfix, from userid 1000)
 id 76DA82C173E; Wed,  1 Apr 2020 09:47:03 +1100 (AEDT)
Message-ID: <34ff52dfe8233007db6dd7b1cd98a741e5bc392c.camel@neuling.org>
Subject: Re: [PATCH] powerpc: Add new HWCAP bits
From: Michael Neuling <mikey@neuling.org>
To: Tulio Magno Quites Machado Filho <tuliom@ascii.art.br>, Alistair Popple
 <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 01 Apr 2020 09:47:03 +1100
In-Reply-To: <877dz0sglo.fsf@linux.ibm.com>
References: <20200331094247.28976-1-alistair@popple.id.au>
 <877dz0sglo.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-03-31 at 12:12 -0300, Tulio Magno Quites Machado Filho wrote:
> Alistair Popple <alistair@popple.id.au> writes:
>=20
> > diff --git a/arch/powerpc/include/uapi/asm/cputable.h
> > b/arch/powerpc/include/uapi/asm/cputable.h
> > index 540592034740..8888c6fe10b2 100644
> > --- a/arch/powerpc/include/uapi/asm/cputable.h
> > +++ b/arch/powerpc/include/uapi/asm/cputable.h
> > @@ -50,6 +50,8 @@
> >  #define PPC_FEATURE2_DARN		0x00200000 /* darn random number insn */
> >  #define PPC_FEATURE2_SCV		0x00100000 /* scv syscall */
> >  #define PPC_FEATURE2_HTM_NO_SUSPEND	0x00080000 /* TM w/out suspended
> > state */
> > +#define PPC_FEATURE2_ARCH_3_10		0x00040000 /* ISA 3.10 */
>=20
> I think this should have been:
>=20
> #define PPC_FEATURE2_ARCH_3_1		0x00040000 /* ISA 3.1 */

Agreed. That's the new name.

Sorry Al I should have caught that earlier.

Mikey
