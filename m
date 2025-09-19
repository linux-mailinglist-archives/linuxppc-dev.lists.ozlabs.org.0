Return-Path: <linuxppc-dev+bounces-12416-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD82B89382
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 13:17:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSqjs36HRz2yQH;
	Fri, 19 Sep 2025 21:17:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758280673;
	cv=none; b=PD4OGQi1LSo4+XTUuji3R57wGgy8P3wNxLolWQo5ZnFLXA7/mv3NLiEh/IYoNoXVKWo5kY+JajcbIi3I3kh0Yuj7sdy/EQX5uPR3MLo31FRM0eCFxGJa7Ayro72rHXGA/RAjFRozeQRbfzjK9dzQwNJbSYKcpDbnkZ7wZIGqf3TgxJAtim4HGEz4SF9uSJM8IVuS9dPYU+I/Ny+59fr0ABWgwpLro8a9CKeXgGQkLDIa9Sfd50h/TEX8rXV3+GJaxZ65ECYvEf7sWqh+k7rOD43GcoRXXrTaoksUINum2YNt38QdhqVdsDwC2A9tsMMDoqFz6leunZCM8JLWv2rUfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758280673; c=relaxed/relaxed;
	bh=eDerpC/hGj1I1JP2YeLk+oYIfnI3gOZYfJE5cgP4y8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHLA8prCDVIZgoaTLvsoUPRpnXn6lmZnqs6UTFyU3vW+kCa0MoYDq6qYG+E2eUaF4k+r8S/MsUT8tg5sjY/Tx6M7UTCh4m+WhYIGxOEFS3EiukE9jdDzwdqLN9/IPmaW9LuWiTpPd3jcU7s/CgYO5ZkGEQz1IpxdfmcePDpYKNx2EwRzd11RLdHhyfqfW/myhIc0Ll1tCfrMVDRcVfA3rv/E96+yYiXJ+MAu+LSf87d/GUgmcqC8yDBxhfyezUIPABdBdAZb+qdzuEwiI4Vvypu0AGeVyscPZmcy7l/8dOUOqkiIRVqv1QB6ewUmOSeTxXd7lGrUXmKz2DwZBrGzzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xyWgVIxj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xyWgVIxj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSqjq4pfMz2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 21:17:50 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so12272565e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758280666; x=1758885466; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eDerpC/hGj1I1JP2YeLk+oYIfnI3gOZYfJE5cgP4y8I=;
        b=xyWgVIxjgX4sHtXMUhxpgTk6z206gvIi/ir5MdQCqgHRz2mDHDrhfQXQUjXJAnl18g
         tdSeRCSm6U5bBWOEsyk7yQDxpV2EceoQC5Y/uI/cFfUH2GKgR6UynMO+3VdZ9C3aE6o2
         sA4M3fQg1fK7NfyiGczGInLw5ld3qN5THlqA8PzmTT+b6djwepk/uFfuqGYmLsr03WRZ
         bB3taxghs+fQb4wOyFA/sYhJogP5ljaxe6TdWKfx76Q49To+XyeiuuIdsbzzQ5ugtRdn
         uh59ZnLyBqzOCsQFqPRNg4elHnoIL53ofeS96r9na2WruPvlOaIXMlpBjMYqXxD4mY94
         9jpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758280666; x=1758885466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDerpC/hGj1I1JP2YeLk+oYIfnI3gOZYfJE5cgP4y8I=;
        b=pnjxGjL1aGBLqfTSZ016bUhCMkSBCVO/bleHhnuFgZW+1qXIknmTtfiOHuRjCtv1OH
         bnkakV40F/0aCTPAQX1B1hvJPUll5zz9ooIMp5M+ln69xab16EtYZK+UbG5ecv97eQin
         H2sJ2sPRJSCRWbP5SF6tIQ7nqjOO4C4C8r8uf/eiSXMPG53OXa4O5J1jy9oJkTeuJeBu
         8vC6Ezqan9uoS27JlSzESlUxRziiiuZmeXRnsw1CFhBOiC3wXXQGSy87CLprx11k/wwY
         1uGj7HbL73rNFl8Lq4LY0REqkr+UP7Kes50gynZwQ8u8svUR3EsKHBHfCHZBoTQ0oQi4
         hHQw==
X-Forwarded-Encrypted: i=1; AJvYcCXDVKKNTLxhbuZvRNCyeMHHuzZoVOupL81iW+byRGWwv0UUiod3ak5XD3anLfwHM1HsbYqaW9e4KOQYIXA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxXW6KoNUqByvDOG/gOC5PVG8nQXqCPa9o5E+CjS4yL7C6GiKbO
	rCLPrsGfdj3nqe5S9QnTqBG2Digh3RQfAB2o2BWXAXYbUbCwfC0dLwQhxJU6stuRimY=
