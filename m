Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9E470D7AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 10:37:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQSPc3WMQz3f6Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 18:37:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=A+xGy2Al;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=A+xGy2Al;
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQSNl44RKz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 18:37:08 +1000 (AEST)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A250020008;
	Tue, 23 May 2023 08:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684831020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zevkAxEFUIWHgePsyHXq++lV+3/FgwN1EoqQjaNsGYw=;
	b=A+xGy2Alx3eEr4XwOFoj85MKrHUxnShJ7PbD5l+i5CxWsj9I3En/qPoytVHDuht3llcImN
	rNOoQAPOFwrZX3ZVSr4i4WQoq+Cqd60Aoj4c7twUjoNpidJhBgug/S1m5ap+gW+UC6UA5w
	zuFMseTy7m8VIHhAKrNLrkS/WWvtL3pniVafsqWL3WNGcTFpiQ6CHB7+u3bqQyvU+yb432
	J0qVwiDja6KpQ0SjyRoNpKUUWWytwhb79zAULgtd/wUeHkisw0gLrym5++rn1GL+mnDTe8
	rb3MPiy4U9J+HJ6O0LrNfXBw1+LeOGPRDS3XfAkz+TpcBrhi3BjqAUwQjrIEFw==
Date: Tue, 23 May 2023 10:36:56 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 2/2] serial: cpm_uart: Fix a COMPILE_TEST dependency
Message-ID: <20230523103656.550c9585@bootlin.com>
In-Reply-To: <d65bb452-80ca-7644-c38c-1bc0566661f0@kernel.org>
References: <20230522082048.21216-1-herve.codina@bootlin.com>
	<20230522082048.21216-3-herve.codina@bootlin.com>
	<d65bb452-80ca-7644-c38c-1bc0566661f0@kernel.org>
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

On Tue, 23 May 2023 09:52:00 +0200
Jiri Slaby <jirislaby@kernel.org> wrote:

> On 22. 05. 23, 10:20, Herve Codina wrote:
> > In a COMPILE_TEST configuration, the cpm_uart driver uses symbols from
> > the cpm_uart_cpm2.c file. This file is compiled only when CONFIG_CPM2 is
> > set.
> > 
> > Without this dependency, the linker fails with some missing symbols for
> > COMPILE_TEST configuration that needs SERIAL_CPM without enabling CPM2.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Link: https://lore.kernel.org/oe-kbuild-all/202305160221.9XgweObz-lkp@intel.com/
> > Fixes: e3e7b13bffae ("serial: allow COMPILE_TEST for some drivers")
> > ---
> >   drivers/tty/serial/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> > index 625358f44419..68a9d9db9144 100644
> > --- a/drivers/tty/serial/Kconfig
> > +++ b/drivers/tty/serial/Kconfig
> > @@ -769,7 +769,7 @@ config SERIAL_PMACZILOG_CONSOLE
> >   
> >   config SERIAL_CPM
> >   	tristate "CPM SCC/SMC serial port support"
> > -	depends on CPM2 || CPM1 || (PPC32 && COMPILE_TEST)
> > +	depends on CPM2 || CPM1 || (PPC32 && CPM2 && COMPILE_TEST)  
> 
> Actually, does this makes sense? I mean, the last part after "||" is now 
> superfluous and doesn't help anything, right?

Indeed, I will remove all the (PPC32 && CPM2 && COMPILE_TEST) in the next
iteration.
I will also remove the '#elif defined(CONFIG_COMPILE_TEST)' case in the
cpm_uart.h file.

Best regards,
Hervé

> 
> >   	select SERIAL_CORE
> >   	help
> >   	  This driver supports the SCC and SMC serial ports on Motorola  
> 
