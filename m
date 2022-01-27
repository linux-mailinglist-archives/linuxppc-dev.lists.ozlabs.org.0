Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F84849E4EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 15:45:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl3Kz2Zw4z3cNP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 01:45:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SvBC8I6x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d35;
 helo=mail-io1-xd35.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SvBC8I6x; dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl3K35vq7z3bY4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 01:44:54 +1100 (AEDT)
Received: by mail-io1-xd35.google.com with SMTP id n17so3827085iod.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 06:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QmOVvHbNHo07Hdnh4i7Uqf4FrJ31JeDl4rLZwaJlkBs=;
 b=SvBC8I6xHJIt0BEuqxLiAD41TmiAo5pfVD3zEaL3tzWyxIE/eMIZYTirmoOeqr9j7P
 bxPgwWE/e0MDvH8Jh/Qh/6SxubnSmcavWYGQZPbsihEqLguoG2UVF9/FlR2oE1Ogp7ZY
 rRLwfwFEcL/YhTvS8f8hTnObZ2gGefxzARn6Kic+VvVTvAA9QPFgsB/dS0g/Ncn4yTXt
 ziuc3TprHqZW21DAZMNxy4u1RW+kbq/fggHxnOw8PfEzxy5CYVTAJCibLR3nXPV6OogL
 5rMUt2kFjQDxh4VTof3G5HtKJkQEPg7DHvqKSxzMWzQ4Zi4PyvxGIu+gQ3rLwy3iSnKA
 1XVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QmOVvHbNHo07Hdnh4i7Uqf4FrJ31JeDl4rLZwaJlkBs=;
 b=DvCD+F9seOtT44LXOdTgzYhlFNNdJ4BaOSjo+VXZyGonIcmUo/avc41x2Yiw3G6jzx
 2BVxeBd27b7tQrWa5detY9P0BOkknaCMEWHbYedoAXaY1aO1uVNscK1S/gE6M4Kb3KqS
 8Y85MuLNGq0CVli+CfGsV/Os4YaNXkWBlUar2/OKcHTKWOx7XzetnXV+maD/I78DtbuW
 sw565jq9GbMvMOby+dIGIiNRNwJB9ChV8T3CXze0znsH89L7+VGUzQrWTesnPVFCwmZX
 GoyudoON8mS2Sg7FXb8eUPt9v+olj3EMgQ1ixcbYTrnj8wGc0O8kN433nYe5w1fGjkL9
 MkOw==
X-Gm-Message-State: AOAM533dU4oQGwtAj7Z/zIJTtXyBOQ6rukMOnomWSvSIrf5gd1kdkWJB
 v9B6aq2wqPZ7iXikRujsh0bxhu3tM5DbTMTCooI=
X-Google-Smtp-Source: ABdhPJyVHLOwW6nUCnVsw0VH8sqxmGwHxSc7t8ZZ0NdIOJIyUhVbx3utRR1PQ7fVDgnXrcoNCoTORt+c3DxoR2va37U=
X-Received: by 2002:a05:6638:4105:: with SMTP id
 ay5mr1091653jab.186.1643294692466; 
 Thu, 27 Jan 2022 06:44:52 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72n_FmDx=r-o9J8gYc6LpwRL5EGmhM6Xzwv27Xc7h1TNDw@mail.gmail.com>
 <cf6ac499-4190-cbe5-255c-f9edf07a4786@kaod.org>
 <CANiq72mV3AzmBDVJM+tQriEoDu_9LFBrK_vR6GC4qEmLw0UepQ@mail.gmail.com>
 <1643269597.wkij0f82dr.astroid@bobo.none>
In-Reply-To: <1643269597.wkij0f82dr.astroid@bobo.none>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 27 Jan 2022 15:44:41 +0100
Message-ID: <CANiq72kDhNCZXVW+yN8JM4ydRO8pnxm9yHH8+yTJ9H1uGoW81A@mail.gmail.com>
Subject: Re: ppc: hard lockup / hang in v5.17-rc1 under QEMU
To: Nicholas Piggin <npiggin@gmail.com>
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
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nicholas,

On Thu, Jan 27, 2022 at 8:47 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> That sounds like my fault actually.
>
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-January/239178.html

Thanks for the reference & fix! I confirm it works in our CI too.

Closing the QEMU issue then.

Cheers,
Miguel
