Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A118C5AE4C6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 11:51:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMLHp42rVz3c1S
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 19:51:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XJXm3+AW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XJXm3+AW;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMLH662cRz2xtV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 19:50:40 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id bj14so1313051wrb.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 02:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=r+ousdY1tGkO/yzh1u+RImPQAzXSy0HohJCLKxybiYk=;
        b=XJXm3+AWkaScI7PxCvoQ855MRL/3gU+oVmXA+TmaNSnrGCkp0lfnYMcUhmEa4QvBZ+
         sYaVm+qnefpABDMbdJrRDdni0Eh99VOQtMWuBGbRav13JXoztc+hfhLMaFjP8vvKQu54
         HPlkuCHjYQqAVn4ZUcS3oLedNX/SJVn8BA6ScFhLkoSk7xuCATff5Px1s+0cJDwOypE9
         aeCEGxq8ZEKZMvQG2QmfQd+hJsGRS23M3vkDrxmLEBy2IhYuHDOKnJqwq7KxWQ2futFG
         UoK/v7u/PlffiLMY82Bk6E+/SLzjX+ot28+yAWGgalHmUmRxF+byLXHYLITxie5Y85IL
         8+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=r+ousdY1tGkO/yzh1u+RImPQAzXSy0HohJCLKxybiYk=;
        b=1AquCc++U17xippFxW0A+mIyDWLghQFA+nq/Crk2tSDryDTOIWXzLcTdtjr5JurIvt
         iJ51WTqrkmc3EqzL4xz9Nrg3S2yS1KRv/lTvmf0X+YO5ozg0dxutj1dg/mC/AWFLDoNa
         Q+gsAcy3lxLij4eIU+t/vxupXe2rratcWk3KtSL2UdGugcqsg5+v4vBlqXbXUiKnpNPw
         h5zxAdg1hkzI/kqQRMRt+krwx+d1EEYfCVmJDLB9lvYBYrvR5t8/y4yCtsJYjTenP0TU
         HYpXO4EbBxCt5H53g7CnFkeLt1Vpk700D8zE47O4My2s+Nh5ReU3+T+JXL1yTnjPG1Ab
         Ntxg==
X-Gm-Message-State: ACgBeo3RjS6zLVBBOrYdgs51+9aOMQV3x5wEmgs4WA61bnCJdajNnyZt
	J+tRUxqkdr2Qb2wlKttrEwvT1VTDiYS+BKbXFFQ=
X-Google-Smtp-Source: AA6agR7mPLP6wpNPjaOIzvnihjyEffacKop3Imfj0A1xsiYyYOOCWztLYg9Z3U3CKn5RbQNjZJyY/3sA6fQgEUOUrgU=
X-Received: by 2002:a05:6000:168e:b0:220:87da:c3e4 with SMTP id
 y14-20020a056000168e00b0022087dac3e4mr25983316wrd.559.1662457834879; Tue, 06
 Sep 2022 02:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPQomcnO5dhkT9DBynwJo8LfVvuuwj5AYNpv0KhAGSWLEw@mail.gmail.com> <CAA+D8APOL1Qx0fAhyajXXzh0_tqEmDJoDBh3Xgo6uYNhV0usBw@mail.gmail.com>
In-Reply-To: <CAA+D8APOL1Qx0fAhyajXXzh0_tqEmDJoDBh3Xgo6uYNhV0usBw@mail.gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Tue, 6 Sep 2022 02:50:23 -0700
Message-ID: <CAGoOwPQfkT2ptdt6mBTAgPfN0NOoR4KfdLE9B2AoL+Qn6bWdFw@mail.gmail.com>
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

On Mon, Sep 5, 2022 at 6:54 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:

>> > +       /* Wait for status of initialization for every enabled pairs */
>> > +       do {
>> > +               udelay(5);
>> > +               regmap_read(asrc->regmap, REG_ASRCFG, &reg);
>> > +               reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
>> > +       } while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) & 0x7)) && --retry);
>> > +
>> > +       /* FIXME: Doesn't treat initialization timeout as error */
>> > +       if (!retry)
>> > +               dev_warn(dev, "initialization isn't finished\n");
>>
>> Any reason why not just dev_err?
>
> Just hesitate to use dev_err. if use dev_err, then should return an error.
> May one of the pairs is finished, it still can continue.

Makes sense. In that case, why "FIXME" :)
