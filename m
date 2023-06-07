Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BC7727333
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 01:39:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qc3hy6wKxz3fdT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 09:39:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=V96h5mLE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=V96h5mLE;
	dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qc3fr5lrXz3f83
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 09:37:40 +1000 (AEST)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-77807e43b7cso177295139f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 16:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686181056; x=1688773056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EN7QCcXv3GhQ50KYCOkYuc7v8/KdYJA2Wdn7x5ACZBs=;
        b=V96h5mLEJYKOMV9BFNRVgNFaASJgFsdeMRqb3jswr4Wn2GHkVX33PPnOqoYfUIzwog
         +uKfdgba9CkmAnJxDTjATMtDizd8LSpSjYbh4s7gaz62i5STy4pngNNkaj+LIUxN2yPz
         XGaCAvvRdtGhT+TTTbgsqejeX8+dcfUhqNpv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686181056; x=1688773056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EN7QCcXv3GhQ50KYCOkYuc7v8/KdYJA2Wdn7x5ACZBs=;
        b=jA3utdZzN0Ceff50HmDyTlJHn2Z1t1d2pESWfUbGmtc6Pge3uSALyTtP7kURZzSzoB
         H46aFfHgPHDUS6ogLFuWLrS3gUUVd0SYEM5M/Uu55eq99Bt+qxgLp55HZGPOi8czxakL
         OzqVF7792+Y0XLVDMhW0TtbzoGPiuG+pAY2UTIaa2HE2xdCgPB6gXQIX1SUSF2hoOIas
         J/LM6dFtCx4gMvUbvyUJYVRM8ewzVON7SfShA02mr5ssq7x1Osh+aRW2/3jynggXduf7
         7n4wwtAOHbS5/d+j74Hj5IzhQ5BRsEumTbBePlY325cgmxLjnrR0g4bZhyJQ6V8D8RkP
         noew==
X-Gm-Message-State: AC+VfDyl7RHCm0sxr7oyQ7gbYtMq4tiOit7ji8TOI0ooBtC+xzxUlaS9
	nclfpWIey779SBj7JvaZAKZXV4z2U1GemSf/gUc=
X-Google-Smtp-Source: ACHHUZ7+TXiB2McgvSEJM1zhINF46MtYsaNCCgpyIH+ycWxwfAJBzePikY4iHkg9NvFKgEd9fB1UwQ==
X-Received: by 2002:a6b:d818:0:b0:777:b3bf:c40d with SMTP id y24-20020a6bd818000000b00777b3bfc40dmr9628536iob.21.1686181056745;
        Wed, 07 Jun 2023 16:37:36 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id t17-20020a6b0911000000b0076c872823b7sm4063951ioi.22.2023.06.07.16.37.32
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 16:37:34 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-33d928a268eso54835ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 16:37:32 -0700 (PDT)
X-Received: by 2002:a92:c54d:0:b0:33e:6b65:6f78 with SMTP id
 a13-20020a92c54d000000b0033e6b656f78mr16557ilj.27.1686181051931; Wed, 07 Jun
 2023 16:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-1-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:37:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W=xamTf6BUmp-Yg-SEEgE8GRKw6Pnfv6t=Hviywj-N-g@mail.gmail.com>
Message-ID: <CAD=FV=W=xamTf6BUmp-Yg-SEEgE8GRKw6Pnfv6t=Hviywj-N-g@mail.gmail.com>
Subject: Re: [PATCH 0/7] watchdog/hardlockup: Cleanup configuration of
 hardlockup detectors
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

On Wed, Jun 7, 2023 at 8:25=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrote=
:
>
> Hi,
>
> this patchset is supposed to replace the last patch in the patchset clean=
ing
> up after introducing the buddy detector, see
> https://lore.kernel.org/r/20230526184139.10.I821fe7609e57608913fe05abd8f3=
5b343e7a9aae@changeid

I will let Andrew chime in with his preference, but so far I haven't
seen him dropping and/or modifying any patches that he's picked up in
this series. I see that he's already picked up the patch that you're
"replacing". I wonder if it would be easier for him if you just built
atop that?

-Doug
