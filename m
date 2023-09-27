Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 065E87B0CA5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 21:36:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PSCdO/vu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwn0v6Wnwz3c12
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 05:36:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PSCdO/vu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=ariel.miculas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rwmzz0nszz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 05:35:42 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c008042211so202055721fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 12:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695843338; x=1696448138; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OBZ4IYoE3UGlFGxrLn0BTpDP5IoGpepsXCJr4HwsmE=;
        b=PSCdO/vuYZk1R7C0xEr+ONab9U86rEGHYuhas2wZLO+/6ybJBhx/Kq73Os4D/jQDkv
         WzImN/s2gKlaVHMFhkLyPslrUNTG1vVSVvlNOQ6tAEpMGl8MGIDw3oF96bZgATIq7uN8
         SHycUZoZf/YvqKPLBDgwUvffWwPGlHkkgxHnxzsyqo9Ovb4MxqlviGrjPvlqoFuaKKv+
         O6Oq1SpWckmfyqXlfrCGGZ/uV7Z3xIaihADfEA6Kuafr0KfplPqDEFnxhKAk3bv9sHW/
         l20lEMbBSLk1cSooa1KcXtMAJ7jP7qg1/VX1M9TJcUE2qmT0cADUNeYRgLE6ItBXyaOp
         6UYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695843338; x=1696448138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OBZ4IYoE3UGlFGxrLn0BTpDP5IoGpepsXCJr4HwsmE=;
        b=qhFVr8GMXPWqcbwl6gPsUT5A41jxsPbvgcX6qFPGbMtPcLIZRsIdXdcEjUpOILkSxQ
         zdRNFVvO9q4RANzpvqJW47KrOkjQWqAg+CJxvma8Qd9nSz4kh3MfupqV2HRV1grB5TjU
         vjhLu655A+w/RPXma/OsIF+zqK9GWoJZrb7aok51ssY0vMdYnprtDTP/5vF7iuRWoWyJ
         twJnlip75XweYncfzj379GM0pebQmeRwvZL/9o2PudEAKx5W052ttOGTWL5LpqoYnct/
         i2GjZ8dLJ3Vh+FMqY8X+kCr22DyQ4+OAnES/lKabnszqwR6TO/S5OLmBRtOXj8GhBQS0
         EKSQ==
X-Gm-Message-State: AOJu0YwgxLTVodWspNOHKG+pkZLx8iwLQSQs3CIjHvtnzXQHeUY2n/An
	rnUPmvNnrfrSKFliVq87XJmXUOtv5PObGMfNFpM=
X-Google-Smtp-Source: AGHT+IHhwf76s38RaAZ7EgW0fnLVrk6vmzRVLT0HM+oYD6dhWdYcbcdp+Az3hS0Kw6QAQuZ0ZzwNJsa6ObbFK2izdXc=
X-Received: by 2002:a05:651c:104:b0:2b9:e53f:e201 with SMTP id
 a4-20020a05651c010400b002b9e53fe201mr2716509ljb.31.1695843337780; Wed, 27 Sep
 2023 12:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAPDJoNtU9Vuh87PxDkxo+7M_Kg_K4PPNGksPuW_guFbChYu-jA@mail.gmail.com>
 <20220601155702.176588-1-ariel.miculas@gmail.com> <CAPDJoNvZmeeU+T94rp8BJ0+bH5pDXQCEKPHiQF0Kcu=JrRRfrg@mail.gmail.com>
 <CAPDJoNsb-HtfOQhD6ntZ8Hqx3fv3WAh1U5Jd3GzyN5EwO8znWA@mail.gmail.com>
 <CAPDJoNuR8pNa+rp-PG_eeS14EvpMBLAmjNf9JvL=+0QTpwww-w@mail.gmail.com>
 <d6bd3632-207e-b232-b4a1-0c592a3aaae9@csgroup.eu> <CAPDJoNvADrCj8L2RAthXVbBxMNrjbY_4pnHu0QtKKARgyoQ-QA@mail.gmail.com>
 <9afcdb29-db22-3f5c-b596-da7567b707ff@csgroup.eu>
In-Reply-To: <9afcdb29-db22-3f5c-b596-da7567b707ff@csgroup.eu>
From: Ariel Miculas <ariel.miculas@gmail.com>
Date: Wed, 27 Sep 2023 22:35:25 +0300
Message-ID: <CAPDJoNt1xzLHfVYDi09X8Tz-3urrepboW7-S=iM6TpWv=Qih7A@mail.gmail.com>
Subject: Re: Fwd: [PATCH] powerpc/ptrace: Fix buffer overflow when handling
 PTRACE_PEEKUSER and PTRACE_POKEUSER
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 27, 2023 at 7:01=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 27/09/2023 =C3=A0 17:27, Ariel Miculas a =C3=A9crit :
> > I've forwarded this old email thread for visibility and discussion's
> > sake around my recent blog post [1][2]
>
> Ah, right, it's been superseded by
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220609133245.57=
3565-1-mpe@ellerman.id.au/
>
> So I mark the new one superseded as well.
>
> By the way, is your other patch still applicable, ref
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220610102821.25=
2729-1-ariel.miculas@belden.com/
> ?

Well, I think it's better to explicitly access fpscr than to implicitly
overflow fpr into fpscr. Because in the implicit case you need to make sure
fpscr comes directly after fpr and this relationship is never modified (e.g=
.
someone refactors the code and puts fpscr before fpr).

Regards,
Ariel
>
> Thanks
> Christophe
>
> >
> > Regards,
> > Ariel
> >
> > [1] https://news.ycombinator.com/item?id=3D37671991
> > [2] https://www.reddit.com/r/programming/comments/16tf5ne/how_i_got_rob=
bed_of_my_first_kernel_contribution/?ref=3Dshare&ref_source=3Dlink
