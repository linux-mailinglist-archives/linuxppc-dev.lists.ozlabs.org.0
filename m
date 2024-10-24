Return-Path: <linuxppc-dev+bounces-2547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 702009AE9C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 17:05:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZ8Ns0MPMz30PD;
	Fri, 25 Oct 2024 02:05:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729782332;
	cv=none; b=k1TdxK2mZyQNZacYnypYQF/nrJ4Os8lUn1w06fqsofEB3vtL8nWR0ajPvjX5n1X78dRnFcbYuxxIF0fE+nqMlekgdFZTWTFo2I3dnn+RiINEjaaQDhhYRI0+fzDlYKsOOT63toTBMJqW5CT0W5Pp4a3yy20U5UdzIH9CtlrS2omBYf65L4I/Wiq9tjxzBaca+jpeyg2FKOMGjuzbTqdr5QJliur38iXHVbuAp3Zr0wusCMgzWqkHTBkL0Bu/c9I6zKoIfM4bQW2ifXAz+jHa2+7XifeSwSzAtUsAzbUBQk6mZq2A41Cjya6g/OySzqEbyr7R/nskFBgLsdVfaDnUWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729782332; c=relaxed/relaxed;
	bh=jyarlQ6i7toXdr4KNns6qkdDvM4HB4Mkf28BveorRBE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=U3OYOjT6T40ZLQZs9nYoDe5K8EseeI8rzzXB80V4ksqHa5JVoNi6di1/krzeIoobIHOlDBJozZvkBG/98bcG1EGO7aNOQUR0KsEhDkztzHmi8jZM6MNr5tVYjHrVqpJo7sf3eEePI9eS2P2QtPcMeUwdaftQ+9HKn9CyIDloVMdXuLNIG1A2ptyv1qmlxKxK9rZkTy/n7ZOIInP+Okak1w4X1fdVV/if5bmP9m/8Qzb4qviD/axqx027oxk/Y2dav3T7SVBEnl8ERFGq1WRf1x0aVpKrpPv9Ua2kWS3PU+4ElgvkQ5lHRQmw3kLGd/zcnlKAbKA328ml6p03o0heSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A300j6Z5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A300j6Z5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZ8Np6Fjkz2yj3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 02:05:28 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7180c7a4e02so609993a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 08:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729782323; x=1730387123; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jyarlQ6i7toXdr4KNns6qkdDvM4HB4Mkf28BveorRBE=;
        b=A300j6Z5BN9NOCy+6NEQWSTX1kdRXkjV9k1XNKpm4ZQc/zOejaRrU/mHrqauSfyUZS
         BgG6ZxxXUDPV/5YXyCbaYYEpXxMPGXTk4yU8NymZW36MA7n0dMzudsbwEmjbHTY1e+l+
         3BdK6YsLzM+cPwGCQtpY4X8SKLAnMOs4vyUCRvE+BinENrq9P1ABb7SdahAsr9mT7xOn
         72+BRk2uH1PT219oId2ulEfLoVoJ/+XEsIRbx3/JDAUqMs4kor8acTczn7Z2NCaFyHbq
         NhvbK6afY58OplDcJCHw8oi5oLlqt3ymSEA/5dWuwvzyc2gb31TatMVmsmWKnWVwB2D4
         JWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729782323; x=1730387123;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jyarlQ6i7toXdr4KNns6qkdDvM4HB4Mkf28BveorRBE=;
        b=KHDhl159OhBvQsbY7M7KVNQhueWneUyazExyNvp/9jrM44lPPrb6hQqklO4fsVRTM9
         yzzTneissgVn5GuHFNnDIpT/fxrV8HQI3P5vbPzpH+BG1QUQLmG2aXYHLkZdPAWY4MMu
         l8FYxFl5GpU44pop29ZFto8lYAF/zWPZHpfbgxK0KY/t+SqaLXyJXuYwTMja1hWmvn1q
         RdAuLPpyjk2HourLPb/eGr6rh9i9DfLsJh2LTufUs0WlLYRmTh046kea6F83cFvoHmqa
         xLhA32DbML+uEYXd/UzcVk4xBAqoo1cbuXno1y8+i6vM+12NMDT9jymsjbah8ROGU9AL
         g9hw==
X-Forwarded-Encrypted: i=1; AJvYcCWaXxdqqtCYx9T6h7LE+ZVNTi5r/5Exzf5baDcPQOdb/DkkBUg1DK3csDhU6IB+3Bs04gl7Gkwecx62RXE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyUveCiPvLQKM5sXIVA8Y3vi0hjn8A+gwPrp9f1zrLrhJNfhbyW
	BnGKfnhJb4LRbSicB94dnB1Usx7DrxQi0dsKcrT/uvpnCxhwGKvu+nwAU2tCfCOMtRxJgSTVBg0
	NIQaaxHZ3o4Z1U8aF7qdHS17TJPrl+UXicE8IWQ==
X-Google-Smtp-Source: AGHT+IEnz1GyTZlftdGpHX3jgxo2wK87KPVx/FAo2DYee8GCdaaTRp24nxaWxYg0SRPKd77LClU0CJyCAJ3uZe9macc=
X-Received: by 2002:a05:6808:180b:b0:3e6:769:b042 with SMTP id
 5614622812f47-3e62cbe6ef9mr2185584b6e.29.1729782323029; Thu, 24 Oct 2024
 08:05:23 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 24 Oct 2024 20:35:11 +0530
Message-ID: <CA+G9fYs2G_4jyv-V7f85oE53rw5rX0Tnf2V8RQ=O9CuPcbfb2A@mail.gmail.com>
Subject: powerpc: clang-nightly: fatal error: error in backend: Trying to
 obtain a reserved register "r2".
To: clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The powerpc clang-nightly version 20.0.0 build warnings / errors noticed on
the Today's Linux next-20241024 tag.

powerpc:
  build:
    * clang-nightly-maple_defconfig
    * clang-nightly-tinyconfig
    * clang-nightly-tqm8xx_defconfig
    * clang-nightly-mpc83xx_defconfig
    * clang-nightly-defconfig
    * clang-nightly-cell_defconfig
    * clang-nightly-ppc64e_defconfig
    * clang-nightly-allnoconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build errors:
----------
fatal error: error in backend: Trying to obtain a reserved register "r2".
clang: error: clang frontend command failed with exit code 70 (use -v
to see invocation)
Debian clang version 20.0.0
(++20241023112211+699ce16b6284-1~exp1~20241023112229.1038)
Target: powerpc-unknown-linux-gnu

metadata:
----------
kernel: 6.12.0-rc4
git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git_sha: fd21fa4a912ebbf8a6a341c31d8456f61e7d4170
git_describe: next-20241024
Test details: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241024
config:  https://storage.tuxsuite.com/public/linaro/lkft/builds/2ns7sv9TltSifV46KaGs3BxlB85/config
download_url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ns7sv9TltSifV46KaGs3BxlB85/
arch: powerpc
toolchain: Clang-nightly (version 20.0.0)

build log link:
------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241024/testrun/25530243/suite/build/test/clang-nightly-defconfig/log
  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2ns7sv9TltSifV46KaGs3BxlB85/

steps to reproduce:
------
# tuxmake --runtime podman --target-arch powerpc --toolchain
clang-nightly --kconfig defconfig LLVM=1 LLVM_IAS=0
LD=powerpc64le-linux-gnu-ld


--
Linaro LKFT
https://lkft.linaro.org

