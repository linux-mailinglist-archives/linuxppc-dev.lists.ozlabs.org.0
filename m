Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E915848704C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 03:23:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVRpF6dr8z3bcY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 13:23:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.177;
 helo=mail-qk1-f177.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVRnl2JRGz2yNW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 13:22:32 +1100 (AEDT)
Received: by mail-qk1-f177.google.com with SMTP id de30so4660954qkb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jan 2022 18:22:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ozs941wKBNQg3LxRfsqbP6OaMzoQiK3QsZ3gg9gac/I=;
 b=7zv8dBtvVyVXkZiLmZua0bsSjM5IKLd5eEz0aefLzd4KSwFv2vwxxOJeIQES+Kkg2Q
 EcTxLfnr5G8QH4xxy2rIg7lOp2oGLIL2h7hFSVWx/HvfbUSt5gN6B1+etz15PJw8Vm2l
 xJVGo8554fY3klC2wau73pQ1XD0u1ObUI5r+q9ulEzPlocvngvWgnhFUhfyqeVcb7R3/
 +mVlczo9++IN6QzAhLwUqH7npJRMm+t9UOy/Vbr8sk7RH++dirIP/n6sIwcdglx2vQp3
 JqYfA3B/CS5Ii3Fq6cENYdt6Df58rC22u6NDr6th9+OJFHLEEITs5BNKP9goTkva4cmp
 XXyA==
X-Gm-Message-State: AOAM530ZfcSrPpID6C+Z3RvWBDj/bkWWHFGeT6Il0TylIqFY2oPOgSWX
 lXidoYlOuSPVkPFUCZd1/SafsPxHUQunpQ==
X-Google-Smtp-Source: ABdhPJz3a3RuFkeRYCGTiPsx5ZxXx1cbryJrQN7OqvE925fyJU+00wPxJQAtkeBkRPdObCTses95TA==
X-Received: by 2002:a37:844:: with SMTP id 65mr44427623qki.683.1641522148291; 
 Thu, 06 Jan 2022 18:22:28 -0800 (PST)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com.
 [209.85.219.46])
 by smtp.gmail.com with ESMTPSA id j16sm2845003qtx.92.2022.01.06.18.22.27
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 18:22:28 -0800 (PST)
Received: by mail-qv1-f46.google.com with SMTP id o10so4195762qvc.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jan 2022 18:22:27 -0800 (PST)
X-Received: by 2002:a05:6214:1d01:: with SMTP id
 e1mr4141088qvd.72.1641522147639; 
 Thu, 06 Jan 2022 18:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20211230014543.1799867-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20211230014543.1799867-1-jiasheng@iscas.ac.cn>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 7 Jan 2022 10:22:15 +0800
X-Gmail-Original-Message-ID: <CADRPPNSsLYzv6ueSqVu4b3yep7JYLJBJcNwbiBVG61ADyqaPBw@mail.gmail.com>
Message-ID: <CADRPPNSsLYzv6ueSqVu4b3yep7JYLJBJcNwbiBVG61ADyqaPBw@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: Check of ioremap return value
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 30, 2021 at 9:47 AM Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
>
> As the possible failure of the ioremap(), the par_io could be NULL.
> Therefore it should be better to check it and return error in order to
> guarantee the success of the initiation.
> But, I also notice that all the caller like mpc85xx_qe_par_io_init() in
> `arch/powerpc/platforms/85xx/common.c` don't check the return value of
> the par_io_init().
> Actually, par_io_init() needs to check to handle the potential error.
> I will submit another patch to fix that.
> Anyway, par_io_init() itsely should be fixed.
>
> Fixes: 7aa1aa6ecec2 ("QE: Move QE from arch/powerpc to drivers/soc")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Applied for next.  Thanks.

> ---
>  drivers/soc/fsl/qe/qe_io.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
> index e277c827bdf3..a5e2d0e5ab51 100644
> --- a/drivers/soc/fsl/qe/qe_io.c
> +++ b/drivers/soc/fsl/qe/qe_io.c
> @@ -35,6 +35,8 @@ int par_io_init(struct device_node *np)
>         if (ret)
>                 return ret;
>         par_io = ioremap(res.start, resource_size(&res));
> +       if (!par_io)
> +               return -ENOMEM;
>
>         if (!of_property_read_u32(np, "num-ports", &num_ports))
>                 num_par_io_ports = num_ports;
> --
> 2.25.1
>
