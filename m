Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F185E9116
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Sep 2022 07:06:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZv4r5wk7z3cfk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Sep 2022 15:06:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jv4KKGWk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=dmitry.torokhov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jv4KKGWk;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MZv4C2Kg5z30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 15:06:17 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so9513384pja.5
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 22:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date;
        bh=+hF2iRaC8IwIsQwNG2CBaYdzZGOTAXTx4/lHRlsiuzc=;
        b=jv4KKGWkKkIq512ndX4nKTtjG4XrjJbLxVL06117qJ+I0Xm9IvyOF33yFL2yCMkT5w
         Fxr73rJYZ0yGupKFvbOCuSWXRglw34svpFSj2ZR+NTD98r9R2nKyZ7OV/byUgNDMPuWA
         n12xWQ/oGyITJ7XxydUu7bqbaRuSJTcP1zo0ZtIYbEELTEu8an9bP9pk5l0ruU5P7m/j
         q+kH5idzaF/sDR8LlHZEaWwn2WXjs8ccZNKNxEQhq2+zYivfMcj3Hej1tX51/en6ACMc
         xgNG28EX/v7hw1mWSB2esMYmJU9Z0pbSh2/+3Bi91HKJblrgtCYqGKXXwQDHxy2d4+9t
         A6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+hF2iRaC8IwIsQwNG2CBaYdzZGOTAXTx4/lHRlsiuzc=;
        b=2cd381qWyORLfFdS7hokx4/9jEr1wPBrILD2gRdePnjV586Qft1vPQvNfmR1MHFejE
         B/Aic07Ya/9QHMgPvFhMamMUVCxyZxDKnFZoVyPPnlbVARKtvMK25Mo0JT2VS8dgBev1
         drmzUCAryqyR7Bt4YevCCA2HPx45m3knu26sDMLigLepFPnXa+S0y4Imuw/enwE1tQMk
         GeSq+UQo+hjVo/almH4sQ5n5EiFGkXkeraTuqYFrVkbsioAegCKfu7pfZt8SvhOBtn0A
         7hicoPLeOQKy45Mtk5QQ2OU7xGphNIz2i+kHuZgEmoyY9U1hONU1TKlK62Vr24uvNPN4
         fEcA==
X-Gm-Message-State: ACrzQf3Yo26SbHMQ6hlBWWJlg0QYK+QXn1p65lCHiXcJYXTyOaCqeBsT
	K1Qt4rcEQcBi7BmpbrSELlk=
X-Google-Smtp-Source: AMsMyM66KSNWmGU9MaV1h6icVVQeJXcHFgyUNZUjSSQXwQRU5yNzpVeQLbsx3vXKtyM388kCZLUbsg==
X-Received: by 2002:a17:903:2443:b0:178:221d:c599 with SMTP id l3-20020a170903244300b00178221dc599mr16471698pls.100.1664082370927;
        Sat, 24 Sep 2022 22:06:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:37c:3916:9a45:14cc])
        by smtp.gmail.com with ESMTPSA id 7-20020a621507000000b0053e80515df8sm9167942pfv.202.2022.09.24.22.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 22:06:10 -0700 (PDT)
Date: Sat, 24 Sep 2022 22:06:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Is PPC 44x PIKA Warp board still relevant?
Message-ID: <Yy/hv2fOLzdWOuvT@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael, Nick,

I was wondering if PIKA Warp board still relevant. The reason for my
question is that I am interested in dropping legacy gpio APIs,
especially OF-specific ones, in favor of newer gpiod APIs, and
arch/powerpc/platforms/44x/warp.c is one of few users of it.

The code in question is supposed to turn off green led and flash red led
in case of overheating, and is doing so by directly accessing GPIOs
owned by led-gpio driver without requesting/allocating them. This is not
really supported with gpiod API, and is not a good practice in general.
Before I spend much time trying to implement a replacement without
access to the hardware, I wonder if this board is in use at all, and if
it is how important is the feature of flashing red led on critical
temperature shutdown?

Thanks.

-- 
Dmitry
