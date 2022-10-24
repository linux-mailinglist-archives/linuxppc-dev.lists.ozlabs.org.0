Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A1360B912
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 22:02:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mx5ZX3t6nz3c9s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 07:02:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bluescreens.de (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org; envelope-from=cmr@bluescreens.de; receiver=<UNKNOWN>)
X-Greylist: delayed 381 seconds by postgrey-1.36 at boromir; Tue, 25 Oct 2022 02:46:14 AEDT
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MwzvB3grVz2yZd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 02:46:14 +1100 (AEDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Mwzlc49Xcz9sTs;
	Mon, 24 Oct 2022 17:39:40 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Oct 2022 10:39:34 -0500
Message-Id: <CNU9LN3VHE7I.3QD0LRZKFY948@sierra>
Subject: Re: [PATCH v8 5/6] powerpc/code-patching: Use temporary mm for
 Radix MMU
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: "Benjamin Gray" <bgray@linux.ibm.com>, "Russell Currey"
 <ruscur@russell.cc>, <linuxppc-dev@lists.ozlabs.org>
References: <20221021052238.580986-1-bgray@linux.ibm.com>
 <20221021052238.580986-6-bgray@linux.ibm.com>
 <21abdd4a7ee1cacc4847ab7424f45117f0d147ee.camel@russell.cc>
 <dd9844b8444e22257b4cdb1fce5877f0086bd63b.camel@linux.ibm.com>
In-Reply-To: <dd9844b8444e22257b4cdb1fce5877f0086bd63b.camel@linux.ibm.com>
X-Rspamd-Queue-Id: 4Mwzlc49Xcz9sTs
X-Mailman-Approved-At: Tue, 25 Oct 2022 07:00:53 +1100
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
Cc: jniethe5@gmail.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Oct 24, 2022 at 12:17 AM CDT, Benjamin Gray wrote:
> On Mon, 2022-10-24 at 14:45 +1100, Russell Currey wrote:
> > On Fri, 2022-10-21 at 16:22 +1100, Benjamin Gray wrote:
> > > From: "Christopher M. Riedl" <cmr@bluescreens.de>
> > >

-----%<------

> > >
> > > ---
> >
> > Is the section following the --- your addendum to Chris' patch?=C2=A0 T=
hat
> > cuts it off from git, including your signoff.=C2=A0 It'd be better to h=
ave
> > it together as one commit message and note the bits you contributed
> > below the --- after your signoff.
> >
> > Commits where you're modifying someone else's previous work should
> > include their signoff above yours, as well.
>
> Addendum to his wording, to break it off from the "From..." section
> (which is me splicing together his comments from previous patches with
> some minor changes to account for the patch changes). I found out
> earlier today that Git will treat it as a comment :(
>
> I'll add the signed off by back, I wasn't sure whether to leave it
> there after making changes (same in patch 2).
> =C2=A0

This commit has lots of my words so should probably keep the sign-off - if =
only
to guarantee that blame is properly directed at me for any nonsense therein=
 ^^.

Patch 2 probably doesn't need my sign-off any more - iirc, I actually defen=
ded
the BUG_ON()s (which are WARN_ON()s now) at some point.
