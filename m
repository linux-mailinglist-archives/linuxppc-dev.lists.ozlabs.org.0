Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B17458A1688
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 16:03:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0NcGI5ol;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFhHz3QGwz3vbg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 00:03:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0NcGI5ol;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFhHJ1GnVz3d2c
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 00:03:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 85C126033D;
	Thu, 11 Apr 2024 14:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE959C072AA;
	Thu, 11 Apr 2024 14:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712844183;
	bh=6UJZZ6IjHCrKomyVcGWFI8QkbjcakZqKcaKnyTXHAhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0NcGI5oljWMkz32EWruHRpi43mJPvYvSKu4mleZsj5+GOQTshIcV111wtKcQHvsNp
	 XXfxmBKYOpZh4N6vL8eBzbUdsIlu//opGukHcs5BzJI+9f8trzvxeTsj6dlgnoiYd/
	 32oIUS7dqxBHJXAPFn+chDjOyRDZHMGN0+u/Y2ts=
Date: Thu, 11 Apr 2024 16:03:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: li.hao40@zte.com.cn
Subject: Re: [PATCH] tty: hvc: wakeup hvc console immediately when needed
Message-ID: <2024041151-crewmate-entail-62a5@gregkh>
References: <20240411215017604oDcKsSipiLnfwd2SzAnsj@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411215017604oDcKsSipiLnfwd2SzAnsj@zte.com.cn>
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
Cc: linuxppc-dev@lists.ozlabs.org, jirislaby@kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 11, 2024 at 09:50:17PM +0800, li.hao40@zte.com.cn wrote:
> From: Li Hao <li.hao40@zte.com.cn>
> 
> Cancel the do_wakeup flag in hvc_struct, and change it to immediately
> wake up tty when hp->n_outbuf is 0 in hvc_push().
> 
> When we receive a key input character, the interrupt handling function
> hvc_handle_interrupt() will be executed, and the echo thread
> flush_to_ldisc() will be added to the queue.
> 
> If the user is currently using tcsetattr(), a hang may occur. tcsetattr()
> enters kernel and waits for hp->n_outbuf to become 0 via
> tty_wait_until_sent(). If the echo thread finishes executing before
> reaching tty_wait_until_sent (for example, put_chars() takes too long),
> it will cause while meeting the wakeup condition (hp->do_wakeup = 1),
> tty_wait_until_sent() cannot be woken up (missed the tty_wakeup() of
> this round&apos;s tty_poll). Unless the next key input character comes,
> hvc_poll will be executed, and tty_wakeup() will be performed through
> the do_wakeup flag.
> 
> Signed-off-by: Li Hao

Did checkpatch say this was ok?

