Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 752564758C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 13:23:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDZC80HYQz3cFf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 23:23:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y+eQK2rh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::534;
 helo=mail-ed1-x534.google.com; envelope-from=naresh.kamboju@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=y+eQK2rh; dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDZBV1NC3z306j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 23:22:24 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id y13so73727447edd.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 04:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=oSus18PkSQk7gaytbRQXd7Pr8Yd4R6m1hBQBrNUfHLE=;
 b=y+eQK2rhs+UjIgjo9x69K8aIQYOroKmJuPG1jDDKFceYUMCfHo6EmOe3EMcbHiyttE
 tqz2hYNwc/xY/rDNVE3WQUF11ihYsWNBzyEVHWwxszBhUWkH7msjY+ZCSibR8SQqnG+/
 e++mBzxIudYCY1s4bQ4oynQOnVMYbOYO9Vu/dbqZ/t3zRkMryKnE1uwbLe9pryRW0rtn
 cswMA13TK0ufoF/ziCW8GSKl4ecNRNE8F2kVlk4/DHYcqG+teXY0IBSS9NyNhInjkycg
 kcqXh0Gjl2lSdRrOT2pqAUaCju16VBsJhLNaYm2nnN/ohGpvTnuY0jloFd6N/j8dz1AY
 UOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=oSus18PkSQk7gaytbRQXd7Pr8Yd4R6m1hBQBrNUfHLE=;
 b=c5js2R+t+4XJ1Ashtii/qeHTqBL3ndHlJ754g2tHKOPS6+XVxoZXlL3fPz3WyttNgz
 z/zFGzMR2fI7Gi4NJwRCnMEcyTtedHDkDNxPk330wyUWjddbDMzoBEd8+lYg2BQkA+TD
 KK06dAWZ8JAwShHKeVJA3Lmi4X6lHiMJtyJfZXlr9hFF0NfrSIxbu3LBW3sP8jDtZjWa
 E5Q1pYX/RWfn5jTXTCcSUnf+JbvwqXxcpU9evLjSz+y8uJzVjrxdNroZmdZPqlD5INN1
 7cYoGbGA4hWJMZVuO2NgdQ1cGBS0JwjAI3tjwS6cvkHnBDAI5Ksyu1kz/Me7Xcii+/4/
 D2qw==
X-Gm-Message-State: AOAM531fBudd8ekj0nZSiGAVB2WYqrLSf88X/6Z+tRYCppNsBwfYKn7t
 Mt4LZpMyCjR4fXA7F4wSbxrR2EJjA3z8Profykayjw==
X-Google-Smtp-Source: ABdhPJy38NvrpRrwmbljzVqKw93QXJ7vvsNCwOQ8Hn0fVKX84lb8CHKTNhIy4Af2FXOEV/Puop9I4HxysphjKkl6Blk=
X-Received: by 2002:a05:6402:4312:: with SMTP id
 m18mr14249776edc.273.1639570937702; 
 Wed, 15 Dec 2021 04:22:17 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 15 Dec 2021 17:52:06 +0530
Message-ID: <CA+G9fYua-LEU7u3OA0=c8HnBjoU6WENh9Avc18GGLg8Dbf9ZAw@mail.gmail.com>
Subject: [next] powerpc: book3s_hv.c:4591:27: error: 'struct kvm_vcpu' has no
 member named 'wait'
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
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
Cc: Marc Zyngier <maz@kernel.org>, lkft-triage@lists.linaro.org,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ Please ignore this email if it is already reported ]

While building Linux next 20211214 powerpc defconfig with gcc-8/9/10/11
following warnings / errors noticed.

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=powerpc
CROSS_COMPILE=powerpc64le-linux-gnu- 'CC=sccache
powerpc64le-linux-gnu-gcc' 'HOSTCC=sccache gcc'
arch/powerpc/kvm/book3s_hv.c: In function 'kvmhv_run_single_vcpu':
arch/powerpc/kvm/book3s_hv.c:4591:27: error: 'struct kvm_vcpu' has no
member named 'wait'
   prepare_to_rcuwait(&vcpu->wait);
                           ^~
arch/powerpc/kvm/book3s_hv.c:4608:23: error: 'struct kvm_vcpu' has no
member named 'wait'
   finish_rcuwait(&vcpu->wait);
                       ^~
make[3]: *** [scripts/Makefile.build:289: arch/powerpc/kvm/book3s_hv.o] Error 1

meta data:
-----------
    git describe: next-20211214
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: 0bafb8f3ebc84525d0ae0fcea22d12151b99312f
    git_short_log: 0bafb8f3ebc8 (\"Add linux-next specific files for 20211214\")
    target_arch: powerpc
    toolchain: gcc-8

steps to reproduce:
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch powerpc --toolchain gcc-8
--kconfig defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build log:
https://builds.tuxbuild.com/22IPCvkz8z9pqpgCMPoNw7OstPD/

--
Linaro LKFT
https://lkft.linaro.org
