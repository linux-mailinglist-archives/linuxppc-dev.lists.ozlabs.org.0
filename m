Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4F5E723D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 05:00:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYcMp4bJjz3cdr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 13:00:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYcMM6wMRz2xk6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 12:59:59 +1000 (AEST)
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 28N2vYVY028156;
	Thu, 22 Sep 2022 21:57:35 -0500
Message-ID: <575f239205e8635add81c9f902b7d9db7beb83ea.camel@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/pci: Enable PCI domains in /proc when PCI bus
 numbers are not unique
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Pali =?ISO-8859-1?Q?Roh=E1r?=
	 <pali@kernel.org>
Date: Fri, 23 Sep 2022 12:57:32 +1000
In-Reply-To: <87wnanu4vf.fsf@mpe.ellerman.id.au>
References: <20220820115113.30581-1-pali@kernel.org>
	 <878rnclq47.fsf@mpe.ellerman.id.au> <20220825083713.4glfivegmodluiun@pali>
	 <87wnanu4vf.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-09-01 at 13:53 +1000, Michael Ellerman wrote:
> >=20
> > I sent two patches which do another steps to achieve it:
> > https://lore.kernel.org/linuxppc-dev/20220817163927.24453-1-pali@kernel=
.org/t/#u
> >=20
> > Main blocker is pci-OF-bus-map which is in direct conflict with
> > CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT and which used on chrp and pmac=
.
> > And I have no idea if pci-OF-bus-map is still needed or not.
>=20
> Yeah thanks, I saw those patches.
>=20
> I can't find any code that refers to pci-OF-bus-map, so I'm inclined to
> remove it entirely.
>=20
> But I'll do some more searching to see if I can find any references to
> it in old code.

Trying to remember ... :-)

So this is what I recall at this point:

 - Ancient X11 didn't understand domains in /proc and thus would barf,
which was the primary reason for not enabling them always iirc...

 - There might be something else with early PowerMacs (Grand Central
chipset) where we have effectively two domains (gc and chaos) but
overlapping bus numbers. There might still be pre-historical code in
there that assumes it's that way though I can't see anything obvious.
Paul might still have one of these :-) (PowerMac 7200/7500/8500/9500
afaik).

 - pci-OF-bus-map predates the PCI layer keeping track of the PCI/OF
relationship. I don't believe it's still used anywhere in the kernel,
though it's possible (unlikely ?) that some garbage remains in
userspace that does.

At this point, I wouldn't object to tearing this all out and just
having domains always (and see what the fallout is).

Cheers,
Ben.
