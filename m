Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D99858B68
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 22:11:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZWJ33cM8zDql0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 06:11:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.79; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0079.hostedemail.com
 [216.40.44.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZWDX3MmRzDqFM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 06:08:27 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 16720180A8155;
 Thu, 27 Jun 2019 20:08:22 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::,
 RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1801:1981:2194:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3868:3870:3872:3874:4321:4605:5007:7903:9149:10004:10400:10848:11026:11232:11658:11914:12043:12296:12297:12438:12740:12760:12895:13069:13311:13357:13439:14659:14721:21080:21324:21451:21627:30054:30070:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:30,
 LUA_SUMMARY:none
X-HE-Tag: lunch72_ea9665a28052
X-Filterd-Recvd-Size: 2578
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Thu, 27 Jun 2019 20:08:20 +0000 (UTC)
Message-ID: <55dc85b3e405821baafe9d8868ef921f99b6d103.camel@perches.com>
Subject: Re: [PATCH v2] powerpc/setup_64: fix -Wempty-body warnings
From: Joe Perches <joe@perches.com>
To: Qian Cai <cai@lca.pw>, mpe@ellerman.id.au
Date: Thu, 27 Jun 2019 13:08:19 -0700
In-Reply-To: <1561665166.5154.90.camel@lca.pw>
References: <1559768018-7665-1-git-send-email-cai@lca.pw>
 <1561665166.5154.90.camel@lca.pw>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
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
Cc: linuxppc-dev@lists.ozlabs.org, paulus@samba.org, tyreld@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-06-27 at 15:52 -0400, Qian Cai wrote:
> On Wed, 2019-06-05 at 16:53 -0400, Qian Cai wrote:
> > At the beginning of setup_64.c, it has,
> > 
> >   #ifdef DEBUG
> >   #define DBG(fmt...) udbg_printf(fmt)
> >   #else
> >   #define DBG(fmt...)
> >   #endif
> > 
> > where DBG() could be compiled away, and generate warnings,
> > 
> > arch/powerpc/kernel/setup_64.c: In function 'initialize_cache_info':
> > arch/powerpc/kernel/setup_64.c:579:49: warning: suggest braces around
> > empty body in an 'if' statement [-Wempty-body]
> >     DBG("Argh, can't find dcache properties !\n");
> >                                                  ^
> > arch/powerpc/kernel/setup_64.c:582:49: warning: suggest braces around
> > empty body in an 'if' statement [-Wempty-body]
> >     DBG("Argh, can't find icache properties !\n");
[]
> > diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
[]
> > @@ -71,7 +71,7 @@
> >  #ifdef DEBUG
> >  #define DBG(fmt...) udbg_printf(fmt)
> >  #else
> > -#define DBG(fmt...)
> > +#define DBG(fmt...) do { } while (0)

I suggest

#define DBG(fmt...) do { if (0) udbg_printf(fmt); } while (0)

so that format and argument are always verified by the compiler.

I would also prefer a more generic form using ##__VA_ARGS__

#ifdef DEBUG
#define DBG(fmt, ...) udbg_printf(fmt, ##__VA_ARGS__)
#else
#define DBG(fmt, ...) do { if (0) udbg_printf(fmt, ##__VA_ARGS__); } while (0)
#endif

or maybe use the no_printk macro like

#ifdef DEBUG
#define DBG(fmt, ...) udbg_printf(fmt, ##__VA_ARGS__)
#else
#define DBG(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
#endif


