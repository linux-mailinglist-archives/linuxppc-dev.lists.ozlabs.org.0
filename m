Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 684BF816AA6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 11:12:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y37HbQNK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4StwcN0p2mz3cQs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 21:12:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y37HbQNK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4StwbY6rG4z2yh5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 21:11:53 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ce4fe4ed18so229385b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 02:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702894308; x=1703499108; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWVfo0YlGfjE9aDQP2Ly3L2JCb3LpM/ev0NxuURn88c=;
        b=Y37HbQNKBFkao6a8//o+EET9PH9wM6DMWm5UdR7SMN/wXJU5IroTl89KauZZ32KhGg
         oYwHWkXW3mv6+rKGC+mVJTnnmaLgvDlFSuoVIi3MuQTa2K9JrhI594OwR/TJlovjP4nF
         k3lXbKyQL4JXsHX/5GsSzC4MEMvwAvaXgutnGPhr2nWS5vlulSnkwRP/Ab5Sxb6OA+yL
         kTf5VxXd21w9wYnel/4zYcqZMwNJCR6JRWz7zNA79MN4C67D0hwU669DCWHO/dfU0vDQ
         VEozPYRiNWH3uJxIdA5W8fAgr2ocJsh809rn6NWY1HSq10ty6Ripl7TFIPyHHLF4nXgf
         5ouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702894308; x=1703499108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWVfo0YlGfjE9aDQP2Ly3L2JCb3LpM/ev0NxuURn88c=;
        b=LnKnenjhVv173ESk5CVJD6O09ot/LBD4xzezucxH+Z11Tg53bKR67IVccEthfaQUOm
         bTE9A3WVLHyM/obyU4M+Cviow/qMxOa716hXYxmWdgmvDfblBSX1Yn+5y7YOl4ZdhLCC
         Q7yVZVsuiTBn7AlRZPvBgiXnYx3tM3yhMruYEO4wDzZxdbpj055Lr2/r+2VjiKS+0gv5
         VinOyVZD/LWApCA/cbWXN2UMOLJ33ch0+yvhHOhxE0e0Um03Z3GVrZYUAfJzBuVuTMwS
         KOu25PTLtcDqjdOBUtGee2jbvtDqqo22ZSI4TxK6H9R6Fs9bYwhpIVU32y2bwowf+ydi
         X2WA==
X-Gm-Message-State: AOJu0YxnodZAX0DEei7/UY7Auo0UtISfomnKbuCDd8R5iQHqgrv5cksB
	PldO46KET652AyVUN+f4Ui0vsPd6/oyoWVGmxfg=
X-Google-Smtp-Source: AGHT+IFYAnVfFiaPLV3aOQmZxk09vqA3D8C1S99StKDu8dlQoGIILh+9qvsyJUfc1ZciBzGtPeAUAdzf88ItNIDemXY=
X-Received: by 2002:a05:6a00:2288:b0:6cd:e3ef:ce54 with SMTP id
 f8-20020a056a00228800b006cde3efce54mr34661547pfe.0.1702894308316; Mon, 18 Dec
 2023 02:11:48 -0800 (PST)
MIME-Version: 1.0
References: <1702891731-3417-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1702891731-3417-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 18 Dec 2023 07:11:36 -0300
Message-ID: <CAOMZO5CjoXFx4uX7w7My_zSeo_+mhQqhWYH3PNdV6SQOUXTxtg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Fix channel swap issue on i.MX8MP
To: Shengjiu Wang <shengjiu.wang@nxp.com>
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 18, 2023 at 7:10=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> When flag mclk_with_tere and mclk_direction_output enabled,
> The SAI transmitter or receiver will be enabled in very early
> stage, that if FSL_SAI_xMR is set by previous case,
> for example previous case is one channel, current case is
> two channels, then current case started with wrong xMR in
> the beginning, then channel swap happen.
>
> The patch is to clear xMR in hw_free() to avoid such
> channel swap issue.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Fixes tag, please.
