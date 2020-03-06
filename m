Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DC217BF10
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 14:37:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YpZS1KbRzDqft
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 00:37:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=rEoA/mjy; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YpVY25jnzDqW9
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 00:33:57 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id i13so1138996pfe.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2020 05:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gUiajEtqHykUipUDAxZZ8PHMye5BZieG1YJoiSofP8Y=;
 b=rEoA/mjylyn+XjZnbo+FAoZbkFtWsFbkdSAQ87jZimTL1ViuqtsI33f3HZK6q697az
 mfbqVVBYgm53l4l6EQheDkVMFMs5BXNELeZBYPanIK1Ndezd/vzOmFfitvCSNaMDlove
 v4zOTwlD21ftcc6NyuLL/kbWFhIQ/PZtj9iQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gUiajEtqHykUipUDAxZZ8PHMye5BZieG1YJoiSofP8Y=;
 b=OIGkl5plCc219hYkuefj7o9YQZtu7CAk7Hile9txroJG3cXDDaiKNW+EBTvZvpiIx0
 VYMKgTHuh2z3gSULf1Zx54tSK1TEH5rAlTMu/f31fHGWU3lsL66Pp8bpnV/GRCgrdaQo
 GhxXM3bSkiqJ25O0frfrF5Rc9+GtK9E5zQonE5P7zk9tsPtu1ausfhjoKd6uPURCl8NE
 RdXtfbEgV7hnOQeAKbm1XKYsHs5QGiKODBcpL06dJv9VuTfCZfzP18Uktaj7suK2IAmD
 rKRmbK8g5mGSr5aNfD+QcmEd5Hv3PB182RUh0SU/4pni4j1H7V9SRYm2wvNIOOASfeSQ
 luGg==
X-Gm-Message-State: ANhLgQ3kUCSSKVZZZUPBDBaBnviu7Bei2w0yCl2lOyGOWQYevTFGtaxY
 HtZQrst6XxJD/At/EpyqhLIiWw==
X-Google-Smtp-Source: ADFU+vvO5wzGbikRf/3JIgJ1Nd5LTOFUYoD4F69O2BvMxCf9Cq3AzzEd/joqlTHvvgzbTOzmPlJzpg==
X-Received: by 2002:a63:d845:: with SMTP id k5mr3272785pgj.183.1583501633687; 
 Fri, 06 Mar 2020 05:33:53 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-b120-f113-a8cb-35fd.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:b120:f113:a8cb:35fd])
 by smtp.gmail.com with ESMTPSA id w195sm33586804pfd.65.2020.03.06.05.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 05:33:52 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v8 0/4] KASAN for powerpc64 radix
Date: Sat,  7 Mar 2020 00:33:36 +1100
Message-Id: <20200306133340.9181-1-dja@axtens.net>
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

One quirk that I've noticed is that detection of invalid accesses to
module globals are currently broken - everything is permitted. I'm
sure this used to work, but it doesn't atm and this is why: gcc puts
the ASAN init code in a section called '.init_array'. Powerpc64 module
loading code goes through and _renames_ any section beginning with
'.init' to begin with '_init' in order to avoid some complexities
around our 24-bit indirect jumps. This means it renames '.init_array'
to '_init_array', and the generic module loading code then fails to
recognise the section as a constructor and thus doesn't run it. This
hack dates back to 2003 and so I'm not going to try to unpick it in
this series. (I suspect this may have previously worked if the code
ended up in .ctors rather than .init_array but I don't keep my old
binaries around so I have no real way of checking.)

v8: Rejig patch 4 commit message, thanks Mikey.
    Various tweaks to patch 4: fix some potential hangs, clean up
    some code, fix a trivial bug, and also have another crack at
    correct stack-walking based on what other arches do. Some very
    minor tweaks, and a review from Christophe.

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
