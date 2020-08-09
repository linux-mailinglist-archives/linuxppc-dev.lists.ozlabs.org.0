Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C37623FFC0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Aug 2020 20:57:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BPpHX18FMzDqTC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 04:57:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FkWr+kqG; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BPpFw5l9YzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 04:55:47 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id m34so3673405pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Aug 2020 11:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PAZaN/L7VPPLwbaC7UrCX4+FJ1ItiEX2Jrle8fqhZ0o=;
 b=FkWr+kqGCgeaKDLnZG6Jb9jbU0UEDeIJtXezXQYcwCJrFPvPkeMT6NFaE4BqOMgwg7
 7IltwePRC1bT8x6/NY6kbdYOlgYMDONJDziZv266NcVAp+h7IRyKV3f81KqhOJpCZSDx
 v+n7zkQnpyd4glU8pLOxAQOzYKkjDPZlF6OjErb1yprLmzjcRhDp3TGpVxmuFk0BOrHP
 TFqf5mOniK8ky7b6/OxykfdXWNfhEd/lQ3GtAl3fDEKNer241lNtdi3Y39dCS414HbGA
 RUUvyWVtyniOlaShzpWYNtF5xPDZFdRep9OFep+EOjbx5pkqrPpRcC++OfkKaD+GBaET
 5znA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=PAZaN/L7VPPLwbaC7UrCX4+FJ1ItiEX2Jrle8fqhZ0o=;
 b=CMwA7QAEb8eq3hdciZwlK+brq7vMvpJyAsUgErkURAHqEYZdx4fL3sQxePb/Tw2b+0
 203UngDfv7t5Bmvv3SRNq3wpyXp4bFka/4qrV8sRpICm7slO16LDsygAHyfRxZZASAXh
 wRv7WyRFRh+SbVvAGfiH+MExobg6sokSSfqWPvONIwtKRfJyBvpHnEMIjGNIQeuEoI1k
 nghNbKYuzu3D+KG6554caJwhmoHZMb+alU0/rd7DCiFpxpd4tQiYnPT8xNbTkgV1VHPx
 dMloojFy8YAentuNvZc8qpcM4Ne/LHVTfDxvBi4K5cRREGZnmftPRHglEvYg/P0ONaQw
 xEiQ==
X-Gm-Message-State: AOAM530n/M/TcOXsxjVa5YFaAQhih2L8zkY7u18HVE/cAlTI85X1JPVt
 yIOeVmuD3aD7erja4J2Bt8c=
X-Google-Smtp-Source: ABdhPJzhi9hHF2qPnMoFx4QOZ2zhNt/Zq4cc6Dq3yX7qgdrpgVmXLJz/nI4iI+9rrn/94a8OOWGU5w==
X-Received: by 2002:a62:5284:: with SMTP id
 g126mr21785655pfb.139.1596999343723; 
 Sun, 09 Aug 2020 11:55:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id c15sm19191410pfo.115.2020.08.09.11.55.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 09 Aug 2020 11:55:42 -0700 (PDT)
Date: Sun, 9 Aug 2020 11:55:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 2/9] macintosh/via-macii: Poll the device most likely to
 respond
Message-ID: <20200809185541.GA133779@roeck-us.net>
References: <cover.1593318192.git.fthain@telegraphics.com.au>
 <5836f80886ebcfbe5be5fb7e0dc49feed6469712.1593318192.git.fthain@telegraphics.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5836f80886ebcfbe5be5fb7e0dc49feed6469712.1593318192.git.fthain@telegraphics.com.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linuxppc-dev@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Sun, Jun 28, 2020 at 02:23:12PM +1000, Finn Thain wrote:
> Poll the most recently polled device by default, rather than the lowest
> device address that happens to be enabled in autopoll_devs. This improves
> input latency. Re-use macii_queue_poll() rather than duplicate that logic.
> This eliminates a static struct and function.
> 
> Fixes: d95fd5fce88f0 ("m68k: Mac II ADB fixes") # v5.0+
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

