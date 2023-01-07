Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 259C5660E9D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 13:15:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpzgX64vPz3cBt
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 23:15:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qNyf3HCS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=matorola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qNyf3HCS;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Npzfd6NRxz3bV1
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 23:14:47 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so5328478wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Jan 2023 04:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=exh5jhWBBK17Ph+CgJeghRyiOswfcgQCDbeTM4nzuso=;
        b=qNyf3HCSTkCM2x51VV2Cu+6OyAqRfd3jq35pM1Vfsm6rY9XiBPdBC19GjNMmyH+5Ac
         KveKhsFbTtt0aLipgmXmkd1KYHATxwb5Y+Yy4n6P5LtmnqydS3mSKNTnwZa0JPVezlLK
         cJhnUkNNunEbsezDZehWHy2KR1Fgshy/NnetM18edQqr7sruoBq+4zxdzVHJv7FOVYpx
         I7ZwyGGcYuaL+zZx4C1mS0bAWd12tOy3It0EolG+fIFfrFZPcM7PkHOJKCUFp+H0OIuT
         iW4T667dq+pFqkLJaeWAt+slyrQd16MQjDAzZrp9W+GA4R3MLCqrdrlh7+KSA+UqXlVJ
         byPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exh5jhWBBK17Ph+CgJeghRyiOswfcgQCDbeTM4nzuso=;
        b=IhvKnT8cDzEHlh6ZVeZCVNrR78/ot0VDtyX1JQooxNbjQ7J7FnfUxxmrneiwEzWyzE
         b2vvHzz4B9rVJmr+zf39/MqnhGpL07Ys3VqeqUofsDD0rui+W6Vm6LNObMqam18+xIFx
         PIYViZ0wbYI0i9+uDHlCH4suTzJ5mpHEvso3m+TdHYljf4LRaLVNXf+UEwC1r+UFehp/
         CaRUhWQ2nw9NfB5qiCB/sxpxx9Qq3uypqWP9eLO7lMj8qpA2qzzuBM/l47XQxik0IMjO
         4w0yHXDy6JjCmZED9v6NB1K/vI3umlO1LeJZSVNUt0TuC66QaF927kXpVJ4oteWk2MB1
         g+vw==
X-Gm-Message-State: AFqh2krXhonLWlB2G9apZUfAxmL8be6a5dyAklBkFlV01dgWAoTI2mOc
	UTFJM/uv7ykDAMdNWsAa38wQf7uBeyTosB8MybQ=
X-Google-Smtp-Source: AMrXdXuztG0SNmH495gPDbzRStX/IndQDUj9OP9rAgDAGEkVoZow/doVDExFB34qKIecc3mpSz3O88mTcRxeBil0l94=
X-Received: by 2002:a05:600c:4b1b:b0:3b4:a6c4:70fb with SMTP id
 i27-20020a05600c4b1b00b003b4a6c470fbmr2999894wmp.79.1673093684612; Sat, 07
 Jan 2023 04:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20230106220020.1820147-1-anirudh.venkataramanan@intel.com> <20230106220020.1820147-8-anirudh.venkataramanan@intel.com>
In-Reply-To: <20230106220020.1820147-8-anirudh.venkataramanan@intel.com>
From: Anatoly Pugachev <matorola@gmail.com>
Date: Sat, 7 Jan 2023 15:14:33 +0300
Message-ID: <CADxRZqwkv=FyzyMvPf_Ou3nMQWOZ1jmAwOT22=9tigVVWfB3Gg@mail.gmail.com>
Subject: Re: [PATCH net-next 7/7] sparc: configs: Remove references to
 CONFIG_SUNVNET and CONFIG_LDMVSW
To: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, netdev@vger.kernel.org, linux-mips@vger.kernel.org, linux-pci@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 7, 2023 at 1:00 AM Anirudh Venkataramanan
<anirudh.venkataramanan@intel.com> wrote:
>
> An earlier patch removed the Sun LDOM vswitch and sunvnet drivers. Remove
> references to CONFIG_SUNVNET and CONFIG_LDMVSW from the sparc64 defconfig.
>
> Cc: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
> ---
>  arch/sparc/configs/sparc64_defconfig | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/sparc/configs/sparc64_defconfig b/arch/sparc/configs/sparc64_defconfig
> index 1809909..a2c76e8 100644
> --- a/arch/sparc/configs/sparc64_defconfig
> +++ b/arch/sparc/configs/sparc64_defconfig
> @@ -95,8 +95,6 @@ CONFIG_MII=m
>  CONFIG_SUNLANCE=m
>  CONFIG_HAPPYMEAL=y
>  CONFIG_SUNGEM=m
> -CONFIG_SUNVNET=m
> -CONFIG_LDMVSW=m
>  CONFIG_NET_PCI=y
>  CONFIG_E1000=m
>  CONFIG_E1000E=m

I wonder what is the reason for removing the perfectly working sunvnet
driver which is used in LDOMs under sun hardware hypervisor?
Can we please not remove drivers which are actually used? Or either
drop sparc32/sparc64 (whole arch) from linux kernel as well. Thanks.
