Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2503BA951
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 17:59:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GHGqK1qxrz30Cm
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jul 2021 01:59:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GHGpw5nvhz2yRT
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Jul 2021 01:59:19 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 163Fs1rg021323;
 Sat, 3 Jul 2021 10:54:01 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 163FrvdE021319;
 Sat, 3 Jul 2021 10:53:57 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sat, 3 Jul 2021 10:53:57 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.ne@posteo.net>
Subject: Re: [PATCH v2 3/4] powerpc: wii.dts: Expose the OTP on this platform
Message-ID: <20210703155357.GG1583@gate.crashing.org>
References: <20210519095044.4109-1-linkmauve@linkmauve.fr>
 <20210519095044.4109-4-linkmauve@linkmauve.fr> <YNe5aW55SrXFGKFV@latitude>
 <20210701195655.knbcikdga57a7epx@luna> <YN7Uv/43TwL4+9ic@latitude>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YN7Uv/43TwL4+9ic@latitude>
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
Cc: devicetree@vger.kernel.org, Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ash Logan <ash@heyquark.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 02, 2021 at 08:56:31AM +0000, Jonathan Neuschäfer wrote:
> On Thu, Jul 01, 2021 at 09:56:55PM +0200, Emmanuel Gil Peyrot wrote:
> > On Sat, Jun 26, 2021 at 11:34:01PM +0000, Jonathan Neuschäfer wrote:
> > > On Wed, May 19, 2021 at 11:50:43AM +0200, Emmanuel Gil Peyrot wrote:
> [...]
> > > > +		otp@d8001ec {
> > > > +			compatible = "nintendo,hollywood-otp";
> > > > +			reg = <0x0d8001ec 0x8>;
> > > 
> > > The OTP registers overlap with the previous node, control@d800100.
> > > Not sure what's the best way to structure the devicetree in this case,
> > > maybe something roughly like the following (untested, unverified):
> > [snip]
> > 
> > I couldn’t get this to work, but additionally it looks like it should
> > start 0x100 earlier and contain pic1@d800030 and gpio@d8000c0, given
> > https://wiibrew.org/wiki/Hardware/Hollywood_Registers
> > 
> > Would it make sense, for the time being, to reduce the size of this
> > control@d800100 device to the single register currently being used by
> > arch/powerpc/platforms/embedded6xx/wii.c (0xd800194, used to reboot the
> > system) and leave the refactor of restart + OTP + PIC + GPIO for a
> > future series?
> 
> Makes sense to me!

There is no benefit to pretending there is a "control" bus (there is no
such thing), it only gets in the way.


Segher
