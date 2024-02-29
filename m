Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9251B86BFA9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 04:54:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fq1Z1FjH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlcls19Bkz3vX1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 14:54:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fq1Z1FjH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlckb1nt7z3dHK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 14:52:55 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7c78573f294so29823139f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 19:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709178772; x=1709783572; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GE8HlfcNsFFEiu7txF0WkDnaFjS/axbXg3f2FUFn/bg=;
        b=Fq1Z1FjHLYaAFUG7Clbybb7PgSNzZfL6ezs2ykKQO/9uok4wh0H9Wqo0P7k/EM1E6v
         sBpTFYDdiEtsD56dRLGeGZPpLaW3pqhf/7Zhf6nlS9R5YL++SG1/wl4NeCRjbl6kouwh
         n6TRXYgyTkU3Vn0ACx7s6ZdOoXOojhdzXBHuvA+YCIG8dw0HHLRRLPeXfEKADYyENRcU
         FQ4NT76Yy/eruBnMPOuCxGaZXax3seQ8muirpafHtsaX5bYdhitF0YdZ3lChvASDDx30
         +UOtkj0ADZaL68Jq3KEu2lfAppN07DV52caO6pfYJea1YbJWVzYY1A9imaBr93shk6pL
         pyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709178772; x=1709783572;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GE8HlfcNsFFEiu7txF0WkDnaFjS/axbXg3f2FUFn/bg=;
        b=nx6/ehHmAXpJIin+IDxqM2xaU7F7SMC2tUBC2Fj6t0dPY0/viymoZO0Hj8lMouY7bh
         C3OpD1IyNljDAjglKjBApFiQHOGWh+l0Y2+mw5fmgx0u43cp/unGPr9bgw7qnLHTFcVE
         fOz095g3e9LL53HvLad/jeFGxr16X2lSB5uGN0zJUl2hLSwegmVjcSPg9RbPaaqg1Cm2
         bZoSH9hHL/SQtO1dkI8X/Hl8lOb8/6j7XRPKoixeqHV+TmtRCVaqYQ67t3qOByvLlQhi
         ClojN4JmKV45SYB1NqkTKrpfi5OyZZ6PHR1cXDhiQe/OaAiOPSH1rKlwwkufpQu4ZVpK
         qVGA==
X-Forwarded-Encrypted: i=1; AJvYcCWm6GOoIP3hFYo/ZetdzQ95SXebxdVmyHj1vaBjPRfbEVB017uTg23uHSUdyEuO704vi87oqGXoqWobsbF+JJS1wN1RXEnkcJyEyP1xgg==
X-Gm-Message-State: AOJu0Yy5kYji1GyBwrTojei8GSVN2oGN3jkZL/FdlEXrMFW6sYtkP7Oy
	F4OvDxSjE8hov06CI8u3cm0Jr9Xq9HgW9J7T8WF8Zsp+prkdZ3qL
X-Google-Smtp-Source: AGHT+IF2sCHOGIDu81WosmY/mHd2F1QEFCJeLxZ9sG77D1aTATrp5oOMhRYDapBFD1jxZ9C3lI9ZfQ==
X-Received: by 2002:a92:c684:0:b0:365:1dd9:ee6b with SMTP id o4-20020a92c684000000b003651dd9ee6bmr1394815ilg.25.1709178772085;
        Wed, 28 Feb 2024 19:52:52 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id g5-20020a170902c38500b001dc78455383sm236299plg.223.2024.02.28.19.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 19:52:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Feb 2024 13:52:46 +1000
Message-Id: <CZH9B1R365G4.2Z2OICA7Z7OY9@wheely>
Subject: Re: [kvm-unit-tests PATCH 09/32] scripts: allow machine option to
 be specified in unittests.cfg
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Jones" <andrew.jones@linux.dev>
X-Mailer: aerc 0.15.2
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-10-npiggin@gmail.com>
 <20240228-386d106a6ef0bc0430edad1a@orel>
In-Reply-To: <20240228-386d106a6ef0bc0430edad1a@orel>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Feb 28, 2024 at 9:47 PM AEST, Andrew Jones wrote:
> On Mon, Feb 26, 2024 at 08:11:55PM +1000, Nicholas Piggin wrote:
> > This allows different machines with different requirements to be
> > supported by run_tests.sh, similarly to how different accelerators
> > are handled.
> >=20
> > Acked-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  scripts/common.bash  |  8 ++++++--
> >  scripts/runtime.bash | 16 ++++++++++++----
> >  2 files changed, 18 insertions(+), 6 deletions(-)
>
> Please also update the unittests.cfg documentation.

Yeah good catch, I will do.

> Currently that
> documentation lives in the header of each unittests.cfg file, but
> we could maybe change each file to have a single line which points
> at a single document.

I'll take a look and do something if it's simple enough,
otherwise I'll just update the unittests.cfg.

Thanks,
Nick
