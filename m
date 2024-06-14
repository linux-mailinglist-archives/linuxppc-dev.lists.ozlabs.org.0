Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9FE908091
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 03:16:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0hFc0Hgxz3cTf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 11:16:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0hFB2v3Pz3cTZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 11:16:28 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 45E18v5Y029218;
	Thu, 13 Jun 2024 20:08:57 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 45E18uJY029217;
	Thu, 13 Jun 2024 20:08:56 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 13 Jun 2024 20:08:56 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH] build: retain intermediate .aux.o targets
Message-ID: <20240614010856.GK19790@gate.crashing.org>
References: <20240612044234.212156-1-npiggin@gmail.com> <20240612082847.GG19790@gate.crashing.org> <D1ZBO021MLHV.3C7E4V3WOHO8V@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D1ZBO021MLHV.3C7E4V3WOHO8V@gmail.com>
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
Cc: linux-s390@vger.kernel.org, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 14, 2024 at 10:43:39AM +1000, Nicholas Piggin wrote:
> On Wed Jun 12, 2024 at 6:28 PM AEST, Segher Boessenkool wrote:
> > On Wed, Jun 12, 2024 at 02:42:32PM +1000, Nicholas Piggin wrote:
> > > arm, powerpc, riscv, build .aux.o targets with implicit pattern rules
> > > in dependency chains that cause them to be made as intermediate files,
> > > which get removed when make finishes. This results in unnecessary
> > > partial rebuilds. If make is run again, this time the .aux.o targets
> > > are not intermediate, possibly due to being made via different
> > > dependencies.
> > > 
> > > Adding .aux.o files to .PRECIOUS prevents them being removed and solves
> > > the rebuild problem.
> > > 
> > > s390x does not have the problem because .SECONDARY prevents dependancies
> > > from being built as intermediate. However the same change is made for
> > > s390x, for consistency.
> >
> > This is exactly what .SECONDARY is for, as its documentation says,
> > even.  Wouldn't it be better to just add a .SECONDARY to the other
> > targets as well?
> 
> Yeah we were debating that and agreed .PRECIOUS may not be the
> cleanest fix but since we already use that it's okay for a
> minimal fix.

But why add it to s390x then?  It is not a fix there at all!


Segher
