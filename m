Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B97F9D60
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 11:25:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uaQt25hy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf1tr5DYqz3cSq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 21:25:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uaQt25hy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::e2a; helo=mail-vs1-xe2a.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sf1t13p7Yz3bPM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 21:24:39 +1100 (AEDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-462a24a7583so1300284137.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 02:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701080673; x=1701685473; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cdp8QAZn1D8I/rEQSBUvbPEDzykyHAXvOt5qwyXf2M0=;
        b=uaQt25hyL/1ZaVHMeC7Hf+mlY66klH0izrrz1n3vznWAUswS+BBZQcNYef0yh/+nzH
         PD4wOFLOWA4mmXjpQXNwGfyDMqsfOHRfoUFIMfWB88BT087/Zqy0NeGU2dUhb+JgHq0+
         Nx1mcMEXOUeRxQQrTR1/B8a0eLA2bbE9VpQYl4CrFiOEFWkSN55ZRU0J2OmSlKUJW3nd
         YnwhsC4QZLD8UKZ+sHDhuxro/72jQdRjRgLkwi/4xhc6/Wbx/6ty8PkDE4rJB3ydfsB/
         UV25jIwALYP/VJakRM+V68s1qv8/4+4sRZPEoCKwmOYMkoT3eLGakBSlEJJXyu2bo1ex
         WliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080673; x=1701685473;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdp8QAZn1D8I/rEQSBUvbPEDzykyHAXvOt5qwyXf2M0=;
        b=iQzhBO+0tOzWvxbyZpKVxnz8gXIUI8TsNS+uWFjtLBkiHKIhiTdgrJi3aqPFx1RD4P
         xnqiGb2xvgwmDWY60lxrvUL7xgcvclrmtbOR8p9+hVr9LdGu+j9478fr8UNP5Ie7qbWB
         +nXHeY9hWYLHTyn8MLFYV0DQeS10bkiywFSNW2ZFzBzJyrrcYIgf8pvH7J4PX7KeDEBA
         6yolBwvbce3NbWCcTg9YOYdunRwfWBCtjpnqxQWuW8Qw4SOWBtcpBTs6XPQ3B5V9TH9P
         c3nAx2MUY3EuHswdRIRzbiNIqFzls81Je5UxtnX2aOEIx4nLpoFnB96JXy1rhfHVOd37
         Kxtg==
X-Gm-Message-State: AOJu0Yxndvrbg2aYsaXMTBSW9YVlKfpFstfYipJYS216TxTMvbHHdGWk
	7XW10N8zxgvv08JZai2aNY0SKPDUQ4gEWMbevgCOW5F4EIo2tzklxf4=
X-Google-Smtp-Source: AGHT+IGVgRALVFNM2U4HPGezSL7BWKq/nblzK1PIlq8pxjAGxKwRm1tQiB7qPihapLMbC+3QEHZXW4jBJTAFWIsKKEI=
X-Received: by 2002:a05:6102:3e95:b0:45f:4e67:4423 with SMTP id
 m21-20020a0561023e9500b0045f4e674423mr15393245vsv.0.1701080673247; Mon, 27
 Nov 2023 02:24:33 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 27 Nov 2023 15:54:22 +0530
Message-ID: <CA+G9fYt0LLXtjSz+Hkf3Fhm-kf0ZQanrhUS+zVZGa3O+Wt2+vg@mail.gmail.com>
Subject: Powerpc: maple_defconfig: kernel/rtas_pci.c:46:5: error: no previous
 prototype for function 'rtas_read_config' [-Werror,-Wmissing-prototypes]
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>, regressions@lists.linux.dev, 
	open list <linux-kernel@vger.kernel.org>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Benjamin Gray <bgray@linux.ibm.com>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Following Powerpc maple_defconfig and other builds failed with gcc-13 / 8
and clang toolchains on Linux next-20231127 tag.

  build:
    * gcc-8-cell_defconfig
    * gcc-8-maple_defconfig
    * gcc-8-tinyconfig
    * gcc-13-tinyconfig
    * gcc-13-cell_defconfig
    * gcc-13-maple_defconfig
    * clang-17-cell_defconfig
    * clang-17-tinyconfig
    * clang-17-maple_defconfig
    * clang-nightly-cell_defconfig
    * clang-nightly-maple_defconfig
    * clang-nightly-tinyconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build logs:
-----------
arch/powerpc/kernel/rtas_pci.c:46:5: error: no previous prototype for
function 'rtas_read_config' [-Werror,-Wmissing-prototypes]
   46 | int rtas_read_config(struct pci_dn *pdn, int where, int size, u32 *val)
      |     ^
arch/powerpc/kernel/rtas_pci.c:46:1: note: declare 'static' if the
function is not intended to be used outside of this translation unit
   46 | int rtas_read_config(struct pci_dn *pdn, int where, int size, u32 *val)
      | ^
      | static
arch/powerpc/kernel/rtas_pci.c:98:5: error: no previous prototype for
function 'rtas_write_config' [-Werror,-Wmissing-prototypes]
   98 | int rtas_write_config(struct pci_dn *pdn, int where, int size, u32 val)
      |     ^
arch/powerpc/kernel/rtas_pci.c:98:1: note: declare 'static' if the
function is not intended to be used outside of this translation unit
   98 | int rtas_write_config(struct pci_dn *pdn, int where, int size, u32 val)
      | ^
      | static
2 errors generated.
make[5]: *** [scripts/Makefile.build:243:
arch/powerpc/kernel/rtas_pci.o] Error 1

steps to reproduce:

# tuxmake --runtime podman --target-arch powerpc --toolchain clang-17
--kconfig maple_defconfig LLVM=1 LLVM_IAS=0
LD=powerpc64le-linux-gnu-ld



Links:
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231127/testrun/21324129/suite/build/test/clang-17-maple_defconfig/log
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231127/testrun/21324129/suite/build/test/clang-17-maple_defconfig/history/
  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Yk9XaK95NuGJL9barjaXrOWxib/

--
Linaro LKFT
https://lkft.linaro.org
