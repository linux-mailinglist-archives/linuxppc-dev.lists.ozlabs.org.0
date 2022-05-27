Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 075B9535706
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 02:24:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8QXJ6vFCz3cgR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 10:24:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8QWX4kcmz2xn8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 10:23:20 +1000 (AEST)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 24R0GV21032451;
	Thu, 26 May 2022 19:16:32 -0500
Message-ID: <6c5d22c3f3743cf5dfe5eac1d52211942dc2fff8.camel@kernel.crashing.org>
Subject: Re: [PATCH net-next] eth: de4x5: remove support for Generic DECchip
 & DIGITAL EtherWORKS PCI/EISA
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 May 2022 10:16:30 +1000
In-Reply-To: <alpine.DEB.2.22.394.2205260933520.394690@ramsan.of.borg>
References: <20220519031345.2134401-1-kuba@kernel.org>
	 <f84c4cb17eebe385fe22c3fc4563645742269d46.camel@kernel.crashing.org>
	 <alpine.DEB.2.22.394.2205260933520.394690@ramsan.of.borg>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, arnd@arndb.de, corbet@lwn.net, netdev@vger.kernel.org, sburla@marvell.com, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, edumazet@google.com, paulus@samba.org, vburru@marvell.com, Jakub Kicinski <kuba@kernel.org>, zhangyue1@kylinos.cn, pabeni@redhat.com, aayarekar@marvell.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-05-26 at 09:43 +0200, Geert Uytterhoeven wrote:
>  	Hi Ben,
> 
> On Sat, 21 May 2022, Benjamin Herrenschmidt wrote:
> > On Wed, 2022-05-18 at 20:13 -0700, Jakub Kicinski wrote:
> > > Looks like almost all changes to this driver had been tree-wide
> > > refactoring since git era begun. There is one commit from Al
> > > 15 years ago which could potentially be fixing a real bug.
> > > 
> > > The driver is using virt_to_bus() and is a real magnet for pointless
> > > cleanups. It seems unlikely to have real users. Let's try to shed
> > > this maintenance burden.
> > > 
> > > Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> > 
> > Removing this driver will kill support for some rather old PowerMac
> > models (some PowerBooks I think, paulus would know). No objection on my
> > part, though. I doubt people still use these things with new kernels
> > but ... who knows ? :-)
> 
> Aren't these PCI, and thus working fine with the PCI-only DE2104X
> (dc2104x) or TULIP (dc2114x) drivers?
> 
> IIRC, I've initially used the de4x5 driver on Alpha (UDB/Multia) or PPC
> (CHRP), but switched to the TULIP driver later (that was before the
> dc2104x/dc2114x driver split, hence a loooong time ago).

I'm pretty sure there were some old Macs who worked with de4x5 and not
tulip but I wouldn't rememeber the details and I'm not sure any of this
hardware still exist in the field nor matters.

Cheers,
Ben.

