Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0782F57F127
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 21:26:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lqx9k0RXCz3c2v
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jul 2022 05:26:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lqx9G1glgz304J
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jul 2022 05:25:37 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26NJMEw8012545;
	Sat, 23 Jul 2022 14:22:15 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26NJMBU3012544;
	Sat, 23 Jul 2022 14:22:11 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 23 Jul 2022 14:22:11 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH] powerpc: Remove the static variable initialisations to 0
Message-ID: <20220723192211.GP25951@gate.crashing.org>
References: <20220723092436.7149-1-wangborong@cdjrlc.com> <20220723133405.GF17705@kitsune.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220723133405.GF17705@kitsune.suse.cz>
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
Cc: lkp@intel.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, Julia.Lawall@inria.fr, paulus@samba.org, Jason Wang <wangborong@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 23, 2022 at 03:34:05PM +0200, Michal Suchánek wrote:
> Hello,
> 
> On Sat, Jul 23, 2022 at 05:24:36PM +0800, Jason Wang wrote:
> > Initialise global and static variable to 0 is always unnecessary.
> > Remove the unnecessary initialisations.
> 
> Isn't this change also unnecessary?
> 
> Initializing to 0 does not affect correctness, or even any kind of
> semantics in any way.

It did make a difference when the kernel was still compiled with
-fcommon (which used to be the GCC default on most configurations, it is
traditional on Unix).  No explicit initialiser puts an object in .bss if
you use -fcommon.  This matters a bit for data layout.

> The current code is slightly easier to understand.
> 
> And changing the code introduces history noise for na gain.

Yup.

This does give you some code golf points of course ;-)


Segher
