Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 581864F375
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 05:51:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45W1nl2G0gzDqk5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 13:51:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.133; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0133.hostedemail.com
 [216.40.44.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45W1lq25kTzDqf9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 13:49:57 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 48FC3180A814D;
 Sat, 22 Jun 2019 03:49:53 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::::,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1567:1593:1594:1711:1714:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3867:4321:5007:10004:10400:10848:10967:11026:11232:11658:11914:12043:12297:12438:12740:12760:12895:13069:13311:13357:13439:13972:14181:14659:14721:21080:21627:30003:30054:30090:30091,
 0,
 RBL:23.242.70.174:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:36,
 LUA_SUMMARY:none
X-HE-Tag: screw48_3903c87882536
X-Filterd-Recvd-Size: 1770
Received: from XPS-9350 (cpe-23-242-70-174.socal.res.rr.com [23.242.70.174])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Sat, 22 Jun 2019 03:49:51 +0000 (UTC)
Message-ID: <fca1233b4a88beb603ba453c84bbd735e5adb07a.camel@perches.com>
Subject: Re: [PATCH 7/7] powerpc/kprobes: Allow probing on any ftrace address
From: Joe Perches <joe@perches.com>
To: Masami Hiramatsu <mhiramat@kernel.org>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>
Date: Fri, 21 Jun 2019 20:49:50 -0700
In-Reply-To: <20190621235034.acc00fc3e2b2c7e89caa1fd5@kernel.org>
References: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <d26f5467577ff0aeecea55e7035ea64e303bdf17.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <20190621235034.acc00fc3e2b2c7e89caa1fd5@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-06-21 at 23:50 +0900, Masami Hiramatsu wrote:
> On Tue, 18 Jun 2019 20:17:06 +0530
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

trivia:

> > diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
[]
> > @@ -57,6 +82,11 @@ NOKPROBE_SYMBOL(kprobe_ftrace_handler);
> >  
> >  int arch_prepare_kprobe_ftrace(struct kprobe *p)
> >  {
> > +	if ((unsigned long)p->addr & 0x03) {
> > +		printk("Attempt to register kprobe at an unaligned address\n");

Please use the appropriate KERN_<LEVEL> or pr_<level>


