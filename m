Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7978615A0D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 06:49:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HTHZ0lCTzDqNw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 16:49:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=c4McV3RO; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HTF14mgQzDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 16:47:33 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id i6so674919pfc.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 21:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6HBUqCa4lDkvWVMth98gkOfMDQFMmsNejhaPRJd9h6k=;
 b=c4McV3ROy7K7TcNJZ6glqfJoozIqu3Imhuvwv+E6LR3U+3mruX/liResbEQ0Rlql4u
 VWt/THID8qk44T1vtXxAeK9ZFTX//XLXm6d7Cp9EITy49LHRunvA8LWxXvjSCzqFbF4d
 FtmE8q1jB13au00SutLTdNFEIpG6jEAQqbEF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6HBUqCa4lDkvWVMth98gkOfMDQFMmsNejhaPRJd9h6k=;
 b=OTKmMym1S+JO1lYDyWnaguYvE19eU1r03+Z2YZcKaZKQsPMafjGC9ULJbmk1rItd3A
 AMQNhqEG2lImx0gdrkQs0N36FDmfygJxND3Y6PD+4kFaTRjS4jjSZ7J8mN85sFpo4Vcp
 YI0Z8IkvKqXgrmbZSgBBZRskogLrTACLPJ7YTh9vlbopzIqHP3CW2NkmNiweSvyNE0p1
 EHPQnF/RU5Cxp956d/j5q3K9VP967PndXlCz9VO1wFYddnoo5xB0HafusIdnKcI+U8b4
 ZVJ4LrazfIuDpvFYDxdoQjwS8eUItYpgNZ/6V0Vmv3auA5Sev7G83MBMVSvCpwHZv5QT
 xG6Q==
X-Gm-Message-State: APjAAAXshKPtl2U9zQTKdPATsq3l0bDAeJtxcoUiPgmEfvUqORYG7Ag/
 a00DWAiRMBgcckQ2Mg1Jaqoypw==
X-Google-Smtp-Source: APXvYqw/DN/0FTA1ZksYApAufAix2IStZs/anNdGfJUJ6f2vgfIGbcrigIYK8wZ/9ZVCpNCvP/aFbg==
X-Received: by 2002:a63:5826:: with SMTP id m38mr10924864pgb.191.1581486449779; 
 Tue, 11 Feb 2020 21:47:29 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-65dc-9b98-63a7-c7a4.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:65dc:9b98:63a7:c7a4])
 by smtp.gmail.com with ESMTPSA id l69sm5969652pgd.1.2020.02.11.21.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 21:47:28 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v6 0/4] KASAN for powerpc64 radix
Date: Wed, 12 Feb 2020 16:47:20 +1100
Message-Id: <20200212054724.7708-1-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
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

This provides full inline instrumentation on radix, but does require
that you be able to specify the amount of physically contiguous memory
on the system at compile time. More details in patch 4.

v6: Rebase on the latest changes in powerpc/merge. Minor tweaks
      to the documentation. Small tweaks to the header to work
      with the kasan_late_init() function that Christophe added
      for 32-bit kasan-vmalloc support.
    No functional change.

v5: ptdump support. More cleanups, tweaks and fixes, thanks
    Christophe. Details in patch 4.

    I have seen another stack walk splat, but I don't think it's
    related to the patch set, I think there's a bug somewhere else,
    probably in stack frame manipulation in the kernel or (more
    unlikely) in the compiler.

v4: More cleanups, split renaming out, clarify bits and bobs.
    Drop the stack walk disablement, that isn't needed. No other
    functional change.

v3: Reduce the overly ambitious scope of the MAX_PTRS change.
    Document more things, including around why some of the
    restrictions apply.
    Clean up the code more, thanks Christophe.

v2: The big change is the introduction of tree-wide(ish)
    MAX_PTRS_PER_{PTE,PMD,PUD} macros in preference to the previous
    approach, which was for the arch to override the page table array
    definitions with their own. (And I squashed the annoying
    intermittent crash!)

    Apart from that there's just a lot of cleanup. Christophe, I've
    addressed most of what you asked for and I will reply to your v1
    emails to clarify what remains unchanged.

