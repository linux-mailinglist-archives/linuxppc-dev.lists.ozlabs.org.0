Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE19763B87B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 04:03:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLnGx2QFBz3cMP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 14:03:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=U3syMjEr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=U3syMjEr;
	dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLnFz6bVCz3bjd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 14:03:03 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id i204-20020a1c3bd5000000b003d0683389e1so14723wma.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 19:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rlsa2wTfZduiT8voqybsJJ6jfGuEqqziQrK4IJ8IF3M=;
        b=U3syMjEr3XY0hAQlGY0Ta5Et9JQb7PvTzy9jqYXgsWSPVGjf89o+1jxLtvQVbzlw39
         8pmtdYz5rJBNOM9k8DzTgYWlHC6nIcwX1PMLdkWV3m6xPrpVEyzh5fS8GHSAvShkAQio
         8Oqns2QOeFJaSWlECWwUupHpCtELhsPZestG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rlsa2wTfZduiT8voqybsJJ6jfGuEqqziQrK4IJ8IF3M=;
        b=VvCZAXZCMzpOuSSXwM1ybL5uoR700TtBK3QlA+nsnmpm5uuaJiPGP1NNfWo95uJPsx
         0eK/QWycAPMFBmMQjxNEPdmUulHi3AKSeUVNV6KCH4ZzANaHRqDvVPhUn+LvU/fl0yOo
         ez1OOPXOKSY7ZGT5el8CztZ2xqhxTitEvzQlJC3e0DpFjTiitRSTmhGWSMFDV1Afoc11
         jO20VomRHxe4VFs28p8G+x0Y06QtV6m5f2AKx5pUXw6DOgmLAblWs30qB1lc4SW+BAVR
         Otz0+fcnUrg1QXDd4MLwla2zjf8DSD/RTtBezUGrs17XKWCiznrA7furEVW9zXXQYDu1
         hblQ==
X-Gm-Message-State: ANoB5pmvws1H1THf1YjjTAb+V5hBB3lWALMfepZiaVkOQ5gzgGb3LPUN
	CJnyTwMg2yhboh14iMZxgGk0OgHgbxdL+qOny48=
X-Google-Smtp-Source: AA0mqf5UT7P5fanFqvO0Me0G0g1g2xyl1YA95sKCQPRNcUCfHlQYS05aofz35CDPsEHGu6zOvg3EIcndxnJ0AWF4I+Q=
X-Received: by 2002:a05:600c:4f83:b0:3cf:8b32:a52 with SMTP id
 n3-20020a05600c4f8300b003cf8b320a52mr44369208wmq.72.1669690978119; Mon, 28
 Nov 2022 19:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20221128041539.1742489-1-npiggin@gmail.com>
In-Reply-To: <20221128041539.1742489-1-npiggin@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 29 Nov 2022 03:02:45 +0000
Message-ID: <CACPK8XddAwhkaneb4RF4dxgEPZJiEUBGiJEEhQ12E898HF9N9w@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Option to build big-endian with ELFv2 ABI
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Nov 2022 at 04:16, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> This is hopefully the final attempt. Luis was happy for the module
> patch to go via the powerpc tree, so I've put the the ELFv2 for big
> endian build patches into the series. Hopefully we can deprecate
> the ELFv1 ABI
>
> Since v5, I cleaned up patch 2 as per Christophe's review. And patch
> 4 I removed the EXPERT depends so it's easier to test. It's marked as
> experimental, but we should soon make it default and try to deprecate
> the v1 ABI so we can eventually remove it.

Reviewed-by: Joel Stanley <joel@jms.id.au>

I did some builds and boot tested them in qemu fine.

>
> Thanks,
> Nick
>
> Nicholas Piggin (4):
>   module: add module_elf_check_arch for module-specific checks
>   powerpc/64: Add module check for ELF ABI version
>   powerpc/64: Add big-endian ELFv2 flavour to crypto VMX asm generation
>   powerpc/64: Option to build big-endian with ELFv2 ABI
>
>  arch/powerpc/Kconfig                   | 21 +++++++++++++++++++++
>  arch/powerpc/kernel/module_64.c        | 10 ++++++++++
>  arch/powerpc/platforms/Kconfig.cputype |  4 ++--
>  drivers/crypto/vmx/Makefile            | 12 +++++++++++-
>  drivers/crypto/vmx/ppc-xlate.pl        | 10 ++++++----
>  include/linux/moduleloader.h           |  3 +++
>  kernel/module/main.c                   | 10 ++++++++++
>  7 files changed, 63 insertions(+), 7 deletions(-)
>
> --
> 2.37.2
>
