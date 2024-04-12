Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 229618A2879
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 09:48:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG7ww6Tmfz3vmJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 17:48:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zte.com.cn (client-ip=63.216.63.40; helo=mxhk.zte.com.cn; envelope-from=li.hao40@zte.com.cn; receiver=lists.ozlabs.org)
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG7wT2TXQz3vj3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 17:48:20 +1000 (AEST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4VG7wL0YBBz8XrRK;
	Fri, 12 Apr 2024 15:48:18 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 43C7m3bH093870;
	Fri, 12 Apr 2024 15:48:03 +0800 (+08)
	(envelope-from li.hao40@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Fri, 12 Apr 2024 15:48:06 +0800 (CST)
Date: Fri, 12 Apr 2024 15:48:06 +0800 (CST)
X-Zmail-TransId: 2af96618e73623d-204a2
X-Mailer: Zmail v1.0
Message-ID: <20240412154806397beb4yGovKASnUXpyoxUJu@zte.com.cn>
In-Reply-To: <75dff5cd-7b0e-4039-9157-8bf10cf7ba29@kernel.org>
References: 20240412113848167egmP7kBg1Qm5sxfwGALG-@zte.com.cn,75dff5cd-7b0e-4039-9157-8bf10cf7ba29@kernel.org
Mime-Version: 1.0
From: <li.hao40@zte.com.cn>
To: <jirislaby@kernel.org>
Subject: =?UTF-8?B?UmU6IFJlOiBbUEFUQ0hdIHR0eTogaHZjOiB3YWtldXAgaHZjIGNvbnNvbGUgaW1tZWRpYXRlbHkgd2hlbiBuZWVkZWQ=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 43C7m3bH093870
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6618E742.000/4VG7wL0YBBz8XrRK
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
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On 12. 04. 24, 5:38, li.hao40@zte.com.cn wrote:
> > From: Li Hao <li.hao40@zte.com.cn>
> > 
> > Cancel the do_wakeup flag in hvc_struct, and change it to immediately
> > wake up tty when hp->n_outbuf is 0 in hvc_push().
> > 
> > When we receive a key input character, the interrupt handling function
> > hvc_handle_interrupt() will be executed, and the echo thread
> > flush_to_ldisc() will be added to the queue.
> > 
> > If the user is currently using tcsetattr(), a hang may occur. tcsetattr()
> > enters kernel and waits for hp->n_outbuf to become 0 via
> > tty_wait_until_sent(). If the echo thread finishes executing before
> > reaching tty_wait_until_sent (for example, put_chars() takes too long),
> > it will cause while meeting the wakeup condition (hp->do_wakeup = 1),
> > tty_wait_until_sent() cannot be woken up (missed the tty_wakeup() of
> > this round's tty_poll). Unless the next key input character comes,
> > hvc_poll will be executed, and tty_wakeup() will be performed through
> > the do_wakeup flag.
> > 
> > Signed-off-by: Li Hao <li.hao40@zte.com.cn>
> > ---
> >   drivers/tty/hvc/hvc_console.c | 12 +++++-------
> >   drivers/tty/hvc/hvc_console.h |  1 -
> >   2 files changed, 5 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
> > index cd1f657f7..2fa90d938 100644
> > --- a/drivers/tty/hvc/hvc_console.c
> > +++ b/drivers/tty/hvc/hvc_console.c
> > @@ -476,11 +476,13 @@ static void hvc_hangup(struct tty_struct *tty)
> >   static int hvc_push(struct hvc_struct *hp)
> >   {
> >       int n;
> > +    struct tty_struct *tty;
> > 
> >       n = hp->ops->put_chars(hp->vtermno, hp->outbuf, hp->n_outbuf);
> > +    tty = tty_port_tty_get(&hp->port);
> >       if (n <= 0) {
> >           if (n == 0 || n == -EAGAIN) {
> > -            hp->do_wakeup = 1;
> > +            tty_wakeup(tty);
> 
> What if tty is NULL? Did you intent to use tty_port_tty_wakeup() instead?
> 
> thanks,
> -- 
> js
> suse labs

Thank you for your prompt reply.
tty_port_tty_wakeup() is better, it no longer check if tty is NULL in hvc_push()

Li Hao
