Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5122498C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 09:58:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457Sng3WQDzDqMr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 17:58:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.82; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0082.hostedemail.com
 [216.40.44.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457SmV6ncfzDqKy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 17:57:46 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id EA649180178A1;
 Tue, 21 May 2019 07:57:41 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::,
 RULES_HIT:41:355:379:421:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3874:4321:5007:6120:7901:7903:10004:10400:10848:11232:11658:11914:12043:12740:12760:12895:13069:13161:13229:13311:13357:13439:14181:14659:21080:21627:30054:30060:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:28,
 LUA_SUMMARY:none
X-HE-Tag: sort67_430d7b49e2635
X-Filterd-Recvd-Size: 1832
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Tue, 21 May 2019 07:57:40 +0000 (UTC)
Message-ID: <38aa2fcceaf7c2c7c6cd7c3abe2999fe7ef98a44.camel@perches.com>
Subject: Re: [PATCH] powerpc/mm: mark more tlb functions as __always_inline
From: Joe Perches <joe@perches.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Christophe Leroy
 <christophe.leroy@c-s.fr>
Date: Tue, 21 May 2019 00:57:39 -0700
In-Reply-To: <CAK7LNAQNp+wsvNK84oYcGwR24=Kf=_N8WJdyZ2aUL9T3qDsVsA@mail.gmail.com>
References: <20190521061659.6073-1-yamada.masahiro@socionext.com>
 <16d967dd-9f8f-4e9e-97fd-3f9761e5d97c@c-s.fr>
 <CAK7LNAQNp+wsvNK84oYcGwR24=Kf=_N8WJdyZ2aUL9T3qDsVsA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-05-21 at 16:27 +0900, Masahiro Yamada wrote:
> On Tue, May 21, 2019 at 3:54 PM Christophe Leroy
> > powerpc accepts lines up to 90 chars, see arch/powerpc/tools/checkpatch.pl
> 
> Ugh, I did not know this. Horrible.
> 
> The Linux coding style should be global in the kernel tree.
> No subsystem should adopts its own coding style.

I don't see a problem using 90 column lines by arch/<foo>

There are other subsystem specific variations like the net/

	/* multiline comments without initial blank comment lines
	 * look like this...
	 */

If there were arch specific drivers with style variations
in say drivers/net, then that might be more of an issue.

