Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6A63954EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 07:11:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ftk0V0ctFz309F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 15:11:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oq5k9ewN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oq5k9ewN; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ftk0171J7z2xfw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 15:10:56 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id y15so4183879pfl.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 May 2021 22:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:mime-version:message-id
 :content-transfer-encoding;
 bh=PAK5QRH91z+SCdu4kLR38Pqrk3fpvtvISw5Hj9SsWJ0=;
 b=oq5k9ewNsSUbHLRvZgMCB+vJKXOo0oXERnKNr+wVWFftSTq8LTCXHOTWDipsVmWnIt
 nWnXly+209ocRsLTcyoVnZXQk0ZX+/6PUNjduWxXJpVjHLLi2qYSFVKRvP3WaaP+1Sq+
 LfdrebX73vtOfHUV4J3Fry7uaf1h5ETPYk9pzJnXNctF9id7MFkjx/waLPkIt/s+g0un
 C4OmHrzbpMXm2z8V65PXbLQg/hPiRRgKdODp1xd/3KI8xKhDwLZgkEMIHcNOf847APgM
 +hLzE1EGJryc4dfCpmMSheoEChbq2nbnjKnw0Od7Xg4Ovh/degUUQIFanGSSnKeRj5mM
 84yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:mime-version:message-id
 :content-transfer-encoding;
 bh=PAK5QRH91z+SCdu4kLR38Pqrk3fpvtvISw5Hj9SsWJ0=;
 b=g9uyK+PLn2HgbBaH3z428jocdiu48CKMy9b8mQzrf2Fb4Pl29Z8dZMjFElHT93CGfR
 NB/L86cJQrtd1/GqucD9sT4RmGmpZyDuY9t6F+Dvnt54wsA/I69qCJjg8Zwi4Gh4GvAd
 4hTyDKIt0m9584fvODB9RV5d2RgqCXrZ4NA4D1PH3CPGzuO8uTDwwVtra8oCDzs0gRz9
 OId2uWe9M2VKXY0nqanb04Zd3jrCZ6Hjd3JjCdYrVGaXVJYDEVU+Spy3BHo89ZrqCf0y
 Y+KYcGSUp+neQFbd4BXFlrsEqHyhUMWvVhlfW7ab3hjI77UwDnUkeWpU6sjV71CJiR1a
 MYkw==
X-Gm-Message-State: AOAM532Pjv14PznVyUts36pP5LDhyQ218R6j6WHjOjshtHMlxLeLZCH6
 E9Z9OxiJ5M5LbFKMWs/2OC0=
X-Google-Smtp-Source: ABdhPJz3WLaprqRlHSivGpGW7g2Df2bvrcm2q37q1FVoPodDrTe+qx4E6ODXFXRoA7m9Q12agbMvMQ==
X-Received: by 2002:a62:6458:0:b029:2e9:c637:975c with SMTP id
 y85-20020a6264580000b02902e9c637975cmr5674084pfb.53.1622437853234; 
 Sun, 30 May 2021 22:10:53 -0700 (PDT)
Received: from localhost (60-241-69-122.static.tpgi.com.au. [60.241.69.122])
 by smtp.gmail.com with ESMTPSA id h76sm10688227pfe.161.2021.05.30.22.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 22:10:52 -0700 (PDT)
Date: Mon, 31 May 2021 15:10:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: KVM P9 optimisation series
To: kvm-ppc@vger.kernel.org
MIME-Version: 1.0
Message-Id: <1622436567.2f2wupw6c6.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I have put my current series here

https://github.com/npiggin/linux/tree/kvm-in-c-new

It contains existing Cify series plus about 50 patches, it's getting=20
fairly stable with both L0 and L1 hypervisors. The aim of the series
is to speed up the P9 entry/exit code and also simplify things where
possible.

It does this in several main ways:

- Rearrange code to optimise SPR accesses. Mainly, avoid scoreboard
  stalls.

- Test SPR values to avoid mtSPRs where possible. mtSPRs are expensive.

- Reduce mftb. mftb is expensive.

- Demand fault certain facilities to avoid saving and/or restoring them
  (at the cost of fault when they are used, but this is mitigated over
  a number of entries, like the facilities when context switching=20
  processes). PM, TM, and EBB so far.

- Defer some sequences that are made just in case a guest is interrupted
  in the middle of a critical section to the case where the guest is
  scheduled on a different CPU, rather than every time (at the cost of
  an extra IPI in this case). Namely the tlbsync sequence for radix with
  GTSE, which is very expensive.

- Reduce barriers, atomics, start shedding some of vcore complexity to
  reduce path length, locking, etc.

So far this speeds up the full entry/exit cycle (measured by guest=20
spinning in 'sc 1' to cause exits, with a host hack make it exit rather
than SIGILL), by about 2x on P9 and more on a P10.

There is some more that can be done (xive optimisation, more complexity
reduction, removing another mftb) but there are not many easy gains left
here. The big thing which is not yet addressed is a light weight exit
that does not switch all context each time. That will take a bit more
design to get working really well, so I prefer to do that over a longer
period perhaps with the help of some realistic workloads. It's very
simple to hack something up to work fast with a few TCE or HPT hcalls
for example, but really we may prefer on balance to do something which
is slightly slower for those but works for other host interrupts like=20
timers, device irqs, IPIs, partition scope page faults, etc.

I will submit this after the first Cify series is accepted into the
powerpc/kvm tree.

Thanks,
Nick
