Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6516A6704
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 05:39:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRM2N1Ykhz3cKk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 15:39:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DFkgiwwM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=ecree.xilinx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DFkgiwwM;
	dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRM1Q5ChXz3bTc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 15:38:16 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id bw19so11877118wrb.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 20:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGJPeH0r7xdEaYTJzJa7w1hRBmNpRDwnHXG8dM1Fi/8=;
        b=DFkgiwwMhK+5PJqOSgpPSKTngPQSY2UCT674oq6b9cyIrdrAk/eFMPKzpXxAIyU2mu
         AIMVErKA5nZWJ3wD8mx7LGgpKD/41iyjWqIcH59c+EiRJJdzAwSPBWx7UO39UnVQ//Db
         pDQhwa3j/09Z+VPJzZ9qZnnueCsDjit6+GxcDcNGGBZnoDkyxUmzcM9LpdjFsVuPhCMg
         Pn/vqPoGz0RLuhzpxtqYIfmX+SUxQk+WUTbPXVLxLWQ8XksU3r3yg2yKs1cvcUNfk/8r
         WHl+ZnqvX9Dy4JY5JTkBQPOfvpCf1+/e5aVvofM8BmoIuxHtoOImKJMYsOP2O/mRx63r
         kEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGJPeH0r7xdEaYTJzJa7w1hRBmNpRDwnHXG8dM1Fi/8=;
        b=3je5XtDZANzlrCoqn2Qnas49svunW5NAUmv55On+BcoWt4Q830kmMOGckOgat1uuG7
         IWKLmO4ZPfI1iuH5G8D3qfacLg7pGAtXNcPyxyFKE4RB42x+tiZih97KkQoFtn4y/PbM
         LTyhvuzkKW2milEseRlz6qSnhYaJmJbSqsgUCyTgXZTNPrT1IJUT5aixlW3GggbI9jYN
         GP9rsOc5ctH6+w+cyhkaGwXi4eo3+SHg6A/MspNTGzNZKULSFZjpjW8TkF5xe94I7m88
         WzNg0aSnvJIkwMgnPCiM1FMtgM8CPInk0lIqciczLOV0BI2UBfL4+Nj7U3D4qzvf9tfX
         OKFA==
X-Gm-Message-State: AO0yUKWVy2eyF3AhYV7eHLfnqbFs5vvEJtzt5rdlOv543Wmd97K6fpEF
	UUFYTiuLtye1OllCKcuUn/M=
X-Google-Smtp-Source: AK7set+gUptp4vTi5bsWAxrQuCAD1OMXyp9cGvDDgba6mo1W7tgWi8r8vzfAV/1dNQguTi11mFakdQ==
X-Received: by 2002:adf:e54b:0:b0:2c7:169b:c577 with SMTP id z11-20020adfe54b000000b002c7169bc577mr3859807wrm.19.1677645493423;
        Tue, 28 Feb 2023 20:38:13 -0800 (PST)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id r14-20020adff70e000000b002c567881dbcsm11442126wrp.48.2023.02.28.20.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 20:38:12 -0800 (PST)
Subject: Re: [PATCH v5 01/17] asm-generic/iomap.h: remove ARCH_HAS_IOREMAP_xx
 macros
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
References: <20230301034247.136007-1-bhe@redhat.com>
 <20230301034247.136007-2-bhe@redhat.com>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <7bd6db48-ffb1-7eb1-decf-afa8be032970@gmail.com>
Date: Wed, 1 Mar 2023 04:38:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20230301034247.136007-2-bhe@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, wangkefeng.wang@huawei.com, arnd@arndb.de, schnelle@linux.ibm.com, netdev@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, David.Laight@ACULAB.COM, willy@infradead.org, loongarch@lists.linux.dev, Martin Habets <habetsm.xilinx@gmail.com>, agordeev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, shorne@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/03/2023 03:42, Baoquan He wrote:
> diff --git a/drivers/net/ethernet/sfc/io.h b/drivers/net/ethernet/sfc/io.h
> index 30439cc83a89..07f99ad14bf3 100644
> --- a/drivers/net/ethernet/sfc/io.h
> +++ b/drivers/net/ethernet/sfc/io.h
> @@ -70,7 +70,7 @@
>   */
>  #ifdef CONFIG_X86_64
>  /* PIO is a win only if write-combining is possible */
> -#ifdef ARCH_HAS_IOREMAP_WC
> +#ifdef ioremap_wc
>  #define EFX_USE_PIO 1
>  #endif
>  #endif

So I don't know how valid what we're doing here is...

> diff --git a/include/asm-generic/iomap.h b/include/asm-generic/iomap.h
> index 08237ae8b840..196087a8126e 100644
> --- a/include/asm-generic/iomap.h
> +++ b/include/asm-generic/iomap.h
> @@ -93,15 +93,15 @@ extern void __iomem *ioport_map(unsigned long port, unsigned int nr);
>  extern void ioport_unmap(void __iomem *);
>  #endif
>  
> -#ifndef ARCH_HAS_IOREMAP_WC
> +#ifndef ioremap_wc
>  #define ioremap_wc ioremap
>  #endif

... but it looks like this will break it, since in sfc/io.h
 `#ifdef ioremap_wc` will always be true (if I'm correctly
 understanding what we get via #include <linux/io.h>, which I'm
 probably not because asm includes always confuse me).
I.e. we're not just interested in "can code that calls ioremap_wc
 compile?", we care about whether we actually get WC, because
 we're making an optimisation decision based on it.
