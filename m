Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7EF6815D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2019 23:59:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45n0v14jLbzDqB7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 07:59:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=danielhb413@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VxZ5ZIYF"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45mxDl3Y9rzDqGF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 05:14:43 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id s22so10088977qkj.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2019 12:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=iWsIp7woxVsgex+gg53/5GfJ+Wgp7SuKXex2IgTyT20=;
 b=VxZ5ZIYFsTGGEd1uZlKmEmL2UjXJUzoW7WHP70DgDVDSYH5HMGQhoNfJ908zIGx11m
 gPnWmnxEvpI5BAYQuRJ7hPvVaKpufMmqsIvtoap+9qJALCByNg6VYd0y40aYbtGSvpyJ
 lTO6tERIYhVzlvvFhtYAExsDQ5dERy9LU/PnnFjwdUffgZCnA0CYdi1KN4H6Vf6IqhnP
 46qQCvyefG/KFjav9Kp3MQVSlXtZye5vr5PGtIfODQYfxiU/PlJkWCANPzxIP0VRfAsy
 AEyt5C/UAHeLjDD0XZH0sYKd9ojoJ0YghqpVy7p33GPSjSbDw73ne9SeBOdvZWOxPME9
 s3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=iWsIp7woxVsgex+gg53/5GfJ+Wgp7SuKXex2IgTyT20=;
 b=pP/nij6ToupO67iC77xuVv+SAnODY1+2Q5PNoC0iei3L5f4X7m8VEqj4tgqtKmvkCT
 ADi2dX5drwAaK9n3XQZaSIl/xMiuBhy11DQTrLIFIFXOwHafXFvM0GAxHp0PSgoo7pbW
 0x9Tz9ubIXoUqUeo6o3sHmyUkmoo3JEVKP6OLbaXtULl3JgYBkioIFY2XgprtyrFGSyG
 pS4f+eZwvnIPBlJkx1IUzWRuQSIN313S/lqMzzVkVo1XOf5oyTvztrBzMINdFJFwwbPs
 lNIb5r/PqNpTxc03xGRkBwoMx7ZzrWs/xuw5Uy60cU7wjh6wXmJW5nQZVyYO6LpmdfCg
 R97A==
X-Gm-Message-State: APjAAAWbxnTXb1ERan30rzOpW4io/GfjFYFcyu/Ks8trRMPaxokKZTgw
 EtM9UheWQlH3i8a+Lbk0T4M=
X-Google-Smtp-Source: APXvYqzbGslF67lig5Wp6HUMIjCgGXVAcTU3GGPZo3N4jd3IxYZbRQw8FE9avd94bxGDnJWDpb4Rzw==
X-Received: by 2002:a05:620a:15d7:: with SMTP id
 o23mr13926953qkm.125.1563131680398; 
 Sun, 14 Jul 2019 12:14:40 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:94cf:6a36:8ff2:a855:c9e6?
 ([2804:431:c7c7:94cf:6a36:8ff2:a855:c9e6])
 by smtp.gmail.com with ESMTPSA id t12sm6986272qtr.49.2019.07.14.12.14.37
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jul 2019 12:14:39 -0700 (PDT)
Subject: Re: [RFC PATCH kernel] powerpc/xive: Drop deregistered irqs
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20190712082036.40440-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <e500148e-93f3-5a63-cdc2-b48428c51ee8@gmail.com>
Date: Sun, 14 Jul 2019 16:14:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712082036.40440-1-aik@ozlabs.ru>
Content-Type: multipart/alternative;
 boundary="------------88F6C81E123270159096557C"
Content-Language: en-US
X-Mailman-Approved-At: Mon, 15 Jul 2019 07:58:15 +1000
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
Cc: Alistair Popple <alistair@popple.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------88F6C81E123270159096557C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

This patch fixed an issue I was experiencing with virsh start/destroy
of guests with mlx5 and GPU passthrough in a Power 9 server. I
believe it's a similar situation which Alexey described in the post
commit msg.


Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>


