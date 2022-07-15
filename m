Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C275763BE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 16:39:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkvBj29R8z3cgs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 00:39:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkvBH5TCCz3c5p
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 00:39:02 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26FEZtii021186;
	Fri, 15 Jul 2022 09:35:55 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26FEZshl021184;
	Fri, 15 Jul 2022 09:35:54 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 15 Jul 2022 09:35:54 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH Linux] powerpc: add documentation for HWCAPs
Message-ID: <20220715143554.GY25951@gate.crashing.org>
References: <20220524093828.505575-1-npiggin@gmail.com> <87ee0juukf.fsf@oldenburg.str.redhat.com> <20220524183236.GJ25951@gate.crashing.org> <1657846871.9qtz2ahf6c.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1657846871.9qtz2ahf6c.astroid@bobo.none>
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
Cc: Florian Weimer <fweimer@redhat.com>, gcc@gcc.gnu.org, libc-alpha@sourceware.org, linuxppc-dev@lists.ozlabs.org, Paul E Murphy <murphyp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 15, 2022 at 11:17:24AM +1000, Nicholas Piggin wrote:
> Excerpts from Segher Boessenkool's message of May 25, 2022 4:32 am:
> > Linux runs on ISA 1.xx and ISA 2.01 machines still.  "Category" wasn't
> > invented for either yet either, but similar concepts did exist of
> > course.
> 
> Not sure what to say about this. It now also has "Compliancy Subset"
> although maybe that's more like a set of features rather than
> incompatible features or modes such as some of the category stuff
> seems to be. I'll try add something.

The compliancy subset stuff is an attempt to simplify things again.
In most cases you want to require a whole swath of feature at once,
if you really try to support fine-grained optional features you need to
test thousands of configurations, while you really can test only ten
(if you are lucky!)

Maybe it is best to just be a bit vague here?


Segher
