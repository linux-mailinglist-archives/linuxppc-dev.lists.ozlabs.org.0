Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C83486BD7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 22:24:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVK9P3tG2z30Lt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 08:24:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VFCxEpkt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29;
 helo=mail-yb1-xb29.google.com; envelope-from=ngompa13@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VFCxEpkt; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVBh43VxYz2xBq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 03:31:46 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id c6so6909334ybk.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jan 2022 08:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZM6UOM3FnObRgkqEaRi7ZwsD77LyLEAv2E7+Qwz8Kpo=;
 b=VFCxEpktrpxVRGftdbTMwrw0K0F4iRBgf/FyutcTsvjBshi4XyaAR9z8aQ1XSsuPMW
 XZwBWhC7xGFrRA7qJ7ZCdRCnCl3IG07J41NrYQOdtNeZqyCkfb5gxVv2gzovjf1S25Cj
 nJ29mE0DJcinUaYPSRFG5CMLPZ07BcCe7mxdeI68C44G5pvX4NxPtvOQ8OJOdUKqp5MW
 C5sEj1X1RkO53v91PxhkmXXMFrJzFHg/ztn4QrrH3hd7EKUzxrmaIm7JXC15fZEf4G8u
 1vEdnf77nA9yfZBXMbnpXAZTi/STZdYof23Fsi08VjH8kIwtknhGklWB+Jhh+1ZfaWgr
 yZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZM6UOM3FnObRgkqEaRi7ZwsD77LyLEAv2E7+Qwz8Kpo=;
 b=IW0KIulLh+iX5cB9drwJc+gBkuRg40cdSXiqUDulSTr2us9wv2TI3S73F5tRCT9+93
 3gLGClGYYcM9eDISiTJjfRYqp0d5/vC9lIuvx4lGf7v/7RR08Z21xjVsNjE348MSgo8+
 cq+2/T4CgG2GdqWJyJ4xTc9443VqwqsxY8Dz0/blkXcGiE5E2WxwtTjBYC/MBnA9yFN+
 IuYyDUuVqTTQzsDgOFCuBhrSPMGpzhjrkmUQLMxbjMv7DBXLuL3c9ka0r+FWRqwgN19e
 NtQhaBwZoErRyIY/pp8/nIoGTElsiCzT6WmcWulDtxXt3RuAqT4sHi996QM5zQlSx1UA
 jj0w==
X-Gm-Message-State: AOAM530ugy8HjqNgwwI/SmIa2hJEYdIIWdpwYC1WVQeIZlF0I1dSF5B3
 5dMT8g5U3ipXAkSarafzrd3F0DGCbcBFVtpC6Xg=
X-Google-Smtp-Source: ABdhPJzNdTP4XFd9P9NPS3ZzTPTsau2wGRp5cUn725XM9mHDW1ZcoJ4wEL3J1x4enMFKNDk4Az+hl/frDFPXPcgZERY=
X-Received: by 2002:a25:d708:: with SMTP id o8mr65492245ybg.582.1641486699930; 
 Thu, 06 Jan 2022 08:31:39 -0800 (PST)
MIME-Version: 1.0
References: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
 <6c7a6762-6bec-842b-70b4-4a53297687d1@gmx.com>
In-Reply-To: <6c7a6762-6bec-842b-70b4-4a53297687d1@gmx.com>
From: Neal Gompa <ngompa13@gmail.com>
Date: Thu, 6 Jan 2022 11:31:04 -0500
Message-ID: <CAEg-Je9UJDJ=hvLLqQDsHijWnxh1Z1CwaLKCFm+-bLTfCFingg@mail.gmail.com>
Subject: Re: [PATCH] fs: btrfs: Disable BTRFS on platforms having 256K pages
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 07 Jan 2022 08:23:36 +1100
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
Cc: linux-hexagon@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 Josef Bacik <josef@toxicpanda.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 linuxppc-dev@lists.ozlabs.org, Btrfs BTRFS <linux-btrfs@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 5, 2022 at 7:05 AM Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
>
> Hi Christophe,
>
> I'm recently enhancing the subpage support for btrfs, and my current
> branch should solve the problem for btrfs to support larger page sizes.
>
> But unfortunately my current test environment can only provide page size
> with 64K or 4K, no 16K or 128K/256K support.
>
> Mind to test my new branch on 128K page size systems?
> (256K page size support is still lacking though, which will be addressed
> in the future)
>
> https://github.com/adam900710/linux/tree/metadata_subpage_switch
>

The Linux Asahi folks have a 16K page environment (M1 Macs)...

Hector, could you look at it too?



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
