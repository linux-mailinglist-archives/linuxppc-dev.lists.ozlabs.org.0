Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E27437B598
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 07:48:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fg3kP3j2wz3bw4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 15:48:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=D+8UcMkB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ieee.org (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=elder@ieee.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256
 header.s=google header.b=D+8UcMkB; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfgTK6rRgz2yRQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 00:36:00 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id i81so19219244oif.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ETXAFKWQdH8/eG9YgJ2MyXQqUI4w0G+a8+7kidOetNw=;
 b=D+8UcMkB2GUwjj2F27jdDoxAVAL9rdC9MdMoJFlDBNeHzfe67XWP/sw3xSweHhjvu0
 L7zFyh43n9/fy4cUZSlUsyNvNqDkT2TqDuEFXFN77WQ7UwdcaxgaJydbt2h0Tqt9neqT
 2ljICDLxSDdscBg19eDiJRfFGl65YBejwUIvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ETXAFKWQdH8/eG9YgJ2MyXQqUI4w0G+a8+7kidOetNw=;
 b=RgQQgc06b/acxXXXseaKHFAKSpLvXmfkNGWYnonk+1bwOj8my5/LyzGFP6UebLqwKt
 LsTgI2l5pjjTbH5XTO71yXkmXJwOWXrXlr6SRq8+9Sig7Zz7wkaVZ2C1A6/yUByCO1+v
 Oytgn2XhbSSzj2zvrJjrSbEot78bdwgx/Xegl7HKp/S9Lbkppi0m5pb18MOyMxKVU9rH
 AC5X2ZnoIwmpfORduG+g3k5qPFoxCKFQpNvPuSRwGXwoxczfDI52Ejzq0G33GUcK6X9h
 CrJMmcIaCG2t94vxYHvqAxIBmvpCBbtRqmbZYy3gh5mqCrVDIaKw2zuZJM7KJw6W0zvA
 XqsQ==
X-Gm-Message-State: AOAM531JJ6zT/GBpSGPA2SoZLwmAPJKXhcTZfeKEzRuEghavb8YuCmLm
 P/cdG2A60CfOH8cc9AQFPc5xSQ==
X-Google-Smtp-Source: ABdhPJyvp7T0CdewBKkqMXtDA5ThSmqkKCGgPnZJ05uagz+Vq5z9FBuvh4nrA0ZkdxuooO6UIklVPg==
X-Received: by 2002:aca:53d8:: with SMTP id h207mr3883260oib.177.1620743757147; 
 Tue, 11 May 2021 07:35:57 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id 2sm3341540ota.67.2021.05.11.07.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 07:35:56 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] kernel.h: Split out panic and oops helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20210511074137.33666-1-andriy.shevchenko@linux.intel.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <c6fa5d2c-84e2-2046-19f0-66cf5dd72077@ieee.org>
Date: Tue, 11 May 2021 09:35:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210511074137.33666-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 12 May 2021 15:47:53 +1000
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
Cc: linux-hyperv@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-staging@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com,
 xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org,
 linux-pm@vger.kernel.org, coresight@lists.linaro.org,
 linux-um@lists.infradead.org, rcu@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/11/21 2:41 AM, Andy Shevchenko wrote:
> kernel.h is being used as a dump for all kinds of stuff for a long time.
> Here is the attempt to start cleaning it up by splitting out panic and
> oops helpers.
> 
> There are several purposes of doing this:
> - dropping dependency in bug.h
> - dropping a loop by moving out panic_notifier.h
> - unload kernel.h from something which has its own domain
> 
> At the same time convert users tree-wide to use new headers, although
> for the time being include new header back to kernel.h to avoid twisted
> indirected includes for existing users.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Kees Cook <keescook@chromium.org>
> Acked-by: Wei Liu <wei.liu@kernel.org>
> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Co-developed-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> Acked-by: Luis Chamberlain <mcgrof@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Acked-by: Helge Deller <deller@gmx.de> # parisc
> ---
> v3: rebased on top of v5.13-rc1, collected a few more tags
> 
> Note WRT Andrew's SoB tag above: I have added it since part of the cases
> I took from him. Andrew, feel free to amend or tell me how you want me
> to do.
> 

Acked-by: Alex Elder <elder@kernel.org>

. . .

> diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
> index a5f7a79a1923..34b68dc43886 100644
> --- a/drivers/net/ipa/ipa_smp2p.c
> +++ b/drivers/net/ipa/ipa_smp2p.c
> @@ -8,6 +8,7 @@
>   #include <linux/device.h>
>   #include <linux/interrupt.h>
>   #include <linux/notifier.h>
> +#include <linux/panic_notifier.h>
>   #include <linux/soc/qcom/smem.h>
>   #include <linux/soc/qcom/smem_state.h>
>   

. . .
