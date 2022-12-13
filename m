Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D3B64B51D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 13:26:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWd5J1gTTz3cj1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 23:26:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWd4m2jtTz3bM7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 23:25:43 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2BDCNaYt011018;
	Tue, 13 Dec 2022 06:23:36 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 2BDCNZRl011017;
	Tue, 13 Dec 2022 06:23:35 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 13 Dec 2022 06:23:35 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Mass-building defconfigs: many fail with assembler errors
Message-ID: <20221213122335.GI25951@gate.crashing.org>
References: <20221212215117.aa7255t7qd6yefk4@lug-owl.de> <87bko8j73z.fsf@mpe.ellerman.id.au> <20221213084159.ozxwohsq7q2yuko3@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221213084159.ozxwohsq7q2yuko3@lug-owl.de>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 13, 2022 at 09:41:59AM +0100, Jan-Benedict Glaw wrote:
> On Tue, 2022-12-13 14:49:20 +1100, Michael Ellerman <mpe@ellerman.id.au> wrote:
> > So your script should exclude all files that end in ".config".
> 
> Thanks!  Will just drop those.
> 
> > To find the names of the generated configs you can use something like:
> > 
> >  $ awk '/PHONY \+= .*config/ {print $3}' arch/powerpc/Makefile
> 
> ...and integrate these instead. Thanks a lot!

You can also pretend you are a simple user and use the targets
"make help" and "make help-boards" suggest :-)


Segher
