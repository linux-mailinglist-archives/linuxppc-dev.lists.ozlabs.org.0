Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB8843251
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 05:27:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PTgb0JQCzDr8V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 13:27:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="ayqIIySK"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PTdR5xZTzDr45
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 13:25:14 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id a186so10871396pfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 20:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=na+M1IgMGaM0aP15I3XbgNE1q19snWq8SHI4WbjnUi8=;
 b=ayqIIySKl6kes4w9jYHEywIJSvRDA1zi9AMajnhKYpTxcdVuBdAgsWgJaGqrz7xwF+
 9RC/evdpHaaIJEqxagLrwVocrWh3UMlFyW9tMnoHoIj67T2hZWr+R1JYWozCB1qocR0C
 cgnBD4a+F5VS9acKQF05CqFm3K2gf7BOYvzfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=na+M1IgMGaM0aP15I3XbgNE1q19snWq8SHI4WbjnUi8=;
 b=Foayvwv/Y2pf43/9sIAS/EZTt2SoQ17iJVm8Odh1bTZKMGzx/v7lLjm+GZN8sVYalE
 EtCuHsMhcrxbHxuc9K6ZZrwsxjZW7HS7W3qocjBKw8mhQFGAmAVvcHtopIoC0VEkPgbx
 Pxdy3JPbjBnes7q9w/8iyZ4ChN2LepUKDmYzrh69dJO4lgQP1f2NW0/iS3wNp0ibrc9Q
 4Li08ACuIw2AEztVVGWUvP7lk1uygnKVKQzW/W/gPFYYRVytGmcFCMhwhvsAWkluUH2D
 kwS9Ui2oiEwj8TkPRbioKMxqlttD43xUBBmAb7abwQI+/KFjP+YgG3tgSHZwtwhJ8q7W
 gZ3g==
X-Gm-Message-State: APjAAAVcWApmv9Hz0FJAk7WbLJ21/tS+akdAyeJUcR+x119L770gx5x8
 XXNbR+M4YXpMe0pHpHr34P5kWQ==
X-Google-Smtp-Source: APXvYqyM53aFUeG9U9Tc6RAfzM93Fkh7XJF4rWPgPyOYiilGDKKp1+at7vv7zLSJgsW+VMFEfd9C/Q==
X-Received: by 2002:a17:90a:1951:: with SMTP id
 17mr2512798pjh.79.1560396311357; 
 Wed, 12 Jun 2019 20:25:11 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id w132sm959398pfd.78.2019.06.12.20.25.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 20:25:10 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Pawel Dembicki <paweldembicki@gmail.com>
Subject: Re: [PATCH] powerpc: Enable kernel XZ compression option on PPC_85xx
In-Reply-To: <20190603164115.27471-1-paweldembicki@gmail.com>
References: <20190603164115.27471-1-paweldembicki@gmail.com>
Date: Thu, 13 Jun 2019 13:25:05 +1000
Message-ID: <877e9qp3ou.fsf@dja-thinkpad.axtens.net>
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
Cc: Christian Lamparter <chunkeey@gmail.com>, linux-kernel@vger.kernel.org,
 Pawel Dembicki <paweldembicki@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pawel Dembicki <paweldembicki@gmail.com> writes:

> Enable kernel XZ compression option on PPC_85xx. Tested with
> simpleImage on TP-Link TL-WDR4900 (Freescale P1014 processor).
>
> Suggested-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> ---
>  arch/powerpc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 8c1c636308c8..daf4cb968922 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -196,7 +196,7 @@ config PPC
>  	select HAVE_IOREMAP_PROT
>  	select HAVE_IRQ_EXIT_ON_IRQ_STACK
>  	select HAVE_KERNEL_GZIP
> -	select HAVE_KERNEL_XZ			if PPC_BOOK3S || 44x
> +	select HAVE_KERNEL_XZ			if PPC_BOOK3S || 44x || PPC_85xx

(I'm not super well versed in the compression stuff, so apologies if
this is a dumb question.) If it's this simple, is there any reason we
can't turn it on generally, or convert it to a blacklist of platforms
known not to work?

Regards,
Daniel

>  	select HAVE_KPROBES
>  	select HAVE_KPROBES_ON_FTRACE
>  	select HAVE_KRETPROBES
> -- 
> 2.20.1
