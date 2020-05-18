Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4F11D81C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 19:51:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qmlh24KHzDqgM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 03:51:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e31;
 helo=mail-vs1-xe31.google.com; envelope-from=rsalvaterra@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pECidUdY; dkim-atps=neutral
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QmhV0GVbzDqdR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 03:48:23 +1000 (AEST)
Received: by mail-vs1-xe31.google.com with SMTP id u7so2877621vsp.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 10:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OGLFUpy4GR0QmrhBtWirazQG0wKOr4eZBgB0OmwSs00=;
 b=pECidUdYMkYE1k6ZySvpHtxMo+iLtbLma8E/lJNyne2dfZZx4dsCeGW+0bgwffOPVT
 NTOF8KEQr5z8QnCHGOIdE+nTaX5Q9xlnnM4+VOZf2kZc/bFfx5dsWk6wmnbmEI9OiGSu
 dEPH2ETLf1WIv4iXlIaI1AgUoGB9uTDiOy5OB7yKM9MnFw7CbXbX2cC9DViK0Kxr43rX
 fQLJKFAZDDZbPWk83nkqp1Csq8Gndzr1S30EFlS9udHCu4qkBnToQ/iJqGyccusb0ABs
 bfMyfnKAVlWjcCFgqqQkCHuzrpnOhGg0JAFLr8/wWi6Nhpd/WPcEAyy+LWsDXLqKX8L0
 zIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OGLFUpy4GR0QmrhBtWirazQG0wKOr4eZBgB0OmwSs00=;
 b=UMGVX3jeNj84yk4uP/Rky1XK2CdeDTTSA1X6kH8FIOHq1u2JRgPEE4IMKKroweuDCi
 ZNAGtfEqCv01u36wvuutQe6g6tlJ43T0hGMgaTJUHem13Qe++npcxwPtqphBYRrVgGrR
 /kZ/e5hwaRx23GpnpxHnAn16EG1dvV47nTIu5Xqj597Qu83X9Iw9YIV15KwOqf2XDs9J
 W3yjFTcEo4BGImxhLC6qIOnyG3yolcowslyYXyS0fP7hP9bHCH2bv0T7Q3CgS0oRDphP
 S3aMR8IJiMQirFcgWyoQOnjTCOR5Pz9dkfuDIVCn7JqxefSYO7EWYgGzkvPJ3BVkB7Po
 yZKw==
X-Gm-Message-State: AOAM533UQwQRLaKidT+GbDlxPx8BxPhPeENgqQmRL/9wmcW/At7kEp4B
 fpXnoBBrI99//a/6ZSQerkuDhxF6a7xGvvRBhw==
X-Google-Smtp-Source: ABdhPJy8g78e5k18ovX82HMR+uiFP1qbEqZOMCjgKb2/PAt6LHyFEyQ+nHwAj2q/hvz/bIxNkCz2refhcMQp7YOPk7A=
X-Received: by 2002:a67:8d0a:: with SMTP id p10mr12899329vsd.45.1589824099335; 
 Mon, 18 May 2020 10:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <CALjTZvZ69v3Z=8MY28F+p8v8_Z5e+7NrH0PAJ7TGD9kh6Ab7bw@mail.gmail.com>
 <3729805f-2638-6f0e-55fa-bd7d5c173899@csgroup.eu>
 <CALjTZvZ0gjZOpx7GuJ4ccawqpyOjr4N_C7UCQQHrrFR1Ojrh4g@mail.gmail.com>
 <d4f02b20-8b3e-fd88-6857-c2e4dc7786da@csgroup.eu>
 <CALjTZvZ1NyVOhX+qJZSqO_8shn9yD76DBBg0t9UeFUyzom=PBw@mail.gmail.com>
 <c00ed41c-e13e-6bd6-4084-501ca14adb4c@csgroup.eu>
In-Reply-To: <c00ed41c-e13e-6bd6-4084-501ca14adb4c@csgroup.eu>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Mon, 18 May 2020 18:48:08 +0100
Message-ID: <CALjTZvaANOK4dDv0-0GruiPOa3Rcy9=1=Xs9K=Z4_er8B34P+w@mail.gmail.com>
Subject: Re: [Regression 5.7-rc1] Random hangs on 32-bit PowerPC (PowerBook6,
 7)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: debian-powerpc@lists.debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 18 May 2020 at 18:15, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Yeah I discovered recently that the way swap is implemented on powerpc
> expects RW and other important bits not be one of the 3 least
> significant bits (see __pte_to_swp_entry() )

I see, you get the swap entry by shifting the PTE right three bits.

> I guess the easiest for the time being is to revert the commit with a
> proper explanation of the issue, then one day we'll modify the way
> powerpc manages swap.

I wonder, what issues could be observable by reverting? I'm asking
this because I've seen another hang on Linux 5.6, but it's harder to
trigger and it involves the GPU (I usually reproduce it easily by,
say, running Arctic Fox and starting a simple OpenGL game like
Chromium BSU). Of course, since this is PowerPC with AGP (even though
I have the AGP GART disabled), it's most likely something unrelated.
