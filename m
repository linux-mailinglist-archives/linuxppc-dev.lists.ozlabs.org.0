Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD9B19477C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 20:35:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pFZB1x3tzDr1Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 06:35:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pFWy4vV9zDqxG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 06:33:18 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AA01AAAC7;
 Thu, 26 Mar 2020 19:33:13 +0000 (UTC)
Date: Thu, 26 Mar 2020 20:33:11 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/64: Fix section mismatch warnings.
Message-ID: <20200326193311.GL25468@kitsune.suse.cz>
References: <20200326163742.28990-1-msuchanek@suse.de>
 <1585245057.hh0vutz28g.naveen@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585245057.hh0vutz28g.naveen@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 26, 2020 at 11:22:03PM +0530, Naveen N. Rao wrote:
> Michal Suchanek wrote:
> > Fixes the following warnings:
> > 
> > WARNING: vmlinux.o(.text+0x2d24): Section mismatch in reference from the variable __boot_from_prom to the function .init.text:prom_init()
> > The function __boot_from_prom() references
> > the function __init prom_init().
> > This is often because __boot_from_prom lacks a __init
> > annotation or the annotation of prom_init is wrong.
> > 
> > WARNING: vmlinux.o(.text+0x2fd0): Section mismatch in reference from the variable start_here_common to the function .init.text:start_kernel()
> > The function start_here_common() references
> > the function __init start_kernel().
> > This is often because start_here_common lacks a __init
> > annotation or the annotation of start_kernel is wrong.
> > 
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> >  arch/powerpc/kernel/head_64.S | 4 ++++
> >  1 file changed, 4 insertions(+)
> 
> Michael committed a similar patch just earlier today:
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=6eeb9b3b9ce588f14a697737a30d0702b5a20293

Missed it because it did not reach master yet.

Thanks

Michal
