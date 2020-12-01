Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B42CA80C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 17:19:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClnNL0N56zDqtR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 03:18:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=pOQ4NjzP; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClnKk6LJdzDqml
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 03:16:41 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id h7so915611pjk.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 08:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=keKgMbCkoGOXeTFvWr8odCNv42gYD1NHpH65Gpi3cCA=;
 b=pOQ4NjzPVp6iisrE9P9gGQG6wNSldY4e18fm6iUbeVrUS7EJ37dp6TsrrKURZ/aNde
 ry5rJrSim0HZoWiOXMWIRmBirNoa7cEORhW5l6j4dxpbpUJT/lQTnPtzP68AnJGbBJU9
 kFxi3hT3dbZM32tJteH0PEpmZ3owWh7NtAIf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=keKgMbCkoGOXeTFvWr8odCNv42gYD1NHpH65Gpi3cCA=;
 b=E6zIMpfavO+6YsRdVTIF+J0bacGxxYvXnj4kOA8TVNJkdAEdnAvgzyRpSZdThDUp6T
 +lBoswXUK2ikIRjBCf234/rSPu9DdlnTxqUUoDqV0YGNDT+E6BcLvOdDPdCIoxoSn57V
 rKaxkclvp9zuVWbOUp92rrNZQQoY/E28TSy/dCoKlwt1NsaGZSmYif2MP1hPXBG1zOil
 Rewbg7FWR3jpDygvDg21bZLApOubDyrCzE6jPmw6F304+JzWTxLLNshp6YT+s78/lBpx
 0R8sSLcaSyM/roHVItwcLwGKOUnLs8haL2faFKcR/EfGufc6OuXiiYu+QUcDlZreYyae
 NIwg==
X-Gm-Message-State: AOAM531jLGKOLcomSDgoE3hhUD6OCWVaBP0q1oM+/Kw1SyYgNHr5oAPT
 Mjdrgp3xubcBiXGmIgMicFSpow==
X-Google-Smtp-Source: ABdhPJw8p/fYmmJr1JIB/2o9aL9RGNVV5xtAOwCWgAXwUflXsCj28scQTc16C3z6SmRwv4gaC0Apuw==
X-Received: by 2002:a17:90b:a14:: with SMTP id
 gg20mr3560478pjb.46.1606839397634; 
 Tue, 01 Dec 2020 08:16:37 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-f932-2db6-916f-25e2.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:f932:2db6:916f:25e2])
 by smtp.gmail.com with ESMTPSA id r11sm82914pgn.26.2020.12.01.08.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 08:16:37 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v9 0/6] KASAN for powerpc64 radix
Date: Wed,  2 Dec 2020 03:16:26 +1100
Message-Id: <20201201161632.1234753-1-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building on the work of Christophe, Aneesh and Balbir, I've ported
KASAN to 64-bit Book3S kernels running on the Radix MMU.

This is a significant reworking of the previous versions. Instead of
the previous approach which supported inline instrumentation, this
series provides only outline instrumentation.

To get around the problem of accessing the shadow region inside code we run
with translations off (in 'real mode'), we we restrict checking to when
translations are enabled. This is done via a new hook in the kasan core and
by excluding larger quantites of arch code from instrumentation. The upside
is that we no longer require that you be able to specify the amount of
physically contiguous memory on the system at compile time. Hopefully this
is a better trade-off. More details in patch 6.

kexec works. Both 64k and 4k pages work. Running as a KVM host works, but
nothing in arch/powerpc/kvm is instrumented. It's also potentially a bit
fragile - if any real mode code paths call out to instrumented code, things
will go boom.

There are 4 failing KUnit tests:

kasan_stack_oob, kasan_alloca_oob_left & kasan_alloca_oob_right - these are
due to not supporting inline instrumentation.

kasan_global_oob - gcc puts the ASAN init code in a section called
'.init_array'. Powerpc64 module loading code goes through and _renames_ any
section beginning with '.init' to begin with '_init' in order to avoid some
complexities around our 24-bit indirect jumps. This means it renames
'.init_array' to '_init_array', and the generic module loading code then
fails to recognise the section as a constructor and thus doesn't run
it. This hack dates back to 2003 and so I'm not going to try to unpick it
in this series. (I suspect this may have previously worked if the code
ended up in .ctors rather than .init_array but I don't keep my old binaries
around so I have no real way of checking.)


Daniel Axtens (6):
  kasan: allow an architecture to disable inline instrumentation
  kasan: allow architectures to provide an outline readiness check
  kasan: define and use MAX_PTRS_PER_* for early shadow tables
  kasan: Document support on 32-bit powerpc
  powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
  powerpc: Book3S 64-bit outline-only KASAN support