On 7/12/19 5:20 AM, Alexey Kardashevskiy wrote:
> There is a race between releasing an irq on one cpu and fetching it
> from XIVE on another cpu as there does not seem to be any locking between
> these, probably because xive_irq_chip::irq_shutdown() is supposed to
> remove the irq from all queues in the system which it does not do.
>
> As a result, when such released irq appears in a queue, we take it
> from the queue but we do not change the current priority on that cpu and
> since there is no handler for the irq, EOI is never called and the cpu
> current priority remains elevated (7 vs. 0xff==unmasked). If another irq
> is assigned to the same cpu, then that device stops working until irq
> is moved to another cpu or the device is reset.
>
> This checks if irq is still registered, if not, it assumes no valid irq
> was fetched from the loop and if there is none left, it continues to
> the irq==0 case (not visible in this patch) and sets priority to 0xff
> which is basically unmasking. This calls irq_to_desc() on a hot path now
> which is a radix tree lookup; hopefully this won't be noticeable as
> that tree is quite small.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>
> Found it on P9 system with:
> - a host with 8 cpus online
> - a boot disk on ahci with its msix on cpu#0
> - a guest with 2xGPUs + 6xNVLink + 4 cpus
> - GPU#0 from the guest is bound to the same cpu#0.
>
> Killing a guest killed ahci and therefore the host because of the race.
> Note that VFIO masks interrupts first and only then resets the device.
>
> Alternatives:
>
> 1. Fix xive_irq_chip::irq_shutdown() to walk through all cpu queues and
> drop deregistered irqs.
>
> 2. Exploit chip->irq_get_irqchip_state function from
> 62e0468650c30f0298 "genirq: Add optional hardware synchronization for shutdown".
>
> Both require deep XIVE knowledge which I do not have.
> ---
>   arch/powerpc/sysdev/xive/common.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
> index 082c7e1c20f0..65742e280337 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -148,8 +148,12 @@ static u32 xive_scan_interrupts(struct xive_cpu *xc, bool just_peek)
>   		irq = xive_read_eq(&xc->queue[prio], just_peek);
>   
>   		/* Found something ? That's it */
> -		if (irq)
> -			break;
> +		if (irq) {
> +			/* Another CPU may have shut this irq down, check it */
> +			if (irq_to_desc(irq))
> +				break;
> +			irq = 0;
> +		}
>   
>   		/* Clear pending bits */
>   		xc->pending_prio &= ~(1 << prio);


--------------88F6C81E123270159096557C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <font size="+1">This patch fixed an issue I was experiencing with
      virsh start/destroy<br>
      of guests with mlx5 and GPU passthrough in a Power 9 server. I<br>
      believe it's a similar situation which Alexey described in the
      post<br>
      commit msg.<br>
      <br>
      <br>
      Tested-by: Daniel Henrique Barboza <a class="moz-txt-link-rfc2396E" href="mailto:danielhb413@gmail.com">&lt;danielhb413@gmail.com&gt;</a><br>
    </font><br>
    <br>
    <div class="moz-cite-prefix">On 7/12/19 5:20 AM, Alexey
      Kardashevskiy wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190712082036.40440-1-aik@ozlabs.ru">
      <pre class="moz-quote-pre" wrap="">There is a race between releasing an irq on one cpu and fetching it
from XIVE on another cpu as there does not seem to be any locking between
these, probably because xive_irq_chip::irq_shutdown() is supposed to
remove the irq from all queues in the system which it does not do.

As a result, when such released irq appears in a queue, we take it
from the queue but we do not change the current priority on that cpu and
since there is no handler for the irq, EOI is never called and the cpu
current priority remains elevated (7 vs. 0xff==unmasked). If another irq
is assigned to the same cpu, then that device stops working until irq
is moved to another cpu or the device is reset.

This checks if irq is still registered, if not, it assumes no valid irq
was fetched from the loop and if there is none left, it continues to
the irq==0 case (not visible in this patch) and sets priority to 0xff
which is basically unmasking. This calls irq_to_desc() on a hot path now
which is a radix tree lookup; hopefully this won't be noticeable as
that tree is quite small.

Signed-off-by: Alexey Kardashevskiy <a class="moz-txt-link-rfc2396E" href="mailto:aik@ozlabs.ru">&lt;aik@ozlabs.ru&gt;</a>
---

Found it on P9 system with:
- a host with 8 cpus online
- a boot disk on ahci with its msix on cpu#0
- a guest with 2xGPUs + 6xNVLink + 4 cpus
- GPU#0 from the guest is bound to the same cpu#0.

Killing a guest killed ahci and therefore the host because of the race.
Note that VFIO masks interrupts first and only then resets the device.

Alternatives:

1. Fix xive_irq_chip::irq_shutdown() to walk through all cpu queues and
drop deregistered irqs.

2. Exploit chip-&gt;irq_get_irqchip_state function from
62e0468650c30f0298 "genirq: Add optional hardware synchronization for shutdown".

Both require deep XIVE knowledge which I do not have.
---
 arch/powerpc/sysdev/xive/common.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 082c7e1c20f0..65742e280337 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -148,8 +148,12 @@ static u32 xive_scan_interrupts(struct xive_cpu *xc, bool just_peek)
 		irq = xive_read_eq(&amp;xc-&gt;queue[prio], just_peek);
 
 		/* Found something ? That's it */
-		if (irq)
-			break;
+		if (irq) {
+			/* Another CPU may have shut this irq down, check it */
+			if (irq_to_desc(irq))
+				break;
+			irq = 0;
+		}
 
 		/* Clear pending bits */
 		xc-&gt;pending_prio &amp;= ~(1 &lt;&lt; prio);
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------88F6C81E123270159096557C--
