Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E87A9204C71
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 10:33:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rfgp1KgXzDqQB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 18:33:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MfKUA1iM; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rff95Z3BzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 18:32:17 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id q198so10218837qka.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WUXkMq3EwcMN7rag+IOzTouUq2jW1leXveyXqam81mE=;
 b=MfKUA1iM2cNLIQb0gJHMFANrfHxAxLJ7OauUZ2pO/Zib5rQxdceNoygxEhaSDMdHF9
 oRekPg5JE8wO67W1XXq2VajDG1CD5zGtq6DzJ+Qqzc0xSSHh8EvgNnEnJ7pA67a4qEGf
 lPl3QQNFvtUUy0Dxt3X/UuNwZ7fbemOh29ZTt497SOrwO3oL3Sey/D/ilE2uGS2PQFbx
 8eRe/P+4LFzxcDQI8ZY/wsYR0Eaj3Q5c4e3/otG65UcV+dUVpriPExa1pjkoV6FtNKsk
 eTFyhw3iNwgYihpOJRXlLTx1rYmcfRPPKKxP+HEqKHn704oUg1p1fMwDArGlPS5755W+
 rRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WUXkMq3EwcMN7rag+IOzTouUq2jW1leXveyXqam81mE=;
 b=L/EpefHkiRGbYxsPgcivr5jKkufj5t7uF2Rle/k6qnrllY6tfChrYUBrOrlDL6yfpX
 K6JYc6ByMf+W7o4pqRnRXYQsfDTCvrXs+2SXyV66K+skatic3zd8TGXnX5bDZvs+uzaY
 +p5uyr77wQFKt8WnMxDYzdu0qd1oFioxehfbf/rNNWJhfGX3uU45IwC/f9HHWyQGULhE
 p2K1fKC6mI/voAD1IMz8JFSsot15Arg7BRdjbW3ukSTStlrh4x8WL6mLGM3SZwkXCuLV
 5qzyDfH5ESrSwQBAGopz1f2OXLvKQqsK5kIYDh1UTTIt8usaId3mRSPfR5FW5YRont2h
 CGkw==
X-Gm-Message-State: AOAM533s7Le64p0RrwAGiU0wRWLmGhWDC3kQb/W6JQ9nJOr0WbdST8hw
 AnCUk8QgMYyUHrBGtz3zcIRC3oKNpdRVzHOcu3Q=
X-Google-Smtp-Source: ABdhPJy8aJP9b/KoDke180z5lb657c5ulXpRf52exbUwqEylh9UUhQV3q7rSAK3MRe5vqIrWMG20D3EDlUJCCfc0XW8=
X-Received: by 2002:a37:8a43:: with SMTP id m64mr18899695qkd.37.1592901133739; 
 Tue, 23 Jun 2020 01:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <39ac8f24-3148-2a3d-3f8d-91567b3c4c9e@web.de>
In-Reply-To: <39ac8f24-3148-2a3d-3f8d-91567b3c4c9e@web.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 23 Jun 2020 16:32:02 +0800
Message-ID: <CAA+D8APR2NGAn9jRDSZzr1fgj5u0hAvH19VxZS+tj2A7j3PCuw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: fsl_mqs: Don't check clock is NULL before
 calling clk API
To: Markus Elfring <Markus.Elfring@web.de>
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
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 3:38 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > In-Reply-To: <cover.1592888591.git.shengjiu.wang@nxp.com>
>
> I guess that it should be sufficient to specify such a field once
> for the header information.

seems it's caused by my "git format-patch" command, I will update
it, hope it is better next time.

>
>
> > Because clk_prepare_enable and clk_disable_unprepare should
> > check input clock parameter is NULL or not internally,
>
> I find this change description unclear.

    clk_prepare_enable and clk_disable_unprepare check the input
    clock parameter in the beginning of the function, if the parameter
    is NULL, clk_prepare_enable and clk_disable_unprepare will
    return immediately.

    So Don't need to check input clock parameters before calling clk
    API.

Do you think this commit message is better?

best regards
wang shengjiu
