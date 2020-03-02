Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3615B175AC8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 13:47:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WKg41cZmzDqYX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 23:47:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WKbf2PwVzDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 23:44:45 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 022CigGl022511;
 Mon, 2 Mar 2020 06:44:42 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 022Cigx2022509;
 Mon, 2 Mar 2020 06:44:42 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 2 Mar 2020 06:44:42 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: eh_frame confusion
Message-ID: <20200302124442.GI22482@gate.crashing.org>
References: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 02, 2020 at 11:56:05AM +0100, Rasmus Villemoes wrote:
> I'm building a ppc32 kernel, and noticed that after upgrading from gcc-7
> to gcc-8 all object files now end up having .eh_frame section.

Since GCC 8, we enable -fasynchronous-unwind-tables by default for
PowerPC.  See https://gcc.gnu.org/r259298 .

> For
> vmlinux, that's not a problem, because they all get discarded in
> arch/powerpc/kernel/vmlinux.lds.S . However, they stick around in
> modules, which doesn't seem to be useful - given that everything worked
> just fine with gcc-7, and I don't see anything in the module loader that
> handles .eh_frame.

It is useful for debugging.  Not many people debug the kernel like this,
of course.


Segher
