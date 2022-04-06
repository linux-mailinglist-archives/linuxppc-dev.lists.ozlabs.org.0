Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 410834F5A10
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 11:32:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYK686K9Gz3bdL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 19:32:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QUqYwudk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=zhouzhouyi@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QUqYwudk; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYK5T2cC4z2yPY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 19:31:24 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id qh7so2948640ejb.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Apr 2022 02:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FI+EACkCTDn0l2CnSWYFgxS84Koe1S8eDRxILRKVO+w=;
 b=QUqYwudkm5hdLASSInYwknK32f48QP5wrARDQ0sfAKPa4GRifQ1IsWNHCEA6CUFdho
 mzxcQfPOyjJNtAEbp4nei8JQU05coMPHffudcBxYyAUNxt5L85Z6OcG7ALOk52Y8paRa
 IbYARhO7kcfEiZih9ggf2DKd/RRqSUrDYJ/IDN/iYcUe9JxBiE8W8YJ34g7MBNXk1E2f
 EVt1GGnMFv1KcmCQcoiGG5Hs4Hvftv8MWd00VyOZ9Gwf8BwrbTM+bcUE7547DUmb9k52
 PZO61kSd5UgxSUuq51I/Nul2Kx5zdoD+QSzHPZYLRXM9qZHlY0JRLrWKmTkvXvIETT/E
 f/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FI+EACkCTDn0l2CnSWYFgxS84Koe1S8eDRxILRKVO+w=;
 b=ZQDgKul9rUzYMK2QxgtXPIkL0sA/9Baxkex0ulASLFHf7/dBls+hx5/4OUvAWJsrSY
 H1d6PYa/HyknoyJz5PqKqsJ3+4Kt8GQg+8JAAJmysrHtXS9FyCIbjwyvpdsFGjX/SuVH
 vbwKzcx2vRTKx7XHNFsIQJ+kf+GZJu4UPsNgtEES1ymIMVgBT9kwipt0G0UWZjUob6CA
 DVcrRWiBhsNOuWfRYsOFNexcsLKV/Iw24OBL6SCfQ/EOj/krPO4DUCXP6TDb972xm3gH
 GovJ1y0K/I0vd5xDYFTfpizSjkt7cNoTA5dLBWBrRF7Pa28NkYuek5aECcIVpCNzXj0Z
 7Riw==
X-Gm-Message-State: AOAM5311K9+kLAYt/8u1Tm21pPjPRwP4/dhUWKbs2GnTXAOZiI+esLYy
 ccwDeDxAsvCofx4o8Warc6L3ehrKrjhFH7MufsY=
X-Google-Smtp-Source: ABdhPJw8KQFjuLQmdXLOWEa2QDdz165o3Fngnj3VRfnJc7mZFia9owQqLuL5XH1JB37XLCcEbR4lIpRCuKC2KmxQ4x8=
X-Received: by 2002:a17:907:6d07:b0:6e7:979e:9c0a with SMTP id
 sa7-20020a1709076d0700b006e7979e9c0amr7295488ejc.614.1649237481267; Wed, 06
 Apr 2022 02:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
In-Reply-To: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 6 Apr 2022 17:31:10 +0800
Message-ID: <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
Subject: Re: rcu_sched self-detected stall on CPU
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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
Cc: rcu <rcu@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

I can reproduce it in a ppc virtual cloud server provided by Oregon
State University.  Following is what I do:
1) curl -l https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-5.18-rc1.tar.gz
-o linux-5.18-rc1.tar.gz
2) tar zxf linux-5.18-rc1.tar.gz
3) cp config linux-5.18-rc1/.config
4) cd linux-5.18-rc1
5) make vmlinux -j 8
6) qemu-system-ppc64 -kernel vmlinux -nographic -vga none -no-reboot
-smp 2 (QEMU 4.2.1)
7) after 12 rounds, the bug got reproduced:
(http://154.223.142.244/logs/20220406/qemu.log.txt)

Cheers ;-)
Zhouyi

On Wed, Apr 6, 2022 at 3:47 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi PPC/RCU,
>
> While merging v5.18-rc1 changes I noticed our CI PPC runs broke. I
> reproduced the problem in v5.18-rc1 as well as next-20220405, under
> both QEMU 4.2.1 and 6.1.0, with `-smp 2`; but I cannot reproduce it in
> v5.17 from a few tries.
>
> Sadly, the problem is not deterministic although it is not too hard to
> reproduce (1 out of 5?). Please see attached config and QEMU output.
>
> Cheers,
> Miguel
