Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3991DF2A8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 01:03:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TMVV1xQgzDr0f
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 09:03:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.66; helo=mail-io1-f66.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TMSk1ZMRzDqp5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 09:02:13 +1000 (AEST)
Received: by mail-io1-f66.google.com with SMTP id u23so112054iot.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 16:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C/nTM//7FB1PAbN/moZIfyohRFuX/F3Z6XuMSd7PjCw=;
 b=JDl6ol/xMkL25itSIHg2XSDZkQ7vMFyfcT55vEEBXdL0Ygk90rmotXQP6NoFsky5GS
 h7CoTxGgN8m+3LsqcESupU+6XUGVzBKmHJ+R1+vyb450VAWg4qPOwZY702xKqJOhMGcP
 bWRtvCNrvJAQYhPOKLvXz1jvuwxn1lpPtXOF2ImT1QDLd47jLZmmf+NNMqJ+6oLeL4O6
 D1GDRcDtHChgSbB8NmSJb2hhidiQeyYVBJNoUd9ciKt53t8TkXZYpu3/LtRFtWXR9VbK
 O0gMJTYvaqyC93jmeKhjrxelw5xwLyGg4P1H/ogF5UauZwVpHLNjeuVKE3wELEECdYi7
 0frw==
X-Gm-Message-State: AOAM532WSxORNOmkkCWDK5JHARhJA2DMW12oMxS1oYuxoUdVJRzzmg1i
 IwZY77W34FtXHElVYHiW45tNb7Cm+bg=
X-Google-Smtp-Source: ABdhPJz6mVFVMrN1EYO2UKBiidlPpRep66NWTJFjCyhoQh82wlERIAHlpmNibsmHvCa8o/8XDsAyGQ==
X-Received: by 2002:a5d:8615:: with SMTP id f21mr5018667iol.155.1590188530870; 
 Fri, 22 May 2020 16:02:10 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177])
 by smtp.gmail.com with ESMTPSA id z24sm4044698ioe.18.2020.05.22.16.02.09
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 16:02:10 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id r2so1202860ila.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 16:02:09 -0700 (PDT)
X-Received: by 2002:a92:5cc1:: with SMTP id d62mr15036209ilg.95.1590188529711; 
 Fri, 22 May 2020 16:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200327161349.284679-1-colin.king@canonical.com>
In-Reply-To: <20200327161349.284679-1-colin.king@canonical.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 22 May 2020 18:01:44 -0500
X-Gmail-Original-Message-ID: <CADRPPNQ4KrnSsG2PxgXxe-+c5DQsUNQjw3f9Xq-kxP3+xAaQcQ@mail.gmail.com>
Message-ID: <CADRPPNQ4KrnSsG2PxgXxe-+c5DQsUNQjw3f9Xq-kxP3+xAaQcQ@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: clean up an indentation issue
To: Colin King <colin.king@canonical.com>
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
Cc: kernel-janitors@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 27, 2020 at 11:15 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a statement that not indented correctly, remove the
> extraneous space.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied for next.  Thanks.

> ---
>  drivers/soc/fsl/qe/ucc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/fsl/qe/ucc.c b/drivers/soc/fsl/qe/ucc.c
> index d6c93970df4d..cac0fb7693a0 100644
> --- a/drivers/soc/fsl/qe/ucc.c
> +++ b/drivers/soc/fsl/qe/ucc.c
> @@ -519,7 +519,7 @@ int ucc_set_tdm_rxtx_clk(u32 tdm_num, enum qe_clock clock,
>         int clock_bits;
>         u32 shift;
>         struct qe_mux __iomem *qe_mux_reg;
> -        __be32 __iomem *cmxs1cr;
> +       __be32 __iomem *cmxs1cr;
>
>         qe_mux_reg = &qe_immr->qmx;
>
> --
> 2.25.1
>
