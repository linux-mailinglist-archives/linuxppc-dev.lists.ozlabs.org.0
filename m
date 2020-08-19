Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6963F24923E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 03:21:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWVP20RZ0zDqsJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 11:21:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.121; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0121.hostedemail.com
 [216.40.44.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWVM64NcBzDqVb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 11:20:00 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id A882B181D330D;
 Wed, 19 Aug 2020 01:19:56 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:2902:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3872:4321:5007:6119:7903:10004:10400:10848:11026:11232:11658:11914:12043:12048:12296:12297:12438:12740:12760:12895:13069:13311:13357:13439:14659:14721:21063:21080:21627:21939:21990:30051:30054:30056:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: wash41_4712ceb27023
X-Filterd-Recvd-Size: 2169
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Wed, 19 Aug 2020 01:19:55 +0000 (UTC)
Message-ID: <3ca05f10dec479a70f6c33274ded8d4fab9c01ec.camel@perches.com>
Subject: Re: [PATCH v2 11/25] powerpc/signal: Refactor bad frame logging
From: Joe Perches <joe@perches.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 18:19:54 -0700
In-Reply-To: <fa094445c119fc00315e1c13783b493346306c6a.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
 <fa094445c119fc00315e1c13783b493346306c6a.1597770847.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-08-18 at 17:19 +0000, Christophe Leroy wrote:
> The logging of bad frame appears half a dozen of times
> and is pretty similar.
[]
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
[]
> @@ -355,3 +355,14 @@ static unsigned long get_tm_stackpointer(struct task_struct *tsk)
>  #endif
>  	return ret;
>  }
> +
> +static const char fm32[] = KERN_INFO "%s[%d]: bad frame in %s: %p nip %08lx lr %08lx\n";
> +static const char fm64[] = KERN_INFO "%s[%d]: bad frame in %s: %p nip %016lx lr %016lx\n";

Why not remove this and use it in place with
%08lx/%016x used as %px with a case to (void *)?

> +void signal_fault(struct task_struct *tsk, struct pt_regs *regs,
> +		  const char *where, void __user *ptr)
> +{
> +	if (show_unhandled_signals)
> +		printk_ratelimited(regs->msr & MSR_64BIT ? fm64 : fm32, tsk->comm,
> +				   task_pid_nr(tsk), where, ptr, regs->nip, regs->link);

	pr_info_ratelimited("%s[%d]: bad frame in %s: %p nip %016lx lr %016lx\n",
			    tsk->comm, task_pid_nr(tsk), where, ptr,
			    (void *)regs->nip, (void *)regs->link);


