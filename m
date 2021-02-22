Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4969C320F35
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 02:41:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkPyz6NGlz3cTj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 12:40:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=T60i5xmq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=T60i5xmq; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkPyZ5qFPz30QW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 12:40:37 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id x129so926739pfx.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Feb 2021 17:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Pmfn8f/i9TumuS4aSYkIvZo4/H99mKopifdoxhuUtdg=;
 b=T60i5xmqABV5ARr6WaanBLU2cGHolVYLPmE8mrIYt8SPrVLMMpkuxwYiviwuc+L/u/
 C2gaolDpezEK6fLu0XlDVV8E0WMSwzTrsCT/Wshcx36Yjszf+UlIJRa4va6+DbG31ldw
 14kfSmTnvfkgCJYqH1/jrOwaHT8u6AA+kA3TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Pmfn8f/i9TumuS4aSYkIvZo4/H99mKopifdoxhuUtdg=;
 b=sbyyp7y8HG5t8Zk2m6KscjEanXZLlL86wWmqMGIHrgwZH1eikSd+vohHCA6RUaEpIY
 H08m/B8wd6zipbJV5jnZroaCJNdBeV7zX6SEZI7VFOQwiSf1aOXb4k+S5jFhobp7XDdn
 IDHP5bvP94fsj7rV1ubqIZ/eBYXYGiVuwicj2+U5Xc30uXP56ZEwa7qp1YYuv5Tyg83P
 z8S1mDSDzGfuaV5SvvmHeULRrqQCImg/SYgb91Jch34w4yB57VUboO0TnJ148SZaA19b
 UUdKoaBdC5YF4mE1g2wbrAjCF+LLFSiwuCXTGPdMW/Q1XJwAwHwjdTQt+F2uLVx3En0s
 yliQ==
X-Gm-Message-State: AOAM530Z+vgn4HeY9S5NfbmowuITmwag80IBafo94JZk/Aaav+JdtKqB
 7dhQZSogSf/BXRd3A0/K06vCzg==
X-Google-Smtp-Source: ABdhPJxtyPWEO8BWjW1Faie4bC1Bqwm2iJDW3XPcs1fWp5czZ1Gt1y7cs6vsAEeh8RmiztWxGvI7Ww==
X-Received: by 2002:a65:6a4b:: with SMTP id o11mr17970000pgu.138.1613958030061; 
 Sun, 21 Feb 2021 17:40:30 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-c141-3594-a9dc-6972.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:c141:3594:a9dc:6972])
 by smtp.gmail.com with ESMTPSA id v1sm19889837pfi.99.2021.02.21.17.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 17:40:29 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Yang Li <yang.lee@linux.alibaba.com>, mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc: use ARRAY_SIZE instead of division operation
In-Reply-To: <1613808853-78381-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1613808853-78381-1-git-send-email-yang.lee@linux.alibaba.com>
Date: Mon, 22 Feb 2021 12:40:26 +1100
Message-ID: <87blccq3qt.fsf@dja-thinkpad.axtens.net>
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yang,

> This eliminates the following coccicheck warning:
> ./arch/powerpc/boot/mktree.c:130:31-32: WARNING: Use ARRAY_SIZE
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  arch/powerpc/boot/mktree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/boot/mktree.c b/arch/powerpc/boot/mktree.c
> index dc603f3..0b2def5 100644
> --- a/arch/powerpc/boot/mktree.c
> +++ b/arch/powerpc/boot/mktree.c
> @@ -127,7 +127,7 @@ int main(int argc, char *argv[])
>  			exit(5);
>  		}
>  		cp = tmpbuf;
> -		for (i = 0; i < sizeof(tmpbuf) / sizeof(unsigned int); i++)
> +		for (i = 0; i < ARRAY_SIZE(tmpbuf); i++)

Unfortunately this breaks the build - see
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1613808853-78381-1-git-send-email-yang.lee@linux.alibaba.com/

This is because 'boot/mktree.c' is a userspace program without access to
the usual kernel headers.

It might be best to get coccicheck to exclude all of
'arch/powerpc/boot/' as I believe everything in that directory is
compiled differently to the rest of the kernel (see the Makefile), but
maybe just blacklisting boot/mktree.c would be sufficient.

Kind regards,
Daniel

>  			cksum += *cp++;
>  		if (write(out_fd, tmpbuf, sizeof(tmpbuf)) != sizeof(tmpbuf)) {
>  			perror("boot-image write");
> -- 
> 1.8.3.1
