Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 766DB7EDCF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 09:33:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PBC2nqLu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWCwy2h98z3cWs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 19:33:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PBC2nqLu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWCw34ZGzz30LM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 19:32:50 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6b709048f32so493362b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 00:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700123563; x=1700728363; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=472+ou2t+S30ff1NG7gEMF59MEFWKxcoDKHurEpmvAA=;
        b=PBC2nqLuTCSydP9AH0JenBCN2r/NnwjlQqwFwv2eb5fbZ276LXwaAsjcTB7A7CiWfH
         wrcc6b6/B9d2QuMCWdxvPEFpoFN85qhYNmDpeIcDQwPeImk48aDHQInwIjfQ5vB37lXF
         qcmat+fZuR/DO8fDHVf2o/GhyQkLSpkXSWwKYYAYMn0LZ4dsshi0e5RPhU706B9A6lKX
         ALIydM0YumyLAKzkY+K6tsM+x/tRLl2+gjTXUl1ERXJNM2+C60C5B3CIkwOu76FvWaj+
         zFbDTj2iaCGjUsH7NdWfH1dlzwUR+hsUMmc9yIPVvqMsU3iPeCK11N3JjoQI45LXhqEM
         zZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700123563; x=1700728363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=472+ou2t+S30ff1NG7gEMF59MEFWKxcoDKHurEpmvAA=;
        b=UG+Lv/juYf4Uuaf/SQthy/fMG8TO7aEcfmZTrzU1FkfoZ2BEjxnvuvfeyqhUNXiEi3
         RTcEqcq3odEmUXjuwGDGAMa+vyKT8RP50ujevJeZ5y6d3yzO30c49tTfrNdVCy2X/YzI
         1W7R7a3iIaUOJkmk942hpFAoOqPiXupS6E8wbn9Yf7Bn0L8TDf5gYYt1ag7UdgPTrk2X
         SV/wFp5UiHcbNAspt0Ut5AVjhMWQWUD2HG6AqmvFwA8NX1HhNop6MZGL3srsCdjVp5XZ
         l+gzHybGo56bJR7aRIRusI+/lJ0s+h4t/CLCy9g3GU6LrX8CNMkac6kqFvdjRdhlCQQ+
         BUTQ==
X-Gm-Message-State: AOJu0YxjPBWk02v6QQ2Tu2KkzBezUbLXao+C5gKdmD3lHwi5PBIHKErD
	K4r7BvxJ0ornMwjSlHWoRGTyOj9eULg+8Xxz+Q0=
X-Google-Smtp-Source: AGHT+IHmJjTLt2CLeHrk7+YuJuksA+MXs3rCdxF6kfgetAkHlbGR3SpegcpCFFHLyAVwVjm4C02UQNvYyF5MjQvkB8k=
X-Received: by 2002:a05:6a20:42a8:b0:187:d380:fd98 with SMTP id
 o40-20020a056a2042a800b00187d380fd98mr337525pzj.44.1700123563211; Thu, 16 Nov
 2023 00:32:43 -0800 (PST)
MIME-Version: 1.0
References: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
 <1699595289-25773-15-git-send-email-shengjiu.wang@nxp.com> <70821f4c-d0f8-4a35-b664-0823bf430816@kernel.org>
