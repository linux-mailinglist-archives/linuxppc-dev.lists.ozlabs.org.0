Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA5291A6EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 14:50:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IK4E69aL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8z1f3yD0z3cY3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 22:50:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IK4E69aL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::a2d; helo=mail-vk1-xa2d.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8z0y3zwLz3bqP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 22:49:37 +1000 (AEST)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-4ef5c772f7bso2166663e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719492575; x=1720097375; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+7Qni7r/WgAD7DkgtwtmtiwAZVFbDMDzC460DmWWyAc=;
        b=IK4E69aLlsUfarJX3l6gBGDBJj7vCk+ZgKpqKQz3aax/ougRNuKfCxYAQwPH8GBVzR
         eg2V0Y6OZeOn6pGuTjEl+XpbmUweDIFrwkH9DYCzI9j0Z0FAhMlk8l9CXzXKpeMZC19k
         ehIIKVA5+o2VYaAKCq6i0B/H3hbnwUr1H/Gw9WmQpR6iUHwSC0lwx4V6Na1teYjamtZY
         GmBGhgSTGdRCBc40TpEdAgHpAB8SZAOpL85D4PWLQdaZ+lJbKPQddRXb7MalK54Skxrw
         cwPKczWr4qjQNerVy7bUrcjvh1NJiPYL5zhtP2jHOzvkJE6OQbtKdUZC3iq2O+W8M9JS
         ijRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719492575; x=1720097375;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+7Qni7r/WgAD7DkgtwtmtiwAZVFbDMDzC460DmWWyAc=;
        b=aqF0nFLlGgtJMLdv6+u6ILmUkfTkfmRJ0H9AUoOAL+aj36ISoxMOVDIeoVm1ZeRWOm
         zSd4Pql/unhNkbKwI3qEUNiL5aWvtmX7s1n/qZnVXHWjXNIx+mlbZ0RP/fiPMN95R8zB
         jVwcEBUlIShwfGxC4GGL726YjHfTXosYcyWkRT/W4+tzwtnEYXLeCqkzxQpQvvxtflYH
         GVy7HGVSD+7mlr7fjRnO53xu1/FhN3sxheUKwcyzTEVj1On6KrFWAY23PfeNLakudZut
         jPHLdsujY5x4ir0KgMnTWBXoWF8LK67b3jaSYqOJNKLW5jBd/ILol0myXC1EzBb/kptR
         73ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVde/kajrMPzoH09bMGee7BjoEVnqoNZ5pzcH7H9AILRtE8RmkbqEH7KAoiuaTRcCacUnhzH0XLbOc1IB8Jdmv67dBu7pIv9fhIVZXblA==
X-Gm-Message-State: AOJu0YzcNnAQhcChskLJnnVqQfQjNBFaLRQscVqDDTsm3XVaY/xYN0uR
	UZW7IDXlNrlhc0rtakQdZMJlQVV8dXvcDtcBGVNMj9pElnMmE4ptXMQXKWlrqsZs62oe212UlYm
	bVRziMlYpTgMn/+94zIcdcwy+lm30IvuLe4208w==
X-Google-Smtp-Source: AGHT+IGiITpyURlNbsXp5GME0V7s81ygGcIa99Yj2pi1rna6IbK6cbK7/bfy993EzWRjVk+838aCUMLn0wBd+QXyZjY=
X-Received: by 2002:a05:6122:921:b0:4ec:f758:e514 with SMTP id
 71dfb90a1353d-4ef6d8ad6e8mr11872712e0c.11.1719492574631; Thu, 27 Jun 2024
 05:49:34 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 27 Jun 2024 18:19:23 +0530
Message-ID: <CA+G9fYtiWKuQzwoBVaBA6zp304uCw5SsHKf3484CY-kuuOgnFA@mail.gmail.com>
Subject: powerpc: nvram_64.c:75:13: error: 'oops_to_nvram' used but never
 defined [-Werror]
To: open list <linux-kernel@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mm <linux-mm@kvack.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The powerpc builds failed on Linux next-20240626 tag due to following warnings
and errors with gcc-13, gcc-8 and clang-18.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on powerpc:

  - clang-nightly-ppc64e_defconfig
  - clang-18-maple_defconfig
  - clang-nightly-defconfig
  - clang-18-defconfig
  - gcc-13-maple_defconfig
  - gcc-8-cell_defconfig
  - gcc-8-maple_defconfig
  - clang-18-ppc64e_defconfig
  - clang-nightly-cell_defconfig
  - clang-nightly-maple_defconfig
  - gcc-8-ppc64e_defconfig
  - gcc-13-cell_defconfig
  - gcc-13-defconfig
  - gcc-13-ppc64e_defconfig
  - clang-18-cell_defconfig
  - gcc-8-defconfig

Build errors:
----
arch/powerpc/kernel/nvram_64.c:79:17: error: initialization of 'void
(*)(struct kmsg_dumper *, enum kmsg_dump_reason,  const char *)' from
incompatible pointer type 'void (*)(struct kmsg_dumper *, enum
kmsg_dump_reason)' [-Werror=incompatible-pointer-types]
   79 |         .dump = oops_to_nvram
      |                 ^~~~~~~~~~~~~
arch/powerpc/kernel/nvram_64.c:79:17: note: (near initialization for
'nvram_kmsg_dumper.dump')
arch/powerpc/kernel/nvram_64.c:645:13: error: conflicting types for
'oops_to_nvram'; have 'void(struct kmsg_dumper *, enum
kmsg_dump_reason,  const char *)'
  645 | static void oops_to_nvram(struct kmsg_dumper *dumper,
      |             ^~~~~~~~~~~~~
arch/powerpc/kernel/nvram_64.c:75:13: note: previous declaration of
'oops_to_nvram' with type 'void(struct kmsg_dumper *, enum
kmsg_dump_reason)'
   75 | static void oops_to_nvram(struct kmsg_dumper *dumper,
      |             ^~~~~~~~~~~~~
arch/powerpc/kernel/nvram_64.c:75:13: error: 'oops_to_nvram' used but
never defined [-Werror]
arch/powerpc/kernel/nvram_64.c:645:13: error: 'oops_to_nvram' defined
but not used [-Werror=unused-function]
  645 | static void oops_to_nvram(struct kmsg_dumper *dumper,
      |             ^~~~~~~~~~~~~
cc1: all warnings being treated as errors

metadata:
--
  git_describe: next-20240626
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_short_log: df9574a57d02 ("Add linux-next specific files for 20240626")
  arch: powerpc
  toolchain: gcc-13, gcc-8 and clang-18

Steps to reproduce:
---------

# tuxmake --runtime podman --target-arch powerpc --toolchain gcc-13
--kconfig ppc64e_defconfig


Links:
--
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2iQqkMfvFPihkYnvWC7UxrVhb1X/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240626/testrun/24453163/suite/build/test/gcc-13-ppc64e_defconfig/details/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2iQqkMfvFPihkYnvWC7UxrVhb1X/config

--
Linaro LKFT
https://lkft.linaro.org
