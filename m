Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5FC57479D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 10:56:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk7dL70Fbz3c9g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 18:56:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Xuvter0R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=sudipm.mukherjee@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Xuvter0R;
	dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lk7cj3pSQz3bnj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 18:55:47 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id r2so603076wrs.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 01:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Pd0s7pfe+tSy6Zgyr/2+hXl9JvN+53ozZq3gL+wyK/M=;
        b=Xuvter0RBrh9MX3/Pb+Mj7eC1QfF1ydLL9v5qHPRgib4vj+ZdmWEmh2umCkpKJh8SM
         y8NF4Ki1myo4QkPvgoyORzfGd1SN38VGB2psdRLzp59/VgIgaok29xtIAQ/XQoeKVMu9
         yL8z4LmxXrH8MTJw28M3Nwo3pXn+TpxtazoomrQTBPeyrGIgphVAIQOTzDD/LLBdNdUV
         wj5Zvx5TJsBMJTzGX/WlVHV5iDak0nClAYPXY7nACAVOwiC7YxcnZ/gf+OBLa0sanlK3
         Ii2mMhHlo324/otp/OtGpH7vJKEBAM/6js+a+vPfayyAHZMhoJfNcRzrcj10XJW3EQha
         AHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Pd0s7pfe+tSy6Zgyr/2+hXl9JvN+53ozZq3gL+wyK/M=;
        b=RRtH5ZcqPCeyrUZ7mTRGM+O5hOv/rQwQuwBLs/c+8SiWEeyKdT5u0btEwfay/EKXiy
         p+x+BtgmyCa6rTGXgbH8Qag+jpk+0VnMyVeCADbIqUaeefSJEP91RZJtCKibRsjg1Clc
         peGPmOehxplG4N9gkDrtTD6QfxZQHuvFRtpug6kfEQ6ER8+4lrxLQOWOFiiJ+SH8SFEi
         PNQ60XmNUtzq88AQRWOZ7+77wcZw5kX6hZ4qWod1iDRNTwW4ddHHP7gDwDDKeRQXmvWB
         3In3zeLrkr4hF74/gmsgajGwQ1pNwdIXDRnAEPUgjUZTWQE6F9xLzayeHLmVZX4FN0ZL
         J+Ig==
X-Gm-Message-State: AJIora8vuJXluXhiHa+XIy9R/qynYdf/tmMJ3IdC2UOK3v723QHzwv9K
	GlttjfDvUdiuQE/cByoOVuc=
X-Google-Smtp-Source: AGRyM1utCuahz4E7ykNJPLlcno4icCMBdFOP4g3e7uUfZNXmhAcQ/BHe9adH2rCC0hzyKAM5Eiy37g==
X-Received: by 2002:a05:6000:1f0b:b0:21d:6dae:7d04 with SMTP id bv11-20020a0560001f0b00b0021d6dae7d04mr7314231wrb.414.1657788943226;
        Thu, 14 Jul 2022 01:55:43 -0700 (PDT)
Received: from debian (host-78-150-47-22.as13285.net. [78.150.47.22])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c465000b003a03ae64f57sm1173997wmo.8.2022.07.14.01.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 01:55:42 -0700 (PDT)
Date: Thu, 14 Jul 2022 09:55:40 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Kees Cook <keescook@chromium.org>
Subject: mainline build failure of powerpc allmodconfig for prom_init_check
Message-ID: <Ys/aDKZNhhsENH9S@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

Not sure if it has been reported before but the latest mainline kernel
branch fails to build for powerpc allmodconfig with gcc-12 and the error is:

Error: External symbol 'memset' referenced from prom_init.c
make[2]: *** [arch/powerpc/kernel/Makefile:204: arch/powerpc/kernel/prom_init_check] Error 1

The commit ca5dabcff1df ("powerpc/prom_init: Fix build failure with
GCC_PLUGIN_STRUCTLEAK_BYREF_ALL and KASAN") looks similar but the error
is still there with gcc-12.

Note: I don't see this error with gcc-11.


I will be happy to test any patch or provide any extra log if needed.

--
Regards
Sudip
