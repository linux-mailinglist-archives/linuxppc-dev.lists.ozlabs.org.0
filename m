Return-Path: <linuxppc-dev+bounces-16411-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPRGBCYNfGkEKQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16411-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 02:45:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C06B63D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 02:45:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2JjX2mkmz2xjP;
	Fri, 30 Jan 2026 12:45:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::42f" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769737504;
	cv=pass; b=C4d+Dbug3DPCwQ+m8YUbiFOCgd4xjSYPIElEN1CbwUP0Y9b4kJr2kxUxvsxvMCDsffHWTtlGJy52CbpTJT7bX58C4uYudSR0/beXlL2VM4TXUXiLjf2f8znEi1T3aVl6F4GXubXklUiPcCuKRjlW80oypfbkIPd5HfA+iEF1Jt0OgjoXSfLQ90ARR85yMupgRHy9oflIuWvaSR2n5tRk+9LFqVpC42f6oQEwLtKRx90raNnfzyGThaN3wv4wJQChK3YUfKBpuuRjP0dvr+NoBRD+RwqhzQW3aDfulKLAqQ+HSCGyB6uKX/00Z95gClbgXPP6BwFz3J5L9t8aRMR3gg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769737504; c=relaxed/relaxed;
	bh=jNEnnUWc0ljhEZKMEfW+sE66aVZ/mqoNGO+gH29mfjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b3t+i1B1FHj6wiuRQmlrYUbTZ+OJxUJNU5lolItth+MOSUM4g2aDv9RiERsajtHsXT1lYF9Q/IljHh2S2j17GtqFUdeVBgwul2K7nJqGVDVcr2kVAIqtmXtB5TOXIkPkkETsruguwua9PBYcmpHkrNTXmOEBV7YlOHdR5btDfhEjZ5usRTlupiRn+nKrP2/50keaUMN6+dm1NVNhqnOmXSRF/7xRugJ2IttKXsmKS/gnVUP4QLbMPvuxDg7/b6Rq0IpUauDHuwuwlhi5fTPg2aEoeKnmgr+lvx7necCHsfMHfJTsZ3bcRVi6nMY68wDrqSus6dwU0QWDTpx48lNcFA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NMjminnc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NMjminnc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2JjV3d39z2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 12:45:01 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-823210d1d8eso861078b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 17:45:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769737498; cv=none;
        d=google.com; s=arc-20240605;
        b=ecwyLbVQp1r1VH9A/Cu1oaAaTk7vmAaGSugXYsHKHNKaAYYIgP0X7kc6OZ8yOdbeEg
         RJhs3R+bogBdEFOl4iR2BRTqSHOLPasZFWVsxEuX+isukM8rxzZapVbx92BwKqIGGIzi
         /ABzd3lDSQXbwTRav6/S00yXN+vvIgbfppGuYxqGfKDbvxuU377S+BWr+nSFJ2AquyLA
         A1Dg/6mDSBzqP7xeicxo+6RfYWRXMT1wMBjrI0yE7/H4aJBbLedY/g7q3tK6N+MMcuaH
         qagthsyMBhJMZgQXnPBP7M97enmyqzC8qAfwKe5nXdF8ITKQbAqBRfcqPmm1n5Owa7wh
         +50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jNEnnUWc0ljhEZKMEfW+sE66aVZ/mqoNGO+gH29mfjQ=;
        fh=YhKOlqHXSL2veDIz8hDEiofk89l+VQVO0d1JbqyKkY0=;
        b=JlPrCGEqSeRhg6CrfF0qsISucSWXJrzVBehsDvQAA34uhNzC03agrPOkifEYKQni26
         XkSMuxX/PZzQIBSBKks607JoT1gplzcTT19TkAxSVKlS2cNWzz2P6YXybgQEUfmlBjO+
         Tu+IwIO+T844pN1cuj0zEe/3x06V2JRzdQ4/MmsnMKhAJyuIF567JQwsV3rPgdTWdH4x
         YXKZnWqitp4sB/1U3qZYKxIDeHPZOGPUybRU4srPjRjqtm7cW4DTYG1xu6kMhIkFZIft
         ni3piTjcrPS4eVRIZGXJx+FvJXWMZZC26QSOQ/+Jdfvod1qOHClk7OcDZpr2Wvln4vIQ
         Ifpg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769737498; x=1770342298; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNEnnUWc0ljhEZKMEfW+sE66aVZ/mqoNGO+gH29mfjQ=;
        b=NMjminnchKpdJ5XxK9GtTCQAD7Eu2PmXUrnuYDslu7j4+B5H7szkfFR0WrwT1+dpb0
         6ahGXvo/PKGlSZl9Ku6Nzhv0u5zA3gfPRm9Clgpmen3EImqngsdzw75HsGyWK6OO8AW2
         nBOHNVzypPRUA6kbfxpK7FOfqNpO0YMcAli8CbQ8C9QfokmeogJPvlBPgxyafHEmaTGs
         cP74lDCzaV5pqcSFEsBKd8aH77zm4FErgVwxC5Q3Yo8b/1K9ZEFs+GOD3m4E5W8mEN4u
         QfbsSBPLBvQpIfRWeNNCloc/fN2CtwCTzKbcMOgJdTMcODz3AE1PpNmu4Xk6PoojSvo8
         CMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769737498; x=1770342298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jNEnnUWc0ljhEZKMEfW+sE66aVZ/mqoNGO+gH29mfjQ=;
        b=KjeF0JnlWTGmH44UNNwEpbiAAUYNHim4i+KElDEveAarkxPe4loZMt1E1ezTdeEkyl
         9xFrAsQiyXl2lX63HF2MeBAmy47dkZbLZJTPxQ/q6Dxhu8F7Xg1BkWVFd+946oVQQ5P6
         2bcoRm33LV2oDr29MqpnL3MVnT8gkc7LSuKh5VcQ8KluCRPHKPKP4RCd+7iDb6LDdwS5
         yQKSw9/MRvDH1yjZDuU1xHs0EWiqu9PMfSAkpbny9L9a7CEdK9V2PmKkggG3E7vSDRvz
         RDoJk1IvSEkrXctZzhW+jg6kJsE2LQWsOY9tOfrytZ1N9n74EqgC7l1MhFJQOiQK1Wfm
         Lmig==
