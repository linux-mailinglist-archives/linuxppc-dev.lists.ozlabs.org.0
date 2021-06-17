Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEA93AAC97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 08:40:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5C9f0JHlz3c74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 16:40:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=ZvI05WcG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=ZvI05WcG; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5C974q4Sz2yYC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 16:40:09 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id h16so3201970pjv.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 23:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z5tXXD3iVvEIVZ0tTMhEKfG6zykuiGGLtMWYWjRDWYs=;
 b=ZvI05WcGmnfe5oUfXHNoGdM/4PM/h3nxOJp96Y+tFn5U15FBFxeWkFmjh3oZf1EL8A
 ADkJUTvU+y/ObXXNwK0vGCrvjU1eU92ZHL7pmy1vKZFrzb+YG+Yqm32icH5OIHbXYy2p
 a2oGBtVpOoRVNRRYQe6ovJIHlhAuYmObTEb5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z5tXXD3iVvEIVZ0tTMhEKfG6zykuiGGLtMWYWjRDWYs=;
 b=GIQXTZ45oLl3pPV2vyZ7fMRedMeda/z+P9FAPg1al2/F9dJ9APbWmecTzIeagrl3Ve
 7REQYjfedIrBdgEhglYKtxmpIMZDQtvD4QyotE3zfop9NgYWRPDr2WIwuaDYWkWPYCxQ
 LzjDrZjm/8zHZj9aLgYzIgyFzsJAxzildMdqaoCCzu6wo1A7ZN80gzgy2v7bqTtJ47gQ
 x1k26UbMG5X75ffMjezVsQZEeQAnYIlV9TzogtTSi4G72ZykPQmN8VyCusTqMuFrxMta
 Ezndf4xYufBMMjwzYyQ8Pmx1k8/h+yU7M0lt5D7A+hs4bSXKLqnHM72A3ooiahcgI7M1
 oowg==
X-Gm-Message-State: AOAM5336ITtS24av1nzfHn0AO9U7491leQX65hnfw+V6zMgkK3qw5A0P
 A27gtpC4ZlIqa8rqmFAtWi0OLA==
X-Google-Smtp-Source: ABdhPJzXBEGC2svL4/w6uQzTlhwr8EKMXDJngko+LKuujG1Wr3mcyI7qAM8QXo2oeD3ihoXSYQO+3A==
X-Received: by 2002:a17:90a:f193:: with SMTP id
 bv19mr15312947pjb.86.1623912003744; 
 Wed, 16 Jun 2021 23:40:03 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id b1sm4112148pgb.91.2021.06.16.23.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 23:40:03 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, elver@google.com, akpm@linux-foundation.org,
 andreyknvl@gmail.com
Subject: [PATCH v14 0/4] KASAN core changes for ppc64 radix KASAN
Date: Thu, 17 Jun 2021 16:39:52 +1000
Message-Id: <20210617063956.94061-1-dja@axtens.net>
X-Mailer: git-send-email 2.30.2
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building on the work of Christophe, Aneesh and Balbir, I've ported
KASAN to 64-bit Book3S kernels running on the Radix MMU. I've been
trying this for a while, but we keep having collisions between the
kasan code in the mm tree and the code I want to put in to the ppc
tree.

This series just contains the kasan core changes that we need. These
can go in via the mm tree. I will then propose the powerpc changes for
a later cycle. (The most recent RFC for the powerpc changes is in the
v12 series at
https://lore.kernel.org/linux-mm/20210615014705.2234866-1-dja@axtens.net/
)

v14 applies to next-20210611. There should be no noticeable changes to
other platforms.

Changes since v13: move the MAX_PTR_PER_* definitions out of kasan and
into pgtable.h. Add a build time error to hopefully prevent any
confusion about when the new hook is applicable. Thanks Marco and
Christophe.

Changes since v12: respond to Marco's review comments - clean up the
help for ARCH_DISABLE_KASAN_INLINE, and add an arch readiness check to
the new granule poisioning function. Thanks Marco.

Daniel Axtens (4):
  kasan: allow an architecture to disable inline instrumentation
  kasan: allow architectures to provide an outline readiness check
  mm: define default MAX_PTRS_PER_* in include/pgtable.h
  kasan: use MAX_PTRS_PER_* for early shadow tables
