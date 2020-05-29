Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E7A1E7748
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 09:43:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YGlR6FpTzDqPf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 17:43:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.67; helo=mail-pj1-f67.google.com;
 envelope-from=mcgrof@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YGht46ghzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 17:41:14 +1000 (AEST)
Received: by mail-pj1-f67.google.com with SMTP id a45so1480002pje.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 00:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxdWIOmMtZof5Zd2ToCNUZnFH4PwEYqbI1WQa7Nahtk=;
 b=fITNbtmKO/NZsBJOTtBdxB1NSj24gwn1dzJ2ZfqvleVHNiGHWlU1757iAMmNyoDAh1
 3rK4S/mK73TcY7GT+h1ZVOxz505dKbRCrRXpFkXL+00AhUnjtjfOnjzkbFhtcH3u060+
 0E50j7Hb1QjryQwo4iQQY06az6S9d3X4cyl/KlGJ0uonVq7tV9IjEuktfEoF7FCtqPOg
 OVwFaig3eHfTY7krbOlEqGIGJHuMVLwRQ1hAZe7OWL9PfwZ38p3UIveJH4fqpcNcP1jJ
 8NfjxI2Ll/kOPnHJioX40Hw5Jvc+5hdq86PyteEFsVBeTqrlTFo6GYWD7hbiTyJexuoJ
 P0Jg==
X-Gm-Message-State: AOAM531ana9N4jwnsEERHtGEPi/Byu6AzryNpyPsYq185hrSQusR6UMK
 wOwje1fw4cBA6PiUjmonp3k=
X-Google-Smtp-Source: ABdhPJx/Y2UkOfRCeSrfHd17IdoL/kq5WzGQ2U9aMMVJNt5xrKYQiwN4acpehMl/gpWlkneskvxS6A==
X-Received: by 2002:a17:90b:1002:: with SMTP id
 gm2mr8188726pjb.197.1590738072133; 
 Fri, 29 May 2020 00:41:12 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id s1sm6842049pjp.27.2020.05.29.00.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:10 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id E3ADF40605; Fri, 29 May 2020 07:41:09 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 00/13] sysctl: spring cleaning
Date: Fri, 29 May 2020 07:40:55 +0000
Message-Id: <20200529074108.16928-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, julia.lawall@lip6.fr,
 Luis Chamberlain <mcgrof@kernel.org>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Me and Xiaoming are working on some kernel/sysctl.c spring cleaning.
During a recent linux-next merge conflict it became clear that
the kitchen sink on kernel/sysctl.c creates too many conflicts,
and so we need to do away with stuffing everyone's knobs on this
one file.

This is part of that work. This is not expected to get merged yet, but
since our delta is pretty considerable at this point, we need to piece
meal this and collect reviews for what we have so far. This follows up
on some of his recent work.

This series focuses on a new helper to deal with subdirectories and
empty subdirectories. The terminology that we will embrace will be
that things like "fs", "kernel", "debug" are based directories, and
directories underneath this are subdirectories.

In this case, the cleanup ends up also trimming the amount of
code we have for sysctls.

If this seems reasonable we'll kdocify this a bit too.

This code has been boot tested without issues, and I'm letting 0day do
its thing to test against many kconfig builds. If you however spot
any issues please let us know.

Luis Chamberlain (9):
  sysctl: add new register_sysctl_subdir() helper
  cdrom: use new sysctl subdir helper register_sysctl_subdir()
  hpet: use new sysctl subdir helper register_sysctl_subdir()
  i915: use new sysctl subdir helper register_sysctl_subdir()
  macintosh/mac_hid.c: use new sysctl subdir helper
    register_sysctl_subdir()
  ocfs2: use new sysctl subdir helper register_sysctl_subdir()
  test_sysctl: use new sysctl subdir helper register_sysctl_subdir()
  sysctl: add helper to register empty subdir
  fs: move binfmt_misc sysctl to its own file

Xiaoming Ni (4):
  inotify: simplify sysctl declaration with register_sysctl_subdir()
  firmware_loader: simplify sysctl declaration with
    register_sysctl_subdir()
  eventpoll: simplify sysctl declaration with register_sysctl_subdir()
  random: simplify sysctl declaration with register_sysctl_subdir()

 drivers/base/firmware_loader/fallback.c       |  4 +
 drivers/base/firmware_loader/fallback.h       | 11 +++
 drivers/base/firmware_loader/fallback_table.c | 22 ++++-
 drivers/cdrom/cdrom.c                         | 23 +----
 drivers/char/hpet.c                           | 22 +----
 drivers/char/random.c                         | 14 +++-
 drivers/gpu/drm/i915/i915_perf.c              | 22 +----
 drivers/macintosh/mac_hid.c                   | 25 +-----
 fs/binfmt_misc.c                              |  1 +
 fs/eventpoll.c                                | 10 ++-
 fs/notify/inotify/inotify_user.c              | 11 ++-
 fs/ocfs2/stackglue.c                          | 27 +-----
 include/linux/inotify.h                       |  3 -
 include/linux/poll.h                          |  2 -
 include/linux/sysctl.h                        | 21 ++++-
 kernel/sysctl.c                               | 84 +++++++++++--------
 lib/test_sysctl.c                             | 23 +----
 17 files changed, 144 insertions(+), 181 deletions(-)

-- 
2.26.2