X-Gm-Gg: ASbGnctjiF3ioDaSRxi6IhmqKaEKKbRW5XaGO18xk6EndsNNkfuVOjsJc92fOO5f+jS
	n6CGvK6OTP3auAvcTQaEEU/WmmJbg1sjzbJDREIjfzyiqjGoxqnD9dCZOSpi1xHYX5MSXtmEfBD
	gBQp1657tAnSpPJlpfm5OtiD3hBeJb7j8uPhdIRsfYkFcHB5NkwJFCGmkJSbr5SDveMUuesGvUR
	STrSD8K2akKFrNvxSpFtkK5N4nVURlZCO2XYjVWsEZHcywpsbu3lOsfYoWY02IbfAPU9dgfn6sS
	TvM3IjREflZzyD4Hvd8G0nAMn1Lj+EEAYjRXQxSpDqMD7bZj4GQL5HFHEX3n5jr15lRe3sOLc0M
	gNwczbUIPwiyaHLNB1L6oy36CMmxh
X-Google-Smtp-Source: AGHT+IH4gxNBOMIcJl992YlFV2alD3mXRT7VpkhmEEkUDus9PLr63vvEj+3tCpbtSb6dagydt/CQiA==
X-Received: by 2002:a05:600c:1c01:b0:45d:d9ab:b85a with SMTP id 5b1f17b1804b1-4684c1486abmr21513285e9.7.1758280665777;
        Fri, 19 Sep 2025 04:17:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-461eefee9f3sm119301495e9.1.2025.09.19.04.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 04:17:45 -0700 (PDT)
Date: Fri, 19 Sep 2025 14:17:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: clang-built-linux <llvm@lists.linux.dev>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>, lkft-triage@lists.linaro.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: clang nightly builds failing on PowerPc
Message-ID: <aM071XHb5cppdEKK@stanley.mountain>
References: <CA+G9fYsJq0sPC+q6vLNKUgBqCGmmjDrfeP4R1-95Eu28FJRY_A@mail.gmail.com>
 <20230612185424.GA2891387@dev-arch.thelio-3990X>
 <CA+G9fYtX6YNqmz9vxJxa5cA5Uf2rr=RNM0nkoTzRpg79Azp2tA@mail.gmail.com>
 <CA+G9fYvmqz3nQ=Cgs=7J6vtRj=OhbNzgkLPmxxN+vOBTU=9zVA@mail.gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvmqz3nQ=Cgs=7J6vtRj=OhbNzgkLPmxxN+vOBTU=9zVA@mail.gmail.com>
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URI_HEX autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi the Clang nightly builds are failing on PowerPC with the
ppc64e_defconfig.  They started failing on Sept 11.  Clang is failing on
PowerPC in both linux-next and stable so it seems like something changed
in Clang and not the kernel.

Unfortunately I don't have ready access to the /tmp/vgetrandom-fef220.c
file that was generated, but hopefully these logs are enough to reproduce
the issue.

regards,
dan carpenter

tuxmake --target-arch=powerpc --kconfig=ppc64e_defconfig --toolchain=clang-nightly --wrapper=none --environment=KBUILD_BUILD_TIMESTAMP=@1758237451 --environment=KBUILD_BUILD_USER=tuxmake --environment=KBUILD_BUILD_HOST=tuxmake --environment=KCFLAGS=-ffile-prefix-map=/home/tuxbuild/.cache/tuxmake/builds/1/build/= --runtime=podman --image=855116176053.dkr.ecr.us-east-1.amazonaws.com/tuxmake/powerpc_clang-nightly LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld config default kernel xipkernel modules dtbs dtbs-legacy debugkernel headers
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld ppc64e_defconfig
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld
fatal error: error in backend: Cannot select: 0x60f13bcf8910: ch,glue = PPCISD::CALL_NOP 0x60f13bcf5e70, TargetGlobalAddress:i32<ptr @__arch_chacha20_blocks_nostack> 0, Register:i64 $x3, Register:i64 $x4, Register:i64 $x5, Register:i64 $x6, Register:i64 $x2, RegisterMask:Untyped, 0x60f13bcf5e70:1
  0x60f13bcf5e70: ch,glue = CopyToReg 0x60f13bcf8750, Register:i64 $x6, 0x60f13bcf5cb0, 0x60f13bcf8750:1
    0x60f13bcf5cb0: i64 = zero_extend 0x60f13bcf8600
      0x60f13bcf8600: i32 = srl 0x60f13bcf8280, Constant:i32<6>
        0x60f13bcf8280: i32,ch = CopyFromReg 0x60f13bc01ec0, Register:i32 %43
    0x60f13bcf8750: ch,glue = CopyToReg 0x60f13bcf6490, Register:i64 $x5, 0x60f13bcf8440, 0x60f13bcf6490:1
      0x60f13bcf8440: i64 = zero_extend FrameIndex:i32<0>
      0x60f13bcf6490: ch,glue = CopyToReg 0x60f13bcf8590, Register:i64 $x4, 0x60f13bcf69d0, 0x60f13bcf8590:1
        0x60f13bcf69d0: i64 = zero_extend 0x60f13bcf5bd0
          0x60f13bcf5bd0: i32,ch = CopyFromReg 0x60f13bc01ec0, Register:i32 %3
        0x60f13bcf8590: ch,glue = CopyToReg 0x60f13bcf6960, Register:i64 $x3, 0x60f13bcf68f0
          0x60f13bcf68f0: i64 = zero_extend 0x60f13bcf8520
            0x60f13bcf8520: i32,ch = CopyFromReg 0x60f13bc01ec0, Register:i32 %44
