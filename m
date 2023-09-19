Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B507A67FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 17:24:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rqlnv1hv3z3cRC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 01:24:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqlnK5nC3z2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 01:24:03 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 38JFGXnW031198;
	Tue, 19 Sep 2023 10:16:33 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 38JFGUOK031195;
	Tue, 19 Sep 2023 10:16:30 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 19 Sep 2023 10:16:30 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Peter Lafreniere <peter@n8pjl.ca>
Subject: Re: [PATCH 0/7] arch/*: config: Remove ReiserFS from defconfig
Message-ID: <20230919151630.GO19790@gate.crashing.org>
References: <20230918175529.19011-1-peter@n8pjl.ca> <20230918234108.GN19790@gate.crashing.org> <20230919000026.7409-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919000026.7409-1-peter@n8pjl.ca>
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
Cc: linux-m68k@vger.kernel.org, tsbogend@alpha.franken.de, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-sh@vger.kernel.org, linux@armlinux.org.uk, richard.henderson@linaro.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, richard@nod.at, ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, geert@linux-m68k.org, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, anton.ivanov@cambridgegreys.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 19, 2023 at 12:00:34AM +0000, Peter Lafreniere wrote:
> On Monday, September 18th, 2023 at 19:41, Segher Boessenkool <segher@kernel.crashing.org> wrote:
> > On Mon, Sep 18, 2023 at 05:56:09PM +0000, Peter Lafreniere wrote:
> > 
> > > ReiserFS has been considered deprecated for 19 months since commit
> > > eb103a51640e ("reiserfs: Deprecate reiserfs"). However, there are
> > > several architectures that still build it into their defconfig kernels.
> > > 
> > > As ReiserFS will be removed in 2025, delete all ReiserFS-related options
> > > from defconfig files before the filesystem's removal.
> > 
> > 
> > This is essentially equivalent to deleting the filesystem now. Why do
> > this? Is there such a hurry?
> 
> This is not equivalent to deleting the filesystem. The filesystem can still
> be configured into kernels, and few distros use a defconfig kernel anyway.

Most people who compile kernels use defconfigs though.  Distros are a
tiny minority if you look at builds.

Again: why do you want this?


Segher
