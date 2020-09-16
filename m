Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E9926D091
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 03:26:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsK7F6fZ5zF1b9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 11:26:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.196;
 helo=mail-lj1-f196.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JjID6Ilf; dkim-atps=neutral
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsJcX49RZzDqwC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 11:03:24 +1000 (AEST)
Received: by mail-lj1-f196.google.com with SMTP id a15so521005ljk.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 18:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oUrT5gwD52MsR1wVTFrUE/WFQvwScZ/Kn5UNNx4HIXA=;
 b=JjID6IlfOKBWQ4lGtoBOpv1ttQeatHSDCajwiJ0azKXbH3YYrtGydW+Gxgc9Piel58
 YFhSrOBPjpmjpppbHq0U1XIL2d7aM4huBXm1h4WWTeRveWVq+kXGVPdqcbZUiqkY8pop
 Wd86Q/TDYKOncWV1Y5HGdXg4ibithp/E8iohuJpujgMxmv3d/X2gB4S8O8jMFW/FikAq
 FYHhoI1jGVqUqtPlRtThH8ISjo9nJmtJbc7R8zCOsqzCnsiOS6x38RzgGJY6PcCS1z4h
 LRNXYbtrV+wpzUFIBRj6Vj/XisBq07u82l92zuLu4ecwxS7qL7Y5yT/EKsYpV7mrhasE
 K9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oUrT5gwD52MsR1wVTFrUE/WFQvwScZ/Kn5UNNx4HIXA=;
 b=DIfeTkfo5e9o0JVsEzuENZu3pdbtoAFpIW9TveVl69zbAPGxWYg6AWVpiEvVTQOrGN
 t0eHBe3E8DgDLRX0NNvsuIxFGDziHFOpYISWzpKU3AcKK36MmneXMUDuG9iwejILjXJr
 AhgPqQgO5scQv53QQsUNj/dkhhYibL6OFzGcStqq/M49IHwllZDr0RHyrfbfFVjgsnkg
 C9uXFGbxw8pO7N5mYiyTr8cdA5QP/x6MVNvnjm9/Ptz3vOFivjjfwUBMv1Fyup/qzCMr
 KZp8VNwiJhzcyDZ+K6CaMVl4qHSenIuOBuiz8X0+rgUBeZdnmy3IWu8ka5Uj36Ow670E
 zwDg==
X-Gm-Message-State: AOAM533v/zCt4RYHL+8HHaO6PsyFL19fvEV7BiS41Cs5Xd3pid8Hh+Fy
 i/s+rRpnLfro4zeMHNRiAJQWHSFHedQCAyxi1H+yinO/
X-Google-Smtp-Source: ABdhPJyHd0Ooh4IK/vHvj2P4gv3lfDfIBiO8RqhPNolmmBPPICV/UOwNTXFmvzSGmOtJPgxjXHBzXE9TuLHprQ7UyvE=
X-Received: by 2002:a2e:a550:: with SMTP id e16mr9601438ljn.125.1600275845628; 
 Wed, 16 Sep 2020 10:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <1600251387-1863-1-git-send-email-shengjiu.wang@nxp.com>
 <1600251387-1863-2-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1600251387-1863-2-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 16 Sep 2020 14:03:54 -0300
Message-ID: <CAOMZO5CZtdxbZdnXrckgYE7bzW-PDo2XOfQobuTf91C1hp462g@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: fsl_sai: Add new added registers and new bit
 definition
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shengjiu,

On Wed, Sep 16, 2020 at 7:23 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> On i.MX850/i.MX815/i.MX845 platform, the sai IP is upgraded.

Please avoid such internal SoC namings and use i.MX8MQ/i.MX8MN/iMX8MM instead.
