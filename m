Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CB78799BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 18:04:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KDhXB68a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvKjp33Jsz3dVj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 04:03:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KDhXB68a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvKj45zPrz3d2B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 04:03:19 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dd6412da28so941035ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 10:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710262995; x=1710867795; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WLftE/7MjlMuOSj897HlMQUMVZbmkOmcm7ijw8JWvLk=;
        b=KDhXB68a8o7Smfpr4Jtb6qoFHtIkgXTtqNJlyJ8esXxrkpTkkD/UDr5srCwA654Xmy
         iw97zrpwmIAgpzfeJgGIQ+2999Gzfp/QXi6bmGYsTQGM7Y42568qMtfVJHDI57fdEvlz
         ji2thm1axoZEoffduKc1u4IJma3d7hMmKaC7X3OK0E2vs6kMEx9CtPD6A1iOcZlHAXOH
         cZNgHdmpoWQ4cfVrySNClbK0TolU8HIGuGzWBwNtU+sGNt9bfXTXxulVcm1nNRuP8esx
         gbcWrqAcyO9+bbhDUz+XRYPl4Uqqdo3KWfgt61dXBFfE8T4SigWLWC+S1/Kpc/rpsKqu
         zZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710262995; x=1710867795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLftE/7MjlMuOSj897HlMQUMVZbmkOmcm7ijw8JWvLk=;
        b=c4jCk1lYlrNctChTupEai6A9NrgSbS4XJhpjdqqNWN9+Ao1CrVJFt1s+9xvF6pthpv
         iAk/A32ElO5ZsSo5eEtoqSTWolFEQeldkKkaK4WqOIUAhoOvzqc4V9n9PripUDOsrcyP
         9B/S8gihZyUqQj8WQlubpG6FXUO0paWBCZDuLzt+Jk1lcwjA+tyhDi/2gctn1JxkFhRB
         Rjwplju8ViRCCS4ON0nYZN1fREghJYaDkPuj44Cb0oBePeonRJPbxbcaDsZa+JFO9Z+W
         dpDyvIYyuH043Xv89CkBmg4RchLE7P5soY+NdCugzwOIjLKqZLt6ESee5vZdFcgvZp81
         nKEw==
X-Forwarded-Encrypted: i=1; AJvYcCXS5EiK8rlaCo42ritzSywfG+So0uT0BPoORWXNieKNtWqMILyFUjZetjTRy3zPuN2IVDDz0fT64dx3BHbWlIdjxaXKCJO9cSLnJgmAig==
X-Gm-Message-State: AOJu0YyDeZech2ymnUKl+v4xxOP/8fV+/IMU1FmEYqLLmg/LP8D/epZO
	TIjdS2yZwXW3+Mq64pYYiCww6Gv9b00fYpAA8GzDfJ9kPul1H9lA
X-Google-Smtp-Source: AGHT+IGoSNJSdzshXUinY0deqrpWSsXfjdp27VpnRBXFH0xqKuZltMGKwFFXD7x5fWGnOCLrPfDYHw==
X-Received: by 2002:a17:902:7ec9:b0:1dd:b681:990e with SMTP id p9-20020a1709027ec900b001ddb681990emr2092458plb.36.1710262994820;
        Tue, 12 Mar 2024 10:03:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r20-20020a170902c61400b001dd02f4c8fcsm6942533plr.139.2024.03.12.10.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:13 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH 00/14] Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:02:55 -0700
Message-Id: <20240312170309.2546362-1-linux@roeck-us.net>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Guenter Roeck <linux@roeck-us.net>, netdev@lists.linux.dev, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmerman
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

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

Design note:
  Function pointers are only added to the __bug_table section if both
  CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled to avoid image
  size increases if CONFIG_KUNIT=n. There would be some benefits to
  adding those pointers all the time (reduced complexity, ability to
  display function names in BUG/WARNING messages). That change, if
  desired, can be made later.

Checkpatch note:
  Remaining checkpatch errors and warnings were deliberately ignored.
  Some are triggered by matching coding style or by comments interpreted
  as code, others by assembler macros which are disliked by checkpatch.
  Suggestions for improvements are welcome.

Changes since RFC:
- Minor cleanups and bug fixes
- Added support for all affected architectures
- Added support for counting suppressed warnings
- Added unit tests using those counters
- Added patch to suppress warning backtraces in dev_addr_lists tests
