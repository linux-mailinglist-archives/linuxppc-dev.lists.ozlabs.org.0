Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ACC70D8FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 11:28:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQTWj4GWlz3fBs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 19:28:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=MLkNf5XJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=MLkNf5XJ;
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQTVt4nfQz3bxC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 19:27:34 +1000 (AEST)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CBD502000C;
	Tue, 23 May 2023 09:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684834051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tWmP+K0uuA6jsYPFxeIuaz/mxhobE31RozhJ+QuYoSM=;
	b=MLkNf5XJX5xupRjTys0zCJsfk4CyCnGchIZJhXDIN9UveOQS+bjXcKHkw0FkgFdzI/2Fcu
	U1v6aa8rCqWKAdykDjVKmeMCkOBRwcNNdrPyl2jsqrZvwV63jvo0yxbigG0eegZVxeHZEF
	aJ4r8+RfJ81gjc5Zt5j4vUeS+NnZ4GIzco1gFar9fJtORIe4dhqldqKGdGmjORPlhesl+l
	lIJpKxxhXPulS3qCMUJQKquSUY3UVeaWRQHidxrESNYqFSmUsBxfH/iQbVSt4ewKQchVlC
	3m3KcKuZbhGtlmz3IVO5hHXkbQcIWw+HN+ftUwgW8Y6ImTwI2/Gao9GrwgSFTA==
Date: Tue, 23 May 2023 11:27:28 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v2 2/2] serial: cpm_uart: Fix a COMPILE_TEST dependency
Message-ID: <20230523112728.00dd5268@bootlin.com>
In-Reply-To: <012b7c3d-1411-e5e1-662a-33369bfca610@kernel.org>
References: <20230523085902.75837-1-herve.codina@bootlin.com>
	<20230523085902.75837-3-herve.codina@bootlin.com>
	<012b7c3d-1411-e5e1-662a-33369bfca610@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 May 2023 11:13:02 +0200
Jiri Slaby <jirislaby@kernel.org> wrote:

> On 23. 05. 23, 10:59, Herve Codina wrote:
> > In a COMPILE_TEST configuration, the cpm_uart driver uses symbols from
> > the cpm_uart_cpm2.c file. This file is compiled only when CONFIG_CPM2 is
> > set.
> > 
> > Without this dependency, the linker fails with some missing symbols for
> > COMPILE_TEST configuration that needs SERIAL_CPM without enabling CPM2.
> > 
> > This lead to:
> >    depends on CPM2 || CPM1 || (PPC32 && CPM2 && COMPILE_TEST)
> > 
> > This dependency does not make sense anymore and can be simplified
> > removing all the COMPILE_TEST part.  
> 
> Then it's the same as my revert:
> https://lore.kernel.org/all/20230518055620.29957-1-jirislaby@kernel.org/
> 
> :D
> 
> But nevermind.

Sorry, I didn't look at your revert.

Do you want a new iteration adding (same as your revert) ?
  Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
  Reported-by: Randy Dunlap <rdunlap@infradead.org>
  Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

Best regards,
Hervé

> 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Link: https://lore.kernel.org/oe-kbuild-all/202305160221.9XgweObz-lkp@intel.com/
> > Fixes: e3e7b13bffae ("serial: allow COMPILE_TEST for some drivers")
> > ---
> >   drivers/tty/serial/Kconfig             | 2 +-
> >   drivers/tty/serial/cpm_uart/cpm_uart.h | 2 --
> >   2 files changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> > index 625358f44419..de092bc1289e 100644
> > --- a/drivers/tty/serial/Kconfig
> > +++ b/drivers/tty/serial/Kconfig
> > @@ -769,7 +769,7 @@ config SERIAL_PMACZILOG_CONSOLE
> >   
> >   config SERIAL_CPM
> >   	tristate "CPM SCC/SMC serial port support"
> > -	depends on CPM2 || CPM1 || (PPC32 && COMPILE_TEST)
> > +	depends on CPM2 || CPM1
> >   	select SERIAL_CORE
> >   	help
> >   	  This driver supports the SCC and SMC serial ports on Motorola
> > diff --git a/drivers/tty/serial/cpm_uart/cpm_uart.h b/drivers/tty/serial/cpm_uart/cpm_uart.h
> > index 0577618e78c0..46c03ed71c31 100644
> > --- a/drivers/tty/serial/cpm_uart/cpm_uart.h
> > +++ b/drivers/tty/serial/cpm_uart/cpm_uart.h
> > @@ -19,8 +19,6 @@ struct gpio_desc;
> >   #include "cpm_uart_cpm2.h"
> >   #elif defined(CONFIG_CPM1)
> >   #include "cpm_uart_cpm1.h"
> > -#elif defined(CONFIG_COMPILE_TEST)
> > -#include "cpm_uart_cpm2.h"
> >   #endif
> >   
> >   #define SERIAL_CPM_MAJOR	204  
> 

