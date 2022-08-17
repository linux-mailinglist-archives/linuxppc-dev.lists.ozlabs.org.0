Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5056159696D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 08:21:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6ybC1PGvz3c8s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 16:21:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IaNwYW13;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IaNwYW13;
	dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6yZd5x7tz3bY8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 16:21:11 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id n7so3830465wrv.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 23:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=khB20IPcVm4LmT/fQkPCK8rCyXeZDwKHmcQKc9vJOvk=;
        b=IaNwYW13LfZmEUQvOi0TP9bqbQWgYzh53ws3fOiElKfEwqKBUxRR4XLEfK80yBiiyA
         ysp51hzlfSr7UcQ0w6DQ0ZUAiWst6kNL4u2Ye2js2YTWE2CsPHyW8plbYzO1FhEZxpRP
         TGeP79b17eDJVAuwL6/+Kb25eDRavfo2PyUO/zGzKgz6h8suS9cEoJd2LCgHNDNk4Ss1
         mGLbxuCfOw8WnmYfuXOKAJO6tFJOBQTEgWofhWFFq6tW6wUZadSIEBJ5ce5rtG6YRQjD
         4Sm+qtG3LHh69S2x9vzpKOPhWUM4nSnef34pmgRG/LQOwM9HDGjlQ9ha9eIUx1JTCZS7
         apPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=khB20IPcVm4LmT/fQkPCK8rCyXeZDwKHmcQKc9vJOvk=;
        b=n+B/FNnkEngJQbQ2o8fEAkstQznT1/mpc7L+Urtk9nyxvb/0krKa7bLfUXwEEaFY2q
         559nbsBQwnU78ouboNFkbrF4bESOpFp378BWwwcuo561DpUEnDgckTcEQCMAmtjvpkEO
         yxncNd2Yx/YXfKKQm4nte9NpWGBFoTQBVUYRYSVZMWQTpXAypuEv+xVHJibOPSq5S69y
         YMgJwGTsHDNGTvJFtf5ciuuPic5tX5xvR6wU5iTyKbF9LE0/z0DVVR+/T/RAjL+C1Hh/
         DURFdjChJbPVwnV/lqshioy/GyJeAk7moBrl93TfZyQFvTavczCpTo0QrHN+Ry374djE
         ddVg==
X-Gm-Message-State: ACgBeo1ahuCGOirMPW/yn7pCULfn2hEsSabv+8TJckYW7Zg+pbCH2aLK
	Z9193JcdrEytM+0r/XrQnM2m8Qg8BOjZ26RnLqA=
X-Google-Smtp-Source: AA6agR7Ic0pRjgTQ94iWPIZ5rgSaQqAPSXO83NX28fvIglU5zlIw6TjRdEWNUKcqglFLeLKa3OGayTRPQ1C8l1jAg0U=
X-Received: by 2002:a05:6000:168e:b0:220:87da:c3e4 with SMTP id
 y14-20020a056000168e00b0022087dac3e4mr12912740wrd.559.1660717267652; Tue, 16
 Aug 2022 23:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <1660713867-26921-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1660713867-26921-1-git-send-email-shengjiu.wang@nxp.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Tue, 16 Aug 2022 23:20:56 -0700
Message-ID: <CAGoOwPT1tP-HP+0J1ddZ0Ea+67zzLzFFTeptTpNwkzxRK45b5g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Remove unnecessary FIFO reset in ISR
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

On Tue, Aug 16, 2022 at 10:41 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> The FIFO reset drops the words in the FIFO, which may cause
> channel swap when SAI module is running, especially when the
> DMA speed is low. So it is not good to do FIFO reset in ISR,
> then remove the operation.

I don't recall the details of adding this many years ago, but
leaving underrun/overrun errors unhandled does not sound right
to me either. Would it result in a channel swap also? Perhaps
there needs to be a reset routine that stops and restarts the
DMA as well?
