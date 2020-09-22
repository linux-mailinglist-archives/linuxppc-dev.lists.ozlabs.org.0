Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5999F274C67
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 00:47:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwxJK4sPZzDqWs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 08:46:57 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwxFh5lBrzDqWY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 08:44:40 +1000 (AEST)
Received: by mail-ot1-f67.google.com with SMTP id g96so17160259otb.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 15:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ci5rMCAbIUPU0EeoukaCTdHdW/bYhDqRoC55epoKiGw=;
 b=VEUDY715b2Ak1dsHDKwSInIiZbkm5BlpsFKvj1w9L29QAPwaXkS7/+8lYpHRhKO25m
 rMLKO1/bItmmTlBzJeGmWx7HQgo8TrJp1V1oQwcV4zuphl7lvRETjWqyveQhfPQ73Opn
 34hAuSZ6j5NzxcohQ+mzIJxKrHHKi4BzOD7llgkqkm9uqUbb1Tjgzd2U7ZB+HvFkMUp0
 si9TZEIuyvZ3HaWKFOoabx2PGUPvJ4CA19ggH7aWgnuZZvHTQm2FLm5NP70D+g6ffxOE
 Hlc6tvoyN97DPLmEmaEzRtYYXZbqW1RgYwXM9MmTtfVW2pPZ2MLexIRsQmuvLyCg2YfQ
 RajA==
X-Gm-Message-State: AOAM5327GMesXdccQ4h2wILLs3p5n+toQdZgbYrAzl7vpFYVbucmCPje
 HJQZMlkJa1IPLz+wbS3CCnPWt4p7mgjtrK+g
X-Google-Smtp-Source: ABdhPJyF96IFpYpwKR1yqjSqA7+AvGujGPYypC9bK71SbRdtRkcPq2Bi3jTE8+dgc4OBzZFsuyJsew==
X-Received: by 2002:a9d:4e1a:: with SMTP id p26mr4419325otf.197.1600814676583; 
 Tue, 22 Sep 2020 15:44:36 -0700 (PDT)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com.
 [209.85.161.50])
 by smtp.gmail.com with ESMTPSA id k13sm8604436ood.31.2020.09.22.15.44.35
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 15:44:35 -0700 (PDT)
Received: by mail-oo1-f50.google.com with SMTP id h8so4556315ooc.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 15:44:35 -0700 (PDT)
X-Received: by 2002:a4a:5896:: with SMTP id f144mr4501811oob.49.1600814675462; 
 Tue, 22 Sep 2020 15:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200910140415.1132266-1-yanaijie@huawei.com>
 <CAJKOXPcsrL2T9EmiSnOhrC5Lh+ZM=nY4Go52cVDv1S6wxn5DHQ@mail.gmail.com>
In-Reply-To: <CAJKOXPcsrL2T9EmiSnOhrC5Lh+ZM=nY4Go52cVDv1S6wxn5DHQ@mail.gmail.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 22 Sep 2020 17:44:23 -0500
X-Gmail-Original-Message-ID: <CADRPPNQQ+fjAgFu9=vRKhi_fMwW8jaqrGNYkDohQRTq4vOkehg@mail.gmail.com>
Message-ID: <CADRPPNQQ+fjAgFu9=vRKhi_fMwW8jaqrGNYkDohQRTq4vOkehg@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: dpio: remove set but not used 'addr_cena'
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: Jason Yan <yanaijie@huawei.com>, Roy Pledge <Roy.Pledge@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Youri Querry <youri.querry_1@nxp.com>, Hulk Robot <hulkci@huawei.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 20, 2020 at 3:20 PM Krzysztof Kozlowski <krzk@kernel.org> wrote=
:
>
> On Thu, 10 Sep 2020 at 16:57, Jason Yan <yanaijie@huawei.com> wrote:
> >
> > This addresses the following gcc warning with "make W=3D1":
> >
> > drivers/soc/fsl/dpio/qbman-portal.c: In function
> > =E2=80=98qbman_swp_enqueue_multiple_direct=E2=80=99:
> > drivers/soc/fsl/dpio/qbman-portal.c:650:11: warning: variable
> > =E2=80=98addr_cena=E2=80=99 set but not used [-Wunused-but-set-variable=
]
> >   650 |  uint64_t addr_cena;
> >       |           ^~~~~~~~~
> >
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Jason Yan <yanaijie@huawei.com>
>
> This was already reported:
> Reported-by: kernel test robot <lkp@intel.com>
> https://lkml.org/lkml/2020/6/12/290
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied for next.  Thanks.

>
> Best regards,
> Krzysztof
>
> > ---
> >  drivers/soc/fsl/dpio/qbman-portal.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio=
/qbman-portal.c
> > index 0ab85bfb116f..659b4a570d5b 100644
> > --- a/drivers/soc/fsl/dpio/qbman-portal.c
> > +++ b/drivers/soc/fsl/dpio/qbman-portal.c
> > @@ -647,7 +647,6 @@ int qbman_swp_enqueue_multiple_direct(struct qbman_=
swp *s,
> >         const uint32_t *cl =3D (uint32_t *)d;
> >         uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
> >         int i, num_enqueued =3D 0;
> > -       uint64_t addr_cena;
> >
> >         spin_lock(&s->access_spinlock);
> >         half_mask =3D (s->eqcr.pi_ci_mask>>1);
> > @@ -701,7 +700,6 @@ int qbman_swp_enqueue_multiple_direct(struct qbman_=
swp *s,
> >
> >         /* Flush all the cacheline without load/store in between */
> >         eqcr_pi =3D s->eqcr.pi;
> > -       addr_cena =3D (size_t)s->addr_cena;
> >         for (i =3D 0; i < num_enqueued; i++)
> >                 eqcr_pi++;
> >         s->eqcr.pi =3D eqcr_pi & full_mask;
> > --
> > 2.25.4
> >
