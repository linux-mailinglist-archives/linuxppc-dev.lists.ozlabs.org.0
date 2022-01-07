Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6616487059
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 03:26:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVRt75lJpz3bcK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 13:26:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.181;
 helo=mail-qt1-f181.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVRsj6y89z2yfg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 13:26:01 +1100 (AEDT)
Received: by mail-qt1-f181.google.com with SMTP id y17so4217588qtx.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jan 2022 18:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=87V7qqVxSV9ymSZhSZ8xp9p8szVy6J09JVmD0DH7rzE=;
 b=rYEXe1VlASEn7vXlMI0sAOc1kLmA3uO7poyLIhKzr/4zYlebVb1SfZgB8L8HZL1u8s
 f8QnSCgQKH5q0Y/Az5kiuIwNGpBQ7T/5xhaaXe+HTcAGCubgjIxC437cUIKUBYEdNZec
 ohE+Ob2KqKLk4YKZcnWe3tVc9mUGU/o7aHcTC9Ts9lFo/UKgpIKYq0ikzdxjrL2L5Sil
 LIsSDXYnZwV/iEu0/90DHwXZF+mRb981ig5eT+fLrotoeuD2PHRyKoHSvnSPXhUFHmOO
 bAz+3um3f6E+9qBv5nUIOg6hnU1bcnjIWyEwDrp8KVjOosMJiVTkvhlhgMjwi0pdignn
 IS8A==
X-Gm-Message-State: AOAM530+b2u/iTFkQUUFh4NUCe1Jpm09qHT+C3gPhgTZkDOQBBqvrOXI
 DYa844QHSpDctaYqa8k+EE2Olta7CuXzWGrJ
X-Google-Smtp-Source: ABdhPJyg8BdUQ3CLdPTDbV1gikPjvTMCQJ1wv0xJcW5/S+H7NBmgf0xJSWRd+jQXBwqLH+27U0eFUw==
X-Received: by 2002:a05:622a:1c6:: with SMTP id
 t6mr54597762qtw.211.1641522358826; 
 Thu, 06 Jan 2022 18:25:58 -0800 (PST)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com.
 [209.85.219.52])
 by smtp.gmail.com with ESMTPSA id bl28sm756401qkb.17.2022.01.06.18.25.57
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 18:25:58 -0800 (PST)
Received: by mail-qv1-f52.google.com with SMTP id fo11so4203093qvb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jan 2022 18:25:57 -0800 (PST)
X-Received: by 2002:a05:6214:252a:: with SMTP id
 gg10mr57453503qvb.19.1641522357806; 
 Thu, 06 Jan 2022 18:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20211211090845.252700-1-wangborong@cdjrlc.com>
In-Reply-To: <20211211090845.252700-1-wangborong@cdjrlc.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 7 Jan 2022 10:25:46 +0800
X-Gmail-Original-Message-ID: <CADRPPNRe=qgH0n2XMTEro2+dYXcz82x=PcvhjiPX1GRGkkbfjg@mail.gmail.com>
Message-ID: <CADRPPNRe=qgH0n2XMTEro2+dYXcz82x=PcvhjiPX1GRGkkbfjg@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: fix typo in a comment
To: wangborong@cdjrlc.com
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

On Sat, Dec 11, 2021 at 5:12 PM Jason Wang <wangborong@cdjrlc.com> wrote:
>
> The double `is' in the comment in line 150 is repeated. Remove one
> of them from the comment.

Looks like you also removed a redundant tab in a new line.  We
probably can squeeze this trivial cleanup in, but we need to mention
it.

>
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Applied for next with commit message updated.

> ---
>  drivers/soc/fsl/qe/qe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index 4d38c80f8be8..b3c226eb5292 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -147,7 +147,7 @@ EXPORT_SYMBOL(qe_issue_cmd);
>   * memory mapped space.
>   * The BRG clock is the QE clock divided by 2.
>   * It was set up long ago during the initial boot phase and is
> - * is given to us.
> + * given to us.
>   * Baud rate clocks are zero-based in the driver code (as that maps
>   * to port numbers). Documentation uses 1-based numbering.
>   */
> @@ -421,7 +421,7 @@ static void qe_upload_microcode(const void *base,
>
>         for (i = 0; i < be32_to_cpu(ucode->count); i++)
>                 iowrite32be(be32_to_cpu(code[i]), &qe_immr->iram.idata);
> -
> +
>         /* Set I-RAM Ready Register */
>         iowrite32be(QE_IRAM_READY, &qe_immr->iram.iready);
>  }
> --
> 2.34.1
>
