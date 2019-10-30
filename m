Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34229EA7DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 00:38:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473PzV20mmzF4hF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 10:38:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473Pkh5tQszF4Bq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 10:27:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 473Pkg5qgtz8xC3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 10:27:39 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 473Pkg25rhz9sPl; Thu, 31 Oct 2019 10:27:39 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 473Pkf0GZ0z9sPk;
 Thu, 31 Oct 2019 10:27:37 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x9UNRXLI021100;
 Wed, 30 Oct 2019 18:27:33 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x9UNRX9W021098;
 Wed, 30 Oct 2019 18:27:33 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 30 Oct 2019 18:27:32 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/tools: Don't quote $objdump in scripts
Message-ID: <20191030232732.GS28442@gate.crashing.org>
References: <20191024004730.32135-1-mpe@ellerman.id.au>
 <20191024172857.GS28442@gate.crashing.org>
 <87sgnabg88.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sgnabg88.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 30, 2019 at 10:55:03PM +1100, Michael Ellerman wrote:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> > On Thu, Oct 24, 2019 at 11:47:30AM +1100, Michael Ellerman wrote:
> >> Some of our scripts are passed $objdump and then call it as
> >> "$objdump". This doesn't work if it contains spaces because we're
> >> using ccache, for example you get errors such as:
> >> 
> >>   ./arch/powerpc/tools/relocs_check.sh: line 48: ccache ppc64le-objdump: No such file or directory
> >>   ./arch/powerpc/tools/unrel_branch_check.sh: line 26: ccache ppc64le-objdump: No such file or directory
> >> 
> >> Fix it by not quoting the string when we expand it, allowing the shell
> >> to do the right thing for us.
> >
> > This breaks things for people with spaces in their paths.
> 
> Spaces in their what? Who does that? :)

I know, right?

> Also we don't support it:
> 
>   $ pwd
>   $ /home/michael/foo bar
>   $ make clean
>   Makefile:147: *** source directory cannot contain spaces or colons.  Stop.

Of course.  But it's shell scripting 101 that you *do* quote all variable
expansions.  Do you want to set a bad example?  ;-)


Segher
