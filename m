Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AB9325A1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 01:24:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HDmb2mCZzDqPG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 09:24:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HDlM60fFzDqMb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 09:23:43 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x52NNW8Z013902;
 Sun, 2 Jun 2019 18:23:33 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x52NNU3p013901;
 Sun, 2 Jun 2019 18:23:30 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sun, 2 Jun 2019 18:23:30 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH kernel] prom_init: Fetch flatten device tree from the
 system firmware
Message-ID: <20190602232330.GN31586@gate.crashing.org>
References: <20190501034221.18437-1-aik@ozlabs.ru>
 <a62a8612-77f5-5c6b-a6a2-15f006051d5e@ozlabs.ru>
 <20190530193736.GC31586@gate.crashing.org>
 <43f037c57eed8ad2175470c940917dced947bb70.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43f037c57eed8ad2175470c940917dced947bb70.camel@kernel.crashing.org>
User-Agent: Mutt/1.4.2.3i
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Fri, May 31, 2019 at 11:03:26AM +1000, Benjamin Herrenschmidt wrote:
> On Thu, 2019-05-30 at 14:37 -0500, Segher Boessenkool wrote:
> > On Thu, May 30, 2019 at 05:09:06PM +1000, Alexey Kardashevskiy wrote:
> > > so, it is sort-of nack from David and sort-of ack from Segher, what
> > > happens now?
> > 
> > Maybe what we really need just a CI call to get all properties of a node
> > at once?  Will that speed up things enough?
> > 
> > That way you need no change at all in lifetime of properties and how they
> > are used, etc.; just a client getting the properties is a lot faster.
> 
> Hrm... if we're going to create a new interface, let's go for what we
> need.
> 
> What we need is the FDT. It's a rather ubiquitous thing these days, it
> makes sense to have a way to fetch an FDT directly from FW.

That is all you need if you do not want to use OF at all.

If you *do* want to keep having an Open Firmware, what we want or need
is a faster way to walk huge device trees.

> There is no use for the "fetch all properties" cases other than
> building an FDT that any of us can think of, and it would create a more
> complicated interface than just "fetch an FDT".

It is a simple way to speed up fetching the device tree enormously,
without needing big changes to either OF or the clients using it -- not
in the code, but importantly also not conceptually: everything works just
as before, just a lot faster.

> So I go for the simple one and agree with Alexey's idea.

When dealing with a whole device tree you have to know about the various
dynamically generated nodes and props, and handle each appropriately.


Segher
