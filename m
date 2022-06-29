Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8565560B15
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 22:33:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYCp64lvLz3drn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 06:33:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYCng0x0Bz2xXV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 06:32:37 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 25TKS467028346;
	Wed, 29 Jun 2022 15:28:04 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 25TKS1wF028345;
	Wed, 29 Jun 2022 15:28:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 29 Jun 2022 15:28:01 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 02/12] powerpc: wiiu: device tree
Message-ID: <20220629202800.GJ25951@gate.crashing.org>
References: <20220622131037.57604-1-ash@heyquark.com> <20220628133144.142185-1-ash@heyquark.com> <20220628133144.142185-3-ash@heyquark.com> <c760e444-57c3-0e1a-0e4d-f79d6ae9867a@linaro.org> <20220629161302.GG25951@gate.crashing.org> <908e7555-0090-84fe-4227-d6b349de1394@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <908e7555-0090-84fe-4227-d6b349de1394@linaro.org>
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
Cc: devicetree@vger.kernel.org, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, rw-r-r-0644@protonmail.com, robh+dt@kernel.org, paulus@samba.org, Ash Logan <ash@heyquark.com>, krzysztof.kozlowski+dt@linaro.org, j.ne@posteo.net, linuxppc-dev@lists.ozlabs.org, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 29, 2022 at 08:13:13PM +0200, Krzysztof Kozlowski wrote:
> On 29/06/2022 18:13, Segher Boessenkool wrote:
> > On Wed, Jun 29, 2022 at 11:58:18AM +0200, Krzysztof Kozlowski wrote:
> >>> +		/* TODO: Add SMP */
> >>> +		PowerPC,espresso@0 {
> >>
> >> Node name should be generic, so "cpu". Unless something needs the
> >> specific node name?
> > 
> > This is how most other PowerPC firmwares do it.  The PowerPC processor
> > binding is older than the generic naming practice, so CPU nodes have
> > device_type "cpu" instead.  
> 
> ePAPR 1.0 from 2008 explicitly asks for generic node names. So 4 years
> before Nintento Wii U. Maybe earlier ePAPR-s were also asking for this,
> no clue, don't have them.

The majority of PowerPC 750 systems long predate that.  Many *current*
systems implement the PowerPC Processor Binding, too (not the epapr
thing, which is incompatible with the older standards!)

> > There is no added value in generic naming for CPU nodes anyway, since
> > you just find them as the children of the "/cpus" node :-)
> 
> There is because you might have there caches. It also makes code easier
> to read.

In the processor binding the cache nodes were subnodes of cpu nodes or
other cache nodes.  But in some server products you can have cache that
is enabled while the corresponding core is disabled; and also, not all
cache belongs to only one higher level anyway.  This was modelled pretty
uncleanly, yup (cleaner would have been to have a /caches node as well
as /cpus, for example).

But on 750 you just have "l2-cache" subnodes, and all nodes in /cpus are
CPUs :-)


Segher
