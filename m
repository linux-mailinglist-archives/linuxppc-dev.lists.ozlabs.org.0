Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8F3461D1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:54:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2tJb6JVvz3f98
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 04:54:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org;
 envelope-from=srs0=azzo=qq=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
X-Greylist: delayed 481 seconds by postgrey-1.36 at boromir;
 Tue, 30 Nov 2021 04:52:06 AEDT
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2tGG3PM3z3cXT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 04:52:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 19EC3CE13BC;
 Mon, 29 Nov 2021 17:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50DAC53FCD;
 Mon, 29 Nov 2021 17:43:56 +0000 (UTC)
Date: Mon, 29 Nov 2021 12:43:55 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: LEROY Christophe <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] recordmcount: Support empty section from recent binutils
Message-ID: <20211129124355.52474d90@gandalf.local.home>
In-Reply-To: <efc0e15e-fc93-fb59-068d-602f96ec7431@csgroup.eu>
References: <cd0f6bdfdf1ee096fb2c07e7b38940921b8e9118.1637764848.git.christophe.leroy@csgroup.eu>
 <efc0e15e-fc93-fb59-068d-602f96ec7431@csgroup.eu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 26 Nov 2021 08:43:23 +0000
LEROY Christophe <christophe.leroy@csgroup.eu> wrote:

> Le 24/11/2021 =C3=A0 15:43, Christophe Leroy a =C3=A9crit=C2=A0:
> > Looks like recent binutils (2.36 and over ?) may empty some section,
> > leading to failure like:
> >=20
> > 	Cannot find symbol for section 11: .text.unlikely.
> > 	kernel/kexec_file.o: failed
> > 	make[1]: *** [scripts/Makefile.build:287: kernel/kexec_file.o] Error 1
> >=20
> > In order to avoid that, ensure that the section has a content before
> > returning it's name in has_rel_mcount(). =20
>=20
> This patch doesn't work, on PPC32 I get the following message with this=20
> patch applied:
>=20
> [    0.000000] ftrace: No functions to be traced?
>=20
> Without the patch I get:
>=20
> [    0.000000] ftrace: allocating 22381 entries in 66 pages
> [    0.000000] ftrace: allocated 66 pages with 2 groups

Because of this report, I have not applied this patch (even though I was
about to push it to Linus).

I'm pulling it from my queue until this gets resolved.

Thanks,

-- Steve
