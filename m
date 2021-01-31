Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 467AF309E51
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 20:41:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTLzH67GczDrB2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 06:40:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=GZl8pdXm; 
 dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTLxJ2CSqzDr7W
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 06:39:09 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id c18so16949334ljd.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 11:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/prez2NnS5ONN2JEGbaH8ZceOC33z6jLmIIRaywDxM0=;
 b=GZl8pdXmgI/+/bvVFugC4BXdlZNhjQK1C34M0NtdchE5n0o7I5hcnwnXr2sLd4qklc
 zzMCCS2S5tJkhQp8gY8jhOSb21ViCHJMKQY/GVBvQCOCOvS0PBueqgs+DbGeREUyJKhR
 A6k5bcLDkfoPkcjuq9U5tXsGVwGC0jdpRYTCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/prez2NnS5ONN2JEGbaH8ZceOC33z6jLmIIRaywDxM0=;
 b=XwXUoT1lbNBnqdGFBnIaVBMuD/UP0Dn12tiQnCVv8+NzVj9VkmaTBJi9bTu44fEbYq
 w2bdOFpQXioc29CrfKjptrcNqFR08AWln7e7NurmrnjRavO0Ml4UkGTkO/vIr7zOaCTl
 +IWj5cOHyeXbPtk1sGzBwnSsfdLIemQ1662qflmLbGiPf5D1IN777/RmsydIH3ok2Uq9
 nD3rPoRONxM2osFQg0pCfuFRKqny7o5BYSjtfUFyc2QemV9xcD8PI96A7qwE5H4yNVua
 VsC0LPlZVmfDgVqvNh4jXUaW3P9EUjdoBAhLODVlpg9YBOvQgeY84MQBzKmBmN0fTo/B
 uBlQ==
X-Gm-Message-State: AOAM5334czLW8Pnc6tU/zl1MhMl0lMSn3gqm3f2YRhLxfLTi4mRxTDqa
 ZhFYqCaznTIW6ErCEt4fnedajdL82jOSbA==
X-Google-Smtp-Source: ABdhPJxGg2CSlpTVB2C6O4gwNWPS+RMmGejT/ipji7cTUrrB6O6E7UJgm2LyZjRWYqlu9WzfpjAQsQ==
X-Received: by 2002:a2e:8741:: with SMTP id q1mr8510966ljj.20.1612121943677;
 Sun, 31 Jan 2021 11:39:03 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id v2sm3455562ljk.60.2021.01.31.11.39.02
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 11:39:03 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id t8so16912771ljk.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 11:39:02 -0800 (PST)
X-Received: by 2002:a2e:860f:: with SMTP id a15mr8349039lji.411.1612121942529; 
 Sun, 31 Jan 2021 11:39:02 -0800 (PST)
MIME-Version: 1.0
References: <87lfc9cnuw.fsf@mpe.ellerman.id.au>
In-Reply-To: <87lfc9cnuw.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 31 Jan 2021 11:38:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjPfxVm0F8Eb0Wba_kCy9hzM6Go-qgOgP6Tf6SKhf-P9w@mail.gmail.com>
Message-ID: <CAHk-=wjPfxVm0F8Eb0Wba_kCy9hzM6Go-qgOgP6Tf6SKhf-P9w@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.11-6 tag
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nick Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 31, 2021 at 4:06 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Please pull another powerpc fix for 5.11:

Manual pr-tracker-bot says thanks,

           Linus