X-Forwarded-Encrypted: i=1; AJvYcCWzvBF6+HNVeb0tVcOVcazvcEi31T0vJ05kL1vu+xbx1EoCgQhWSmA75BnXI+6DD1cKPIb3ta1/hIhp9rE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzUOtQ7G6RBT5xQrIPOPGLBY8BrY6AQ4ocpH4T1/umPfdZTfIsq
	S3a59Cjn154buUR7m6nME0OrRgbyZ9b/dNnuZa99XOHEBDlw0rSdla92x30pyOpEBNuuSXrboTy
	4WayxfkSgw6VPfg/M9ld+peyBVSE50ds=
X-Gm-Gg: AZuq6aK5sIGpzrKuJ98kovZR5rqwHAuxVXAnHdsoGTsktBuNCXStCcIJReAx5xbI9u7
	aWp+DH8WnJmbflm8MZkiF2tQpxo8kZIkgDWZpItXmMprgdmfCeTFCirKtNRGGA7z568NjYKEzgQ
	Xzo070Hlfy/mCxUuHYNJnC+4aMUHUO8GZUgxIraPu+++ZTXX4uzyCBKoMAP2Sqapowh/j7AlbzR
	NlxuV+OYWSgcjIbufsqYbUzOvy15TAXloLr17I17nNSbYv79RvH2zYi+ZcecfAM6TMiTrA=
X-Received: by 2002:a05:6a21:9214:b0:366:14ac:8c6f with SMTP id
 adf61e73a8af0-392e01842cemr1045926637.69.1769737497875; Thu, 29 Jan 2026
 17:44:57 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-3-shengjiu.wang@nxp.com> <aXuVXruPir7hasdd@lizhi-Precision-Tower-5810>
