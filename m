Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D2B851B83
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 18:32:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYWjk5LwMz3d3W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 04:32:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYWjG2MPCz3bwd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 04:31:45 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 41CHUh3X012877;
	Mon, 12 Feb 2024 11:30:43 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 41CHUhUG012876;
	Mon, 12 Feb 2024 11:30:43 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 12 Feb 2024 11:30:43 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH] powerpc: Add gpr1 and fpu save/restore functions
Message-ID: <20240212173043.GX19790@gate.crashing.org>
References: <995988479.14839534.1707756078600.JavaMail.zimbra@raptorengineeringinc.com> <20240212170207.GW19790@gate.crashing.org> <1251499652.14843228.1707757778984.JavaMail.zimbra@raptorengineeringinc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1251499652.14843228.1707757778984.JavaMail.zimbra@raptorengineeringinc.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 12, 2024 at 11:09:38AM -0600, Timothy Pearson wrote:
> There is existing code in the kernel right now to provide support functions for gpr0 and altivec save/restore.  I don't know the full story here, but at some point in the kernel's history it seems to have been decided to provide the helper functions in lieu of linking libgcc directly.  If this is incorrect, then I need to know that so I can rework the patch to enable libcc and remove the existing support functions.
> 
> Is there anyone on-list that knows more of the history and decision-making that went into the current state of the kernel here?

Long long time ago, linux-0.11 or something, it was discovered that some
programmiing mistakes resulted in double-length divisions (64x64->64 on
32-bit systems, say).  Most architectures have no hardware support for
that, x86 is one of those; so you need very expensive support routines
to do that (_udivdi3 or _divdi3 in that case, ...ti3 on 64-bit archs).

So it was decided to not link to libgcc to avoid this.  But that means
that all the extremely many other suppoort routines, more for some other
archs, are also not there.  While it would have been much easier to just
link to something that provides the _{u,}divdi3 symbol and then causes a
forced linking error from that!


Segher
