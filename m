Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E18C339E1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 23:19:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hny36gy9zDqY2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 07:19:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hnwx2RqCzDqH4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 07:18:57 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x53LIh1w010156;
 Mon, 3 Jun 2019 16:18:44 -0500
Message-ID: <32063141651fd502c8ce94be19cb5c5330ce39bd.camel@kernel.crashing.org>
Subject: Re: [PATCH kernel] prom_init: Fetch flatten device tree from the
 system firmware
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Segher Boessenkool
 <segher@kernel.crashing.org>
Date: Tue, 04 Jun 2019 07:18:42 +1000
In-Reply-To: <7fc6cd5e-ddd6-4028-b4ef-7bdcd6db69d0@ozlabs.ru>
References: <20190501034221.18437-1-aik@ozlabs.ru>
 <a62a8612-77f5-5c6b-a6a2-15f006051d5e@ozlabs.ru>
 <20190530193736.GC31586@gate.crashing.org>
 <43f037c57eed8ad2175470c940917dced947bb70.camel@kernel.crashing.org>
 <20190602232330.GN31586@gate.crashing.org>
 <7fc6cd5e-ddd6-4028-b4ef-7bdcd6db69d0@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-06-03 at 12:56 +1000, Alexey Kardashevskiy wrote:
> 
> > That is all you need if you do not want to use OF at all.
> 
> ? We also need OF drivers to boot grub and the system, and a default
> console for early booting, but yes, we do not want to keep using slof
> that much.
> 
> > If you *do* want to keep having an Open Firmware, what we want or need
> > is a faster way to walk huge device trees.
> 
> Why? We do not need to _walk_ the tree at all (we _have_ to now and
> while walking we do nothing but pack everything together into the fdt
> blob) as slof can easily do this already.

I agree with Alexey. In a sense this can be thought as an extension of
"quiesce", which effectively kills OF.

Yes we could make property fetching faster but mostly by creating a new
bulk interface which is quite a bit of work, a new API, and will in
practice not be used for anything other than creating the FDT. In that
case, nothing will beat in performance having OF create the FDT itself
based on its current tree.

> > > There is no use for the "fetch all properties" cases other than
> > > building an FDT that any of us can think of, and it would create a more
> > > complicated interface than just "fetch an FDT".
> > 
> > It is a simple way to speed up fetching the device tree enormously,
> > without needing big changes to either OF or the clients using it -- not
> > in the code, but importantly also not conceptually: everything works just
> > as before, just a lot faster.
> 
> I can safely presume though that this will never ever be used in
> practice. And it will be still slower, a tiny bit. And require new code
> in both slof and linux.

Correct.

> I can rather see us getting rid of SLOF in the future which in turn will
> require the fdt blob pointer in r5 (or whatever it is, forgot) when the
> guest starts; so "fetch-all-props" won't be used there either.
> 
> > > So I go for the simple one and agree with Alexey's idea.
> > 
> > When dealing with a whole device tree you have to know about the various
> > dynamically generated nodes and props, and handle each appropriately.
> 
> The code I am changing fetches the device tree and build an fdt. What is
> that special knowledge in this context you are talking about?

Ben.


