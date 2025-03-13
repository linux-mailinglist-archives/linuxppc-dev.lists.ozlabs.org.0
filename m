Return-Path: <linuxppc-dev+bounces-6988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44DA601BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 21:00:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDJJX6cz3z3cBx;
	Fri, 14 Mar 2025 07:00:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741866280;
	cv=none; b=X42b/k4cd6DfMEg0QmVys6SJZtn5HLbbd5aTsLxfc9IExydYYlfgHPbYsXJbJQAMybnfpkg5HDiuIBotA3T1d9ZVpjXjMfwkmivDw8GB+uvClQE7KjPjr5rYs1ET8RXZhE0LbhzAVZx5F78dlKmUTW+Dgf/mpvRltVjJJooOjY+PLUg+Pz+Ycq/4jjUoPT13UXcyhDNDKegI/+dnjY+NhjPTTT/kvdSiyLoSM/n+CEX3gAIL5/tyUHBPB9Cri+qPz2h0PItQUaK9YP7+5/eZgSbcf6z4YS1AstEjnqlIO8J25VESlqamVv0V67cCypfLhh4EE9YVkiHQ8HEw0ICFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741866280; c=relaxed/relaxed;
	bh=Vi3vqlZEjhRyke+tn+Q3MD+zw3p/H2XxVRSJ9/S1eBk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-type; b=CNegrHDlFjmxfGhCDJzVog0mQJDjMkF/XY9NsiBJeOrxS+2YGSnIgEZP4R6i8Cc9D4wbePAiG8vg9ZjooeT3VUyShrgmEjKCTnOPHBR/PebjhXRimuLbI3X3oN3vb9mMLYmLk6sk/fybTs4JnClQDvw0wnf/GDERWqQKqT/o/Bu113vJ0WMlRhq0rSsP6U4Z1Y2ktvcpTFSybBOtMmxUmdAJwSxYTRtvReOHfKR30J14a8IPl6ZFB+7TokS9C8e2sJrMgHK8N2vSo1PQtlHE8L8jBgztxtXM5/KJ0Z1lhZt7tEIpsRXn7xrWJ26wJZDQojfROW+7Y3QFX9tMK9pmzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WqugVzZ8; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gOmquiTo; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WqugVzZ8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gOmquiTo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=acarmina@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD5JQ5vvgz30Tm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 22:44:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vi3vqlZEjhRyke+tn+Q3MD+zw3p/H2XxVRSJ9/S1eBk=;
	b=WqugVzZ8f+Vx4UvGl1aA/yks2AB7/6BChGCJWwALmPCbRn0Fbewym9uuHr5Cf131YKFec+
	QSkNzqUK5AlT8yL/BQgHiCDaiw4iFcZeq32LuUnzss/PqyCAhSAIPNuj0PxnJ+NZL6zQCE
	rmF1KRpf/R1UxtfVqq+V+JUhqrvUA0I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vi3vqlZEjhRyke+tn+Q3MD+zw3p/H2XxVRSJ9/S1eBk=;
	b=gOmquiToPIyIecjOE4lWRHDHKWoBcEPvmjmZbazrd9UCld3tU4As8PDKFcwm4rFbnftbWb
	lSMjKOOY5oc3gaj6krv3fIs8bcSduOKqleE+V96L1ipCxDXIKQEvMljxK1eSMjzY/LWazh
	Rb/WzhEjyzVfiv8WZLEy2gaRcDQwVIk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-vekRD8wPMoOCrqrbzRoWfQ-1; Thu, 13 Mar 2025 07:44:30 -0400
X-MC-Unique: vekRD8wPMoOCrqrbzRoWfQ-1
X-Mimecast-MFC-AGG-ID: vekRD8wPMoOCrqrbzRoWfQ_1741866269
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39135d31ca4so448394f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 04:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866269; x=1742471069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vi3vqlZEjhRyke+tn+Q3MD+zw3p/H2XxVRSJ9/S1eBk=;
        b=Jdql6rhIoJk4kfzz3D9LqZVz5EutDCoWhXwXhHkvVUWFIX21SXvTrq8/w0Mf9UPF+a
         qa3LilBYmMZ1NAgf07bMUoPy3taooTCCwIPJvhvfXe8bBH9GSgNTeT1BaKT3sv43IOzo
         yCB1P0lRLL25JWXF3rUjEQvsyzNzZ4+39i/Xe0u6vc6XxkDJ3/AhQrmpJsPFmjFqL2wd
         m0X656gOqNU0AhyRdlRQUBy7+Kx1e6Zi7/okEiG1urP0ju9cnjejeuxvf8yb9+iC7iYY
         Q4FJgRoqV4uEr4EeVsPBwJKZX0VU/S4jvA0CcdT2T55JfwwSS6aNl2dghtBDV8PzsYg4
         yFAA==
