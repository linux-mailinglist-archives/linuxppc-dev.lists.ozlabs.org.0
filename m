Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78D2717D1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 22:21:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bvf9Y3wrszDqjv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 06:21:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ovAyCNee; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bvf7Z3sS5zDqcT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 06:19:54 +1000 (AEST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7122720897
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 20:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600633190;
 bh=tEYZWaBgSpMov9mzVr3tGK3tHnfa7SQH05Xon68mJR4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ovAyCNeeUSd3NZnEeh5eCA9mpVIaA8QFF7tGlC3YpLtwcdzFtMF3Rt544ERHqox7N
 fQ7yvB1Q0nRvaxpjBqMEM3lITWhcLqBshrgNgZ7XYU5WT8FO/ZVzXPIGthP4Sic2XW
 p3aLGnx29ctbCW6oomdHtiFO/iQ2Zohb6jWpntOs=
Received: by mail-ed1-f47.google.com with SMTP id n22so10909224edt.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 13:19:50 -0700 (PDT)
X-Gm-Message-State: AOAM532yc9v/dtu8ruG9IzYDiHB3X0Zt71z/vstRx4OeLs2jcqQE6DjY
 ooeCDkl69gaq9n6YRVYi77eZK8bXXpicH5AY2mE=
X-Google-Smtp-Source: ABdhPJxFz7US67oDidXdHLkxA0kibKoSZu7zgANW15rRIppXBC+z7UsnV7Li7qTAXWzW+XsS6Q/uhd8uyMQN56dLbow=
X-Received: by 2002:aa7:da16:: with SMTP id r22mr50413600eds.132.1600633188982; 
 Sun, 20 Sep 2020 13:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200910140415.1132266-1-yanaijie@huawei.com>
In-Reply-To: <20200910140415.1132266-1-yanaijie@huawei.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 20 Sep 2020 22:19:37 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcsrL2T9EmiSnOhrC5Lh+ZM=nY4Go52cVDv1S6wxn5DHQ@mail.gmail.com>
Message-ID: <CAJKOXPcsrL2T9EmiSnOhrC5Lh+ZM=nY4Go52cVDv1S6wxn5DHQ@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: dpio: remove set but not used 'addr_cena'
To: Jason Yan <yanaijie@huawei.com>
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
Cc: Roy.Pledge@nxp.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 youri.querry_1@nxp.com, Hulk Robot <hulkci@huawei.com>, leoyang.li@nxp.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 10 Sep 2020 at 16:57, Jason Yan <yanaijie@huawei.com> wrote:
>
> This addresses the following gcc warning with "make W=3D1":
>
> drivers/soc/fsl/dpio/qbman-portal.c: In function
> =E2=80=98qbman_swp_enqueue_multiple_direct=E2=80=99:
> drivers/soc/fsl/dpio/qbman-portal.c:650:11: warning: variable
> =E2=80=98addr_cena=E2=80=99 set but not used [-Wunused-but-set-variable]
>   650 |  uint64_t addr_cena;
>       |           ^~~~~~~~~
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

This was already reported:
Reported-by: kernel test robot <lkp@intel.com>
https://lkml.org/lkml/2020/6/12/290

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

> ---
>  drivers/soc/fsl/dpio/qbman-portal.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/q=
bman-portal.c
> index 0ab85bfb116f..659b4a570d5b 100644
> --- a/drivers/soc/fsl/dpio/qbman-portal.c
> +++ b/drivers/soc/fsl/dpio/qbman-portal.c
> @@ -647,7 +647,6 @@ int qbman_swp_enqueue_multiple_direct(struct qbman_sw=
p *s,
>         const uint32_t *cl =3D (uint32_t *)d;
>         uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
>         int i, num_enqueued =3D 0;
> -       uint64_t addr_cena;
>
>         spin_lock(&s->access_spinlock);
>         half_mask =3D (s->eqcr.pi_ci_mask>>1);
> @@ -701,7 +700,6 @@ int qbman_swp_enqueue_multiple_direct(struct qbman_sw=
p *s,
>
>         /* Flush all the cacheline without load/store in between */
>         eqcr_pi =3D s->eqcr.pi;
> -       addr_cena =3D (size_t)s->addr_cena;
>         for (i =3D 0; i < num_enqueued; i++)
>                 eqcr_pi++;
>         s->eqcr.pi =3D eqcr_pi & full_mask;
> --
> 2.25.4
>
