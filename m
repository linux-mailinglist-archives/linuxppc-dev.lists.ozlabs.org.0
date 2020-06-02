Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF741EB32E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 04:00:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bZxD0XW3zDqQN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 12:00:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49bZvK2YsszDqMW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 11:58:21 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 0521w3Ot014392;
 Mon, 1 Jun 2020 20:58:03 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 0521w2aI014389;
 Mon, 1 Jun 2020 20:58:02 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 1 Jun 2020 20:58:02 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Daniel Kolesa <daniel@octaforge.org>
Subject: Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200602015802.GN31009@gate.crashing.org>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, musl@lists.openwall.com,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>, linuxppc-dev@lists.ozlabs.org,
 Joseph Myers <joseph@codesourcery.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 02, 2020 at 01:26:37AM +0200, Daniel Kolesa wrote:
> On Mon, Jun 1, 2020, at 23:28, Joseph Myers wrote:
> Are you sure this would be a new port? Glibc already works in this combination, as it seems to me it'd be best if it was just a variant of the existing 32-bit PowerPC port, sharing most conventions besides endianness with the BE port.

That's right.  Except it isn't an "official" existing port, never has
been "officially" supported.

> 128-bit IEEE long double would not work, since that relies on VSX being present (gcc will explicitly complain if it's not). I'd be all for using 64-bit long double, though (musl already does, on all ppc ports).

The current IEEE QP float support requires VSX for its emulation, yes
(possibly even Power8?)  As Mike reminded me today, it also requires
__int128 support, which rules out anything 32-bit currently.  Without
that restriction, we could just make QP float passed in GPRs (use the
ABIs for any struct passed that way), and that'll just work out with
all ABIs, older or not.

> While we're at long double, I'd actually be interested in transitioning the existing big endian ports in Void (64-bit and 32-bit, neither has VSX baseline requirement in my case) to using 64-bit long double, abandoning the IBM format altogether (little endian will transition to 128-bit IEEE long double once it's ready on your side, as that assumes POWER8 baseline which includes VSX).

I recommend new ports that cannot jump to IEEE QP float directly to use
long double == double for the time being, avoiding the extra
complications that IBM double double would bring.  But you'll still have
a transition to IEEE 128 if you ever want to go there.

But if you already use double-double, I don't know if the cost changing
away from that is worth it now.

> What would be the best way for me to proceed with that? I actually experimented with this, using the old glibc compat symbols from pre-ibm128 times, and I mostly had it working, except I haven't managed to find a way to switch the default symbols to 64-bit ones, which is problematic as linking everything against nldbl_nonshared is fragile and potentially quirky (breaks dlsym, function pointer equality across libraries, etc).

Yup.  "Rebuild the world" works :-/  I don't have any  better advice,
nothing you cannot figure out yourself.

> There is also one more thing while we're at this. The 64-bit big endian Void port uses the ELFv2 ABI, even on glibc. This is not officially supported on glibc as far as I can tell, but it does work out of box, without any patching (things in general match little endian then, i.e. ld64.so.2 etc, but they're big endian). Is there any chance of making that support official?

(I don't talk for glibc).

The first thing needed is for "us" to have faith in it.  That starts
with seeing test results for the testsuites!

(Something similar goes for the GCC port -- there is no official support
for BE ELFv2, but of course it does work, and if we get test results we
may keep it that way, hint hint :-) )


Segher