X-Forwarded-Encrypted: i=1; AJvYcCW9wRLsQ0o0Yf5RsWGVrlazCrscxbS45Y4LF7svF2uv1jZXx+X/7FRpPV1QXH1m8QEBycubssAnlcqHrL8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2y21mLfPix0oic0o26Nvw8exNqujziNabdonIBcmdhs9X03n+
	UPLso+B4aFVlnAB9WAY1xRpWs9S6Mwg27BIR+AuX9IIwHFjHM6XbXBAZHuB00Tm7G2oX8ttSOhe
	fjq3dCAmdbiLoEcJgpaVYeryxkZ7u49TBKkRHQjhguRJ/h+PVRqvZqs57d4H+/yM=
X-Gm-Gg: ASbGncutEkHJ/yYORQ4vm9XWJdSQUjnyGFZtDzn00gt54M83167mmUhulbdibWbnd9Q
	Kj3jLH9Y1fuv+mWmxRu1VrbRnUcHMaq7S45UGYPtXx5tNO929tzLPRbDgm+e+2v2AiWh/SXJMNO
	vMRaDedXHuxzj9stWbKvp76p44zMAWZCMtlmMAR6k2gOSPACGHhvKlOFc23vbJO+c5rPKV3Jic6
	bwoPgSPHNlunskfWJ9P2z2h4D/2H/rsEWj1mqk5eJ32iyrHY5ULewompj5L/CJv9j779uh1sdPh
	l/pT0bDMolcqCRwAAhan
X-Received: by 2002:a5d:64cb:0:b0:38f:23c4:208c with SMTP id ffacd0b85a97d-395b954ea75mr1784211f8f.18.1741866269072;
        Thu, 13 Mar 2025 04:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5B4S8E4d5tF3TI1rIoUvKO0tSV0G2B0BPE1gxY0qJz2LBrnTYS6FEhx79I2sbOMPQrE3jHw==
X-Received: by 2002:a5d:64cb:0:b0:38f:23c4:208c with SMTP id ffacd0b85a97d-395b954ea75mr1784186f8f.18.1741866268630;
        Thu, 13 Mar 2025 04:44:28 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:27 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	x86@kernel.org,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 00/14] Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:15 +0000
Message-Id: <20250313114329.284104-1-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UgRZcCnjXPyvfHXF2ow1kCIsxE7XHBlWSlgxVQHuYQc_1741866269
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Some unit tests intentionally trigger warning backtraces by passing bad
parameters to kernel API functions. Such unit tests typically check the
return value from such calls, not the existence of the warning backtrace.

Such intentionally generated warning backtraces are neither desirable
nor useful for a number of reasons.
- They can result in overlooked real problems.
- A warning that suddenly starts to show up in unit tests needs to be
  investigated and has to be marked to be ignored, for example by
  adjusting filter scripts. Such filters are ad-hoc because there is
  no real standard format for warnings. On top of that, such filter
  scripts would require constant maintenance.

One option to address problem would be to add messages such as "expected
warning backtraces start / end here" to the kernel log.  However, that
would again require filter scripts, it might result in missing real
problematic warning backtraces triggered while the test is running, and
the irrelevant backtrace(s) would still clog the kernel log.

Solve the problem by providing a means to identify and suppress specific
warning backtraces while executing test code. Support suppressing multiple
backtraces while at the same time limiting changes to generic code to the
absolute minimum. Architecture specific changes are kept at minimum by
retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
CONFIG_KUNIT are enabled.

The first patch of the series introduces the necessary infrastructure.
The second patch introduces support for counting suppressed backtraces.
This capability is used in patch three to implement unit tests.
Patch four documents the new API.
The next two patches add support for suppressing backtraces in drm_rect
and dev_addr_lists unit tests. These patches are intended to serve as
examples for the use of the functionality introduced with this series.
The remaining patches implement the necessary changes for all
architectures with GENERIC_BUG support.

