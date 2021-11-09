Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E625944AE78
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 14:08:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpSwW6Jwqz2yK3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 00:08:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CuUtxJN4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::529;
 helo=mail-ed1-x529.google.com; envelope-from=naresh.kamboju@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CuUtxJN4; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpSvq4mY4z2x9g
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 00:08:04 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id f4so76115096edx.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 05:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=z/G52I1JExpiE6TsSsLB/EzgZR9OB61hQ9ixNpsTNBE=;
 b=CuUtxJN4kwqiRiUowjq6mEvwrxbwdABBDFwboec9BwfBBdNKP+Sd0FJQ2oNClGFe3j
 6hsijBoQm6PVzx6rpcsIRMF5nRChEyRXjOnRF7zObCZ9zs4W8FYbDC3TqL5MdAIVjBzo
 milLxaXzmLHeJMIuFzf6v9W2QcdoPHr5bOLCBxuINtH/rYcVZXYJ7/O9um2gEGlnmlV4
 i4JxLxE1na3/h7vZTOWyGhLU1UZddywmHh87pC7KQNPyFcMH50nZ1Q6NqNgMMVnb6Bun
 0Qa1yfv8qDXSQfGhd6TknCcoLaUoj/aqjFVp02cArCjNPQuuLnPq24D2oN+Dyssuf2+L
 cPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=z/G52I1JExpiE6TsSsLB/EzgZR9OB61hQ9ixNpsTNBE=;
 b=oteLsBVA/0h6kOh3RBWNDo+C2YjnP7pG7eZptb0ly4IlqfmkHV9WPbQbaWAQIiWIc/
 Sx2VzTBVWZBo0DF4GJo+xuzz72ESiEscWTlAXKP1PcvY5CCus5ZVpKm2UsJ8kVSS8SWl
 Z7UNTpNeCQFZAQzoQTv1Dza/dmgQOttosQTdwgFbetTU7gEznxeMbXo+fhPWYWpXdjr6
 +Uy4rITtf7t7e9w9O+zGPXlwWdoZrvlxM/yny6zqbn+Gi7PjK/MNjokObIgB9aWL+6LV
 Q8Kn9Vng74RFmqMggGA+zlGo37bRan7xMA/ySEud/IOJZYmJlCWh/gjAxPUOV7jElUn6
 xn1w==
X-Gm-Message-State: AOAM53233XJOQGC4L8/thLeZRR/VghNwtsNqVgW/FE8DE6grV0fUtB02
 0qGsqFHSpZOQNmBIf67/A/tX77VJNt/d85U+DnIUZQ==
X-Google-Smtp-Source: ABdhPJwUTCxSCo1QVtNs5QZJ4bfRcHmVDxVbWaA72k99Wgx4nF22yhg3NcwJ+sONSsC0fGX1HlPTvHTRROvNktdXjz4=
X-Received: by 2002:a50:e184:: with SMTP id k4mr10018486edl.217.1636463280343; 
 Tue, 09 Nov 2021 05:08:00 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 9 Nov 2021 18:37:48 +0530
Message-ID: <CA+G9fYvviLKpT7a-1ZDmVp8YN8cCG0ixLpxv2uSubtsw-CkZCQ@mail.gmail.com>
Subject: powerpc: mcu_mpc8349emitx.c:189:13: error: unused variable 'ret'
 [-Werror=unused-variable]
To: Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>
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
Cc: Scott Wood <oss@buserror.net>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Anders Roxell <anders.roxell@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Please ignore this email if it is already reported ]

Regression found on powerpc gcc-8/9/10 and gcc-11 built with ppc6xx_defconfig
Following build warnings / errors reported on linux next 20211109.

metadata:
    git_describe: next-20211109
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_short_log: c8109c2ba35e (\"Add linux-next specific files for 20211109\")
    target_arch: powerpc
    toolchain: gcc-11

build error :
--------------
<stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [-Wcpp]
arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c: In function 'mcu_remove':
arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c:189:13: error: unused
variable 'ret' [-Werror=unused-variable]
  189 |         int ret;
      |             ^~~
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:288:
arch/powerpc/platforms/83xx/mcu_mpc8349emitx.o] Error 1
make[4]: Target '__build' not remade because of errors.
make[3]: *** [scripts/Makefile.build:571: arch/powerpc/platforms/83xx] Error 2

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build link:
-----------
https://builds.tuxbuild.com/20fICxLPRCpcISasoGwKGICBELv/build.log

build config:
-------------
https://builds.tuxbuild.com/20fICxLPRCpcISasoGwKGICBELv/config

# To install tuxmake on your system globally
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch powerpc --toolchain gcc-11
--kconfig ppc6xx_defconfig


--
Linaro LKFT
https://lkft.linaro.org
