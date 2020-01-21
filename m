Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BC0143BEB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 12:18:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4825dT5yvHzDqPC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 22:18:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.36; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0036.hostedemail.com
 [216.40.44.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4825bG4J60zDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 22:16:56 +1100 (AEDT)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 791E718224D9C;
 Tue, 21 Jan 2020 11:16:52 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::,
 RULES_HIT:41:355:379:599:901:960:967:973:982:988:989:1260:1263:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2194:2198:2199:2200:2393:2525:2553:2561:2564:2682:2685:2828:2859:2892:2895:2902:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3608:3622:3657:3770:3865:3867:3868:3871:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:4659:5007:6997:7974:9025:9388:10004:10049:10400:11026:11232:11473:11658:11852:11855:11914:12043:12296:12297:12555:12740:12760:12895:13019:13069:13311:13357:13439:14094:14096:14181:14659:14721:14764:14775:14777:14849:21080:21627:21691:21939:30054:30075:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: toys51_3bc2dfa430738
X-Filterd-Recvd-Size: 2336
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Tue, 21 Jan 2020 11:16:50 +0000 (UTC)
Message-ID: <24012ba289823e9e38c2f89116a5f61581ef3909.camel@perches.com>
Subject: Re: [PATCH -next] powerpc/maple: fix comparing pointer to 0
From: Joe Perches <joe@perches.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Date: Tue, 21 Jan 2020 03:15:49 -0800
In-Reply-To: <20200121074723.GF3191@gate.crashing.org>
References: <20200121013153.9937-1-chenzhou10@huawei.com>
 <618f58cd46f0e4fd619cb2ee3c76665a28e30f4e.camel@perches.com>
 <20200121074723.GF3191@gate.crashing.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
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
Cc: Chen Zhou <chenzhou10@huawei.com>, linux-kernel@vger.kernel.org,
 nivedita@alum.mit.edu, paulus@samba.org, gregkh@linuxfoundation.org,
 tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, allison@lohutok.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-01-21 at 01:47 -0600, Segher Boessenkool wrote:
> On Mon, Jan 20, 2020 at 05:52:15PM -0800, Joe Perches wrote:
> > On Tue, 2020-01-21 at 09:31 +0800, Chen Zhou wrote:
> > > Fixes coccicheck warning:
> > > ./arch/powerpc/platforms/maple/setup.c:232:15-16:
> > > 	WARNING comparing pointer to 0
> > 
> > Does anyone have or use these powerpc maple boards anymore?
> > 
> > Maybe the whole codebase should just be deleted instead.
> 
> This is used for *all* non-Apple 970 systems (not running virtualized),
> not just actual Maple.

OK, then likely this Kconfig description should be updated
(and the http://www.970eval.com link is no longer about powerpc)

$ cat arch/powerpc/platforms/maple/Kconfig
# SPDX-License-Identifier: GPL-2.0
config PPC_MAPLE
	depends on PPC64 && PPC_BOOK3S && CPU_BIG_ENDIAN
	bool "Maple 970FX Evaluation Board"
	select FORCE_PCI
	select MPIC
	select U3_DART
	select MPIC_U3_HT_IRQS
	select GENERIC_TBSYNC
	select PPC_UDBG_16550
	select PPC_970_NAP
	select PPC_NATIVE
	select PPC_RTAS
	select MMIO_NVRAM
	select ATA_NONSTANDARD if ATA
	help
	  This option enables support for the Maple 970FX Evaluation Board.
	  For more information, refer to <http://www.970eval.com>



