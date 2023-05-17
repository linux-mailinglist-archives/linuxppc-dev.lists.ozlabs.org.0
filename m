Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B6F706A79
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 16:03:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLvwT1VWzz3f8b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 00:03:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HdfqFplY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HdfqFplY;
	dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLvvb60smz3cNY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 00:03:05 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-ba878d5e75fso476215276.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 07:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684332180; x=1686924180;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EnN81p2MeWO9EzOWTpebA/OMy7HtWZHmn+rKTFE9OqM=;
        b=HdfqFplYz7Qf9SanlMHtPvfRuEa8h8QgTs2pp24EwWfK02ZbEs06WnBq6Vi4ke8ALC
         Nu+AHv2FBCR+drvv6EuN666Wt/A5Vbd6xAnLElWstD7ALkee9Q05qV8GX5uhw6uhuuZi
         B4fBFopzSA1bGTqnA8XRDAxwWETprDKa4PpCCT/WD6+4Bu6UwY3NM5coNv8rZ1teGyAo
         voZ/fh6D1yfhCuJd5IlTu2kLKijc9Fwju3/gVrSdGdQfY85CWAkIoYQEgmPlOrQ6VZkk
         +AlktRzrpxoJa4kYyVQXkjwIJz1JbkoFm0dNwWSFMhfmf1JmMhZ34uqN+PWcYHxpY9Wj
         y2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684332180; x=1686924180;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EnN81p2MeWO9EzOWTpebA/OMy7HtWZHmn+rKTFE9OqM=;
        b=IPfSPNP0W1DYHLSFuTClfPiqI5kIBad4CRzVbs5roetXwdwmqgoP7eW4qYQEYS634P
         QDbJ1h4ZBoEVKS04sLxKcKowup8RFL5eJayNweSk5AUKmUaORqavAbF/Ae+0vc3fK5jv
         rn3Cf+yTZgy9OSU2h4GDumbP4QZaoR4tMQiSUvnHKaEpNW2x2IASGnGm/bcDoEyMRnb1
         dMSYduN2K6lJ9j9jwXQ26kBpBAHugiKqTE53WCKSLyR0lhI1RQUR13O/GDFF93pqq4K8
         Yd0+JqOlYZ0o/x6/tHZQOXT22l07GIIs+0pH4RvdUx4elRdH0H/ovkv6//VpqP1CXxD2
         ALzQ==
X-Gm-Message-State: AC+VfDwesMpuzYvempqSJwXs8xLNEHRohwa6E41d/ts70tb2/suIJ4f1
	U7DQibe7Xm+IGhZvzs980jXoX4fQ2ATAFExDHwD383SlDHXX+lt1pidz8w==
X-Google-Smtp-Source: ACHHUZ5ebL6rGP7D45jjjmqs/3K8SRxUe+aFYYf5yNPLUOHysTYfhtudOs1R+FMLsNcRKZaBP9DtvPGuDCjBp+f73xA=
X-Received: by 2002:a05:7500:e568:b0:106:ad71:fc05 with SMTP id
 rh40-20020a057500e56800b00106ad71fc05mr43929gab.73.1684332180208; Wed, 17 May
 2023 07:03:00 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 17 May 2023 19:32:48 +0530
Message-ID: <CA+G9fYsShNP=LALHdMd-Btx3PBtO_CjyBNgpStr9fPGXNbRvdg@mail.gmail.com>
Subject: next: gcc-8-ppc6xx_defconfig: ERROR: modpost: "__divdi3"
 [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org
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
Cc: alsa-devel@alsa-project.org, Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>, Nicholas Piggin <npiggin@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linux next powerpc gcc-8 build failed on Linux next 20230516 and 20230517.
 - build/gcc-8-ppc6xx_defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
====
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build \
  ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- \
  'CC=sccache powerpc64le-linux-gnu-gcc' \
  'HOSTCC=sccache gcc'

ERROR: modpost: "__divdi3" [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
ERROR: modpost: "__udivdi3" [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
make[2]: *** [/builds/linux/scripts/Makefile.modpost:136:
Module.symvers] Error 1
make[2]: Target '__modpost' not remade because of errors.
make[1]: *** [/builds/linux/Makefile:1978: modpost] Error 2


links,
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17031706/suite/build/test/gcc-8-ppc6xx_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17031706/suite/build/test/gcc-8-ppc6xx_defconfig/history/

Steps to reproduce:
=======
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

 tuxmake --runtime podman --target-arch powerpc --toolchain gcc-8
--kconfig ppc6xx_defconfig


--
Linaro LKFT
https://lkft.linaro.org
