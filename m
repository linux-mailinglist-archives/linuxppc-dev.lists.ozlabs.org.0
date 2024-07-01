Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA8491DC10
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 12:06:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FmfknVlX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCMBb5VXbz3dfM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 20:06:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FmfknVlX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::a2b; helo=mail-vk1-xa2b.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCM9v2p4tz2y66
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 20:05:37 +1000 (AEST)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-4f284ef075dso2257773e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2024 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719828335; x=1720433135; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I4DXBAWMyQsPIP/BlZF0MhKJYIvvGxN8nErZr4nhF+E=;
        b=FmfknVlXFjfH11SrOLvhwuofz94cJjljwAs9G9lVhw4FOUcbEjowRPIhUARn31Rh75
         fRYk+KogSMERMUQxRTtG+YZ2cgVe/EIFuP5y3GUcHkCCgTMTktaEs81i603H+jX5xqJE
         LbcRiIZrE6m8RG2W1Q+24vu6KDFiUNsUoz/xgben+uhZLo/mMTxlN8eRh4zs9COILrYn
         lPjcgSiRA+P9iCBUHrKrt7v/HI5FUgOdoR94ufmBft9LXTrpI+n/obhlPG66j7nJaQ4n
         TP208b1jCG+cAyjRAzdC2R3JuOhsHYtpn9IdFTcWsgTtNsHT7Ytw6dNQ1sNwBy5yw1ul
         J+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719828335; x=1720433135;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I4DXBAWMyQsPIP/BlZF0MhKJYIvvGxN8nErZr4nhF+E=;
        b=UEvPjxHoxwz/1q0DHNFXHsdND00QMAv58QIlOSz6zKBp+xDGbmoWpMvE/g6LBVtZRv
         kpA+M5o34sh9phczV7BhobX36tLQSA7WZ00hnwW8yEP7cCOwV1BTrNanAPi/MqFYIAIu
         iAArf+YpDAF/wJSHlfZ2CFrLaLuhgF3Y8V1ORWOZoUDBTwx4qpVA5d/yVZnjDAECTOZM
         hlulomzLY/BFylrhzjq6UMwv4iAGLPq0WpNG2lOyBczpyU1tGPsGLK69J8yG+LK/w2X6
         seAbMJzBvBYJqE+myocXYutbP5KPnENoWG8A80J98WwWkwCaBI1MEvoVttCmrATjxq6w
         zDtg==
X-Forwarded-Encrypted: i=1; AJvYcCUKLi3+91fR6msQzVFbvwNbZehSRVzOJzPgNNLl69N4J7e7uCvjPwBcGSFVtkqeRFqm9e41LFFHNn5h/lcAcERn4oiUHKkVUJq9haMVtA==
X-Gm-Message-State: AOJu0Yx8g0zdTdk5c25WRUPKc2cHhA9NgMR6LMkTXAQ76JGKPUVVieBf
	hDMZsvwUlmNtj6p5QDDxHMLjKZgr1vRdLQw9GNlYafnhmdoCTfp6QR8k9jdOwixylEkRbeLVYPy
	jE8MX5Bu1v8c4zaf0bQpHlOtmbytq3e6HVF0cCg==
X-Google-Smtp-Source: AGHT+IG/UJLtDpqLnWBEhTMwLbgorI6NfFHGnvnXUhY4RXRD1i3Q/9cj2Xrr1s9Ry+0T5PQVhvZc+dVzAoKpfP89VE8=
X-Received: by 2002:ac5:cd4f:0:b0:4ef:8574:ce18 with SMTP id
 71dfb90a1353d-4f295e9d7cdmr4071960e0c.6.1719828334606; Mon, 01 Jul 2024
 03:05:34 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 1 Jul 2024 15:35:23 +0530
Message-ID: <CA+G9fYve66bw-4xVrJnfeXtRV1et1UhEZMFAvvTXbKB2-m--fg@mail.gmail.com>
Subject: mm: gup.c:2827:22: error: conflicting types for 'try_grab_folio_fast';
 have 'struct folio
To: lkft-triage@lists.linaro.org, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-mm <linux-mm@kvack.org>
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The powerpc build failures noticed on Linux next-20240628 tag.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on powerpc:

  - gcc-13-maple_defconfig
  - gcc-13-cell_defconfig
  - clang-nightly-maple_defconfig
  - gcc-8-defconfig
  - gcc-8-tqm8xx_defconfig
  - clang-18-tqm8xx_defconfig
  - gcc-8-maple_defconfig
  - clang-nightly-cell_defconfig
  - clang-18-maple_defconfig
  - gcc-13-defconfig
  - clang-18-defconfig
  - clang-nightly-defconfig
  - gcc-13-tqm8xx_defconfig
  - clang-nightly-tqm8xx_defconfig
  - gcc-8-cell_defconfig
  - clang-18-cell_defconfig

Build error:
---
mm/gup.c: In function 'gup_hugepte':
mm/gup.c:525:25: error: implicit declaration of function
'try_grab_folio_fast'; did you mean 'try_grab_folio'?
[-Werror=implicit-function-declaration]
  525 |                 folio = try_grab_folio_fast(page, refs, flags);
      |                         ^~~~~~~~~~~~~~~~~~~
      |                         try_grab_folio
mm/gup.c:525:23: warning: assignment to 'struct folio *' from 'int'
makes pointer from integer without a cast [-Wint-conversion]
  525 |                 folio = try_grab_folio_fast(page, refs, flags);
      |                       ^
mm/gup.c: At top level:
mm/gup.c:2827:22: error: conflicting types for 'try_grab_folio_fast';
have 'struct folio *(struct page *, int,  unsigned int)'
 2827 | static struct folio *try_grab_folio_fast(struct page *page, int refs,
      |                      ^~~~~~~~~~~~~~~~~~~
mm/gup.c:525:25: note: previous implicit declaration of
'try_grab_folio_fast' with type 'int()'
  525 |                 folio = try_grab_folio_fast(page, refs, flags);
      |                         ^~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Steps to reproduce:
----

# tuxmake --runtime podman --target-arch powerpc --toolchain gcc-13
--kconfig cell_defconfig



metadata:
----
 git_describe: next-20240628
 git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
 git_short_log: 1eb586a9782c ("Add linux-next specific files for 20240628")
 arch: powerpc
 toolchain: gcc-13 and clang-18

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2iWYcbTLGMcGuxl7caQ3jwv9C4a/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240628/testrun/24464887/suite/build/test/gcc-13-cell_defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240628/testrun/24464887/suite/build/test/gcc-13-cell_defconfig/log


--
Linaro LKFT
https://lkft.linaro.org