With CONFIG_KUNIT enabled, image size increase with this series applied is
approximately 1%. The image size increase (and with it the functionality
introduced by this series) can be avoided by disabling
CONFIG_KUNIT_SUPPRESS_BACKTRACE.

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

Design note:
  Function pointers are only added to the __bug_table section if both
  CONFIG_KUNIT_SUPPRESS_BACKTRACE and CONFIG_DEBUG_BUGVERBOSE are enabled
  to avoid image size increases if CONFIG_KUNIT is disabled. There would be
  some benefits to adding those pointers all the time (reduced complexity,
  ability to display function names in BUG/WARNING messages). That change,
  if desired, can be made later.

Checkpatch note:
  Remaining checkpatch errors and warnings were deliberately ignored.
  Some are triggered by matching coding style or by comments interpreted
  as code, others by assembler macros which are disliked by checkpatch.
  Suggestions for improvements are welcome.

Changes since RFC:
- Introduced CONFIG_KUNIT_SUPPRESS_BACKTRACE
- Minor cleanups and bug fixes
- Added support for all affected architectures
- Added support for counting suppressed warnings
- Added unit tests using those counters
- Added patch to suppress warning backtraces in dev_addr_lists tests

Changes since v1:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
  [I retained those tags since there have been no functional changes]
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option, enabled by
  default.

Changes since v2:
- Rebased to v6.9-rc2
- Added comments to drm warning suppression explaining why it is needed.
- Added patch to move conditional code in arch/sh/include/asm/bug.h
  to avoid kerneldoc warning
- Added architecture maintainers to Cc: for architecture specific patches
- No functional changes

Changes since v3:
- Rebased to v6.14-rc6
- Dropped net: "kunit: Suppress lock warning noise at end of dev_addr_lists tests"
  since 3db3b62955cd6d73afde05a17d7e8e106695c3b9
- Added __kunit_ and KUNIT_ prefixes.
- Tested on interessed architectures.

----
Guenter Roeck (14):
  bug/kunit: Core support for suppressing warning backtraces
  kunit: bug: Count suppressed warning backtraces
  kunit: Add test cases for backtrace warning suppression
  kunit: Add documentation for warning backtrace suppression API
  drm: Suppress intentional warning backtraces in scaling unit tests
  x86: Add support for suppressing warning backtraces
  arm64: Add support for suppressing warning backtraces
  loongarch: Add support for suppressing warning backtraces
  parisc: Add support for suppressing warning backtraces
  s390: Add support for suppressing warning backtraces
  sh: Add support for suppressing warning backtraces
  sh: Move defines needed for suppressing warning backtraces
  riscv: Add support for suppressing warning backtraces
  powerpc: Add support for suppressing warning backtraces

 Documentation/dev-tools/kunit/usage.rst |  30 ++++++-
 arch/arm64/include/asm/asm-bug.h        |  27 ++++--
 arch/arm64/include/asm/bug.h            |   8 +-
 arch/loongarch/include/asm/bug.h        |  42 +++++++---
 arch/parisc/include/asm/bug.h           |  29 +++++--
 arch/powerpc/include/asm/bug.h          |  37 +++++++--
 arch/riscv/include/asm/bug.h            |  38 ++++++---
 arch/s390/include/asm/bug.h             |  17 +++-
 arch/sh/include/asm/bug.h               |  28 ++++++-
 arch/x86/include/asm/bug.h              |  21 +++--
 drivers/gpu/drm/tests/drm_rect_test.c   |  16 ++++
 include/asm-generic/bug.h               |  16 +++-
 include/kunit/bug.h                     |  56 +++++++++++++
 include/kunit/test.h                    |   1 +
 include/linux/bug.h                     |  13 +++
 lib/bug.c                               |  51 +++++++++++-
 lib/kunit/Kconfig                       |   9 ++
 lib/kunit/Makefile                      |   7 +-
 lib/kunit/backtrace-suppression-test.c  | 104 ++++++++++++++++++++++++
 lib/kunit/bug.c                         |  42 ++++++++++
 20 files changed, 519 insertions(+), 73 deletions(-)
 create mode 100644 include/kunit/bug.h
 create mode 100644 lib/kunit/backtrace-suppression-test.c
 create mode 100644 lib/kunit/bug.c

-- 
2.34.1


