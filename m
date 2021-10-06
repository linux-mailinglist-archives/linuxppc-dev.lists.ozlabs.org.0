Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1D942491E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 23:40:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPnv05YPsz2yxL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 08:40:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HPntY25Z2z2yJM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 08:40:20 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 196LRU0O007032;
 Wed, 6 Oct 2021 16:27:30 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 196LRS4V007029;
 Wed, 6 Oct 2021 16:27:28 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 6 Oct 2021 16:27:28 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Message-ID: <20211006212728.GM10333@gate.crashing.org>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org> <YV4KkAC2p9D4yCnH@antec>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YV4KkAC2p9D4yCnH@antec>
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
Cc: Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Jonas Bonn <jonas@southpole.se>, Rob Herring <robh@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 bcm-kernel-feedback-list@broadcom.com, James Morse <james.morse@arm.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Ray Jui <rjui@broadcom.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Yoshinori Sato <ysato@users.osdn.me>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 07, 2021 at 05:44:00AM +0900, Stafford Horne wrote:
> You have defined of_get_cpu_hwid to return u64, will this create compiler
> warnings when since we are storing a u64 into a u32?
> 
> It seems only if we make with W=3.

Yes.  This is done by -Wconversion, "Warn for implicit conversions that
may alter a value."

> I thought we usually warned on this.

This warning is not in -Wall or -Wextra either, it suffers too much from
false positives.  It is very natural to just ignore the high bits of
modulo types (which is what "unsigned" types *are*).  Or the bits that
"fall off" on a conversion.  The C standard makes this required
behaviour, it is useful, and it is the only convenient way of getting
this!


Segher
