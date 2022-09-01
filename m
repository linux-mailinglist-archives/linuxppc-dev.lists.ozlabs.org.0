Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F095A907B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 09:38:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJCbH5Svfz304v
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 17:38:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=DKIM header.b=naAOJdS5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iram.es (client-ip=130.206.19.145; helo=mx01.puc.rediris.es; envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=DKIM header.b=naAOJdS5;
	dkim-atps=neutral
Received: from mx01.puc.rediris.es (outbound4mad.lav.puc.rediris.es [130.206.19.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJCZb3Sj5z2xGK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 17:38:12 +1000 (AEST)
Received: from sim.rediris.es (mta-out04.sim.rediris.es [130.206.24.46])
	by mx01.puc.rediris.es  with ESMTP id 2817bp7d004582-2817bp7f004582
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 1 Sep 2022 09:37:51 +0200
Received: from sim.rediris.es (localhost.localdomain [127.0.0.1])
	by sim.rediris.es (Postfix) with ESMTPS id 377EB39C39;
	Thu,  1 Sep 2022 09:37:50 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by sim.rediris.es (Postfix) with ESMTP id 9F7C239C3C;
	Thu,  1 Sep 2022 09:37:49 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
	mta-out04.sim.rediris.es
Received: from sim.rediris.es ([127.0.0.1])
	by localhost (mta-out04.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Aco7_lIICjnn; Thu,  1 Sep 2022 09:37:49 +0200 (CEST)
Received: from lt-gp.iram.es (haproxy01.sim.rediris.es [130.206.24.69])
	by sim.rediris.es (Postfix) with ESMTPA id 1498139C39;
	Thu,  1 Sep 2022 09:37:46 +0200 (CEST)
Date: Thu, 1 Sep 2022 09:37:42 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc: Fix irq_soft_mask_set() and
 irq_soft_mask_return() with sanitizer
Message-ID: <YxBhRtTuJ4Ut7wUt@lt-gp.iram.es>
References: <c0b486e782b6695092dcdb2cd340a3d44c8c266d.1661272738.git.christophe.leroy@csgroup.eu>
 <CMJ3VICKD1CI.SVFJOKYJPKZQ@bobo>
 <e022754d-b4d3-bc9f-cc79-2cf556180459@csgroup.eu>
 <CMJ8P06JA9OY.1S8VDV2XRU3W5@bobo>
 <7c11b659-5b8e-256c-508e-39395041fccb@csgroup.eu>
 <20220831224522.GX25951@gate.crashing.org>
 <ad5ebb37-6b6f-372c-dd07-fc4cfc5f5fe5@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <ad5ebb37-6b6f-372c-dd07-fc4cfc5f5fe5@csgroup.eu>
Content-Transfer-Encoding: quoted-printable
X-FE-Policy-ID: 23:8:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM; c=relaxed/relaxed;
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=8oRtUt8n6oJO2slKo6oCUf7IVvigM4Ug71hTwGM018E=;
 b=naAOJdS5nF1l3osWGt5jM0E8jjERSjBSaLXL2U3f5R2uLCZHhOI7XyYC+1YfORGLXI/MXoftea7T
	pvc4WmzeX1Xp+QO+2DY/aelXWhKhWJhn4oo/ajxPFmH2Rxdi2NtaA3pV6/z1O81TH7O54ixy5loJ
	QrlW0VVVz5Z/YkEbl+afZzQYk1vgNyTqXu3/3XdnDFEBbQdvVbj6d99CbdM8b8xFRb7UcF1F0X4S
	gxotryTbBL/b+gcWNqiNweqgyOTFreoPrfmH8utRyjG9KHR6mlJHePZelMdv9umKQ4Zq3p0HsOwB
	WAQnre8JHZRNrJs8osQRzSl80jPc5bJkwYVf0Q==
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Zhouyi Zhou <zhouzhouyi@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 01, 2022 at 05:22:32AM +0000, Christophe Leroy wrote:
>=20
>=20
> Le 01/09/2022 =E0 00:45, Segher Boessenkool a =E9crit=A0:
> > Hi!
> >=20
> > On Tue, Aug 30, 2022 at 09:10:02AM +0000, Christophe Leroy wrote:
> >> Le 30/08/2022 =E0 11:01, Nicholas Piggin a =E9crit=A0:
> >>> On Tue Aug 30, 2022 at 3:24 PM AEST, Christophe Leroy wrote:
> >>>>> This is still slightly concerning to me. Is there any guarantee t=
hat the
> >>>>> compiler would not use a different sequence for the address here?
> >>>>>
> >>>>> Maybe explicit r13 is required.
> >>>>>
> >>>>
> >>>> local_paca is defined as:
> >>>>
> >>>> 	register struct paca_struct *local_paca asm("r13");
> >=20
> > And this is in global scope, making it a global register variable.
> >=20
> >>>> Why would the compiler use another register ?
> >>>
> >>> Hopefully it doesn't. Is it guaranteed that it won't?
> >=20
> > Yes, this is guaranteed.
> >=20
> > For a local register variable this is guaranteed only for operands to=
 an
> > extended inline asm; any other access to the variable does not have t=
o
> > put it in the specified register.
> >=20
> > But this is a global register variable.  The only thing that would ma=
ke
> > this crash and burn is if *any* translation unit did not see this
> > declaration: it could then use r13 (if that was allowed by the ABI in
> > effect, heh).
> >=20
> >>> I'm sure Segher will be delighted with the creative asm in __do_IRQ
> >>> and call_do_irq :) *Grabs popcorn*
> >=20
> > All that %% is blinding, yes.
> >=20
> > Inline tabs are bad taste.
> >=20
> > Operand names instead of numbers are great for obfuscation, and nothi=
ng
> > else -- unless you have more than four or five operands, in which cas=
e
> > you have bigger problems already.
> >=20
> > Oh, this function is a good example of proper use of local register a=
sm,
> > btw.
> >=20
> > Comments like "// Inputs" are just harmful.  As is the "creative"
> > indentation here.  Both harm readability and do not help understandin=
g
> > in any other way either.
> >=20
> > The thing about inline asm is the smallest details change meaning of =
the
> > whole, it is a very harsh environment, you are programming both in C =
and
> > directly assembler code as well, and things have to be valid for both=
,
> > although on the other hand there is almost no error checking.  Keepin=
g
> > it small, simple, readable is paramount.
> >=20
> > The rules for using inline asm:
> >=20
> > 0) Do no use inline asm.
> > 1) Use extended asm, unless you know all differences with basic asm, =
and
> >     you know you want that.  And if you answer "yes I do" to the latt=
er,
> >     you answered wrong to the former.
> > 2) Do not use toplevel asm.
> > 3) Do no use inline asm.
> > 4) Do no use inline asm.
> > 5) Do no use inline asm.
> >=20
> > Inline asm is a very powerful escape hatch.  Like all emergency exits=
,
> > you should not use them if you do not need them!  :-)
> >=20
> > But, you are talking about the function calling and the frame change =
I
> > bet :-)  Both of these are only okay because everything is back as it
> > was when this (single!) asm is done, and the state created is perfect=
ly
> > fine (this is very dependent on exact ABI used, etc.)
> >=20
> > I would have used real assembler code here (in a .s file).  But there
> > probably are reasons to do things this way, performance probably?
>=20
> We changed it to inline asm in order to ... inline it in the caller.

And there is a single caller it seems. Typically GCC inlines function
with a single call site, but it may be confused by asm statements.

>=20
> I also find that those operand names make it awull more difficult to=20
> read that traditional numbering. I really dislike that new trend.
> And same with those // comments, better use meaningfull C variable name=
s.

Agree, but there is one thing which escapes me: why is r3 listed in the
outputs section (actually as a read write operand with the "+"
constraint modifier) but is not used after the asm which is the last
statement of function returning void?

Do I miss something?

	Gabriel

 

