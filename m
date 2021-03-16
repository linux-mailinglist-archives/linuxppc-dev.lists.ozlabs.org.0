Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC2B33CB89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 03:37:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzyBR5FBRz30GF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 13:37:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oOlXhQYm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oOlXhQYm; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzyB10SJnz2y8J
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 13:37:26 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id r16so6499991pfh.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 19:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=6lp695PcIQjxnB74Ga/9wMdAdKUKeJasCm+kHxvArMg=;
 b=oOlXhQYmb9PiL9bzrWsBzOuEN5/wk8+5lqS0QVBhgXiXuqoXC5mfSca7aa+X/X2Pxi
 q7C7UfeQeMU9bUQ3cm5VWi5Uro3OyCGRm/ZtYg1GSstgysIVzbe9QWp4DF5Fgelk9HzS
 EhxQdxaLG6s/f+FYSFIGzcCDrfHCda4Bl/PXkIvmVO970q+IA+jq4QoNmV2/s9KTTIfD
 IHX6x2jZ91aVxsgI/I2vk9yGPl6qgaErL+u3gbOaOSVThVou5/wdM636GDZ1B0oVxglA
 JDBOsJ6koyT581Jl10QvYxaei17yhj98hyXDXrN4PJjgI2jz0xVSfqOjyGzaWFIrXBPS
 VveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=6lp695PcIQjxnB74Ga/9wMdAdKUKeJasCm+kHxvArMg=;
 b=sYxGu2XuLKZqN0e4Qjo2KWvDX46UfCQ93MOqqiqEJqQlSoINqb6iz3lGfZz7vaOnPN
 D5BXVc1w5oGF6NMvggQ0sD22bD7aTDKX+UUAsbBPiKSaWpxWodqkDodC3zfdd1yYTx/z
 JzIjd95wH61qHrCjKA7aIBMA/ywfnAYjKHs/b6vmT15ZrAu3Jz5y00m4WzTK7iC6vAb2
 OeYhOMi89ExYtKz6aFb3e1+vSpiCVrCtwx2kkDY9KNiGKOUFXEGv+xFXoTkAjrp4B9Ud
 9bFIq7FVUkny9zvfWsVu7br68iRfgNqq4bI/ZEx3JeTKwZZkV+4XrRmGEPYuaQxFpZz0
 lVow==
X-Gm-Message-State: AOAM5338DigRSseY148oGWpW2qO/rxerFPj0UKPy9FVLB065RJestMTz
 28mrgEfC+GcU4WtMRLDHqzPIR/dCaCY=
X-Google-Smtp-Source: ABdhPJwnQJgS9BcJ9ll+cpL3FkCCvpsu5ET/TzB/g43FYSegZz8H7L9XK4I2+1iTwQN8yX9WbkBb+w==
X-Received: by 2002:a65:62cc:: with SMTP id m12mr1834288pgv.427.1615862241342; 
 Mon, 15 Mar 2021 19:37:21 -0700 (PDT)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id r2sm14047813pgv.50.2021.03.15.19.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 19:37:20 -0700 (PDT)
Date: Tue, 16 Mar 2021 12:37:15 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/2] handle premature return from H_JOIN in pseries
 mobility code
To: linuxppc-dev@lists.ozlabs.org, Nathan Lynch <nathanl@linux.ibm.com>
References: <20210315080045.460331-1-nathanl@linux.ibm.com>
In-Reply-To: <20210315080045.460331-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1615861985.myhwki4p5y.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: brking@linux.ibm.com, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nathan Lynch's message of March 15, 2021 6:00 pm:
> pseries VMs in shared processor mode are susceptible to failed
> migrations becasue stray H_PRODs from the paravirt spinlock
> implementation can bump threads out of joining state before the
> suspend has occurred. Fix this by adding a small amount of shared
> state and ordering accesses to it with respect to H_PROD and H_JOIN.

Oh, tricky problem. Nice work on finding and fixing it.

The patches seem okay to me.

Thanks,
Nick
