Return-Path: <linuxppc-dev+bounces-2453-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C959A5D1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 09:32:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XX6Sw0clXz2xtt;
	Mon, 21 Oct 2024 18:32:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.170
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729495920;
	cv=none; b=Np2DZ2cC95k+ErNXJED9hQ8Si/D2kk+uSTEZfVMry7wsaOHxUTO6I8LvguWH47IX7ZzzsKMTZCwBbtBI+qBWrGt8DN1DWrE+GXurbqYO/JZe+YFnlT/Os7QO8BikhH1RyCDQJjmxxR4EDFCHb20ebhVFI4/SwMOH4ayYhktIcmuVf9FSp/3Ew1y+AI1+pV7UpG58aFmUJbPl+8eyJHEpQ9bWzMlX9I98GQwy/qOzhT6QIeDPuCiv9geg7rXdL6G3rYLWcx/jQC7Fo5sUJrv5MvTqyfoyYKXVnP+SzZuUwG5f3uiAs4lPaifNoC2QUxkM1b1NDcgl1d0zWWeraIH/2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729495920; c=relaxed/relaxed;
	bh=jr+kpALnRUsAPIgtZFzgufk7e4vaGeioyiXEU/DOG3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUvAqHAr8TWHHu3WhtX1hyPvAJSmnKbIYDQeSpvD9faLqSH9yj3SxCzAf5l88hB2Dk3N/d0/elr9b8Pe7gloJK6KXlKJv3gS/bwXD2YUp9Dvcrk0S7l9fRwnKWlwvKaJ9NyXELVbxg2/hBoz36gAZkr04FFliOJgcPIs2qLpoeEHSUdN++EaLRrak1I+OOD7dr5pcjh8IEl28YuBkwJg/GpHEvoeLJVCHqmH7CnND78Cfr/4sJQx7JKYKxfn0uJLLFnob3kW+5RFQ5qPhKJTMe1enAwpARJM2e8EsMxxkoH1UXRLWb7JynPCBMNk2hFGsfTG6ukfYmZ/35HK/lyo5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.219.170; helo=mail-yb1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.170; helo=mail-yb1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XX6St164yz2xHG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 18:31:56 +1100 (AEDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e2903a48ef7so3861483276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 00:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495910; x=1730100710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jr+kpALnRUsAPIgtZFzgufk7e4vaGeioyiXEU/DOG3s=;
        b=ewTCc1wtB0D/E19kR6+K/UWvp3Zx+2k3Du3X5g0D+5OgQlROmA1+7YHRhbbsPea/8P
         1MgrFE5lR4ard9ccrHOy6C6KI0DD66dHEpjjDXZ+njW/o7PfcAMjul7UdObQPnwQIUAE
         NMHLkwhzDv/aTmRLGS0tgX3ehq7JDV/P6dI63ORGbNlKGHDT3WSQAYA2K9sC7CEvu3nR
         a+LcVwNbd5oXbFwA2IQzaM2OV+zgGd0rtAtvAZ0jluiInF4a9QyHEW/LjmRILhPI7pyD
         RHMwR3W6NBYCMQOzWGW8J2VVTJP+4iBA/5k1WjtRkB4pK6Ea4EcQHkyxpPqizVu1LJSn
         4X6A==
X-Forwarded-Encrypted: i=1; AJvYcCUyqhpBu7bDSxjdVY4+JiIWDWgFEmlWEwK95pDfY3i88QNmLAk18JWxYhXuv+66T8Y6brquS11HVIBJipI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzf00Evlh6SkJ+JQLxJKIWsNSlPj9tKwqiH1qFksV0/WAfh0J7p
	YGB3IMANpFI5WQ9sBFgkf4a0Uc2RflnsOdFPZE6WnxeUA//at2eRg4vvjGhU
X-Google-Smtp-Source: AGHT+IHsv15edLKwZ+w/kvELuZ1j8Rq2ySCCFGfCEpmwWX5wDK41zaxZgVzYQrBx+fLpqFqVlBmFrg==
X-Received: by 2002:a05:6902:120b:b0:e29:2c97:f004 with SMTP id 3f1490d57ef6-e2bb1309233mr9879939276.22.1729495909630;
        Mon, 21 Oct 2024 00:31:49 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2bdc9b2820sm571565276.31.2024.10.21.00.31.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 00:31:49 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e3d97b8274so34169547b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 00:31:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX24Mv4/dQQlm88vLR764JNinCNB8Hb3tVkUnH4nt1KLsHY8hac/jP18bawWS6PAVPcXuATNcxpz5GOlfk=@lists.ozlabs.org
X-Received: by 2002:a05:690c:3389:b0:6dd:e837:3596 with SMTP id
 00721157ae682-6e5bfc31904mr97889987b3.14.1729495908789; Mon, 21 Oct 2024
 00:31:48 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <ZxMV3YvSulJFZ8rk@mail.google.com>
In-Reply-To: <ZxMV3YvSulJFZ8rk@mail.google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Oct 2024 09:31:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUG7z0Qz=6GfeidmnrD_s_RQzMeC1wq0c2A1eQB7rG=Xg@mail.gmail.com>
Message-ID: <CAMuHMdUG7z0Qz=6GfeidmnrD_s_RQzMeC1wq0c2A1eQB7rG=Xg@mail.gmail.com>
Subject: Re: [PATCH][next] powerpc/ps3: replace open-coded sysfs_emit function
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: geoff@infradead.org, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Oct 19, 2024 at 4:14=E2=80=AFAM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
> sysfs_emit() helper function should be used when formatting the value
> to be returned to user space.
>
> This patch replaces open-coded sysfs_emit() in sysfs .show() callbacks
>
> Link: https://github.com/KSPP/linux/issues/105
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.c=
om>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

