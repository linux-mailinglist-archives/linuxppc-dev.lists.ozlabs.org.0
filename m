Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 949A920C149
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 14:50:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vDBh0Q6czDrBZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 22:50:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b42;
 helo=mail-yb1-xb42.google.com; envelope-from=bmeng.cn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AeRzz+WB; dkim-atps=neutral
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vD8K5xwrzDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 22:48:44 +1000 (AEST)
Received: by mail-yb1-xb42.google.com with SMTP id m16so5861341ybf.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 05:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+HfAsc3Fw0I2/Pkf86A5lqfA/70gYLaBPcWCq9aJpao=;
 b=AeRzz+WBhKO+5GtOCaz+ccjrHZUKiTXdnnfYWgLxCfdztvFYjHPD77187NcrFOFh5A
 Q7jh2fJcHOFk6mS4IQ4NulKW+vb72CRV4DQv3kPTr1C2QkIYs/gzhYa+jS41LaJrC9c/
 gDKcW9jp/Amq7jv94tzJB5lNCDRi2u0EfrhIRchUo7DQFbr06k1dRpvvp2ODoGEnrXrK
 7I60UP54+w0wjSNonkS9/XqERdAWY7hs1I6RefxXIdPHas4jp0XYxlA6P8gws88mq3AF
 OYJIRRRA0C7zNX/FXhHNhc64r0pkSWCtxlDycm23bPSF48C6iVzDOQX4FAiClnsPssOL
 XO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+HfAsc3Fw0I2/Pkf86A5lqfA/70gYLaBPcWCq9aJpao=;
 b=pC98Dbcw3hYKzwq63iXrSWxSZhASn9cw8aEosV1Sq/zcbyEWNAuuN7r1SgMR+y0wit
 iDqe35f24GaSQ6uUua0ceIxP5+APp8NCAHBg2IYL5ZHh+78nnnlcDPkewWyjSksFIxby
 EUXO71k09/pVjmS+ZP4k9KGq4peKVCewoeYvrz3OiRnYWdHpdsYO1Mr+yVSln1bfcXUN
 Ipu3Z6B/kHok7VQWnvEMwuzbBTBsNG6627DMyT23BEV1JZG72t3ck/O2nOakmJUWeZWy
 gornYuiBOtfHUQqOCx8lpwCw4bZoscMj6CIJ3qxuHLXCNOWfBy9bK7/kvhhRGY7Ng/Fm
 t59w==
X-Gm-Message-State: AOAM530UkFpoyU2MARHrR6gfwTooDTOikitclcOxNckNLBUZhESYJEzo
 TkP/QTqj3BtXieWS6oOE8hvUcTuFpYGje7U+SG0NiA==
X-Google-Smtp-Source: ABdhPJzjf74IrntbQ4ZBa5tcfJ5vYcPJob6AkZpl9XawpxW9SaujUKcSkKn4BsHUIoQmUpZ8VWY0rIQ8OmtuQhYb8S8=
X-Received: by 2002:a25:fc26:: with SMTP id v38mr10924450ybd.314.1593262120092; 
 Sat, 27 Jun 2020 05:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <1588394694-517-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1588394694-517-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 27 Jun 2020 20:48:29 +0800
Message-ID: <CAEUhbmUj4iC1+4Y=93zpj+aCBqU1ySOHXvQgJHmxNx__UWduCQ@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc: Drop CONFIG_MTD_M25P80 in 85xx-hw.config
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 2, 2020 at 12:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Drop CONFIG_MTD_M25P80 that was removed in
> commit b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
> Changes in v2:
> - correct the typo (5xx => 85xx) in the commit title
>
>  arch/powerpc/configs/85xx-hw.config | 1 -
>  1 file changed, 1 deletion(-)
>

It seems this patch isn't applied anywhere. Ping?
