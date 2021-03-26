Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2904349F68
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 03:18:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F65H36G65z3c0R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 13:18:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.47; helo=mail-ot1-f47.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F65Gj0Pzrz30G9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 13:17:48 +1100 (AEDT)
Received: by mail-ot1-f47.google.com with SMTP id
 m21-20020a9d7ad50000b02901b83efc84a0so3900430otn.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 19:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pN6nWQzQZ6AQx0kJQTtGWLMXZDRLpSHjIhqC/t+YFhY=;
 b=pg6OQeRkCiGEFuklTXqRxVXWIrc2+sp5ZILlzwgRB1hGFrOwLhdm02u1v1BVB769yf
 BlZfcAXVViKSyNI4vNWV7Lf1Ot6SGv/Sl5WK3aaRE1QbU39JR8xPEbZ1BztSrp/w0bEh
 o7HpydMDRWAfSCShesv1EQH9axaoEXP+E/Mc4acGKvK9NHNEgmM18qmYmMtTHjKUTrID
 XvJiQEcqC8g2k+qhVdt6gSM5J8UWXvzawDo71mgwfCzlf99bH0TtW3U46uh8crL2xfVp
 ydP9qAL4HHhKaQxKA2lwwgX8Lbfl08p0Rffbs07JXqALlWM6SEJ/FfYV0kLGKYxvb0Qw
 8DbQ==
X-Gm-Message-State: AOAM531zwM9D/ZKlmEXGQfTkQsZ2sIxHVWZYmZFdZ/knWQVb9kX1F+KD
 CwUE/UOvJbpatsL5mD8TE0nedQCzxJU=
X-Google-Smtp-Source: ABdhPJxygfLULdYinCKv9Q8ic/5/UoyrbuitbVjJZMSjpBz2Equ0HjVvOTtQsFpVvf+dw+YmutQrZg==
X-Received: by 2002:a05:6830:17d0:: with SMTP id
 p16mr9733626ota.127.1616725065533; 
 Thu, 25 Mar 2021 19:17:45 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
 [209.85.210.49])
 by smtp.gmail.com with ESMTPSA id x25sm1711902oto.72.2021.03.25.19.17.44
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 19:17:44 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id
 91-20020a9d08640000b0290237d9c40382so3890549oty.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 19:17:44 -0700 (PDT)
X-Received: by 2002:a05:6830:20da:: with SMTP id
 z26mr10108692otq.74.1616725064425; 
 Thu, 25 Mar 2021 19:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210323131530.2619900-1-arnd@kernel.org>
In-Reply-To: <20210323131530.2619900-1-arnd@kernel.org>
From: Li Yang <leoyang.li@nxp.com>
Date: Thu, 25 Mar 2021 21:17:33 -0500
X-Gmail-Original-Message-ID: <CADRPPNQJfJ=KmRGkX5Uo6VfWDsihrMUKV7OkQ7jtb3+Byb0RLQ@mail.gmail.com>
Message-ID: <CADRPPNQJfJ=KmRGkX5Uo6VfWDsihrMUKV7OkQ7jtb3+Byb0RLQ@mail.gmail.com>
Subject: Re: [PATCH] soc/fsl: qbman: fix conflicting alignment attributes
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Madalin-cristian Bucur <madalin.bucur@nxp.com>, soc@kernel.org,
 Lee Jones <lee.jones@linaro.org>, Roy Pledge <roy.pledge@nxp.com>,
 YueHaibing <yuehaibing@huawei.com>, lkml <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 8:17 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> When building with W=1, gcc points out that the __packed attribute
> on struct qm_eqcr_entry conflicts with the 8-byte alignment
> attribute on struct qm_fd inside it:
>
> drivers/soc/fsl/qbman/qman.c:189:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
>
> I assume that the alignment attribute is the correct one, and
> that qm_eqcr_entry cannot actually be unaligned in memory,
> so add the same alignment on the outer struct.
>
> Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/soc/fsl/qbman/qman.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> index a1b9be1d105a..fde4edd83c14 100644
> --- a/drivers/soc/fsl/qbman/qman.c
> +++ b/drivers/soc/fsl/qbman/qman.c
> @@ -186,7 +186,7 @@ struct qm_eqcr_entry {
>         __be32 tag;
>         struct qm_fd fd;
>         u8 __reserved3[32];
> -} __packed;
> +} __packed __aligned(8);

The EQCR structure is actually aligned on 64-byte from the manual.
But probably 8 is enough to let the compiler not complain.

>  #define QM_EQCR_VERB_VBIT              0x80
>  #define QM_EQCR_VERB_CMD_MASK          0x61    /* but only one value; */
>  #define QM_EQCR_VERB_CMD_ENQUEUE       0x01
> --
> 2.29.2
>
