Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EBB88AC84
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 18:53:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f4WohoIl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3LC61DRcz3vhB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 04:53:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f4WohoIl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3LBL5SP7z3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 04:52:58 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ea9a605ca7so1081248b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 10:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389175; x=1711993975; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XNSADZIa55EnhS6o0yIL3ifpTu+GjUejKXDxEmLThHE=;
        b=f4WohoIlPfHH2MOeUBDVz2Zu9JHmkrec8KeFXHaGlK7vVBo0ChjYd3ywF7s91SiNR2
         yWh1YPfCvz1bu92oePisTw9+eZuJNXlMywNjcsmmIV7sdxjTeb3VKbcWFooYJG7KJj8c
         UxFaANnaIsF/XQuOvMmyJxdOmnu90yOp7WSeXR9gxxMQSsMsZ6mJCxHiZIpGsXGLfcBB
         ewUUHXW/ZqkyXP5uRfHl/bP3Sk/G9DECf4wA+tDJ258zviQUpQAOOutmxAzroV8PA4xx
         A3Dm7SVqHoOw9L9i+oiQjPkAGZxnb36pb/0/DKCZYMLWarC62+x+jZsrMIQDVcG9r3qC
         NaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389175; x=1711993975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNSADZIa55EnhS6o0yIL3ifpTu+GjUejKXDxEmLThHE=;
        b=VVRmwa4iwALP/AiVlwEETwDXCTVuWw1JFz/ari6SFoP196lstFFdOzTRBanBc7ozpl
         lKduPZU+aeDNET1PlC44XHGBlgzQdR1M2RBQhC6Y7QxUK85GWEPJ083ut3kj7m2TJ/FO
         xhN1VpgDQvsiR5w86bFThDIHhy2doVScCO5PYQ//Nd8M8QFDKS+ZapeFbNzLhlRYGzI6
         Ze+ntvv2DlzAaJIiKwqJTSFd3agI5Ht7PwA8A/BFJz1Pk/ZVarugo1M+3mobcx+qZULN
         3l5W3Mv1SDGrDiB5ocFKIh0YK321y6j12BvUUxy5GmAVrzUDvY4UKdcfQ3dL1fnDW/zo
         9RTA==
X-Forwarded-Encrypted: i=1; AJvYcCVuveF5suU+KtoYMiTpwBZgo3a1EmN9twZlUxrUtvT4FnZkA21CBYoAmOW8YdjGDQJAMN2p8oHoAwnqyFHrNqX1Fvn+acgiIWkmqMw5Sg==
X-Gm-Message-State: AOJu0YxdX5kP2d9t7sVvA19/xmRyKq3qpJLcf6Ncu6a+39LOPVZp85ew
	74q4antZZUKtdhErB97dnRzzhx9UU3y/w2f3xrB672MM2n0nlQALRXUAi08i
X-Google-Smtp-Source: AGHT+IGIDWtPHdUbX+7LWIxScptU3Z3k9sozN35URR01B7XvfxcUzrh1Z1HYjZAKi2mO+Me8ITFPPw==
X-Received: by 2002:a05:6a20:6a0e:b0:1a3:c4ba:a453 with SMTP id p14-20020a056a206a0e00b001a3c4baa453mr6509702pzk.7.1711389175417;
        Mon, 25 Mar 2024 10:52:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id dr18-20020a056a020fd200b005cd835182c5sm5239787pgb.79.2024.03.25.10.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:52:53 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH v2 00/14] Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:34 -0700
Message-Id: <20240325175248.1499046-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmerman
 n <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
