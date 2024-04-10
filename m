Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAC08A0382
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 00:44:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fIlwW7LO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFHvK5sBTz3vZn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 08:44:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fIlwW7LO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=thiago.bauermann@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFHP56bXRz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 08:21:44 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e4149e7695so29262825ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 15:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712787702; x=1713392502; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQ9C1Cr3AvASEU86K/hlf2OO0iCRrNUVuyjVHdlWHE4=;
        b=fIlwW7LOrKsC09Jz2jUCwPn5ae6W+giD8ds4cCx6PGhQY0rmBy+7/3+C4TnqUBcvwf
         fgiWl2G7DM6ynZkqckho9GxhZrl2+J9AEtdLLn3DIrOVhe1bnDDTERL2AsKARxloa27G
         SUUBSGz7S6OSLCO28mCJTTxwksxnJ5unoRneo3GqGUYdwg+O7CA+JVNen13Z1r15vHTx
         dwz4IDN1znAvo/t/SXIvxZWyf47McRGCTWwU3VQ9bZGyQjkA6qE/K9RJjnJgjax0+2MC
         +aFpvIXNgt99esBAjz8z/PZR9gzhzJDBLpF6eE7MXYqJ7VM6iR1TYWOGzHD51yEwk9cs
         1JFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712787702; x=1713392502;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UQ9C1Cr3AvASEU86K/hlf2OO0iCRrNUVuyjVHdlWHE4=;
        b=tUkp1zv74wnmtVUGSkfKA7GHjtwdsoR/fhuBkRvt9WwtOgHzDMj+bbwAqvtxi5zTPM
         WmnCkx6nOJ1yLHcCA4wTE3M88aFsYST8/58tvXoStJCJiy+yzdLKtvnrjNPVofGk+k0o
         yHf9xGvslJSpf+XmkXzIeTrTga9IKppqNlANlQIbaPu2HP47OB9+Bpjkz/fE+dNBsGne
         T1Ee/4ffeGHAnUR+B5gTl9uy4Ei3qv38lZWhS9QDHJky2I+Ml+cBs5L+80CFtKqIR7dW
         FKPPJKtfU7E5YM1bCka9QQzDX7Yna8Zzj4K2iAVytZtDZ904E2Vi6DysVjo+rAqXGcK3
         +LQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+bla7jhtU0X1zfC1ahIdpnUBlrbDEz/vvPKYEZ9LE+ZfnizCmYUj23nN2a8ZeQkh7nQedLQ6U1cN+lkpGX7Ci3+gT6XYTwgiW+ARtgA==
X-Gm-Message-State: AOJu0YwQwrpxICTYyy6W6fhlOoMrc26RguXbp7U6YyOsuLer+n/uuAbV
	6uXCT5XI4J2ELl4GYxo+OosneiOFTaFJUZIrnIkcvhmhM3cVeFZ2UVCulhDFfG8=
X-Google-Smtp-Source: AGHT+IEyXjz5iWD+JzMbxman4f15iRJH7qvrzDvYbxC6J1pXkyjcclFUtxHEFXG2Dt+UzEnUxH7BCA==
X-Received: by 2002:a17:902:e810:b0:1e3:e081:e7f5 with SMTP id u16-20020a170902e81000b001e3e081e7f5mr5334384plg.66.1712787701595;
        Wed, 10 Apr 2024 15:21:41 -0700 (PDT)
