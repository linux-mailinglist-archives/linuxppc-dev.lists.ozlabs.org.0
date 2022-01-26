Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADFE49D228
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 19:58:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkY0W6dVdz3bc4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 05:58:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nSPmP24H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d31;
 helo=mail-io1-xd31.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nSPmP24H; dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkXzq41VCz2ymc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 05:58:13 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id i62so789611ioa.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 10:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wyngZyIrlUk01+iEOlsom8ih3d/SEkgg9mdbfxMjBKY=;
 b=nSPmP24HtC8iu/VFrAUpvAwud6+rPMJ5yo6pAqXOvx8fFTj3qP8h2gt4oObElaUDxR
 f3geinsOxRWyAkvxpMQMuC6w9f+VVqdUcLJZHjBFjS8O4FWjdtYWpO05/XfvZQ1jv+G6
 A12hipy+TxNMvNjpcKjyouHTj0MU3iYbtGCgzgZnzq95SFX3ybqPxkLD3yKVBLiK2qEW
 eVwkYkNemK6Lhy0uuo+/ByG56hxXfHg5XVTjDT2xeEb3pK9/lBCVknk3CHIW5uU/FGbj
 3khZbEz1vNmkBKlYExdxxnYFNA4GZWHVxRLE1jHfl8bYfTr0FSOIopw44OxnNB3UpTC0
 yajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wyngZyIrlUk01+iEOlsom8ih3d/SEkgg9mdbfxMjBKY=;
 b=hoX2A8OEjeVfXBz1ifNwUOr443G6nGuKMPeG3tN2NUnUlxr5juCVmzKIjwC3W9TVBP
 1ZzMtkqburwEhgaNLwlzp7w4cuDiWL0Ct8R33edcTtsifo0VKXVtMgQifT2EW39rpdPs
 YRdX/YwVRFgorrDKzJveMKiIS5XofXSdBUJB4BKpZdSVewL7nZ2PDYR5NxQwjZQ0/uGJ
 VGmwecDmMWhVEyYobIAB1Trl+N7/vzg+cHrkLBRaQoasJ+EPW1TEwXOxBricBIBeMX7J
 cnbp/dCFjZxmaCCo+VTXuspdIXAGhioHv05dYoOp1/fFGapBTaW9KVdDHSuIu18/6Rec
 RFyA==
X-Gm-Message-State: AOAM5320V8Tqr2dsKv5Bq+zre30D+duVRMD0EB2GoSOHBsLc/OX3Qhf+
 9ZUnnUj71CZ2y1D6He9AdedNE6wOUnjlClrUU0M=
X-Google-Smtp-Source: ABdhPJwtMLliBG3wT1Y/vWDYL0Er0UPdS0WQquBtClo6suuooJ1hlgFqLRErD+rAPDLXUnNKXmqNSNQM0vMBhinPeq0=
X-Received: by 2002:a05:6602:2d49:: with SMTP id
 d9mr14348785iow.64.1643223489670; 
 Wed, 26 Jan 2022 10:58:09 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72n_FmDx=r-o9J8gYc6LpwRL5EGmhM6Xzwv27Xc7h1TNDw@mail.gmail.com>
 <cf6ac499-4190-cbe5-255c-f9edf07a4786@kaod.org>
In-Reply-To: <cf6ac499-4190-cbe5-255c-f9edf07a4786@kaod.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Jan 2022 19:57:58 +0100
Message-ID: <CANiq72mV3AzmBDVJM+tQriEoDu_9LFBrK_vR6GC4qEmLw0UepQ@mail.gmail.com>
Subject: Re: ppc: hard lockup / hang in v5.17-rc1 under QEMU
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 26, 2022 at 4:03 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Indeed. I could reproduce.

Thanks for the quick confirmation!

> Could you please send the QEMU command line and the full dmesg ? and
> possibly open an issue on :
>
>    https://gitlab.com/qemu-project/qemu/-/issues/
>
> I guess it's a QEMU modeling issue.

Of course -- done (details there):

    https://gitlab.com/qemu-project/qemu/-/issues/842

Cheers,
Miguel
