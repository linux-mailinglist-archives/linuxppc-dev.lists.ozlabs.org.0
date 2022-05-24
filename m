Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52851533088
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 20:36:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L72vm1s3Fz3cCm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 04:36:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4L72vM70j1z2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 04:35:43 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 24OIWbnb027426;
 Tue, 24 May 2022 13:32:37 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 24OIWai1027425;
 Tue, 24 May 2022 13:32:36 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 24 May 2022 13:32:36 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH Linux] powerpc: add documentation for HWCAPs
Message-ID: <20220524183236.GJ25951@gate.crashing.org>
References: <20220524093828.505575-1-npiggin@gmail.com>
 <87ee0juukf.fsf@oldenburg.str.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ee0juukf.fsf@oldenburg.str.redhat.com>
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul E Murphy <murphyp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 24, 2022 at 11:52:00AM +0200, Florian Weimer wrote:
> * Nicholas Piggin:
> 
> > +2. Facilities
> > +-------------
> > +The Power ISA uses the term "facility" to describe a class of instructions,
> > +registers, interrupts, etc. The presence or absence of a facility indicates
> > +whether this class is available to be used, but the specifics depend on the
> > +ISA version. For example, if the VSX facility is available, the VSX
> > +instructions that can be used differ between the v3.0B and v3.1B ISA
> > +verstions.
> 
> The 2.07 ISA manual also has categories.  ISA 3.0 made a lot of things
> mandatory.  It may make sense to clarify that feature bits for mandatory
> aspects of the ISA are still set, to help with backwards compatibility.

Linux runs on ISA 1.xx and ISA 2.01 machines still.  "Category" wasn't
invented for either yet either, but similar concepts did exist of
course.


Segher
