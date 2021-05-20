Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF938B304
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 17:22:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmD4P0jZcz308R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 01:22:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.16; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Received: from smtprelay.hostedemail.com (smtprelay0016.hostedemail.com
 [216.40.44.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmD3y1c0sz2yyj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 01:21:48 +1000 (AEST)
Received: from omf01.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 3155B181CC1BF;
 Thu, 20 May 2021 15:21:43 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf01.hostedemail.com (Postfix) with ESMTPA id C005517275; 
 Thu, 20 May 2021 15:21:41 +0000 (UTC)
Message-ID: <3173f7f10e0c212c8c828d9ca4450927f757e7d2.camel@perches.com>
Subject: Re: [PATCH 6/9] tty: hvc_console: Fix coding style issues of block
 comments
From: Joe Perches <joe@perches.com>
To: Johan Hovold <johan@kernel.org>, Xiaofei Tan <tanxiaofei@huawei.com>
Date: Thu, 20 May 2021 08:21:39 -0700
In-Reply-To: <YKYcFfKiHT39Gyey@hovoldconsulting.com>
References: <1621233433-27094-1-git-send-email-tanxiaofei@huawei.com>
 <1621233433-27094-7-git-send-email-tanxiaofei@huawei.com>
 <YKJ6ZjT8o5xJmBCr@hovoldconsulting.com>
 <e88b6fcd-bfe1-9812-905a-862825f420ce@huawei.com>
 <YKYcFfKiHT39Gyey@hovoldconsulting.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C005517275
X-Spam-Status: No, score=-2.90
X-Stat-Signature: gpzyzddmarn4jdsor9ep6g1wg5gtmhrf
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18KqlcSav5TvmdBlRG1J6AisdTKuL2Xz9w=
X-HE-Tag: 1621524101-433904
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
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 jirislaby@kernel.org, linux-kernel@vger.kernel.org, linuxarm@openeuler.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2021-05-20 at 10:21 +0200, Johan Hovold wrote:
> On Tue, May 18, 2021 at 12:01:22PM +0800, Xiaofei Tan wrote:
> > On 2021/5/17 22:15, Johan Hovold wrote:
> > > On Mon, May 17, 2021 at 02:37:10PM +0800, Xiaofei Tan wrote:
> > > > Fix coding style issues of block comments, reported by checkpatch.pl.
> > > > Besides, add a period at the end of the sentenses.
[]
> > > > diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
[]
> > > > @@ -177,7 +177,8 @@ static void hvc_console_print(struct console *co, const char *b,
> > > >  			r = cons_ops[index]->put_chars(vtermnos[index], c, i);
> > > >  			if (r <= 0) {
> > > >  				/* throw away characters on error
> > > > -				 * but spin in case of -EAGAIN */
> > > > +				 * but spin in case of -EAGAIN.
> > > > +				 */
> > > 
> > > How is this an improvement? First, the multi-line comment style is
> > > 
> > > 	/*
> > > 	 * ...
> > > 	 */
> > > 
> > 
> > Yes, mostly we use this style. I can follow it if new version is needed.
> 
> This is the preferred style outside of networking.
> 
> > BTW, How about add the '/*' check into checkpatch.pl?
> 
> Checkpatch already has too many checks IMO

I sometimes agree.  What checkpatch messages do you think are excessive?

> and I'm a bit surprised that
> it doesn't check this already. Perhaps it's because you used the -f to
> run checkpatch on in-kernel code, which you should not.

Likely not.  If it was run on a suggested patch, checkpatch doesn't emit
many messages on unmodified patch context lines.  And it shouldn't.

> it's just that you
> introduce noise in the logs and do pointless changes of context which
> makes it harder to use tools like git blame and makes backporting harder
> for no good reason.

Pretty pointless metric IMO.  Context changes in comments are mostly harmless.
IMO: backporting of these sorts non-bug fix changes is done _far_ too often.

