Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7424E9849
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 15:36:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRtyt2fLgz3c6m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 00:36:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KRtxn34B7z3c0T
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 00:35:56 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 22SDJU00005431;
 Mon, 28 Mar 2022 08:19:30 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 22SDJSov005423;
 Mon, 28 Mar 2022 08:19:28 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 28 Mar 2022 08:19:28 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 01/22] orion5x: Replace comments with C99 initializers
Message-ID: <20220328131928.GH614@gate.crashing.org>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <CAK8P3a1e57mNUQgronhwrsXsuQW9sZYxCktKij7NwsieBWiGmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a1e57mNUQgronhwrsXsuQW9sZYxCktKij7NwsieBWiGmw@mail.gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 linux-atm-general@lists.sourceforge.net, linux-ia64@vger.kernel.org,
 linux-pci <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 "H. Peter Anvin" <hpa@zytor.com>, wcn36xx@lists.infradead.org,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Benjamin =?iso-8859-1?Q?St=FCrz?= <benni@stuerz.xyz>,
 Jason Gunthorpe <jgg@ziepe.ca>, Pkshih <pkshih@realtek.com>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Robert Moore <robert.moore@intel.com>, Harald Welte <laforge@gnumonks.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Chas Williams <3chas3@gmail.com>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 Len Brown <lenb@kernel.org>, mike.marciniszyn@cornelisnetworks.com,
 Robert Richter <rric@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 kvalo@kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Karsten Keil <isdn@linux-pingi.de>, loic.poulain@linaro.org,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Nicolas Pitre <nico@fluxnic.net>, gregkh <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>, Networking <netdev@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 26, 2022 at 08:23:31PM +0100, Arnd Bergmann wrote:
> On Sat, Mar 26, 2022 at 5:58 PM Benjamin Stürz <benni@stuerz.xyz> wrote:
> >
> > This replaces comments with C99's designated
> > initializers because the kernel supports them now.
> 
> The change looks fine, but the comment looks misplaced, as enum initializers
> are not c99 feature.

Yes, it is from C89/C90.

> Also, the named array and struct intializers have been
> supported by gnu89 for a long time and widely used in the kernel, so it's
> not a recent change even for the others.

GCC supports this since 1998.  There was a syntax different from C99
designated initializers (".ans = 42") before (namely, "ans: 42").

1998 is long enough ago for all intents and purposes now of course ;-)


Segher
