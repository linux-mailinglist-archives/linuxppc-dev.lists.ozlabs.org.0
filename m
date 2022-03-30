Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8D04EBFBB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 13:25:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT3yF214nz306r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 22:25:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M0E4Z/rk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=M0E4Z/rk; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT3xb6d53z2xCy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 22:24:49 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 g9-20020a17090ace8900b001c7cce3c0aeso1785784pju.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 04:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FSpDM0U+NUVE9OpahQNlQVvGlraF7PHkCtk0ovmaHZQ=;
 b=M0E4Z/rk3HKXbQ4F+nSF0raKybGY+C9//mtoCzvN185TSUIwUoPTKNikBD4rE1Wzc7
 4+kOh7gae67Do8uFpgFvaxQtkA93/yi6NKNNEIAJqsOZ9+bV/HYR3+nw2A5m2Jt3QTeI
 oKMsRic25CaQ2zEHuPwN6l3YJqpZovvUfSpKTZ6i/QIZNM4WPzbeA58TwVkeQuU0qGTv
 uV0qmOllvpc3/DPWNHwD1MWBYBURBnQBgj1CZYYEit+xtBcN0NYFdbk9SCQ0K3hDvH2Y
 kQBXQGI9hzGKzoST61OLWNsDDofuGDHq5HTuQ6DdFI9Pb06ojiBwrPB6ZBGAVtVIysep
 hWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FSpDM0U+NUVE9OpahQNlQVvGlraF7PHkCtk0ovmaHZQ=;
 b=nKBF40rXWdItduyGZ8iKpv/6M8waRBagMqnv7VRKG61KwpIDqLTuifH5BO9wbTY6Ay
 8foi5fo49MtGtkXQ701ZUZfMR2rPS00TvQu3ZVRCcx2FiSOWFELp8E09u5Ujt9yCe212
 Fhj/GFZ7x3OTqXUNsk9OREfEnnsARHiuYwFlFM1o3By2EDEPhlmjd+4snjFyYgiB0vxB
 FxMMGUtO7Xr085yc8WcC0MurcSIcxeOhTruNVn1sc0geulnJj8XAbWJUcxsF8dVrrHx1
 PdjtEM37Hbh/RXpo+2QkPkNY/J2nYDSgSWpntD5v1wn5A/I8rrNwQ0f0VDAnwXrQiWf8
 Ihew==
X-Gm-Message-State: AOAM531kEeY4ZcFcBo57mZYVlLW3zFuvrUuPe5VYlb/FAQE4DayhZOav
 udhLqGwo2ZLKQtoeNmBgg2O/p2JxdGc=
X-Google-Smtp-Source: ABdhPJyllDhJKsgmDTYAZd6NC+8ozFNKzx0y7+mgSFuydpYkSenlwAWjfpyv+HsasBOdilgn1/vZiQ==
X-Received: by 2002:a17:902:e9d4:b0:153:bd06:859c with SMTP id
 20-20020a170902e9d400b00153bd06859cmr34611780plk.8.1648639486670; 
 Wed, 30 Mar 2022 04:24:46 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 x38-20020a056a0018a600b004fafd05ac3fsm20574699pfh.37.2022.03.30.04.24.44
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 04:24:45 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/boot: Build wrapper for an appropriate CPU
Date: Wed, 30 Mar 2022 21:54:37 +1030
Message-Id: <20220330112437.540214-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the boot wrapper lacks a -mcpu option, so it will be built for
the toolchain's default cpu. This is a problem if the toolchain defaults
to a cpu with newer instructions.

We could wire in TARGET_CPU but instead use the oldest supported option
so the wrapper runs anywhere.

The GCC documentation stays that -mcpu=powerpc64le will give us a
generic 64 bit powerpc machine:

 -mcpu=powerpc, -mcpu=powerpc64, and -mcpu=powerpc64le specify pure
 32-bit PowerPC (either endian), 64-bit big endian PowerPC and 64-bit
 little endian PowerPC architecture machine types, with an appropriate,
 generic processor model assumed for scheduling purposes.

So do that for each of the three machines.

This bug was found when building the kernel with a toolchain that
defaulted to powre10, resulting in a pcrel enabled wrapper which fails
to link:

 arch/powerpc/boot/wrapper.a(crt0.o): in function `p_base':
 (.text+0x150): call to `platform_init' lacks nop, can't restore toc; (toc save/adjust stub)
 (.text+0x154): call to `start' lacks nop, can't restore toc; (toc save/adjust stub)
 powerpc64le-buildroot-linux-gnu-ld: final link failed: bad value

Even with tha bug worked around the resulting kernel would crash on a
power9 box:

 $ qemu-system-ppc64 -nographic -nodefaults -M powernv9 -kernel arch/powerpc/boot/zImage.epapr -serial mon:stdio
 [    7.069331356,5] INIT: Starting kernel at 0x20010020, fdt at 0x3068c628 25694 bytes
 [    7.130374661,3] ***********************************************
 [    7.131072886,3] Fatal Exception 0xe40 at 00000000200101e4    MSR 9000000000000001
 [    7.131290613,3] CFAR : 000000002001027c MSR  : 9000000000000001
 [    7.131433759,3] SRR0 : 0000000020010050 SRR1 : 9000000000000001
 [    7.131577775,3] HSRR0: 00000000200101e4 HSRR1: 9000000000000001
 [    7.131733687,3] DSISR: 00000000         DAR  : 0000000000000000
 [    7.131905162,3] LR   : 0000000020010280 CTR  : 0000000000000000
 [    7.132068356,3] CR   : 44002004         XER  : 00000000

Link: https://github.com/linuxppc/issues/issues/400
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Tested:

 - ppc64le_defconfig
 - pseries and powernv qemu, for power8, power9, power10 cpus
 - buildroot compiler that defaults to -mcpu=power10 (gcc 10.3.0, ld 2.36.1)
 -  RHEL9 cross compilers (gcc 11.2.1-1, ld 2.35.2-17.el9)

All decompressed and made it into the kernel ok.

ppc64_defconfig did not work, as we've got a regression when the wrapper
is built for big endian. It hasn't worked for zImage.pseries for a long
time (at least v4.14), and broke some time between v5.4 and v5.17 for
zImage.epapr.

 arch/powerpc/boot/Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 9993c6256ad2..1f5cc401bfc0 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -38,9 +38,13 @@ BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		 $(LINUXINCLUDE)
 
 ifdef CONFIG_PPC64_BOOT_WRAPPER
-BOOTCFLAGS	+= -m64
+ifdef CONFIG_CPU_LITTLE_ENDIAN
+BOOTCFLAGS	+= -m64 -mcpu=powerpc64le
 else
-BOOTCFLAGS	+= -m32
+BOOTCFLAGS	+= -m64 -mcpu=powerpc64
+endif
+else
+BOOTCFLAGS	+= -m32 -mcpu=powerpc
 endif
 
 BOOTCFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
-- 
2.35.1

