Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8889CE65B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 17:27:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t7nl0YtZzDqN6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 01:27:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=jacmet@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EU8p/LiA"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t7kf00ZQzDqTs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:24:57 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id w37so9504835edw.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 08:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=zdkl15yDtUMDjcT3PhPiGxH6HbIfk+17gDQY6gRt9VY=;
 b=EU8p/LiAuWZTaBXKNZWaKq1vNaSJvDcy39qwV/Z0FHFTDHncV1Zr4ndrOk4JGQHpjX
 8+2Fp9pb74ZpblErpBwk2AHVSA0XH1TFcISRE2xKvyJ09GkPlceqdU0EpvbPyjROw/Rp
 2mjTY5DKkCICp5o8xAzP61nli8P0TVf4bfqEgZD8rzztWgastc4fusx/sOq1jUdvqMSm
 u/4ZemsXZ+LiOOOHhyR/mI0lVFDHDfej+AK9qa3aWH0ZWw6BwM+Q0zzdWbfYGenHUgTj
 mKQnWyDk7GiejXknp18q+wabn/scWwGXt9KqD4tzqHeVAqnAHml0d/6MfFfKMOSTgfl6
 uvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=zdkl15yDtUMDjcT3PhPiGxH6HbIfk+17gDQY6gRt9VY=;
 b=nDgsWyzEGgUYXtDeqLuNdqs8oMm0ovje+X+gYAuz+V4ytVBUEwWAHDUOCA5JjDrIaH
 8p0TBXjB2EMF9hSa8Y5sUT0XLGgwGcsIb50KKhXvSsWboiWtq9j8/o6tP7Fy10gVBhqL
 v4L/kDGTV70yDjbhPxOlaysIm6B6tJjXAoPCmEAWeNWnlFNOaje+F+cTIo7jdOrBj1Fu
 dwXNiQx5DiVT27K5xcb9oCCv71deZw8pG66iig5VQUXwqZNV2NVi4mekYccT8V7wIfrn
 YBxpZEKZFfLuSEhhLVsnfFFG9uJkaNOH5nSOB3IctY76Fj1PXc6jd0cTFy9jmiZFTnBO
 TI3Q==
X-Gm-Message-State: APjAAAU9b2dW74pOLmadrETxJJGeKjoFOdpEs6tYaY+UdmlI+Qjqkh6L
 IvyAwh7zOzOqRtWzS90Szzg=
X-Google-Smtp-Source: APXvYqzd7kklmwd/rJ9mZmXiJZJarahK9hi98VCMk8C4K5NtullM8PfDIBfWq8pF0LtSyR4PuNZQ7Q==
X-Received: by 2002:a17:906:1f53:: with SMTP id
 d19mr10119945ejk.12.1556551494836; 
 Mon, 29 Apr 2019 08:24:54 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 y12sm5901269ejo.85.2019.04.29.08.24.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 08:24:53 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.89)
 (envelope-from <peter@korsgaard.com>)
 id 1hL89F-0000nB-4t; Mon, 29 Apr 2019 17:24:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Enrico Weigelt\, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 16/41] drivers: tty: serial: uartlite: fix overlong lines
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-17-git-send-email-info@metux.net>
Date: Mon, 29 Apr 2019 17:24:53 +0200
In-Reply-To: <1556369542-13247-17-git-send-email-info@metux.net> (Enrico
 Weigelt's message of "Sat, 27 Apr 2019 14:51:57 +0200")
Message-ID: <87a7g8rfzu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org, macro@linux-mips.org,
 andrew@aj.id.au, gregkh@linuxfoundation.org, slemieux.tyco@gmail.com,
 liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, linux-mips@vger.kernel.org,
 linux@prisktech.co.nz, matthias.bgg@gmail.com, khilman@baylibre.com,
 linux-serial@vger.kernel.org, sudeep.holla@arm.com, sparclinux@vger.kernel.org,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org, vz@mleia.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>>>> "Enrico" == Enrico Weigelt, metux IT consult <info@metux.net> writes:

 > Fix checkpatch warnings:
 >     WARNING: line over 80 characters
 >     #283: FILE: drivers/tty/serial/uartlite.c:283:
 >     +	ret = request_irq(port->irq, ulite_isr, IRQF_SHARED | IRQF_TRIGGER_RISING,

 >     WARNING: Missing a blank line after declarations
 >     #577: FILE: drivers/tty/serial/uartlite.c:577:
 >     +	struct earlycon_device *device = console->data;
 >     +	uart_console_write(&device->port, s, n, early_uartlite_putc);

 >     WARNING: line over 80 characters
 >     #590: FILE: drivers/tty/serial/uartlite.c:590:
 >     +OF_EARLYCON_DECLARE(uartlite_b, "xlnx,opb-uartlite-1.00.b", early_uartlite_setup);

 >     WARNING: line over 80 characters
 >     #591: FILE: drivers/tty/serial/uartlite.c:591:
 >     +OF_EARLYCON_DECLARE(uartlite_a, "xlnx,xps-uartlite-1.00.a", early_uartlite_setup);

Given that these are just a few characters more than 80 I don't really
think these changes improve readability.


 > Signed-off-by: Enrico Weigelt <info@metux.net>
 > ---
 >  drivers/tty/serial/uartlite.c | 10 +++++++---
 >  1 file changed, 7 insertions(+), 3 deletions(-)

 > diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
 > index 6f79353..0140cec 100644
 > --- a/drivers/tty/serial/uartlite.c
 > +++ b/drivers/tty/serial/uartlite.c
 > @@ -280,7 +280,8 @@ static int ulite_startup(struct uart_port *port)
 >  		return ret;
 >  	}
 
 > -	ret = request_irq(port->irq, ulite_isr, IRQF_SHARED | IRQF_TRIGGER_RISING,
 > +	ret = request_irq(port->irq, ulite_isr,
 > +			  IRQF_SHARED | IRQF_TRIGGER_RISING,
 >  			  "uartlite", port);
 >  	if (ret)
 >  		return ret;
 > @@ -574,6 +575,7 @@ static void early_uartlite_write(struct console *console,
 >  				 const char *s, unsigned int n)
 >  {
 >  	struct earlycon_device *device = console->data;
 > +
 >  	uart_console_write(&device->port, s, n, early_uartlite_putc);

Unrelated change?

-- 
Bye, Peter Korsgaard
