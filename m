Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1271A4AF5F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 03:13:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45T6QS2SHczDqR7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 11:13:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45T6N512pVzDq5W
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 11:11:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="clEjH7Q7"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 45T6N420hRz9s3l;
 Wed, 19 Jun 2019 11:11:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1560906676;
 bh=7TMYlMTGr57kvpIOT2ri7jpdPyF9ZyOZTrYr59zbLeU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=clEjH7Q74pThkxAepBWXKHk8UlgOALPKonzlOX/3/s7+30RIxj/FNBruoQLExdxZ5
 k/X8utmiH2Qc+ezwEi71s3Cu3oMoPk9eqbTg01/srUd2tp2BqJ5nwQEAplDV9cLd4i
 x0z1HhT/jIEvQyPKTDM8Dh6yFSU5XQPtKlMO+GZxaJsBajZl7+DmlbzxEE04utzzrt
 qZTnotDUMr3usTPdDZEIkUWXYJ78u6Hn5V1xdSG4LE5gMJlllZPl71T39h3fCUtkm2
 Bs+xVhIUaniBhbcVKSp7M/nku0rqDT0ZZDhwYvOnUAI/GK8HM1UNGpJqFmuxUKDIHE
 8fcTRS/Ff+UQA==
Received: by neuling.org (Postfix, from userid 1000)
 id 3D5932A2538; Wed, 19 Jun 2019 11:11:16 +1000 (AEST)
Message-ID: <3426e38c9028694f2ea55f6adaf3b679a1bce19f.camel@neuling.org>
Subject: Re: [PATCH v5 2/2] powerpc: Fix compile issue with force DAWR
From: Michael Neuling <mikey@neuling.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>, mpe@ellerman.id.au
Date: Wed, 19 Jun 2019 11:11:16 +1000
In-Reply-To: <e20b2d44-508c-7d06-1af8-b608563b8c57@c-s.fr>
References: <20190604030037.9424-1-mikey@neuling.org>
 <20190604030037.9424-2-mikey@neuling.org>
 <e20b2d44-508c-7d06-1af8-b608563b8c57@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
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
Cc: Mathieu Malaterre <malat@debian.org>, hch@infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-06-18 at 18:28 +0200, Christophe Leroy wrote:
>=20
> Le 04/06/2019 =C3=A0 05:00, Michael Neuling a =C3=A9crit :
> > If you compile with KVM but without CONFIG_HAVE_HW_BREAKPOINT you fail
> > at linking with:
> >    arch/powerpc/kvm/book3s_hv_rmhandlers.o:(.text+0x708): undefined
> > reference to `dawr_force_enable'
> >=20
> > This was caused by commit c1fe190c0672 ("powerpc: Add force enable of
> > DAWR on P9 option").
> >=20
> > This moves a bunch of code around to fix this. It moves a lot of the
> > DAWR code in a new file and creates a new CONFIG_PPC_DAWR to enable
> > compiling it.
>=20
> After looking at all this once more, I'm just wondering: why are we=20
> creating stuff specific to DAWR ?
>=20
> In the old days, we only add DABR, and everything was named on DABR.
> When DAWR was introduced some years ago we renamed stuff like do_dabr()=
=20
> to do_break() so that we could regroup things together. And now we are=
=20
> taking dawr() out of the rest. Why not keep dabr() stuff and dawr()=20
> stuff all together in something dedicated to breakpoints, and try to=20
> regroup all breakpoint stuff in a single place ? I see some=20
> breakpointing stuff done in kernel/process.c and other things done in=20
> hw_breakpoint.c, to common functions call from one file to the other,=20
> preventing GCC to fully optimise, etc ...
>=20
> Also, behing this thinking, I have the idea that we could easily=20
> implement 512 bytes breakpoints on the 8xx too. The 8xx have neither=20
> DABR nor DAWR, but is using a set of comparators. And as you can see in=
=20
> the 8xx version of __set_dabr() in kernel/process.c, we emulate the DABR=
=20
> behaviour by setting two comparators. By using the same comparators with=
=20
> a different setup, we should be able to implement breakpoints on larger=
=20
> ranges of address.

Christophe

I agree that their are opportunities to refactor this code and I appreciate=
 your
efforts in making this code better but...=20

We have a problem here of not being able to compile an odd ball case that a=
lmost
no one ever hits (it was just an odd mpe CI case). We're up to v5 of a simp=
le
fix which is just silly.=20

So let's get this fix in and move on to the whole bunch of refactoring we c=
an do
in this code which is already documented in the github issue tracking.

Regards,
Mikey

