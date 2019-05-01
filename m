Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 871EC10408
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 04:30:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44v2SY74TqzDqVZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 12:30:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux-mips.org
 (client-ip=148.251.95.138; helo=cvs.linux-mips.org;
 envelope-from=macro@linux-mips.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-mips.org
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
 by lists.ozlabs.org (Postfix) with ESMTP id 44v2R81fgyzDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 12:29:39 +1000 (AEST)
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
 with ESMTP id S23990394AbfEAC3gOuPKs (ORCPT
 <rfc822;linuxppc-dev@lists.ozlabs.org>);
 Wed, 1 May 2019 04:29:36 +0200
Date: Wed, 1 May 2019 03:29:36 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 06/41] drivers: tty: serial: sb1250-duart: use dev_err()
 instead of printk()
In-Reply-To: <1556369542-13247-7-git-send-email-info@metux.net>
Message-ID: <alpine.LFD.2.21.1905010257020.30973@eddie.linux-mips.org>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-7-git-send-email-info@metux.net>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-mips@vger.kernel.org, andrew@aj.id.au,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sudeep.holla@arm.com,
 liviu.dudau@arm.com, linux-kernel@vger.kernel.org, vz@mleia.com,
 linux@prisktech.co.nz, sparclinux@vger.kernel.org, khilman@baylibre.com,
 linux-serial@vger.kernel.org, slemieux.tyco@gmail.com, matthias.bgg@gmail.com,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 27 Apr 2019, Enrico Weigelt, metux IT consult wrote:

> diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
> index 329aced..655961c 100644
> --- a/drivers/tty/serial/sb1250-duart.c
> +++ b/drivers/tty/serial/sb1250-duart.c
> @@ -663,7 +663,6 @@ static void sbd_release_port(struct uart_port *uport)
>  
>  static int sbd_map_port(struct uart_port *uport)
>  {
> -	const char *err = KERN_ERR "sbd: Cannot map MMIO\n";
>  	struct sbd_port *sport = to_sport(uport);
>  	struct sbd_duart *duart = sport->duart;
>  
> @@ -671,7 +670,7 @@ static int sbd_map_port(struct uart_port *uport)
>  		uport->membase = ioremap_nocache(uport->mapbase,
>  						 DUART_CHANREG_SPACING);
>  	if (!uport->membase) {
> -		printk(err);
> +		dev_err(uport->dev, "Cannot map MMIO (base)\n");
>  		return -ENOMEM;
>  	}
>  
> @@ -679,7 +678,7 @@ static int sbd_map_port(struct uart_port *uport)
>  		sport->memctrl = ioremap_nocache(duart->mapctrl,
>  						 DUART_CHANREG_SPACING);
>  	if (!sport->memctrl) {
> -		printk(err);
> +		dev_err(uport->dev, "Cannot map MMIO (ctrl)\n");
>  		iounmap(uport->membase);
>  		uport->membase = NULL;
>  		return -ENOMEM;

 Hmm, what's the point to have separate messages, which consume extra 
memory, for a hardly if at all possible error condition?

  Maciej