In function: __c_kernel_getrandom
clang: error: clang frontend command failed with exit code 70 (use -v to see invocation)
Debian clang version 22.0.0 (++20250917082822+6c8fcd6089b9-1~exp1~20250917203011.86)
Target: powerpc-unknown-linux-gnu
Thread model: posix
InstalledDir: /usr/lib/llvm-22/bin
clang: note: diagnostic msg: 
********************

PLEASE ATTACH THE FOLLOWING FILES TO THE BUG REPORT:
Preprocessed source(s) and associated run script(s) are located at:
clang: note: diagnostic msg: /tmp/vgetrandom-fef220.c
clang: note: diagnostic msg: /tmp/vgetrandom-fef220.sh
clang: note: diagnostic msg: 

********************
fatal error: error in backend: Don't know how to emit this value.
make[3]: *** [/builds/linux/arch/powerpc/kernel/vdso/Makefile:91: arch/powerpc/kernel/vdso/vgetrandom-32.o] Error 1
clang: error: clang frontend command failed with exit code 70 (use -v to see invocation)
Debian clang version 22.0.0 (++20250917082822+6c8fcd6089b9-1~exp1~20250917203011.86)
Target: powerpc-unknown-linux-gnu
Thread model: posix
InstalledDir: /usr/lib/llvm-22/bin
clang: note: diagnostic msg: 
********************

PLEASE ATTACH THE FOLLOWING FILES TO THE BUG REPORT:
Preprocessed source(s) and associated run script(s) are located at:
clang: note: diagnostic msg: /tmp/vgettimeofday-43498a.c
clang: note: diagnostic msg: /tmp/vgettimeofday-43498a.sh
clang: note: diagnostic msg: 

********************
make[3]: *** [/builds/linux/arch/powerpc/kernel/vdso/Makefile:89: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
make[2]: *** [/builds/linux/arch/powerpc/Makefile:388: vdso_prepare] Error 2
make[2]: Target '__all' not remade because of errors.
make[1]: *** [/builds/linux/Makefile:248: __sub-make] Error 2
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:248: __sub-make] Error 2
make: Target '__all' not remade because of errors.
rm -rf /home/tuxbuild/.cache/tuxmake/builds/1/build/modinstall
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=/home/tuxbuild/.cache/tuxmake/builds/1/build/modinstall ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld modules_install
make[3]: *** No rule to make target 'modules.order', needed by '/home/tuxbuild/.cache/tuxmake/builds/1/build/modinstall/lib/modules/6.17.0-rc6/modules.order'.
make[3]: *** No rule to make target 'modules.builtin', needed by '/home/tuxbuild/.cache/tuxmake/builds/1/build/modinstall/lib/modules/6.17.0-rc6/modules.builtin'.
make[3]: *** No rule to make target 'modules.builtin.modinfo', needed by '/home/tuxbuild/.cache/tuxmake/builds/1/build/modinstall/lib/modules/6.17.0-rc6/modules.builtin.modinfo'.
make[3]: Target '__modinst' not remade because of errors.
make[2]: *** [/builds/linux/Makefile:1917: modules_install] Error 2
make[1]: *** [/builds/linux/Makefile:248: __sub-make] Error 2
make[1]: Target 'modules_install' not remade because of errors.
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'modules_install' not remade because of errors.
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build INSTALL_DTBS_PATH=/home/tuxbuild/.cache/tuxmake/builds/1/build/dtbsinstall/dtbs ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld dtbs
rm -rf /home/tuxbuild/.cache/tuxmake/builds/1/build/dtbsinstall
mkdir -p /home/tuxbuild/.cache/tuxmake/builds/1/build/dtbsinstall/dtbs
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build INSTALL_DTBS_PATH=/home/tuxbuild/.cache/tuxmake/builds/1/build/dtbsinstall/dtbs ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld dtbs_install
tar --sort=name --owner=tuxmake:1000 --group=tuxmake:1000 --mtime=@1758237451 --clamp-mtime -caf /home/tuxbuild/.cache/tuxmake/builds/1/build/dtbs.tar.xz -C /home/tuxbuild/.cache/tuxmake/builds/1/build/dtbsinstall dtbs
rm -rf /home/tuxbuild/.cache/tuxmake/builds/1/build/install_hdr
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build INSTALL_HDR_PATH=/home/tuxbuild/.cache/tuxmake/builds/1/build/install_hdr/ ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld headers_install
tar --sort=name --owner=tuxmake:1000 --group=tuxmake:1000 --mtime=@1758237451 --clamp-mtime -caf /home/tuxbuild/.cache/tuxmake/builds/1/build/headers.tar.xz -C /home/tuxbuild/.cache/tuxmake/builds/1/build/install_hdr .


