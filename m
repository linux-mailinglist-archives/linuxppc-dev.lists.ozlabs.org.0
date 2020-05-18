Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40C1D7709
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 13:28:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QcGH3srRzDqSp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 21:28:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=rsalvaterra@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TgLsWTM3; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QcDH3CjdzDqJ3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 21:26:55 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id g11so4111511plp.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 04:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3m6kpdhCzyXiKM7tLUi87kvi3ahn+D+OqUxwCRyIdVY=;
 b=TgLsWTM3LH0bgV3PQTcUirjMbz+xAsvX8lqA69DmH1LoNETzem7Swo6jVVXDSebLnN
 VYsls9+wUVxBjkSNy/Xm5SVZixhnbsoD0jpJqaGKh7zKPTaWxk3P3kjLc2JfVf0qv4Y1
 TVQaAV/MhNt/tfdGpmdJc4KQyIL+3my4nXgi7WMjOSgXtIbY0kcyQBNDDyBv+MeEsmBv
 BkXHQZIWsAcjK19XF2DgkZx5QiKMuK9+H85NIVMpk728L7xDaTYyGmYm1+5irQ+BL0mg
 lnY6snYG1RsqxJLRnBfHR5b58pRVKHwWIzgpG4TJ3DIeItw04Kw2VSjKkmclw+XglJVo
 4AVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3m6kpdhCzyXiKM7tLUi87kvi3ahn+D+OqUxwCRyIdVY=;
 b=gkksekU/wIJjCJtHSWDWWgHcVJTBX1ILcJYa3h89+ztWyEFE5PeqKVL8OOhdIctKDR
 ppgPbKEtMUJkhz01uQODBQiqkFfn4MtAbAze+78AyIObfDpPvlJhVodyoYLcxloUIsgt
 /2tDhYfnBJlwIJF+LwDhzx/avO9ccO6x9cf2+Q2F07/4XmhmR2bapjjpnvJ/4PdiWyYd
 WbiINkwu1e+4PgM3MyINdAKtdH8wXFWA75r9G09G3YkheD4AG9QY1XUSbNDc7649MTDG
 Hnxkxy/lpCBPbj0nggAxOPZlruWxrM+WvOzDpAWGkzgNcaxkqAYlTNqV38Npjty3+0O3
 5WRA==
X-Gm-Message-State: AOAM533B4gz4YX426H+nzncI2rf+wosKEESIwheDQgXHH9Dr9zHLlzZV
 Mpz8vmOjMy06cqmPL8VN9JI/5KtFKHjMdTHX7yNZqHc=
X-Google-Smtp-Source: ABdhPJz33/i2ynDnb3B69EYRFygQ92NXgj1gqOPtNmBTNQp7K+9Tdut5IGWy8m5vUrHTcobqdCo+3wQGtmyJ0qTQtLc=
X-Received: by 2002:a67:f64a:: with SMTP id u10mr10501648vso.202.1589800702710; 
 Mon, 18 May 2020 04:18:22 -0700 (PDT)
MIME-Version: 1.0
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Mon, 18 May 2020 12:18:11 +0100
Message-ID: <CALjTZvZ_FQUP=02GcnkuQKoGunvhV5DGS142Q1FC3Ez6UvQGTQ@mail.gmail.com>
Subject: debian-powerpc@lists.debian.org
To: linuxppc-dev@lists.ozlabs.org
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, everyone,

I strongly suspect something went wrong between Linux 5.6 and 5.7-rc1.
This is an iBook G4 laptop with 1.5 GiB of RAM running the Debian
powerpc port. I haven't bisected yet, since it's going to take quite a
bit of time, so I'm sending this mostly as a heads-up (and to see if
anybody has any clues about the possible cause). I'm using the
following reproducer:

stress-ng --cpu 8 --io 8 --vm 8 --vm-bytes 1G --fork 8 --timeout 10m

On Linux 5.7-rc1, this completely hangs the machine in about 30
seconds. Linux 5.6 survives the test. Let me know if I can provide any
additional info, otherwise I'll just bite the bullet and start
bisecting.

Thanks,
Rui