In-Reply-To: <aXuVXruPir7hasdd@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 09:44:45 +0800
X-Gm-Features: AZwV_QgRSYSkN9m3U3HWfvC48m_G_i-4n2rGz9NZqS3r9F4yXRNiuZDo3HAYyaM
Message-ID: <CAA+D8AMYEVbFTgTaVhTU_ZJ=eoyQAj4zygLsfuK+Yt+=8qQk1Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16411-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 44C06B63D1
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 1:14=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Jan 28, 2026 at 03:18:52PM +0800, Shengjiu Wang wrote:
> > Add a compatible string and clock mapping table to support ASRC on the
> > i.MX952 platform.
> >
> > There is a limitation on i.MX952 that dma request is not cleared at the
> > end of conversion with dma slave mode. Which causes sample is dropped
> > from the input fifo on the second time if dma is triggered before the
> > client device and EDMA may copy wrong data from output fifo as the outp=
ut
> > fifo is not ready in the beginning.
> >
> > So need to trigger asrc before dma on i.MX952, and add delay to wait
> > output data is generated then start the EDMA for output, otherwise the
> > m2m function has noise issues.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c        | 39 +++++++++++++++++++++++++++++++++
> >  sound/soc/fsl/fsl_asrc.h        | 16 ++++++++++++++
> >  sound/soc/fsl/fsl_asrc_common.h |  3 +++
> >  sound/soc/fsl/fsl_asrc_m2m.c    | 29 +++++++++++++++++-------
> >  4 files changed, 79 insertions(+), 8 deletions(-)
> >
> ...
> > diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.=
c
> > index f46881f71e43..296e13a16490 100644
> > --- a/sound/soc/fsl/fsl_asrc_m2m.c
> > +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> > @@ -253,15 +253,28 @@ static int asrc_m2m_device_run(struct fsl_asrc_pa=
ir *pair, struct snd_compr_task
> >       reinit_completion(&pair->complete[IN]);
> >       reinit_completion(&pair->complete[OUT]);
> >
> > -     /* Submit DMA request */
> > -     dmaengine_submit(pair->desc[IN]);
> > -     dma_async_issue_pending(pair->desc[IN]->chan);
> > -     if (out_dma_len > 0) {
> > -             dmaengine_submit(pair->desc[OUT]);
> > -             dma_async_issue_pending(pair->desc[OUT]->chan);
> > -     }
> > +     if (asrc->start_before_dma) {
> > +             asrc->m2m_start(pair);
>
> Does other Soc also work if ASRC start before DMA enable? Suppose most li=
ke
> work. Then needn't start_before_dma.

Yes, should work.  but I don't want to change the original behaviour
of other SoC.

Best regards
Shengjiu Wang
>
> Frank
>
> > +             /* Submit DMA request */
> > +             dmaengine_submit(pair->desc[IN]);
> > +             dma_async_issue_pending(pair->desc[IN]->chan);
> > +             if (out_dma_len > 0) {
> > +                     if (asrc->m2m_output_ready)
> > +                             asrc->m2m_output_ready(pair);
> > +                     dmaengine_submit(pair->desc[OUT]);
> > +                     dma_async_issue_pending(pair->desc[OUT]->chan);
> > +             }
> > +     } else {
> > +             /* Submit DMA request */
> > +             dmaengine_submit(pair->desc[IN]);
> > +             dma_async_issue_pending(pair->desc[IN]->chan);
> > +             if (out_dma_len > 0) {
> > +                     dmaengine_submit(pair->desc[OUT]);
> > +                     dma_async_issue_pending(pair->desc[OUT]->chan);
> > +             }
> >
> > -     asrc->m2m_start(pair);
> > +             asrc->m2m_start(pair);
> > +     }
> >
> >       if (!wait_for_completion_interruptible_timeout(&pair->complete[IN=
], 10 * HZ)) {
> >               dev_err(dev, "out DMA task timeout\n");
> > --
> > 2.34.1
> >

