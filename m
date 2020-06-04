Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE551EEB44
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 21:39:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dGLt2F4bzDqtV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 05:39:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=libc.org
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dGJY0Mk2zDqBX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 05:37:31 +1000 (AEST)
Date: Thu, 4 Jun 2020 15:37:27 -0400
From: Rich Felker <dalias@libc.org>
To: David Edelsohn <dje.gcc@gmail.com>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200604193726.GQ1079@brightrain.aerifal.cx>
References: <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
 <alpine.DEB.2.21.2006021334170.24059@digraph.polyomino.org.uk>
 <20200602142337.GS25173@kitsune.suse.cz>
 <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
 <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
 <20200604174613.GP1079@brightrain.aerifal.cx>
 <CAGWvnymiNUWSMeGNDvJk_uc=8OdS1Y_8uE=cd0s2BKCFFe7Dkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGWvnymiNUWSMeGNDvJk_uc=8OdS1Y_8uE=cd0s2BKCFFe7Dkg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: GNU C Library <libc-alpha@sourceware.org>, eery@paperfox.es,
 Daniel Kolesa <daniel@octaforge.org>, musl@lists.openwall.com,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>,
 Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Joseph Myers <joseph@codesourcery.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 04, 2020 at 03:00:51PM -0400, David Edelsohn wrote:
> On Thu, Jun 4, 2020 at 1:46 PM Rich Felker <dalias@libc.org> wrote:
> >
> > On Thu, Jun 04, 2020 at 12:33:12PM -0500, Segher Boessenkool wrote:
> > > On Thu, Jun 04, 2020 at 01:18:44PM -0400, Rich Felker wrote:
> > > > On Thu, Jun 04, 2020 at 12:12:32PM -0500, Segher Boessenkool wrote:
> > > > > On Tue, Jun 02, 2020 at 05:13:25PM +0200, Daniel Kolesa wrote:
> > > > > > well, ppc64le already cannot be run on those, as far as I know (I
> > > > > > don't think it's possible to build ppc64le userland without VSX in
> > > > > > any configuration)
> > > > >
> > > > > VSX is required by the ELFv2 ABI:
> > > > >
> > > > > """
> > > > > Specifically, to use this ABI and ABI-compliant programs, OpenPOWER-
> > > > > compliant processors must implement the following categories:
> > > >
> > > > This is not actually ABI but IBM policy laundered into an ABI
> > > > document, which musl does not honor.
> > >
> > > It is the ABI.  If you think it should be different, make your own ABI,
> > > don't pretend the existing ABI is different than what it is.  Thank you.
> >
> > Our ABI is as specified in the ELFv2 document, but with ld as ld64,
> > and minus gratuitous requirements on ISA level that are not part of
> > implementing linkage.
> 
> Rich,
> 
> If you are changing the Power ELFv2 ABI then it is not the Power ELFv2
> ABI.  You can't cherry-pick what you like and claim that it is
> compatible.  You are not conforming to the ABI.

You are aware of this and you are aware that I don't care about your
opinion on the matter, and that I don't appreciate your ongoing
harassment of users of musl who run on pre-POWER8 hardware that IBM
does not approve them using.

Rich
