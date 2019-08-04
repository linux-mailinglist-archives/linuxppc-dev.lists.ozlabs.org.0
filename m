Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD31E80BE4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Aug 2019 19:36:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 461p3K6mqWzDqbw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 03:36:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="ADlOLWHu"; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 461p160hBGzDqPc
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2019 03:34:14 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id g20so162717158ioc.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Aug 2019 10:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JSbKSx5m73TVdbeyhFM7iW9Og1SMXpc1ky4bCAVCxs4=;
 b=ADlOLWHuK2VwUfve8vpeFdrwbwA7RPaodycp1N99CBS2wORgpg6zZHSoWiP8SmSm1U
 RM7TiKc9dLUy0KCZ3jp4MSagVlXp2AeFW2delztb2FP5PvPDTLjyuZEcW0SwvT0pdBVb
 FUsy5k+0ovTT3iS49Jn1TBuP/PWctP5WOBK14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JSbKSx5m73TVdbeyhFM7iW9Og1SMXpc1ky4bCAVCxs4=;
 b=CShME7WmPMAeebREONhDkpRwh0gbAb+cPTy/D/L8w++gwt27q+dnDL3IcY0W1MwPfr
 6cU/IpYXG2a4HToMmDlkNVgJNaiZS/qn74tnTTaFLZpcX97sw45aPdXu18v8tCdaMTjO
 uZK9BANTLSpihKNZzvS8yDy6dYTnak1rhhQnPLxjaBZPxld8XBwHh97oS8egKvA/3fYF
 SSm4WKNjJXpLvSLBqGkfkP+0Dg38dO0cdbf2xIaW36I0GLpb60pYaKacQbpQD4HwVkxg
 RRXCJL03CKU9JzATm+ybqrIDw/vsNR37Nf4eTYFPfiGc7Uw9j0a8vrkCxFBbskVuturO
 kofQ==
X-Gm-Message-State: APjAAAU7L3XAaCqc5n9BnhrWgPxrrHeJjf0HevTCfZ9PSrkQQEmxNGjG
 ANaqDsBcNiHDkyMKRC+6qz7xAo1q8XwpaejNjLr3AQ==
X-Google-Smtp-Source: APXvYqzzUEpJFtRih6Nzxhg6l6D83kQ2I6KqG2D7hrcFzzozkSYptlaJsV8IqdJ6lRVyc6a+lSg8vTv3+hRGSfmO3aM=
X-Received: by 2002:a5d:948f:: with SMTP id v15mr4358171ioj.93.1564940050963; 
 Sun, 04 Aug 2019 10:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <87a7cpw3on.fsf@concordia.ellerman.id.au>
In-Reply-To: <87a7cpw3on.fsf@concordia.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 4 Aug 2019 10:34:00 -0700
Message-ID: <CAADWXX-B=twNfqs=2hbp0UFpnhqmUDMFZA3tjXFEjDp2dAD_YA@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.3-3 tag
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, santosh@fossix.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 4, 2019 at 4:49 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Please pull some more powerpc fixes for 5.3:

Hmm. This was caught by the gmail spam-filter for some reason. I don't
see anything particularly different from your normal pull requests, so
don't ask me why.

The fact that you have no email authentication (dkim/spf/whatever) for
your email address tends to make gmail more suspicious of emails, so
it's probably then some random other pattern that just happened to
trigger it.

I do check my spam fairly religiously, so it's not like it's usually a
problem - and I obviously marked it as ham to hopefully teach gmail
the error of its ways. So this is just a heads up.

But if you do have the possibility of enabling DKIM or similar on
ellerman.id.au, then that is always a good thing, of course. I hate
spam, even even if DKIM and friends certainly aren't perfect, they are
better than nothing.

                Linus
