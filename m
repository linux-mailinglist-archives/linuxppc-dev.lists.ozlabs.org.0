Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6155767F7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 22:03:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ll2Nk3lJyz3cCk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 06:03:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ll2NC2b1bz2xrY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 06:03:06 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26FJxqhD032654;
	Fri, 15 Jul 2022 14:59:52 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26FJxp9u032647;
	Fri, 15 Jul 2022 14:59:51 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 15 Jul 2022 14:59:51 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Tulio Magno Quites Machado Filho <tuliom@ascii.art.br>
Subject: Re: [PATCH v2] powerpc: add documentation for HWCAPs
Message-ID: <20220715195951.GA25951@gate.crashing.org>
References: <20220715012636.165948-1-npiggin@gmail.com> <877d4euskv.fsf@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877d4euskv.fsf@linux.ibm.com>
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
Cc: Florian Weimer <fweimer@redhat.com>, gcc@gcc.gnu.org, libc-alpha@sourceware.org, Nicholas Piggin <npiggin@gmail.com>, Paul E Murphy <murphyp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 15, 2022 at 03:41:20PM -0300, Tulio Magno Quites Machado Filho wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
> 
> > +PPC_FEATURE_ARCH_2_05
> > +    The processor supports the v2.05 userlevel architecture. Processors
> > +    supporting later architectures also set this feature.
> 
> I don't think this bit is enabled when processors support later architectures.
> In my tests, this behavior started only with v2.06, i.e. processors that
> support v2.07 enable bit v2.06, but do not enable bit v2.05.

That is a usability problem.  Can it be fixed, or will that create its
own compatibility problems?  In practice I mean.  If it is, the C
libraries could fix it up, for new programs, and then after a while the
kernel can do the sane thing?

How big is the problem, anyway?  Is it only 2.05, or also 2.04, 2.03?


Segher
