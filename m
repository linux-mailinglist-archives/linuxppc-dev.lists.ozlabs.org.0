Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B78846E914C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 12:59:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2F5c401cz3fT0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 20:59:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SV6NOe5H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::929; helo=mail-ua1-x929.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SV6NOe5H;
	dkim-atps=neutral
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2F4l3zQCz3chx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 20:58:13 +1000 (AEST)
Received: by mail-ua1-x929.google.com with SMTP id a19so1908325uan.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681988287; x=1684580287;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OlkpqVPsMGBCHCwPiGXeltlqZgDhFYvIj0YwaJwjXcY=;
        b=SV6NOe5HXGojj8j858toAmnSCAUSPE+WaKKDGb4VN2CvbQQri0Qft/DJ2/u6BcgzIJ
         FP9KTi9YL+RDIsLWGjjdaTD+mwNxmS81RD6Kv75eL8QiZqvJ5D/5HnBNXxAXTWpzmD5c
         ByPMIyHMuAyJ2PH12t3+7r60A68vWdORNBRVkrNLSL1KjQ+L2dlt8PJyFucLhPNQ8EWe
         tL49nbKGktraXetVBfH1pqPCuS3fH/RauI+qN7JXAzO9XPUTml6aFgFtHD3g0hwqhatJ
         dvV4v0hO76lzr9KdIbk6DYwHAn2C52Ms8rtGrYA0V4HoCzc5ZL4rLxX9rgRVERyISyUq
         /CKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681988287; x=1684580287;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OlkpqVPsMGBCHCwPiGXeltlqZgDhFYvIj0YwaJwjXcY=;
        b=iGRP+5WuABszZFdxFso8SlPR3mjmqfMg2uS8Qg4OLuiz8VsoVPrYFL9ma+jN02OvFO
         HmGBkipJqYEPRTzrBiovCbL+1gyjWjneA0eC4kIQKjVtbioy/cP1/vg+WDoBA8YTsK0p
         IRVB+cfbdKjjO4Pl4+XhfqzG4kvQ+wegEeb+l7fFwe3sJ9Anz17KwZv2uRQuNb0HJxvp
         vvqYyL2+d//8inPDopwEBHu4irAlkzCHe9+OHOqd9++PQ4TrkSvI1WyRQk5IINPxj5WW
         TeabEepibxpMQugNiXrlLTD3gWrO8l1z8AP+gZU7+jCmMtqjt24njKAeCxJp261hjPSx
         WvFg==
X-Gm-Message-State: AAQBX9cJK32OjsVn70cUOPZ1pyy461D2LpDuACjekth/Ey5wU86biMv6
	GvtVzwatumDD3yOaP7iElzqD4NMq73zkvPuG4c1+vMceF4zMPCzdai8=
X-Google-Smtp-Source: AKy350b7fx0YW1+BNZLLBmYhRSGLKi7LfzgDknAEsvAl3PAP80GeDmOlnQyMN2RGFNnwI0N5D1wvi1oRdNQ/BUlwORQ=
X-Received: by 2002:a1f:4114:0:b0:443:e263:2dff with SMTP id
 o20-20020a1f4114000000b00443e2632dffmr377711vka.7.1681988287392; Thu, 20 Apr
 2023 03:58:07 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 20 Apr 2023 16:27:56 +0530
Message-ID: <CA+G9fYsdMioe4+DEgeh38aTeaY3YaN_s_c0GFjPHhuPWfxyetA@mail.gmail.com>
Subject: next: powerpc: gpio_mdio.c:(.text+0x13c): undefined reference to `__of_mdiobus_register'
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Netdev <netdev@vger.kernel.org>
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
Cc: Rob Herring <robh@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, ajd@linux.ibm.com, Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Following build failures noticed on Linux next-20230419 for powerpc.

Regressions found on powerpc:
 - build/gcc-8-defconfig
 - build/clang-16-defconfig
 - build/gcc-12-defconfig
 - build/clang-nightly-defconfig


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
--------
powerpc64le-linux-gnu-ld: arch/powerpc/platforms/pasemi/gpio_mdio.o:
in function `gpio_mdio_probe':
gpio_mdio.c:(.text+0x13c): undefined reference to `__of_mdiobus_register'
powerpc64le-linux-gnu-ld: drivers/net/phy/phy_device.o: in function `phy_probe':
phy_device.c:(.text+0x56ac): undefined reference to
`devm_led_classdev_register_ext'
powerpc64le-linux-gnu-ld: drivers/net/ethernet/pasemi/pasemi_mac.o: in
function `pasemi_mac_open':
pasemi_mac.c:(.text+0x19ac): undefined reference to `of_phy_connect'
make[2]: *** [scripts/Makefile.vmlinux:35: vmlinux] Error 1

Build details:
---------
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230419/testrun/16369015/suite/build/test/gcc-12-defconfig/details/
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230419/testrun/16369015/suite/build/test/gcc-12-defconfig/log


Steps to reproduce:
------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

tuxmake --runtime podman --target-arch powerpc --toolchain gcc-12
--kconfig defconfig


--
Linaro LKFT
https://lkft.linaro.org
