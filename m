Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E7F212F0D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 23:48:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yWtw1mJbzDr8D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 07:48:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sm2IOQme; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yWs11qvNzDqd0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 07:47:01 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id 9so34113615ljv.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wEWLJugUEoJF13EVG36TIW/5jfa4TRoxlnl+tX/Wn14=;
 b=sm2IOQmesVWJ2z0ORa2TSdnYdjJIGzToARHSUN1fhHU3JQH4rkm/9yUzqJe18MjgRO
 cEfd9xFFw94U9bfjx/6tCrVEw+YDC25KG3GqUB+h+ESGVBxgaP8AdZSSX2IMS/OjIiYE
 jD4v7Y1Y7biuhhoMmQPttanmkCj97ERsYN5jC+NQHkuSXZ7cQUUSm/iWRn1nFaxgXIjL
 h7uDrGbnQ4rawQoaUIYFheBUEuwy8/ODC9Pi2eqLqx9I9he1VSRmTP+fZZIN63A2f9pj
 3LL25C9HRCgceLBWY/9UXCtL99epNMGZNvJovRC3HKKIHoIANYTepGWuX9bPeeDVX7fs
 Y08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wEWLJugUEoJF13EVG36TIW/5jfa4TRoxlnl+tX/Wn14=;
 b=OCev+rqPq+WqwDXdjuWXLcQKjshaZNjUL4A1X7TAiJmk/EyDIRRXpfFlrrCfAVaMtP
 Q1Jt3FyCW/56MWBikrHRvWe1xnqf4yULrGeQ+MaNd4d+OJ48JPG6fd2qkgrGNrLlwYzV
 ElI4Yr7Icv0+j2G6R+aXtC+9d1vVtOb3qJY55Vys6VJXfC1my7z7arvj4QKv6vN+oV/q
 M1U4lUo0YCzSvPDeG+YVVN+7eL+EdWBPI6T25AMi6ZBHa0u8PSpXiIuYtG1oSvp2uApZ
 t77cvBE0fIw1mkeo18PIOeKFsioA/w2xtn8xrjbij77Gck0cBrHU+zBi+yF4xISR5EPf
 imTA==
X-Gm-Message-State: AOAM531hUccBOBEZ/J9kz9G467mMS7Y/VHILgpMbU8bkjWuwSTaZz6nk
 1vJLiGdBt21UK0fDzQ0VLmRF9HFUk4Yhqc0Ruzo=
X-Google-Smtp-Source: ABdhPJyiO67FouY0jlSz55/tgTo3v5o4FPE/8mfJyTgmhx7uN6BdSgCL6JlgSdYfOLxyZadGIa83ykMwT8pYWiLh6ms=
X-Received: by 2002:a05:651c:200f:: with SMTP id
 s15mr4716908ljo.125.1593726414677; 
 Thu, 02 Jul 2020 14:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200702193102.25282-1-nicoleotsuka@gmail.com>
In-Reply-To: <20200702193102.25282-1-nicoleotsuka@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 2 Jul 2020 18:46:43 -0300
Message-ID: <CAOMZO5BveOO3wNpGYbqDyQ290wNE3Xp5X_jXkvcDdP8iytRZiA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Shengjiu to reviewer list of
 sound/soc/fsl
To: Nicolin Chen <nicoleotsuka@gmail.com>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@tabi.org>,
 Xiubo Li <Li.Xiubo@freescale.com>, linuxppc-dev@lists.ozlabs.org,
 "S.j. Wang" <shengjiu.wang@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 2, 2020 at 4:31 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> Add Shengjiu who's actively working on the latest fsl/nxp audio drivers.
>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
