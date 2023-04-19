Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B576EB1F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 21:01:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q33lL0RMgz3fYc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Apr 2023 05:01:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20221208.gappssmtp.com header.i=@rivosinc-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=bQyblJRy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=palmer@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20221208.gappssmtp.com header.i=@rivosinc-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=bQyblJRy;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q33jW6xqSz3fR7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Apr 2023 04:59:27 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-63b35789313so1925543b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Apr 2023 11:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682103565; x=1684695565;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+EQ/x793Jnsa/kqgXiOJb3p0eah7oFJhucKW106Kl8=;
        b=bQyblJRyAvGuTLy7qPVklUSkkntz5faFsanTHGL8+W8tK7sfMyp8tTFo7QvA60d/UW
         JEVIbrj/vr3OdOv4W9eGM7+H99bBq3vk1HvaueHNN8TyjPI4bOlC4yFpFniBEltfCK9S
         a6SfS4IlzcbdMqiaWhNrZLZmlaZqp4ZX/MOCweDAHIH82q5DvegmFZF/rOG4iBUrgJsE
         /l8K3CJ6JeYhfbZwImHI9bK8nzBZfU1X6YjlosZiMF9YRwLusS1aYk1zweTU7guN0tR9
         KqgXJegycYDF46jiq+R0uNxxQcgUvLwrsKvS97bTmxb6phciqD3Mj/Su/ExzkZSsuk7e
         5pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682103565; x=1684695565;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+EQ/x793Jnsa/kqgXiOJb3p0eah7oFJhucKW106Kl8=;
        b=frCgGEfxIoUxqvEMNhFrcRiuDGKWC7Kszq/7BdpaQJmIg5RQDKpQhkMUElRHd/lhZ9
         Y2EvIrixZA44On/jnENBpSHbtMEp9m4zpKW2n+vtDPIEhbXAtEItuotvEJY/R/ZhEhka
         CgdpapVMXWdusieCj/vY18YhQwXHyikT0fHDzXNIhIsrOOThsYNdFVfR7lB2Z8YvEhNL
         HgsRCclXVX1j+MFSa7nw4KA2LiQmWVA2Jnt0v3+YSGf1qRcrfsU0B83Z3oSdAOYajWkn
         YzU8sRNIUac8ybBihClzgm+i6v5N1NW22MDoiXFlgsaYFwYqAHapMD5T8do/xu879Qum
         FlHA==
X-Gm-Message-State: AAQBX9dg1j/cFibdKbk2aQEkQWDIFnoHQtiGYT95ba2PXsrYAdqJK6Dw
	AHwrUPW6lAiFv9/amp/2hK2xSg==
X-Google-Smtp-Source: AKy350aPgF7/ICzgPm9D1rqVxYtdqSsows6+k23WW1suuTm43XEGetau1y5211vGXw0C4sHlJCV6lg==
X-Received: by 2002:a05:6a00:13a6:b0:63f:ec9:bc9a with SMTP id t38-20020a056a0013a600b0063f0ec9bc9amr7724187pfg.20.1682103564695;
        Fri, 21 Apr 2023 11:59:24 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id h69-20020a628348000000b0063db25e140bsm3299248pfe.32.2023.04.21.11.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 11:59:24 -0700 (PDT)
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH v9 0/6] Introduce 64b relocatable kernel
Message-Id: <168191616325.7488.14079862095622576679.b4-ty@rivosinc.com>
Date: Wed, 19 Apr 2023 07:56:03 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
  =C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
  Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Wed, 29 Mar 2023 06:53:23 +0200, Alexandre Ghiti wrote:
> After multiple attempts, this patchset is now based on the fact that the
> 64b kernel mapping was moved outside the linear mapping.
> 
> The first patch allows to build relocatable kernels but is not selected
> by default. That patch is a requirement for KASLR.
> The second and third patches take advantage of an already existing powerpc
> script that checks relocations at compile-time, and uses it for riscv.
> 
> [...]

Applied, thanks!

[1/6] riscv: Prepare EFI header for relocatable kernels
      https://git.kernel.org/palmer/c/55de1e4ad43b
[2/6] riscv: Move .rela.dyn outside of init to avoid empty relocations
      https://git.kernel.org/palmer/c/69a90d2fe107
[3/6] riscv: Introduce CONFIG_RELOCATABLE
      https://git.kernel.org/palmer/c/39b33072941f
[4/6] powerpc: Move script to check relocations at compile time in scripts/
      https://git.kernel.org/palmer/c/47981b5cc687
[5/6] riscv: Check relocations at compile time
      https://git.kernel.org/palmer/c/c2dea0bc5339
[6/6] riscv: Use --emit-relocs in order to move .rela.dyn in init
      https://git.kernel.org/palmer/c/559d1e45a16d

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

