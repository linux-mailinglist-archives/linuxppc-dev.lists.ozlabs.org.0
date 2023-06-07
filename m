Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 514577260FB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 15:18:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbnwG0skrz3dsR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 23:18:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l6WfMVJL;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Si6uaBWU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=matz@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l6WfMVJL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Si6uaBWU;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbnvM2VTmz3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 23:17:35 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 9DDBD1FDAA;
	Wed,  7 Jun 2023 13:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1686143842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LLFNMhZOn1lPpKW6EioLyAkQckdY7WRbEhKwaz4+z7g=;
	b=l6WfMVJLM7wUz05TU4TC+dlVm+vbYcUxFwY3D9W0IoO8EdasGs3PfU9QbR81aNvH3/3V3u
	hBEIDs4LyxpZeUM0IBfeeK2lkuglh6PQM6M/wS/rst6H94Hp2QpxOgTWCTucr25R/4jwfh
	cg2Oz644s19YUjjXUVPPkyvnmGDrGPA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686143842;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LLFNMhZOn1lPpKW6EioLyAkQckdY7WRbEhKwaz4+z7g=;
	b=Si6uaBWUz01Mi76DwPBavJL04auwaj9x9nQ2/LRlC39a8x1ej9eXyO+EcunWJgfhXYOena
	Yw4Ap8IYjiRSAJAw==
Received: from wotan.suse.de (wotan.suse.de [10.160.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 568D72C141;
	Wed,  7 Jun 2023 13:17:21 +0000 (UTC)
Received: by wotan.suse.de (Postfix, from userid 10510)
	id DA1D4660C; Wed,  7 Jun 2023 13:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by wotan.suse.de (Postfix) with ESMTP id D7C2864B8;
	Wed,  7 Jun 2023 13:17:21 +0000 (UTC)
Date: Wed, 7 Jun 2023 13:17:21 +0000 (UTC)
From: Michael Matz <matz@suse.de>
To: Umesh Kalappa <umesh.kalappa0@gmail.com>
Subject: Re: Passing the complex args in the GPR's
In-Reply-To: <CAGfacvQ7qE4S-U=XLVRdZmitWJiCcppWH+VscpKz4piDYWwp=w@mail.gmail.com>
Message-ID: <alpine.LSU.2.20.2306071314190.13548@wotan.suse.de>
References: <20220524093828.505575-1-npiggin@gmail.com> <CAGfacvTu_8tZnndLqbRJeU4UJrnq+tCchiZyFFqOE-hXM0=wCA@mail.gmail.com> <CA+=Sn1=gt-nf4T3vfWDKQLRNKkuBXh98nLbTtiCGDSPhMxyRiQ@mail.gmail.com> <CAGfacvQ84ZexaH3Wgdz-vL3Y2MkKEtqqMg_jOZ15++rhNvZuXA@mail.gmail.com>
 <20230606164256.GQ19790@gate.crashing.org> <CAGfacvQ7qE4S-U=XLVRdZmitWJiCcppWH+VscpKz4piDYWwp=w@mail.gmail.com>
User-Agent: Alpine 2.20 (LSU 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1609957120-1269396235-1686143841=:13548"
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org, Andrew Pinski <pinskia@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Paul E Murphy <murphyp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1609957120-1269396235-1686143841=:13548
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hey,

On Tue, 6 Jun 2023, Umesh Kalappa via Gcc wrote:

> Question is : Why does GCC choose to use GPR's here and have any
> reference to support this decision  ?

You explicitely used -m32 ppc, so 
https://www.polyomino.org.uk/publications/2011/Power-Arch-32-bit-ABI-supp-1.0-Unified.pdf 
applies.  It explicitely states in "B.1 ATR-Linux Inclusion and 
Conformance" that it is "ATR-PASS-COMPLEX-IN-GPRS", and other sections 
detail what that means (namely passing complex args in r3 .. r10, whatever 
fits).  GCC adheres to that, and has to.

The history how that came to be was explained in the thread.


Ciao,
Michael.

 > 
> Thank you
> ~Umesh
> 
> 
> 
> On Tue, Jun 6, 2023 at 10:16 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> >
> > Hi!
> >
> > On Tue, Jun 06, 2023 at 08:35:22PM +0530, Umesh Kalappa wrote:
> > > Hi Adnrew,
> > > Thank you for the quick response and for PPC64 too ,we do have
> > > mismatches in ABI b/w complex operations like
> > > https://godbolt.org/z/bjsYovx4c .
> > >
> > > Any reason why GCC chose to use GPR 's here ?
> >
> > What did you expect, what happened instead?  Why did you expect that,
> > and why then is it an error what did happen?
> >
> > You used -O0.  As long as the code works, all is fine.  But unoptimised
> > code frequently is hard to read, please use -O2 instead?
> >
> > As Andrew says, why did you use -m32 for GCC but -m64 for LLVM?  It is
> > hard to compare those at all!  32-bit PowerPC Linux ABI (based on 32-bit
> > PowerPC ELF ABI from 1995, BE version) vs. 64-bit ELFv2 ABI from 2015
> > (LE version).
> >
> >
> > Segher
> 
---1609957120-1269396235-1686143841=:13548--
