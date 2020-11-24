Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE932C1A33
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 01:52:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cg57z05xvzDqRm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 11:51:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cg55x5bM6zDqRb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 11:50:08 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id 92so14724752otd.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 16:50:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iOdTCmgyt3Rw2NWUSk3IqpjqjDIXkanlk8cXx/I9Kbo=;
 b=Iz1xiqQB81lDF1iTFb/qMynrYFYCgQZO7zyTbkvjEJ+cKyOepUVn35GWJs8P7MMn1O
 GlVjWygAZwOEBxrq/EsCVOozgKthvkW2nVpAUJeaQr+7QnkaeOLpo7d8AAmUictCHyHJ
 Y86T9zXLKMMRgMNVyGv51UMDO3CRYIZ/arbi3qgnJxZAU1xskisGY7ZlPK8ktrk0cPQN
 7pqlY5T92adMi0IB/6JFBoC1H4nzhV77MDZaniQoD1O9f7NmgM5wq41gqZ9y6YwoJvLB
 hqnHGHD7UbP8rjJdUI8HcJWc1ri8TVmV75irhBE7ITX57eAgZn0KLAQQS9moSNf220HX
 EpCw==
X-Gm-Message-State: AOAM531yXgw72x2og0YV/6Tu5s+qyL1O7wwoTe5EuJlUSSERQCuHi8fW
 /Qzg9ZLVKU09+756kekDiVF2PaNHlm/28g==
X-Google-Smtp-Source: ABdhPJwPmliEJQAJa+SAlP/UAkknYTqygTdQqd4VZmcWggoIWdjhTNTWnYifdTku+KwFy0acVQJieA==
X-Received: by 2002:a05:6830:2301:: with SMTP id
 u1mr1544613ote.36.1606179005784; 
 Mon, 23 Nov 2020 16:50:05 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com.
 [209.85.210.48])
 by smtp.gmail.com with ESMTPSA id 189sm3019801oob.26.2020.11.23.16.50.05
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 16:50:05 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id g19so17762596otp.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 16:50:05 -0800 (PST)
X-Received: by 2002:a05:6830:160d:: with SMTP id
 g13mr1625578otr.74.1606179005016; 
 Mon, 23 Nov 2020 16:50:05 -0800 (PST)
MIME-Version: 1.0
References: <20201103152838.1290217-1-lee.jones@linaro.org>
 <20201103152838.1290217-26-lee.jones@linaro.org>
In-Reply-To: <20201103152838.1290217-26-lee.jones@linaro.org>
From: Li Yang <leoyang.li@nxp.com>
Date: Mon, 23 Nov 2020 18:49:53 -0600
X-Gmail-Original-Message-ID: <CADRPPNTguTHuRVhB_4QmN4N3Jorqi8y0gzm4Ew9D=qOuXqu=4g@mail.gmail.com>
Message-ID: <CADRPPNTguTHuRVhB_4QmN4N3Jorqi8y0gzm4Ew9D=qOuXqu=4g@mail.gmail.com>
Subject: Re: [PATCH 25/25] soc: fsl: qbman: qman: Remove unused variable
 'dequeue_wq'
To: Roy Pledge <Roy.Pledge@nxp.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Lee Jones <lee.jones@linaro.org>, YueHaibing <yuehaibing@huawei.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Roy,

On Tue, Nov 3, 2020 at 9:31 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/soc/fsl/qbman/qman.c: In function =E2=80=98qman_shutdown_fq=E2=
=80=99:
>  drivers/soc/fsl/qbman/qman.c:2700:8: warning: variable =E2=80=98dequeue_=
wq=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Cc: Li Yang <leoyang.li@nxp.com>
> Cc: YueHaibing <yuehaibing@huawei.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/soc/fsl/qbman/qman.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> index 9888a70618730..62b182c3a8b04 100644
> --- a/drivers/soc/fsl/qbman/qman.c
> +++ b/drivers/soc/fsl/qbman/qman.c
> @@ -2622,7 +2622,7 @@ int qman_shutdown_fq(u32 fqid)
>         union qm_mc_command *mcc;
>         union qm_mc_result *mcr;
>         int orl_empty, drain =3D 0, ret =3D 0;
> -       u32 channel, wq, res;
> +       u32 channel, res;
>         u8 state;
>
>         p =3D get_affine_portal();
> @@ -2655,7 +2655,7 @@ int qman_shutdown_fq(u32 fqid)
>         DPAA_ASSERT((mcr->verb & QM_MCR_VERB_MASK) =3D=3D QM_MCR_VERB_QUE=
RYFQ);
>         /* Need to store these since the MCR gets reused */
>         channel =3D qm_fqd_get_chan(&mcr->queryfq.fqd);
> -       wq =3D qm_fqd_get_wq(&mcr->queryfq.fqd);
> +       qm_fqd_get_wq(&mcr->queryfq.fqd);

This probably is not needed also.

>
>         if (channel < qm_channel_pool1) {
>                 channel_portal =3D get_portal_for_channel(channel);
> @@ -2697,7 +2697,6 @@ int qman_shutdown_fq(u32 fqid)
>                          * to dequeue from the channel the FQ is schedule=
d on
>                          */
>                         int found_fqrn =3D 0;
> -                       u16 dequeue_wq =3D 0;
>
>                         /* Flag that we need to drain FQ */
>                         drain =3D 1;
> @@ -2705,11 +2704,8 @@ int qman_shutdown_fq(u32 fqid)
>                         if (channel >=3D qm_channel_pool1 &&
>                             channel < qm_channel_pool1 + 15) {
>                                 /* Pool channel, enable the bit in the po=
rtal */
> -                               dequeue_wq =3D (channel -
> -                                             qm_channel_pool1 + 1)<<4 | =
wq;
>                         } else if (channel < qm_channel_pool1) {
>                                 /* Dedicated channel */
> -                               dequeue_wq =3D wq;

With these gone, these if statements seem to be redundant.  Can you
propose an additional patch to further cleanup the code here?  Thanks.

>                         } else {
>                                 dev_err(dev, "Can't recover FQ 0x%x, ch: =
0x%x",
>                                         fqid, channel);
> --
> 2.25.1
>