In-Reply-To: <70821f4c-d0f8-4a35-b664-0823bf430816@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 16 Nov 2023 16:32:31 +0800
Message-ID: <CAA+D8ANiNr0DVNP4eiTGVzvYGxTJJBjJocW++x0A9GDEbNTqRA@mail.gmail.com>
Subject: Re: [PATCH v9 14/15] media: imx-asrc: Add memory to memory driver
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 11, 2023 at 4:16=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/11/2023 06:48, Shengjiu Wang wrote:
> > +static int asrc_m2m_probe(struct platform_device *pdev)
> > +{
> > +     struct fsl_asrc_m2m_pdata *data =3D pdev->dev.platform_data;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct asrc_m2m *m2m;
> > +     int ret;
> > +
> > +     m2m =3D devm_kzalloc(dev, sizeof(struct asrc_m2m), GFP_KERNEL);
>
> sizeof(*)
>
> > +     if (!m2m)
> > +             return -ENOMEM;
> > +
> > +     m2m->pdata =3D *data;
> > +     m2m->pdev =3D pdev;
> > +
> > +     ret =3D v4l2_device_register(dev, &m2m->v4l2_dev);
> > +     if (ret) {
> > +             dev_err(dev, "failed to register v4l2 device\n");
> > +             goto err_register;
> > +     }
> > +
> > +     m2m->m2m_dev =3D v4l2_m2m_init(&asrc_m2m_ops);
> > +     if (IS_ERR(m2m->m2m_dev)) {
> > +             dev_err(dev, "failed to register v4l2 device\n");
>
> Why aren't you using dev_err_probe() at all?

ok, will use dev_err_probe.

>
> > +             ret =3D PTR_ERR(m2m->m2m_dev);
> > +             goto err_m2m;
> > +     }
> > +
> > +     m2m->dec_vdev =3D video_device_alloc();
> > +     if (!m2m->dec_vdev) {
> > +             dev_err(dev, "failed to register v4l2 device\n");
>
> Why do you print errors on ENOMEM?

ok, will remove this print.

>
> Did you run coccinelle?

Does coccinelle report issue for print error on ENOMEM?

I try to run make coccicheck, but no issue report for it.

>
> > +             ret =3D -ENOMEM;
> > +             goto err_vdev_alloc;
> > +     }
> > +
> > +     mutex_init(&m2m->mlock);
> > +
> > +     m2m->dec_vdev->fops =3D &asrc_m2m_fops;
> > +     m2m->dec_vdev->ioctl_ops =3D &asrc_m2m_ioctl_ops;
> > +     m2m->dec_vdev->minor =3D -1;
> > +     m2m->dec_vdev->release =3D video_device_release;
> > +     m2m->dec_vdev->lock =3D &m2m->mlock; /* lock for ioctl serializat=
ion */
> > +     m2m->dec_vdev->v4l2_dev =3D &m2m->v4l2_dev;
> > +     m2m->dec_vdev->vfl_dir =3D VFL_DIR_M2M;
> > +     m2m->dec_vdev->device_caps =3D V4L2_CAP_STREAMING | V4L2_CAP_AUDI=
O_M2M;
> > +
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +     m2m->mdev.dev =3D &pdev->dev;
> > +     strscpy(m2m->mdev.model, M2M_DRV_NAME, sizeof(m2m->mdev.model));
> > +     snprintf(m2m->mdev.bus_info, sizeof(m2m->mdev.bus_info),
> > +              "platform:%s", M2M_DRV_NAME);
> > +     media_device_init(&m2m->mdev);
> > +     m2m->mdev.ops =3D &asrc_m2m_media_ops;
> > +     m2m->v4l2_dev.mdev =3D &m2m->mdev;
> > +#endif
> > +
> > +     ret =3D video_register_device(m2m->dec_vdev, VFL_TYPE_AUDIO, -1);
> > +     if (ret) {
> > +             dev_err(dev, "failed to register video device\n");
> > +             goto err_vdev_register;
> > +     }
> > +
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +     ret =3D v4l2_m2m_register_media_controller(m2m->m2m_dev, m2m->dec=
_vdev,
> > +                                              MEDIA_ENT_F_PROC_AUDIO_R=
ESAMPLER);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to init mem2mem media controller\n")=
;
> > +             goto error_v4l2;
> > +     }
> > +
> > +     ret =3D media_device_register(&m2m->mdev);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to register mem2mem media device\n")=
;
> > +             goto error_m2m_mc;
> > +     }
> > +#endif
> > +
> > +     video_set_drvdata(m2m->dec_vdev, m2m);
> > +     platform_set_drvdata(pdev, m2m);
> > +     pm_runtime_enable(&pdev->dev);
> > +
> > +     return 0;
> > +
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +error_m2m_mc:
> > +     v4l2_m2m_unregister_media_controller(m2m->m2m_dev);
> > +#endif
> > +error_v4l2:
> > +     video_unregister_device(m2m->dec_vdev);
> > +err_vdev_register:
> > +     video_device_release(m2m->dec_vdev);
> > +err_vdev_alloc:
> > +     v4l2_m2m_release(m2m->m2m_dev);
> > +err_m2m:
> > +     v4l2_device_unregister(&m2m->v4l2_dev);
> > +err_register:
> > +     return ret;
> > +}
> > +
> > +static void asrc_m2m_remove(struct platform_device *pdev)
> > +{
> > +     struct asrc_m2m *m2m =3D platform_get_drvdata(pdev);
> > +
> > +     pm_runtime_disable(&pdev->dev);
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +     media_device_unregister(&m2m->mdev);
> > +     v4l2_m2m_unregister_media_controller(m2m->m2m_dev);
> > +#endif
> > +     video_unregister_device(m2m->dec_vdev);
> > +     video_device_release(m2m->dec_vdev);
> > +     v4l2_m2m_release(m2m->m2m_dev);
> > +     v4l2_device_unregister(&m2m->v4l2_dev);
> > +}
> > +
> > +#ifdef CONFIG_PM_SLEEP
> > +/* suspend callback for m2m */
> > +static int asrc_m2m_suspend(struct device *dev)
> > +{
> > +     struct asrc_m2m *m2m =3D dev_get_drvdata(dev);
> > +     struct fsl_asrc *asrc =3D m2m->pdata.asrc;
> > +     struct fsl_asrc_pair *pair;
> > +     unsigned long lock_flags;
> > +     int i;
> > +
> > +     for (i =3D 0; i < PAIR_CTX_NUM; i++) {
> > +             spin_lock_irqsave(&asrc->lock, lock_flags);
> > +             pair =3D asrc->pair[i];
> > +             if (!pair || !pair->req_pair) {
> > +                     spin_unlock_irqrestore(&asrc->lock, lock_flags);
> > +                     continue;
> > +             }
> > +             if (!completion_done(&pair->complete[V4L_OUT])) {
> > +                     if (pair->dma_chan[V4L_OUT])
> > +                             dmaengine_terminate_all(pair->dma_chan[V4=
L_OUT]);
> > +                     asrc_input_dma_callback((void *)pair);
> > +             }
> > +             if (!completion_done(&pair->complete[V4L_CAP])) {
> > +                     if (pair->dma_chan[V4L_CAP])
> > +                             dmaengine_terminate_all(pair->dma_chan[V4=
L_CAP]);
> > +                     asrc_output_dma_callback((void *)pair);
> > +             }
> > +
> > +             if (asrc->m2m_pair_suspend)
> > +                     asrc->m2m_pair_suspend(pair);
> > +
> > +             spin_unlock_irqrestore(&asrc->lock, lock_flags);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int asrc_m2m_resume(struct device *dev)
> > +{
> > +     struct asrc_m2m *m2m =3D dev_get_drvdata(dev);
> > +     struct fsl_asrc *asrc =3D m2m->pdata.asrc;
> > +     struct fsl_asrc_pair *pair;
> > +     unsigned long lock_flags;
> > +     int i;
> > +
> > +     for (i =3D 0; i < PAIR_CTX_NUM; i++) {
> > +             spin_lock_irqsave(&asrc->lock, lock_flags);
> > +             pair =3D asrc->pair[i];
> > +             if (!pair || !pair->req_pair) {
> > +                     spin_unlock_irqrestore(&asrc->lock, lock_flags);
> > +                     continue;
> > +             }
> > +             if (asrc->m2m_pair_resume)
> > +                     asrc->m2m_pair_resume(pair);
> > +
> > +             spin_unlock_irqrestore(&asrc->lock, lock_flags);
> > +     }
> > +
> > +     return 0;
> > +}
> > +#endif
> > +
> > +static const struct dev_pm_ops asrc_m2m_pm_ops =3D {
> > +     SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(asrc_m2m_suspend,
> > +                                   asrc_m2m_resume)
> > +};
> > +
> > +static struct platform_driver asrc_m2m_driver =3D {
> > +     .probe  =3D asrc_m2m_probe,
> > +     .remove_new =3D asrc_m2m_remove,
> > +     .driver =3D {
> > +             .name =3D M2M_DRV_NAME,
> > +             .pm =3D &asrc_m2m_pm_ops,
> > +     },
> > +};
> > +module_platform_driver(asrc_m2m_driver);
> > +
> > +MODULE_DESCRIPTION("Freescale ASRC M2M driver");
> > +MODULE_ALIAS("platform:" M2M_DRV_NAME);
>
> You should not need MODULE_ALIAS() in normal cases. If you need it,
> usually it means your device ID table is wrong (e.g. misses either
> entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
> for incomplete ID table.


This driver don't have MODULE_DEVICE_TABLE.  it is only registered
by platform_device_register_data().

best regards
wang shengjiu
>
>
> > +MODULE_LICENSE("GPL");
>
> Best regards,
> Krzysztof
>
