Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2468734F76
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 11:17:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YRpT193y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql40c3XKSz30h7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 19:17:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YRpT193y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::a32; helo=mail-vk1-xa32.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql3zh5qd9z305N
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 19:16:31 +1000 (AEST)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-47179f18c76so409418e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687166185; x=1689758185;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jpyu9+vUxnLoEwJKh4R9bRZU6gQu+Nc3NINbivt7AnY=;
        b=YRpT193ywlG8pkN22LtvJ38LsMh94m1cIfP/+wJn7vAWCjNejMJ7qLhIdcqEcyMTos
         iSSO1/ebR5xchpTcOd+Ni6oD7TRDhcg1Fv5u+xfN9qC/34vrKRQu6tLBBZc1FgogYaQM
         gWliN5UNCxgHi6jEy79ZngcDH5A8d4Fk67byMPuS5Q6PLVyvqoFkoI29XguiBtBf8BQt
         /CBIALugQqjouNjrX2AY9tXMPCgmHS6xYu+cqAxjEhgsOXeqptp3M26F8EAFF8c9sHEX
         YHHdos00HCtBe6huz9yyWPNIEzTtvFursWTyaXzxMgQOvly6VtM64lgp7SHluDOD+6G2
         bN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687166185; x=1689758185;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jpyu9+vUxnLoEwJKh4R9bRZU6gQu+Nc3NINbivt7AnY=;
        b=E+u6W56vJdaDF8NZP3wPP2e6k9M4S6e6II0dNccoHVol4dhyvxrALI9bmzHBTQS1re
         uiY2DM3srz+meUWb+uhXMuKOlVTuNokaQnP1ROCGabfR8saU2qnAdfF4HkF3H++JEV6x
         8QBnNY/8/TxSQLpF6BZyYAc38JTlAKxPu1xTJPP3ARYDkmf8vYx19toH56Uc1fWxL/VT
         olt/xp2Jb052E5jtYkw8PDgMER9aJdm2U3/R38lxFrn/nBlQ0VvS5PRzvggB0TqIV3Rl
         wEvME5uR/55yIrvaWbdKUjZnk+FUbq2FsIiMyR+ypW/L/P/aI5aS/niyNu//IKFczenp
         fkJA==
X-Gm-Message-State: AC+VfDyJs9FNFxTnckycTOFnjDUkzDkwvjxAkQwTNQVdWCwbnY4ycrDb
	zoUPfuNIxxLtr/ogdzh2oHls+FxQrBbyrSKnEvtPMmbwNavHjbj8R5okDg==
X-Google-Smtp-Source: ACHHUZ4prwk7uRDs24/5AJ2ByEVDUQzD436D3NF1yQPr176M3WlLyTAW5ovN/35k/xVtHnpMfVjAjs5EDH8oApP2MPY=
X-Received: by 2002:a1f:cc06:0:b0:471:cea:3d62 with SMTP id
 c6-20020a1fcc06000000b004710cea3d62mr1527615vkg.2.1687166184000; Mon, 19 Jun
 2023 02:16:24 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 19 Jun 2023 14:46:12 +0530
Message-ID: <CA+G9fYskONbUxqfDMC8H0yBODc86CSSsezzky46iG-=rHS=YHg@mail.gmail.com>
Subject: next: arch/powerpc/kernel/stacktrace.c:171:9: error: implicit
 declaration of function 'nmi_cpu_backtrace'
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Following build regressions noticed on Linux next-20230619.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


Regressions found on powerpc:

 - build/clang-nightly-maple_defconfig
 - build/gcc-8-maple_defconfig
 - build/gcc-12-maple_defconfig
 - build/clang-nightly-cell_defconfig
 - build/gcc-12-cell_defconfig
 - build/gcc-8-cell_defconfig
 - build/clang-16-cell_defconfig
 - build/clang-16-maple_defconfig

Build log:
arch/powerpc/kernel/stacktrace.c: In function 'handle_backtrace_ipi':
arch/powerpc/kernel/stacktrace.c:171:9: error: implicit declaration of
function 'nmi_cpu_backtrace' [-Werror=implicit-function-declaration]
  171 |         nmi_cpu_backtrace(regs);
      |         ^~~~~~~~~~~~~~~~~
arch/powerpc/kernel/stacktrace.c: In function 'arch_trigger_cpumask_backtrace':
arch/powerpc/kernel/stacktrace.c:226:9: error: implicit declaration of
function 'nmi_trigger_cpumask_backtrace'; did you mean
'arch_trigger_cpumask_backtrace'?
[-Werror=implicit-function-declaration]
  226 |         nmi_trigger_cpumask_backtrace(mask, exclude_self,
raise_backtrace_ipi);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |         arch_trigger_cpumask_backtrace
cc1: all warnings being treated as errors


Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230619/testrun/17629288/suite/build/test/gcc-12-cell_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230619/testrun/17629288/suite/build/test/gcc-12-cell_defconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230619/testrun/17629288/suite/build/test/gcc-12-cell_defconfig/details/

Steps to reproduce:
# To install tuxmake to your home directory at ~/.local/bin:
# pip3 install -U --user tuxmake
#
# Or install a deb/rpm depending on the running distribution
# See https://tuxmake.org/install-deb/ or
# https://tuxmake.org/install-rpm/
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch powerpc --toolchain gcc-12
--kconfig cell_defconfig

--
Linaro LKFT
https://lkft.linaro.org
