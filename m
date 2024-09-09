Return-Path: <linuxppc-dev+bounces-1193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B2F9724A6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 23:47:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2gR92z6vz2yNn;
	Tue, 10 Sep 2024 07:47:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::a2e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725909966;
	cv=none; b=CFKTjT8RnoOadllkS+f+nnwl+ZegkHkVZvG7LwQMKR4NDiCuveLLT1bx/lMaahqbhY325T8WezkLPoN7UuhGFaqo3AM9LdxsEbzDBMREzVKW6/GCQbuia/bswMQyYiBBzq+ifVnCHTqlZhJoBGDN178PNS67KvSQmvKfAHCZuyDYMS7iPfOlrnl3aWV3s6zFwjs7lim5vTz9vkuu5OTR2j64NsdmbQ2XTO9Hi5jiI/nH7GPmKkwRvgy4eFxXQwuaiPN90WlgLiXzVg5zXjDcr5MdDGY9HpP551IhMQWouN5XWw6F4F/eiEZfKf88nhHK2+OYlByb4seoC08yhuukPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725909966; c=relaxed/relaxed;
	bh=pBpee4AHaJe65pM2kNypO8RGjnF5LmfGxGgPOtmOqKo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ul4isax5kJFzImipBfAfi5Od1/ZMLHkod41Yz2M81sS7v6xHl1tjuI9QzR4ap6jcYI14E8FtPgItuM8npwTIfmL9pwgG00RFcZpxTXYYClVfsqQxgNQfYfmLuagicUeSj8u9+GyICtGan4iBf/uJKvA0N+eyLnS4GBghgChDwcGSwrLVcrHg/+lxHvg5yweQ/p6aoVs8AUdELaVqIOagKDXGtWiwekBfjj8PH5T9slBr/l0hPK6/JuwbucnWveJUSUw9HKAXbOA5e3EqVV+YpkSayMTrwdywmKqixOQhgUKN5Gtfnqf3UyDP7duPcnlKPLrvSXxh3xUltelUbJNjfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=d7PS8HVm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a2e; helo=mail-vk1-xa2e.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=d7PS8HVm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::a2e; helo=mail-vk1-xa2e.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2cJF2pYmz2yK9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 05:26:02 +1000 (AEST)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5011af33774so1494706e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2024 12:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725909960; x=1726514760; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pBpee4AHaJe65pM2kNypO8RGjnF5LmfGxGgPOtmOqKo=;
        b=d7PS8HVmQQ2zu16NXSiZlFtiKmRWih5r5NqjbGLMSXipIPb8Bpfs54q5WZ7Rccx1k6
         D9LzQwxgh/PZt2BcXIUijO1+WUxknBRL0SjJJs3YJqBYrRHe/3p5iylxCCXCRXi6zW2V
         ev6g/A1mAZ3C1ZpKGBD+5GGC7gszd7Mo3+7Ipy2bfSFeYXcN42VEMRa8UYwx6nYPb+QG
         GVuHQeK/M3g7jHxhmDSXn2IyYZNUVhsRDkAWKYnASgJrzU1SZtSuBrexChIxnO31DlPF
         KdZaNwSJeEfvNwBxtI3u50AICuclQ6FBarYF2/VjgBniDFzSCw4Ywrcz9QR0h5n9kU8u
         LOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725909960; x=1726514760;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBpee4AHaJe65pM2kNypO8RGjnF5LmfGxGgPOtmOqKo=;
        b=YhSbE1bqHTodRax3iOJ1LpQP+uBsrsDaxYEVwA7Uq1101NO/hoveSSv5WZMvGPpBbN
         FX68cScJFlQv8RA/HbIm0I0aIqUNQEChe5bqNXGMburx+jgx++aMC8k1mcEDcL7oATRZ
         MIGwBff9Kzc6pbAOk9XZQuPkjnhoL0fuOE9tK/VV/Ui4dAMochpaIw1Y4rRf3Y+jKk3C
         x0y/WumNpEp6YLQ6PlzAtUHtpr2vr1EXLC5hIT9ajSYmQdiK9Wdjz3NEh5TNIC0UHeim
         o6hNiSaMrWpK697YPYj1eI3hNqNDFEEEDNMwr3Kx7WRTP5eq0ajr/iItBMkB5isHCWrO
         uqGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSrGK4f8Ezr7Xnrvby7c4ZMiMp03cCa8+7A9gpQKUcAaG4PNRd7iglG5MC+AQmPvgqYEgrOUu7bchluA8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzXB5WxBjKWA7KxEmgHA2rBb2E4hVbUtlR8h7PYfopotE0/9Kw/
	Y58mvEUYMCp9L6zz7hqqTepekfG7l1YieTlAGDR39QDpaYV2j321PsX6tNcfCImgYXelTRRXqBX
	3tInHNySuoffheAyP2V7Jwqb8Q4W8Jhk5X973Kg==
X-Google-Smtp-Source: AGHT+IEuduoGf6I4eJ+GJljoEMZ5wo3n99jpHThb2kz/K2C5nP569Myd6UaP/RNPBRmaqTmAcfa+nDK0fFyCJafEFIg=
X-Received: by 2002:a05:6122:168d:b0:4ed:145:348f with SMTP id
 71dfb90a1353d-50220c7bb1emr14141759e0c.12.1725909959674; Mon, 09 Sep 2024
 12:25:59 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 10 Sep 2024 00:55:48 +0530
Message-ID: <CA+G9fYvG3Tv-Gk6f6oSTuY4=sJWMcF5oRc9Qe1otFvetysm4zw@mail.gmail.com>
Subject: No rule to make target 'arch/powerpc/boot/dtbImage.ps3', needed by 'arch/powerpc/boot/zImage'.
To: open list <linux-kernel@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, naveen@kernel.org
Content-Type: text/plain; charset="UTF-8"

The Powerpc cell_defconfig and mpc83xx_defconfig builds failed on the
Linux next-20240909 due to following build warnings / errors with gcc-13 and
clang-19.

First seen on next-20240909
  Good: next-20240906
  BAD:  next-20240909

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build log:
--------
make[3]: *** No rule to make target 'arch/powerpc/boot/dtbImage.ps3',
needed by 'arch/powerpc/boot/zImage'.
make[3]: Target 'arch/powerpc/boot/zImage' not remade because of errors.


Build Log links,
--------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240909/testrun/25078675/suite/build/test/clang-19-cell_defconfig/log

Build failed comparison:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240909/testrun/25078675/suite/build/test/clang-19-cell_defconfig/history/

metadata:
----
  git describe: next-20240909
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git sha: 100cc857359b5d731407d1038f7e76cd0e871d94
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2lpXzh3wwbuC6nYpMV2nPNA0IpF/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2lpXzh3wwbuC6nYpMV2nPNA0IpF/
  toolchain: gcc-13, clang-19 and clang-nightly
  config: cell_defconfig and mpc83xx_defconfig

Steps to reproduce:
---------
 - # tuxmake --runtime podman --target-arch powerpc --toolchain
clang-19 --kconfig cell_defconfig LLVM_IAS=0
 - # tuxmake --runtime podman --target-arch powerpc --toolchain gcc-13
--kconfig mpc83xx_defconfig


--
Linaro LKFT
https://lkft.linaro.org

