Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D4D18A721
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 22:34:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jNbG3sYczDr8H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 08:34:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jNRm0QYjzDr4m
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 08:27:47 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 02ILRRa8012989;
 Wed, 18 Mar 2020 16:27:28 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 02ILRQ0s012988;
 Wed, 18 Mar 2020 16:27:26 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 18 Mar 2020 16:27:26 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 12/15] powerpc/watchpoint: Prepare handler to handle more
 than one watcnhpoint
Message-ID: <20200318212726.GN22482@gate.crashing.org>
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-13-ravi.bangoria@linux.ibm.com>
 <3ba94856-0d87-5046-eca9-b5c3d99ec654@c-s.fr>
 <87zhcdevz7.fsf@mpe.ellerman.id.au>
 <a7829a23-9b4d-0248-415e-85409f17dd77@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7829a23-9b4d-0248-415e-85409f17dd77@c-s.fr>
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
Cc: apopple@linux.ibm.com, mikey@neuling.org,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, peterz@infradead.org,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, fweisbec@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 18, 2020 at 12:44:52PM +0100, Christophe Leroy wrote:
> Le 18/03/2020 à 12:35, Michael Ellerman a écrit :
> >Christophe Leroy <christophe.leroy@c-s.fr> writes:
> >>Le 09/03/2020 à 09:58, Ravi Bangoria a écrit :
> >>>Currently we assume that we have only one watchpoint supported by hw.
> >>>Get rid of that assumption and use dynamic loop instead. This should
> >>>make supporting more watchpoints very easy.
> >>
> >>I think using 'we' is to be avoided in commit message.
> >
> >Hmm, is it?
> >
> >I use 'we' all the time. Which doesn't mean it's correct, but I think it
> >reads OK.
> >
> >cheers
> 
> From 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html :
> 
> Describe your changes in imperative mood, e.g. “make xyzzy do frotz” 
> instead of “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy 
> to do frotz”, as if you are giving orders to the codebase to change its 
> behaviour.

That is what is there already?  "Get rid of ...".

You cannot describe the current situation with an imperative.


Segher
