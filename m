Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AF873006C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 15:48:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jlp8OxtI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh6Fp6sPsz30gp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 23:48:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jlp8OxtI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh6Dt31cNz30fG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 23:47:39 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51496f57e59so9395362a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 06:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686750453; x=1689342453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76di/i2mInmVCxeVKqtSRBrcXSBLthtuA5QqmKpv0gg=;
        b=jlp8OxtI66wmx6ofvYbecBCQapH2lREmqablzfBh+9OExysu5k9h76l1tCeV8/J90c
         4Z1ZouQnIxyCpFC63R+Y2e/3+b2Jxk5JrOBGOCsPtQ8f8vMjLIC0eQU8nmbwpRYwQPz+
         zcnti9QTI56yIvgkrHHGpaaUQcJKbnO76la6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686750453; x=1689342453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76di/i2mInmVCxeVKqtSRBrcXSBLthtuA5QqmKpv0gg=;
        b=ZI/Q5f2jzCCiNZw0pCPO2C7GOdo7AdGU1swmkhzp+oCiKYWIawSpzpeyDZr7c38iSm
         CwWb8t/RrAo2y5kjZDvv+9yg4X15N4esvRiPbIqzEdt9NIbJWth9RONO0nEnRvwDUvR9
         eDCAd8XECI7pb2C45Ggk5mGmFiSVhyNZFEtFvfo6C32WsrT2wqnMv8MpuniRBHIcYxM8
         G3kG1/0ejmFb0AW/YDot6wwDDZ7pyOyAiIrxCI4gAiw15teOoV1OyfZx2F5vZZBnPqbT
         h6/aNUBtDk+jyON8Z0PSOyjDtMFYEKVMSq0fFP/V/ghHFW/kem3v9XD8TVNac03PKVo6
         t7/Q==
X-Gm-Message-State: AC+VfDzLJvvveU4TqteYuIAyyJErlW7lN2oOVWuRV3noOkZveMPMm4Fv
	8uqS9lMqv0yV551LDcdb3h/XBavouexwrxd5zasUqQQV
X-Google-Smtp-Source: ACHHUZ4YM4ogHO+9PT5DtOuU1bwW+Gjg2ebIbCnKUPcY5DEa7Co/rlYThCv/S/qPqTYZQJg2Bpzt2g==
X-Received: by 2002:aa7:c6cc:0:b0:518:5f8e:53b8 with SMTP id b12-20020aa7c6cc000000b005185f8e53b8mr4701550eds.13.1686750452847;
        Wed, 14 Jun 2023 06:47:32 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id ca15-20020aa7cd6f000000b00514a5f7a145sm7661525edb.37.2023.06.14.06.47.31
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 06:47:32 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-51400fa347dso11352a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 06:47:31 -0700 (PDT)
X-Received: by 2002:a50:9f82:0:b0:50b:c48c:8a25 with SMTP id
 c2-20020a509f82000000b0050bc48c8a25mr104476edf.6.1686750451172; Wed, 14 Jun
 2023 06:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com> <20230607152432.5435-3-pmladek@suse.com>
 <CAD=FV=WRzaLbLQ65usGeFq3ya=DV8cYyHQina_721EFoSTdBGA@mail.gmail.com>
 <ZIG1Qi0iUjTKICQM@alley> <CAD=FV=XzueJia--Zv4cAofzk7yocmP-7K8wa4doAN8pzED_hZA@mail.gmail.com>
 <ZImWd62fXjsZildv@alley>
In-Reply-To: <ZImWd62fXjsZildv@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Jun 2023 06:47:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WP39nUmdeNjjTGx-XWhS4AgG5haHCfYjFUCEKckYVZDA@mail.gmail.com>
Message-ID: <CAD=FV=WP39nUmdeNjjTGx-XWhS4AgG5haHCfYjFUCEKckYVZDA@mail.gmail.com>
Subject: Re: [PATCH 2/7] watchdog/hardlockup: Make the config checks more straightforward
To: Petr Mladek <pmladek@suse.com>
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, Jun 14, 2023 at 3:29=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> It seems that we have entered into a bike shedding mode.
> The following questions come to my mind:
>
>    1. Does this patchset improve the current state?
>
>    2. Maybe, it is not black&white. Is it possible to summarize
>       what exactly got better and what got worse?
>
> Maybe, there is no need to do bike-shedding about every step
> if the final result is reasonable and the steps are not
> completely wrong.
>
> I just followed my intuition and tried to do some changes step
> by step. I got lost many times so maybe the steps are not
> ideal. Anyway, the steps helped me to understand the logic
> and stay reasonably confident that they did not change
> the behavior.
>
> I could rework the patchset. But I first need to know what
> exactly is bad in the result. And eventually if there is more
> logical way how to end there.

Sure. I still feel like the end result of the CONFIG options after
your whole patchset is easier to understand / cleaner by adjusting the
dependencies as I have suggested. That being said, I agree that it is
the type of thing that can be more a matter of personal preference. I
do agree that, even if you don't take my suggestion of adjusting the
dependencies, the end result of your patchset still makes things
better than they were.

...so if you really feel strongly that things are more understandable
with the dependencies specified as you have, I won't stand in the way.
I still think you need a v2, though, just to address other nits.

-Doug
