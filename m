Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10172586FBC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 19:48:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxQZr0Bpzz3bxt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 03:48:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G4tRILzA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G4tRILzA;
	dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxQZC4x3wz2xk9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 03:47:46 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id r83-20020a1c4456000000b003a3a22178beso4312884wma.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Aug 2022 10:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=8Jns36cM/Xdll3zQTDOynsDPWveorbrG1VHyx9CdQR0=;
        b=G4tRILzARpm1bpxvqlIvwyPp6Q3sPOp30LU8KfkTmEbQvU/HzJTfAutPmk7ojeUJl+
         IxmsFl1cOf3f9TEB0LvOEu2hnx1emE0t0Ty2+rUvwm4Stt0nmWIq/agtWwIuzyuRiZYs
         1Zy+AoDvCDe04ITvIkdsGsfBs4PQD7vQ8KRQ4vRbB1I1orGiMsmjn+OnOPlN9DXTGYDA
         TpgEPTvOgtWzpQNn8tqYXJ/pgyB0fg8VejaGxPE6PavIgCU6YQyVBnqEita9wAmkwKFJ
         hVkeHxggcnWcygVPyUBVq4QG88GP9BZGQFukG4EEtA15a9wFdZ1XZ/H9ejkRUXCDgFuJ
         5Yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=8Jns36cM/Xdll3zQTDOynsDPWveorbrG1VHyx9CdQR0=;
        b=ieVVmAiLwmst5AcK4U5HvDobcs46aw+kdi+p0O4jbAGrTocrNgbxehdK5h7xXTzGZ8
         6kwXsPJrOb77VQrt42t+kuxYoIpL6HUZM4XNC1sdTINWlXx0Rc8aQ5MJkg6pViaaRIBn
         nbyOIVBHtrSWuRxioQ/67t86cS/msuTBcHwZHxSwHtx6ET7FmREF385FAerA8dT0ETEu
         JGOCTWPMrsSxJJoyfR1z1WWEdLapBW8UMIEwXkct9PS0TzRC1yU3ucqTddkEZyV7x3zO
         PXofXnoFAHTd+2orHkf31iiWBPRzIJYFY2l8fSKHYScyqXNqW/0Mk45wrtnwON7dKF91
         G7yQ==
X-Gm-Message-State: AJIora+qigU9qTPRZitsGEbQnR80NSY91U9+mOmjHd6yJ5WvFz3cbTYq
	HLvyJtK0+NzwLTFhXcDElCGMXb+jjRnKL8Fq92E=
X-Google-Smtp-Source: AGRyM1vXZlt10Nll2wkPPyLa+hlsyZx/+f3pCIFG+RLb7StXHim8J1UtQjk4yZr5Nc72B/VPuT0OJCtzNR7gmh4BNG0=
X-Received: by 2002:a05:600c:4f06:b0:3a3:2158:c5ed with SMTP id
 l6-20020a05600c4f0600b003a32158c5edmr11852463wmq.103.1659376059939; Mon, 01
 Aug 2022 10:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <1659356773-8315-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1659356773-8315-1-git-send-email-shengjiu.wang@nxp.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Mon, 1 Aug 2022 10:47:28 -0700
Message-ID: <CAGoOwPSy77PuBvA0BghsFrNgpXfO+JuFgTW5VTNOfMEQdnbrVA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-rpmsg: Support configure sysclk for codec dai
To: Shengjiu Wang <shengjiu.wang@nxp.com>
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, broonie@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 1, 2022 at 5:42 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:

>  struct imx_rpmsg {
>         struct snd_soc_dai_link dai;
>         struct snd_soc_card card;
> +       unsigned int sysclk;

unsigned long?
