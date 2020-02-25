Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F356D16B6B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 01:29:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RKYY2zNNzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 11:29:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RKWq2z42zDq6l
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 11:27:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=BQCQ10WE; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48RKWn5Hk3z8t5h
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 11:27:33 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48RKWn42dSz9sSR; Tue, 25 Feb 2020 11:27:33 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::144; helo=mail-il1-x144.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=BQCQ10WE; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48RKWn3gKCz9sS9
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Feb 2020 11:27:33 +1100 (AEDT)
Received: by mail-il1-x144.google.com with SMTP id t17so9291885ilm.13
 for <linuxppc-dev@ozlabs.org>; Mon, 24 Feb 2020 16:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SQsmpamnEC+1G39fOnv3AHWet4T1m/yewhekPzkg6oM=;
 b=BQCQ10WEVUabUm+celhXtz0JdV/fkLvArkq4WsPhiiiAA43MY858di0FZp521E3XTa
 5gqYAYDSdEkYN7SnEs4kyHgKuDAokjOrwg8sDzoyGx+kRiRQoeYPAVL27o3UY1SptQ6P
 pawfnNYmAT74vVjX3bw3QxdpPYAKa7PertS4SDxi5/4YRqLx4WUWY4Ylh1MJTe0qeGqM
 r7Zso+I/9Be7mulc84it+ioN3JpDc0n0Kd2afVxxvFbzx11l8++ZB3RGjGPJCEOH5hAH
 GLMKZmfBiPVmTF/1Gi+sS0w11tan1GNl6HxPE8SWZpwc/YwfxcOn9Pqvsn0bWAq+BB1q
 KTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SQsmpamnEC+1G39fOnv3AHWet4T1m/yewhekPzkg6oM=;
 b=s/Mpb7xBFh+ZYzr/YN5BtCjkAI2kDfbXKAEHS5qB6ZHtrAB222I84nyPfVnIWYO3v3
 e5epoNRu3kD0pCjQnoTXGfMykcha2+reFUHNDa93w4sx67zzgCaacCnZFg3NunAUujEW
 7Y2XV2rDiARZTfXKOVzY1IE4+1mmVUKNMQnznlHpw0365T4pQIoTT1Y53w8YNfjh6GcB
 0IzT0vYKQ5nuEw/lsPZrES1NqLg5Lx/iG6yIf9iorgWrDBbgJDMk0hEiwJepQiVBWjES
 82IKevRB+CuRK/IwKKbIxt+3xBY99hGpDzAnvNxQqGAkEmTjW4zI2Sg5yHIeVqBUorNy
 TCPg==
X-Gm-Message-State: APjAAAWmtCG6ZTSEeXJyAsfC32E17Z22HctZ1DpiyVy/JRxEu3EbOuQU
 a+3DqBzj/1MPCFrBvQkOJ+unaeuN10yZqSyQA33R7w==
X-Google-Smtp-Source: APXvYqywoJznArA+B42fE3qotZLbAO/lZwwwFgSnCIFaKH0Kz32B3tEXhjaA2SpvadNI/Y+gQm5xbMlQ4ziEB+Eb1ho=
X-Received: by 2002:a92:db49:: with SMTP id w9mr59714964ilq.277.1582590446536; 
 Mon, 24 Feb 2020 16:27:26 -0800 (PST)
MIME-Version: 1.0
References: <20200224233146.23734-1-mpe@ellerman.id.au>
 <20200224233146.23734-3-mpe@ellerman.id.au>
In-Reply-To: <20200224233146.23734-3-mpe@ellerman.id.au>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 24 Feb 2020 16:27:15 -0800
Message-ID: <CAOesGMhHSYHvAXAH-kBxxGhd05Q0bbxDa9dyuw7oKTH96PTi0w@mail.gmail.com>
Subject: Re: [PATCH 3/8] powerpc: Remove PA SEMI MAINTAINERS entries
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 24, 2020 at 3:31 PM Michael Ellerman <mpe@ellerman.id.au> wrote=
:
>
> The PA SEMI entries have been orphaned for 3 =C2=BD years, so fold them
> into the main POWERPC entry. The result of get_maintainer.pl is more
> or less unchanged.
>
> Cc: Olof Johansson <olof@lixom.net>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
