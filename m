Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CECDE5AE6C3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 13:42:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMNmY52F7z3bl0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 21:42:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QkM9zo9P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QkM9zo9P;
	dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMNlv6GTGz2yhy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 21:42:19 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id j26so6746857wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 04:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yfwusrA/vHTen2gLyGVSqF1Zuxr8iDP38xL+HIoCxPI=;
        b=QkM9zo9PN2dWAiC8J4q0THRsOuX24X/0IhqXiSTaZbCTClt+1QWxnekXzhtV7mEEFC
         J9ChK+JMTerYRrKuh8XoBouBuTylZMvgrtfQtzBcGjITn4BG6SvU3D15LBV3Db2pZ8g5
         JdCmBntAE0+4+tMGV7VIz1kJ8B5+kc9UW0b/xdDxGItoeLNpy8iu8WOejf7WtyNVa4Oa
         go4po6ri4qntg4X1g6oAueCnUd/Oa5vJWJrE9mOklo1xmxDP/yrU2/ZoXNbLvpRgtlrA
         lMVf2o3F9m7pu55tTpjtoZkC1pVTLp1sER3G0gkFajOCnEuwpSYzl0n/Mo9bxCaGEGEs
         l67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yfwusrA/vHTen2gLyGVSqF1Zuxr8iDP38xL+HIoCxPI=;
        b=w236C/Ybr+LUBJ7rPXzkw5uKttB0QC+dyHgVAFe+7LM3/q7AGhNDT6aNIxiHIcilmo
         n0/VkxsrUXvlezxNnSjH3nnTcsWSRntjRnmMxGOU1p/Ow7+SV5H10MkfOw6UhTcq7Z5J
         pE+y+VzdOOzR/YO0OJzGXkS+1baV8RbqYpZj2JsZp0Mj77oAU+Gul0GAUH+B8VYm8Kbl
         35qGZ47sHWyGmwP8ZTo01RLVTVmKq7dBwhbNVG/LtN5JArEqmCVcnOjgGQ7fa3bePuTM
         lQ+a4hqywViPalvHRvePNs4NYvBgLjvOYbvFPIFkg4BvDBj92TIOXsS+CgoRJ6dEZOIo
         UBfg==
X-Gm-Message-State: ACgBeo3H48x+Fc9yb8/janazxGJvRY8E2SKLFRomlA1tfcOI7Pk4mpXc
	DZA9C8iwaEaDYp2odwmtZHPpPqyem0nqNBVt63I=
X-Google-Smtp-Source: AA6agR6sJco1NZSWZTgvBaNZK+j/cMNesorrtn3LYX7TH6GbgoGfKURFhUi+BOvyvq/CTWtp6gM6quAwEjcBA4oKJrA=
X-Received: by 2002:a7b:c34b:0:b0:3a6:8516:a729 with SMTP id
 l11-20020a7bc34b000000b003a68516a729mr13865234wmj.83.1662464531080; Tue, 06
 Sep 2022 04:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPQomcnO5dhkT9DBynwJo8LfVvuuwj5AYNpv0KhAGSWLEw@mail.gmail.com>
 <CAA+D8APOL1Qx0fAhyajXXzh0_tqEmDJoDBh3Xgo6uYNhV0usBw@mail.gmail.com>
 <CAGoOwPQfkT2ptdt6mBTAgPfN0NOoR4KfdLE9B2AoL+Qn6bWdFw@mail.gmail.com> <CAA+D8AMYrQsu-nM_WdrBtB4iPU2UYNDhPW-zdY_Z+-9L03gu1Q@mail.gmail.com>
In-Reply-To: <CAA+D8AMYrQsu-nM_WdrBtB4iPU2UYNDhPW-zdY_Z+-9L03gu1Q@mail.gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Tue, 6 Sep 2022 04:41:59 -0700
Message-ID: <CAGoOwPSOEmLN+0esj2QfoadN7JZ=TJeZymxcp3MPqP4oLok70w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add initialization finishing check in
 runtime resume
To: Shengjiu Wang <shengjiu.wang@gmail.com>
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 6, 2022 at 3:50 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>> >> > +       /* Wait for status of initialization for every enabled pairs */
>> >> > +       do {
>> >> > +               udelay(5);
>> >> > +               regmap_read(asrc->regmap, REG_ASRCFG, &reg);
>> >> > +               reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
>> >> > +       } while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) & 0x7)) && --retry);
>> >> > +
>> >> > +       /* FIXME: Doesn't treat initialization timeout as error */
>> >> > +       if (!retry)
>> >> > +               dev_warn(dev, "initialization isn't finished\n");
>> >>
>> >> Any reason why not just dev_err?
>> >
>> > Just hesitate to use dev_err. if use dev_err, then should return an error.
>> > May one of the pairs is finished, it still can continue.
>>
>> Makes sense. In that case, why "FIXME" :)

> Just want to have a record/note here, need to care about this warning.

"FIXME" feels like something is wrong and literally means that it is
waiting for a fix/solution. In your case, it's not waiting for a fix
at all, but just an annotation? So, shouldn't it be just "Note:"?
