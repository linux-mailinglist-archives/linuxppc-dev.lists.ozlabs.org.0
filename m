Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DB6686574
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 12:32:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6KXm16MBz3f5B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 22:32:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=au5gJa1i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=au5gJa1i;
	dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6KWr4tTLz3083
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 22:32:05 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 141so12299246pgc.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Feb 2023 03:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BBlFMphcYAKGu8ilzPr5Z81/fHgzzMqhp9aruKhD+k=;
        b=au5gJa1iq220Ld8ZF6MxmOrYAyHIOGCXtNmqgX/IMCnFlogzvvEwcW12Gdoi/Zax4k
         EZK1jbpR1vUuym1nFbHScy157/n2kdUnRl423j+ble5oXFtDeRU3QkG1MwWo9CmnEG1E
         e09TS3oWTWI+4YBxwdLunnsLQF0ecBi7y0LDKvlMpb+lQNgeDvrxPKJHDa7q93HkvERT
         QkcCo0so/Z8j7pBg0qAGliK7lAcyuTom7o5J/wre9d3SjwKYoKSDUIrtas5+bNKvETqz
         2sv86qfkJ0bmdj+bs7SO9TjUz739qXefSwj1W0jzG2Bo8I8xmjJzmk/9A54n4QzNpZya
         oTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BBlFMphcYAKGu8ilzPr5Z81/fHgzzMqhp9aruKhD+k=;
        b=yKyQGsYPTJl+ZFNqlp2m8LisQsew53gcfTMU3l8tseVzoKd4sVJWFJmNwk+C910Ws6
         mmP0/BatVYtWQqgIUkLPoHoKuPAOq7iy7LNZOXk7meR2TSFmB5ncUuxVLkfZ2caTaiO9
         wNU9wsUMUUQPr4WF9hivxpMLpGodRXtFdAAdcoMBwYYcm+8ukRzzeG9DQH73EH2AGV7E
         zifuw11JcgyHPlfbuWczPEjJcv3omxoyKYeO4aXWa/DTYevLBST6Wckeb4BE3vEKpNq/
         hYHNtrTo/IjbPnDHR9dyhB90kVr0HzCSzGMzq8EvOpS/VF2rk0FQJCNQLbXQ9uPtH/ur
         WsZg==
X-Gm-Message-State: AO0yUKWCmgmfCS1UcPDFn04xO8C4liEOtMYI0cg/6SalitlT5B4fzU3+
	diEGy/0rgUu5qQ5oUuQ/HDQ9Xw==
X-Google-Smtp-Source: AK7set+C0uPsa2mdXLmzGnjX/RqEqmB7QuIr0iNYXeo+TID3anmh3rbkC6bKeQcgcvGxz8S+AWYnxg==
X-Received: by 2002:aa7:8dd2:0:b0:593:3ab1:a144 with SMTP id j18-20020aa78dd2000000b005933ab1a144mr2006259pfr.12.1675251122558;
        Wed, 01 Feb 2023 03:32:02 -0800 (PST)
Received: from localhost.localdomain ([124.123.179.186])
        by smtp.gmail.com with ESMTPSA id y15-20020a056a001c8f00b0059260f01115sm10024336pfw.76.2023.02.01.03.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 03:32:02 -0800 (PST)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: christophe.leroy@csgroup.eu
Subject: [PATCH 1/2] powerpc/64: Set default CPU in Kconfig
Date: Wed,  1 Feb 2023 17:01:55 +0530
Message-Id: <20230201113155.18113-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy@csgroup.eu>
References: <76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy@csgroup.eu>
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
Cc: anders.roxell@linaro.org, arnd@arndb.de, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, nathan@kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>, pali@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Following build regression started from next-20230131.

Regressions found on powerpc:

  build/clang-nightly-tqm8xx_defconfig
  build/clang-nightly-ppc64e_defconfig


make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 tqm8xx_defconfig
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0

error: unknown target CPU '860'
note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, ppc64le, future
make[2]: *** [/builds/linux/scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
error: unknown target CPU '860'
note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, ppc64le, future
make[2]: *** [/builds/linux/scripts/Makefile.build:252: scripts/mod/empty.o] Error 1

    
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230201/testrun/14479384/suite/build/test/clang-nightly-tqm8xx_defconfig/history/

The bisection pointed to this commit,
  45f7091aac35 ("powerpc/64: Set default CPU in Kconfig")

--
Linaro LKFT
https://lkft.linaro.org
