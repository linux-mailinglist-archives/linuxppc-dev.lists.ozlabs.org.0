Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAB79C8B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 07:37:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H14B46DZzDqN2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 15:37:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="nd0pExQX"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H12D43W3zDqWF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 15:36:02 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id i18so9864635pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 22:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=KdvhWx5STJQuh3h6H3k/gde8WO2PhkrNqGMLuEz+X7g=;
 b=nd0pExQXCUmwBnwOJDaiy3haAHBnMxeK18GFfX6DKysRajp/3+t/EoL2ktvKTIPeKU
 nCXANGDj7C2dqWaS5oxRVTnt87qrrAOD3/ZfUgkLnO3TM3nVDUxwSXJ15/gChK3CYZgw
 07c304FGDN3hWgwsu5dCg/8wWOVu3wWXJbrxO5GzYIv2cpeaOVceYDIVrYCal/UwpkvP
 qkeMtnsAUxNidvn8t5zLMF9g29imsJGb4NQ1L4Z5JDFsbYO4hNcQCLMv7sKHp7g2D5FG
 5ZOLEKcepdqtx6fYiz6z8bbncNalq8Jd3UlCPJLuvYpR278wnvLKJmxnnX1SkpVJG/Iu
 pJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=KdvhWx5STJQuh3h6H3k/gde8WO2PhkrNqGMLuEz+X7g=;
 b=GZzKeutvb8YtmdTO2iNTCjNdeuKANCyiJ4rfy5Tka4e2z5sFgNH3EjdXQaU9K2GR5a
 2deRxyNLptB8e7F8v0Q3olqA2I4BpadHDH0MaiBLuEpnY93gTmPfmZsLF4IVMQAIqZrR
 I1W13rp7QWxnVRkF8GkJulaGfFO2KN2qwZmNHy35KFdcLUZ2+reN/PQTwael2/MjvFNy
 upqa1LYovO4wAsUTf1vyyxJLOMlM3d0zK7h6/nI2XFMAnr7o3lyfh/TQUT6IN9/PGu4X
 pVbBJr4r8SII3N9FiheXBhTC2+E1OK/YDM8WVwZe3dKHsELqapfsl7Dngo2cQz+E8YX9
 Ul5g==
X-Gm-Message-State: APjAAAWPP7gC7x8xNE25ocYztf2LcS0Yextx8iWOibfilQRDT+Ca2636
 B+e6hNbKjMHD7Z6V1RJVUxDRxw==
X-Google-Smtp-Source: APXvYqzLbNe7kZu12nUvr9UjhYpZ1XPkr1S0moFNK89fzJ/s8JVOm7N4kheB0F+Id5psYyLjnP1AQw==
X-Received: by 2002:a17:90a:cd04:: with SMTP id
 d4mr16762205pju.70.1566797760058; 
 Sun, 25 Aug 2019 22:36:00 -0700 (PDT)
Received: from localhost ([129.41.84.71])
 by smtp.gmail.com with ESMTPSA id a128sm13260907pfb.185.2019.08.25.22.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2019 22:35:59 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/mm: tell if a bad page fault on data is read or
 write.
In-Reply-To: <4f88d7e6fda53b5f80a71040ab400242f6c8cb93.1566400889.git.christophe.leroy@c-s.fr>
References: <4f88d7e6fda53b5f80a71040ab400242f6c8cb93.1566400889.git.christophe.leroy@c-s.fr>
Date: Mon, 26 Aug 2019 11:05:56 +0530
Message-ID: <87k1b0ij43.fsf@santosiv.in.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> DSISR has a bit to tell if the fault is due to a read or a write.
>
> Display it.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-by: Santosh Sivaraj <santosh@fossix.org>

> ---
>  arch/powerpc/mm/fault.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 8432c281de92..b5047f9b5dec 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -645,6 +645,7 @@ NOKPROBE_SYMBOL(do_page_fault);
>  void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
>  {
>  	const struct exception_table_entry *entry;
> +	int is_write = page_fault_is_write(regs->dsisr);
>  
>  	/* Are we prepared to handle this fault?  */
>  	if ((entry = search_exception_tables(regs->nip)) != NULL) {
> @@ -658,9 +659,10 @@ void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
>  	case 0x300:
>  	case 0x380:
>  	case 0xe00:
> -		pr_alert("BUG: %s at 0x%08lx\n",
> +		pr_alert("BUG: %s on %s at 0x%08lx\n",
>  			 regs->dar < PAGE_SIZE ? "Kernel NULL pointer dereference" :
> -			 "Unable to handle kernel data access", regs->dar);
> +			 "Unable to handle kernel data access",
> +			 is_write ? "write" : "read", regs->dar);
>  		break;
>  	case 0x400:
>  	case 0x480:
> -- 
> 2.13.3