With this patch applied, the qemu "q800" emulation no longer works and is stuck
in early boot. Any idea why that might be the case, and/or how to debug it ?

Thanks,
Guenter

> ---
>  drivers/macintosh/via-macii.c | 99 +++++++++++++++++++----------------
>  1 file changed, 53 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/macintosh/via-macii.c b/drivers/macintosh/via-macii.c
> index 6aa903529570d..d4f1a65c5f1fd 100644
> --- a/drivers/macintosh/via-macii.c
> +++ b/drivers/macintosh/via-macii.c
> @@ -77,6 +77,10 @@ static volatile unsigned char *via;
>  #define ST_ODD		0x20		/* ADB state: odd data byte */
>  #define ST_IDLE		0x30		/* ADB state: idle, nothing to send */
>  
> +/* ADB command byte structure */
> +#define ADDR_MASK	0xF0
> +#define CMD_MASK	0x0F
> +
>  static int macii_init_via(void);
>  static void macii_start(void);
>  static irqreturn_t macii_interrupt(int irq, void *arg);
> @@ -117,7 +121,8 @@ static int reply_len; /* number of bytes received in reply_buf or req->reply */
>  static int status;          /* VIA's ADB status bits captured upon interrupt */
>  static int last_status;              /* status bits as at previous interrupt */
>  static int srq_asserted;     /* have to poll for the device that asserted it */
> -static int command_byte;         /* the most recent command byte transmitted */
> +static u8 last_cmd;              /* the most recent command byte transmitted */
> +static u8 last_poll_cmd; /* the most recent Talk R0 command byte transmitted */
>  static int autopoll_devs;      /* bits set are device addresses to be polled */
>  
>  /* Check for MacII style ADB */
> @@ -179,35 +184,49 @@ static int macii_init_via(void)
>  /* Send an ADB poll (Talk Register 0 command prepended to the request queue) */
>  static void macii_queue_poll(void)
>  {
> -	/* No point polling the active device as it will never assert SRQ, so
> -	 * poll the next device in the autopoll list. This could leave us
> -	 * stuck in a polling loop if an unprobed device is asserting SRQ.
> -	 * In theory, that could only happen if a device was plugged in after
> -	 * probing started. Unplugging it again will break the cycle.
> -	 * (Simply polling the next higher device often ends up polling almost
> -	 * every device (after wrapping around), which takes too long.)
> -	 */
> -	int device_mask;
> -	int next_device;
>  	static struct adb_request req;
> +	unsigned char poll_command;
> +	unsigned int poll_addr;
>  
> +	/* This only polls devices in the autopoll list, which assumes that
> +	 * unprobed devices never assert SRQ. That could happen if a device was
> +	 * plugged in after the adb bus scan. Unplugging it again will resolve
> +	 * the problem. This behaviour is similar to MacOS.
> +	 */
>  	if (!autopoll_devs)
>  		return;
>  
> -	device_mask = (1 << (((command_byte & 0xF0) >> 4) + 1)) - 1;
> -	if (autopoll_devs & ~device_mask)
> -		next_device = ffs(autopoll_devs & ~device_mask) - 1;
> -	else
> -		next_device = ffs(autopoll_devs) - 1;
> +	/* The device most recently polled may not be the best device to poll
> +	 * right now. Some other device(s) may have signalled SRQ (the active
> +	 * device won't do that). Or the autopoll list may have been changed.
> +	 * Try polling the next higher address.
> +	 */
> +	poll_addr = (last_poll_cmd & ADDR_MASK) >> 4;
> +	if ((srq_asserted && last_cmd == last_poll_cmd) ||
> +	    !(autopoll_devs & (1 << poll_addr))) {
> +		unsigned int higher_devs;
> +
> +		higher_devs = autopoll_devs & -(1 << (poll_addr + 1));
> +		poll_addr = ffs(higher_devs ? higher_devs : autopoll_devs) - 1;
> +	}
>  
> -	adb_request(&req, NULL, ADBREQ_NOSEND, 1, ADB_READREG(next_device, 0));
> +	/* Send a Talk Register 0 command */
> +	poll_command = ADB_READREG(poll_addr, 0);
> +
> +	/* No need to repeat this Talk command. The transceiver will do that
> +	 * as long as it is idle.
> +	 */
> +	if (poll_command == last_cmd)
> +		return;
> +
> +	adb_request(&req, NULL, ADBREQ_NOSEND, 1, poll_command);
>  
>  	req.sent = 0;
>  	req.complete = 0;
>  	req.reply_len = 0;
>  	req.next = current_req;
>  
> -	if (current_req != NULL) {
> +	if (WARN_ON(current_req)) {
>  		current_req = &req;
>  	} else {
>  		current_req = &req;
> @@ -266,37 +285,22 @@ static int macii_write(struct adb_request *req)
>  /* Start auto-polling */
>  static int macii_autopoll(int devs)
>  {
> -	static struct adb_request req;
>  	unsigned long flags;
> -	int err = 0;
>  
>  	local_irq_save(flags);
>  
>  	/* bit 1 == device 1, and so on. */
>  	autopoll_devs = devs & 0xFFFE;
>  
> -	if (autopoll_devs && !current_req) {
> -		/* Send a Talk Reg 0. The controller will repeatedly transmit
> -		 * this as long as it is idle.
> -		 */
> -		adb_request(&req, NULL, ADBREQ_NOSEND, 1,
> -		            ADB_READREG(ffs(autopoll_devs) - 1, 0));
> -		err = macii_write(&req);
> +	if (!current_req) {
> +		macii_queue_poll();
> +		if (current_req && macii_state == idle)
> +			macii_start();
>  	}
>  
>  	local_irq_restore(flags);
> -	return err;
> -}
>  
> -static inline int need_autopoll(void)
> -{
> -	/* Was the last command Talk Reg 0
> -	 * and is the target on the autopoll list?
> -	 */
> -	if ((command_byte & 0x0F) == 0x0C &&
> -	    ((1 << ((command_byte & 0xF0) >> 4)) & autopoll_devs))
> -		return 0;
> -	return 1;
> +	return 0;
>  }
>  
>  /* Prod the chip without interrupts */
> @@ -333,7 +337,12 @@ static void macii_start(void)
>  	 */
>  
>  	/* store command byte */
> -	command_byte = req->data[1];
> +	last_cmd = req->data[1];
> +
> +	/* If this is a Talk Register 0 command, store the command byte */
> +	if ((last_cmd & CMD_MASK) == ADB_READREG(0, 0))
> +		last_poll_cmd = last_cmd;
> +
>  	/* Output mode */
>  	via[ACR] |= SR_OUT;
>  	/* Load data */
> @@ -424,10 +433,11 @@ static irqreturn_t macii_interrupt(int irq, void *arg)
>  				if (req->done)
>  					(*req->done)(req);
>  
> -				if (current_req)
> +				if (!current_req)
> +					macii_queue_poll();
> +
> +				if (current_req && macii_state == idle)
>  					macii_start();
> -				else if (need_autopoll())
> -					macii_autopoll(autopoll_devs);
>  			}
>  
>  			if (macii_state == idle) {
> @@ -507,14 +517,11 @@ static irqreturn_t macii_interrupt(int irq, void *arg)
>  
>  		macii_state = idle;
>  
> -		/* SRQ seen before, initiate poll now */
> -		if (srq_asserted)
> +		if (!current_req)
>  			macii_queue_poll();
>  
>  		if (current_req)
>  			macii_start();
> -		else if (need_autopoll())
> -			macii_autopoll(autopoll_devs);
>  
>  		if (macii_state == idle)
>  			via[B] = (via[B] & ~ST_MASK) | ST_IDLE;
> -- 
> 2.26.2
> 
