Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AFA7BCBE7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 05:31:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JZkxpoeP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S374W6glzz3cPd
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 14:31:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JZkxpoeP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S373f17srz30LM
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Oct 2023 14:30:52 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-69101022969so3096942b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Oct 2023 20:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696735850; x=1697340650; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Po8IwO3ZNX4Frjy8MjMqPcYZOoaeDikNFLkcWX7OJPI=;
        b=JZkxpoePpWlHIgg/RB5vz8mhTYurG2jo1x2Ff9S+BRcrKd5sKIK+Vfs/SG5YtHQoG+
         +5HzywDnvXq/LnNRi0KgXvqQ7UwLPpDADT3D9FI35otIb7wyNgOIq0jboHfkcMp4uIAI
         FqOudCD1Es97iZsiSkIgxOJpvHAalozHyFRp0yHFPKzLbXRAmG5v25loh902FgSibS/Y
         SsemkxqV7LLP1IzVXNDibD4uBuJ16+OyXwJh9vKfBduHJH0Cf1tn46U6U4gTW2nwRkr2
         lymtZ4LYvm5qYU35Db2Jn9NakvtBgTzzFSID0+hpDSfmQEcR6Lfg0itKN5F/UrRBCEd4
         F0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696735850; x=1697340650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Po8IwO3ZNX4Frjy8MjMqPcYZOoaeDikNFLkcWX7OJPI=;
        b=giSWGJq+XmMU/mI+jyeoBX6CHTFsi42oWqxoLv/FXJjWOXZCXTlU2U0bgR3vbliw0L
         hqn8In95RioaC7CCsiyG8+Px1DNAiH+amc0xWiPp45UyfrvhHv5yVE+Z/SqFEHqwI4fE
         Q7hQRlvG0U22qcmPHbnAdt/3aR+/EOQGSmQ7Qj55vc0Uq2N6Zn1ttY55xELq8h5heja9
         D4U9vc/b0SzZAnmuhytwz3641luI5giUIVkfXKIrloL87br59/DSSr/Aam4/uAMDMtbL
         JkOVTPF75+7r08lWYorDIjxnj2iVvomnL+8nsZiyiXk/uR5pjh1xKFd4TD6VJCbyub0l
         UlgQ==
X-Gm-Message-State: AOJu0YzVrRToCv7zoaYTtqn9y9SX6blGrpYrSJAn3UYAo8g3kbSkGRJo
	qhzbKQ5YAbgOV2aBfgiTZYdQSSHDF/hvRbsRIBY=
X-Google-Smtp-Source: AGHT+IHu0m1BG7YctYVYzTTaRMvMvVrKlnV6do4IhJbTtREHvtRDSndFewmonfv7LypGWBoeuyRfvI4GrwV0RDkFj1M=
X-Received: by 2002:a05:6a20:6a1a:b0:154:fb34:5f09 with SMTP id
 p26-20020a056a206a1a00b00154fb345f09mr14826314pzk.15.1696735849741; Sat, 07
 Oct 2023 20:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
 <1695891619-32393-2-git-send-email-shengjiu.wang@nxp.com> <7af54654-d4d5-498e-bd53-78ad54e6d818@sirena.org.uk>
In-Reply-To: <7af54654-d4d5-498e-bd53-78ad54e6d818@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 8 Oct 2023 11:30:38 +0800
Message-ID: <CAA+D8AOyDD9Wd0pHFW=jwY9FKqY0OA2UMmDRrB_UnSPN4FJSZA@mail.gmail.com>
Subject: Re: [RFC PATCH v5 01/11] ASoC: fsl_asrc: define functions for memory
 to memory usage
To: Mark Brown <broonie@kernel.org>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On Mon, Oct 2, 2023 at 11:08=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Sep 28, 2023 at 05:00:09PM +0800, Shengjiu Wang wrote:
>
> > m2m_start_part_one: first part of the start steps
> > m2m_start_part_two: second part of the start steps
> > m2m_stop_part_one: first part of stop steps
> > m2m_stop_part_two: second part of stop steps, optional
>
> The part_one/two naming isn't amazing here.  Looking at the rest of the
> code it looks like this is a prepare/trigger type distinction where the
> first part is configuring things prior to DMA setup and the second part
> is actually starting the transfer.  Perhaps _config()/_start() instead?

Ok, I will use m2m_prepare/m2m_unprepare to replace
m2m_start_part_one/m2m_stop_part_one,  and use m2m_start/m2m_stop
to replace  m2m_start_part_two/m2m_stop_part_two.

Best regards
Wang shengjiu
