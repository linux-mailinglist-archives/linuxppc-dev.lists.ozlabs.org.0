Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8BB1BD940
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 12:15:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BvXH4CCSzDr1x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 20:15:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BvVY5Jw6zDqv9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 20:13:38 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id j26so1234144ots.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 03:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GAfuhEzVW9yjP9v9ZyOBXMfmtyVV4v9q9d6s8nYURRw=;
 b=Q4dPjXYWICIpF7Atm6hOTiG5wnnYjo0EYa7F9FjbvdRdXiV4otrAwdbMq2hpvpuKIY
 go321Ml8XySX2b/41Oezi5utoMg7BAYTTvgVIDKKTZjaenuRK+jg2HJgJq6w4ucei4lp
 AD5nMCF+ZO/YItnT6XztCD8QdWPMMBBuP8RBJhpHkPkfPTyYfjOr17DSYK9w61KUUt1O
 JCkGIrK9VZn+Gaq3Un2/nR1AFnFrfscFVPnFfPp0T2xMJo7NB+u2RK0OV8c6qOeUrmf/
 26aFdHb51mnk0/Qvm/pBgWC6r+L23qTVA3OS8tStqoCc617gYuN81Tx1YYu1/ZV7RZfP
 fSAw==
X-Gm-Message-State: AGi0PuZqO51SEIPHGq0ImY8dBMAsPkBkw6ejkF4fpvRLFBkTJpVHbylS
 /0VGMUFJob2pVFb0oXygp7frFEzdGro5RIjRmtQ=
X-Google-Smtp-Source: APiQypLNl85RevSy0/DHCOQ/0uIL1S8p+SQGkgEw2+WUCF5vUQENVyz6mpH0BtVc15iBHXl6+3WkdKUTDOHxMtdqO7E=
X-Received: by 2002:a9d:564:: with SMTP id 91mr25989025otw.250.1588155216129; 
 Wed, 29 Apr 2020 03:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <1588154448-56759-1-git-send-email-wangxiongfeng2@huawei.com>
In-Reply-To: <1588154448-56759-1-git-send-email-wangxiongfeng2@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2020 12:13:24 +0200
Message-ID: <CAMuHMdUn357yn5s6x4KRPwSZP1pTqq1PNXW9TqBRnfOXJaxY_Q@mail.gmail.com>
Subject: Re: [PATCH] powerpc/ps3: Move static keyword to the front of
 declaration
To: Xiongfeng Wang <wangxiongfeng2@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Geoff Levand <geoff@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 29, 2020 at 12:07 PM Xiongfeng Wang
<wangxiongfeng2@huawei.com> wrote:
> Move the static keyword to the front of declaration of 'vuart_bus_priv',
> and resolve the following compiler warning that can be seen when
> building with warnings enabled (W=3D1):
>
> drivers/ps3/ps3-vuart.c:867:1: warning: =E2=80=98static=E2=80=99 is not a=
t beginning of declaration [-Wold-style-declaration]
>  } static vuart_bus_priv;
>  ^
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
