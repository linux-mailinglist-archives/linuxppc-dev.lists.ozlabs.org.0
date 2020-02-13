Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BAB15B625
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 01:49:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Hyb36GbNzDqS4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 11:49:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=QwUP5Ymp; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HyXy68wczDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 11:48:02 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id q39so1628480pjc.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 16:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jh/fY28bFcd7/L9cFsQkhcdCpmkjY9Ls0EJJsmxHbno=;
 b=QwUP5YmpF0cywwIr+qqbXA8X8QjSa5/SMryDRo1Jmcg58ari7q9lz42nXW6NmnSWb0
 AXCu4fiU33C4y8T28zSV0Qmm1knIZnwmQqe7wJ5n4BeCkX8RDy+wtRfO9RQhv0y+nsbZ
 29TRSP46434x8xNKLi22b57LNpH44rIGdMKSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jh/fY28bFcd7/L9cFsQkhcdCpmkjY9Ls0EJJsmxHbno=;
 b=H9PI9g70tCgdabMzjTPeoNd1kP6q+vTiSdX4Hc6JTnuDthVgiOr+vP6Aaf7ASTP/ZK
 3tglPhryr4ew3TPL3etOerEgnx3nBY7NN1d+h6SHw7MOnG0x0lOQ1JYuvHMer/QiLRvw
 Ewv3vv5wyV+kmgoZnazzJskgHCZS8lLgngGCwNkCh49lRZ/Ah7ALRr6iSlGuUJRGEZBD
 oBehh1aA4LXkWFQ/v4hQR8hGK2WR5c3S/zw6uPTFVDXbFGrF/qAnxILIM6/oVZqzBhk8
 OCRoPsOIL51s7ntsn7uowkr41/m93yKar/UhgKg/+o5grfVRCMdx9QcYmi4riQYYvELR
 8rlw==
X-Gm-Message-State: APjAAAWdt9L07WBy73XTTFl/O1FBQa6svRJ4xfTgo0pUwAMfyGOrVvZI
 DX502bM2UfokUKNMZrAbfK6DkA==
X-Google-Smtp-Source: APXvYqzTc2qiS1kuq5ADzvkss9L6yK8qP1IIPA8eq7f36ELS9X5Fs2jbKo2Gb97ZIjxebSzszwP4Qg==
X-Received: by 2002:a17:90a:858a:: with SMTP id
 m10mr1992942pjn.117.1581554878778; 
 Wed, 12 Feb 2020 16:47:58 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-f1ea-0ab5-027b-8841.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:f1ea:ab5:27b:8841])
 by smtp.gmail.com with ESMTPSA id u126sm399077pfu.182.2020.02.12.16.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 16:47:58 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v7 0/4] KASAN for powerpc64 radix
Date: Thu, 13 Feb 2020 11:47:48 +1100
Message-Id: <20200213004752.11019-1-dja@axtens.net>
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

v7: Tweaks from Christophe, fix issues detected by snowpatch.

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

