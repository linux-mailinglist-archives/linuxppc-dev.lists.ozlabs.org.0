Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 768225AD39B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 15:16:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLptr2vshz3bmP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 23:16:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F1x+ph1o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F1x+ph1o;
	dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLptC0Ptsz2xgN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 23:15:45 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id t7so6297024wrm.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Sep 2022 06:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=x+z5fbgK5rWlFLrQ0q/oa0BmwbXh9sKksymdTFC7GMQ=;
        b=F1x+ph1oLUQWORqFZ+6iU5G/jt2WQgwrWWWyebsIQKcW+9UOxdsIIUQypDzGGRcoMi
         j05s3YxGptvw40x7s2JOAozNSdraSyG7GmWotGKU+PpHVJr8IqIsmxfo8jrHiwA3SH2U
         kPhrec/LkEbAmsOxdyGzXrm5disk9kaS4ChhnspXR6U4QEPRGUaqpx7lAXEnA54apaK8
         obP2VMs9Gisccz6V84XLu+YYfLp3yTHNAx8tO1JDXd/vYBqcGQWYbQVji33jodksCizB
         elU37YU0TvQb4NnWJjOV6PWYh7cyuOlx/bHenFczAjoU7wkT9kiJ67sAnF4TNIdW/281
         DsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=x+z5fbgK5rWlFLrQ0q/oa0BmwbXh9sKksymdTFC7GMQ=;
        b=H49JnvT0NsUlwyDXkX1OERgYcvV7yZ23SefEH+uhQEzkI/QdxIiplz+wIffWmt/tgl
         8IRLLiU09YXGiN5ExpV2FfzFS9GkTF8VUoSJGAY6qm4kAc3hPky2W2cjJvmecylXj33M
         CHvEABPgcUq46Z54ydzOjPRjqMvF+GBfFIhIzG7H5POFy/WK8xJzKXaT5e77rS/BElH4
         WPXdW6YZBDMGII53i08qj2ntQ/4PKipZedOY4sNI833iKU5RtJympKJd1x/OXgN3qKP5
         tBRcetCc2GCfc4t5y2kAS+jjpvEHzLAfPAyT5IRLGk9tu2073YHsuo0GkdhrSp0hSAi7
         4mmw==
X-Gm-Message-State: ACgBeo3APuZ0Q9WlIRAp/l+IHM3I1L8aG3yr/EliqsFG4IRM8a7iIPP1
	qwgcIefLtEzPzuB0fUmPy2FeLJFXfsYyM84itTU=
X-Google-Smtp-Source: AA6agR4OHk0dWrF3EDRI1FChnBvUyFqcofwqBz5m92F++Rw8GkiS+bAka5b6ma0tgWR/0cMK4A50cXKDzEYmb3n1lV0=
X-Received: by 2002:a5d:6388:0:b0:228:c792:aabe with SMTP id
 p8-20020a5d6388000000b00228c792aabemr1064303wru.689.1662383738519; Mon, 05
 Sep 2022 06:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Mon, 5 Sep 2022 06:15:27 -0700
Message-ID: <CAGoOwPQomcnO5dhkT9DBynwJo8LfVvuuwj5AYNpv0KhAGSWLEw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add initialization finishing check in
 runtime resume
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

On Mon, Sep 5, 2022 at 3:47 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> @@ -1295,6 +1301,17 @@ static int fsl_asrc_runtime_resume(struct device *dev)
>         regmap_update_bits(asrc->regmap, REG_ASRCTR,
>                            ASRCTR_ASRCEi_ALL_MASK, asrctr);
>
> +       /* Wait for status of initialization for every enabled pairs */
> +       do {
> +               udelay(5);
> +               regmap_read(asrc->regmap, REG_ASRCFG, &reg);
> +               reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
> +       } while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) & 0x7)) && --retry);
> +
> +       /* FIXME: Doesn't treat initialization timeout as error */
> +       if (!retry)
> +               dev_warn(dev, "initialization isn't finished\n");

Any reason why not just dev_err?