Received: from localhost ([2804:214:8686:5e16:705e:67c9:b3ef:a558])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e107222eb5sm39198plr.191.2024.04.10.15.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 15:21:41 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
In-Reply-To: <20240329072441.591471-14-samuel.holland@sifive.com> (Samuel
	Holland's message of "Fri, 29 Mar 2024 00:18:28 -0700")
References: <20240329072441.591471-1-samuel.holland@sifive.com>
	<20240329072441.591471-14-samuel.holland@sifive.com>
User-Agent: mu4e 1.12.2; emacs 29.3
Date: Wed, 10 Apr 2024 19:21:37 -0300
Message-ID: <87wmp4oo3y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 11 Apr 2024 08:43:52 +1000
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hello,

Samuel Holland <samuel.holland@sifive.com> writes:

> Now that all previously-supported architectures select
> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
> of the existing list of architectures. It can also take advantage of the
> common kernel-mode FPU API and method of adjusting CFLAGS.
>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Unfortunately this patch causes build failures on arm with allyesconfig
and allmodconfig. Tested with next-20240410.

Error with allyesconfig:

$ make -j 8 \
    O=3D$HOME/.cache/builds/linux-cross-arm \
    ARCH=3Darm \
    CROSS_COMPILE=3Darm-linux-gnueabihf-
make[1]: Entering directory '/home/bauermann/.cache/builds/linux-cross-arm'
    =E2=8B=AE
arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.=
o: in function `dcn20_populate_dml_pipes_from_context':
dcn20_fpu.c:(.text+0x20f4): undefined reference to `__aeabi_l2d'
arm-linux-gnueabihf-ld: dcn20_fpu.c:(.text+0x210c): undefined reference to =
`__aeabi_l2d'
arm-linux-gnueabihf-ld: dcn20_fpu.c:(.text+0x2124): undefined reference to =
`__aeabi_l2d'
arm-linux-gnueabihf-ld: dcn20_fpu.c:(.text+0x213c): undefined reference to =
`__aeabi_l2d'
arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.=
o: in function `pipe_ctx_to_e2e_pipe_params':
dcn_calcs.c:(.text+0x390): undefined reference to `__aeabi_l2d'
arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.=
o:dcn_calcs.c:(.text+0x3a4): more undefined references to `__aeabi_l2d' fol=
low
arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.o:=
 in function `optimize_configuration':
dml2_wrapper.c:(.text+0xcbc): undefined reference to `__aeabi_d2ulz'
arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_translatio=
n_helper.o: in function `populate_dml_plane_cfg_from_plane_state':
dml2_translation_helper.c:(.text+0x9e4): undefined reference to `__aeabi_l2=
d'
arm-linux-gnueabihf-ld: dml2_translation_helper.c:(.text+0xa20): undefined =
reference to `__aeabi_l2d'
arm-linux-gnueabihf-ld: dml2_translation_helper.c:(.text+0xa58): undefined =
reference to `__aeabi_l2d'
arm-linux-gnueabihf-ld: dml2_translation_helper.c:(.text+0xa90): undefined =
reference to `__aeabi_l2d'
make[3]: *** [/home/bauermann/src/linux/scripts/Makefile.vmlinux:37: vmlinu=
x] Error 1
make[2]: *** [/home/bauermann/src/linux/Makefile:1165: vmlinux] Error 2
make[1]: *** [/home/bauermann/src/linux/Makefile:240: __sub-make] Error 2
make[1]: Leaving directory '/home/bauermann/.cache/builds/linux-cross-arm'
make: *** [Makefile:240: __sub-make] Error 2

The error with allmodconfig is slightly different:

$ make -j 8 \
    O=3D$HOME/.cache/builds/linux-cross-arm \
    ARCH=3Darm \
    CROSS_COMPILE=3Darm-linux-gnueabihf-
make[1]: Entering directory '/home/bauermann/.cache/builds/linux-cross-arm'
    =E2=8B=AE
ERROR: modpost: "__aeabi_d2ulz" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] unde=
fined!
ERROR: modpost: "__aeabi_l2d" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefi=
ned!
make[3]: *** [/home/bauermann/src/linux/scripts/Makefile.modpost:145: Modul=
e.symvers] Error 1
make[2]: *** [/home/bauermann/src/linux/Makefile:1876: modpost] Error 2
make[1]: *** [/home/bauermann/src/linux/Makefile:240: __sub-make] Error 2
make[1]: Leaving directory '/home/bauermann/.cache/builds/linux-cross-arm'
make: *** [Makefile:240: __sub-make] Error 2

--
Thiago
