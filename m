Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAD3394E68
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 May 2021 00:45:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FsxTr5gsGz30BM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 May 2021 08:45:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=i6A/A7Wo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20150623.gappssmtp.com
 header.i=@dabbelt-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=i6A/A7Wo; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FsxTL3YcQz2xts
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 May 2021 08:45:07 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id h12so3329778plf.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 May 2021 15:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=fi0vV/kF+CsBKSccmeD5rhECNTR0UPRdkNUxlQCOu6o=;
 b=i6A/A7Wom+6pM1tUHC83JTgbW35vAvfXx8K69AJbPi1Hu/Vb0nH15InB2zoG8ZDzdQ
 wyTBY3U0HJRoTiWmeiELkZo8IlIEQpbtxhPLlDwbwTu5KrE2OZK6I9i4TquPmiDzLKaZ
 lWaUa6IiJZ4IdVi4mMrObXbQxU+uFt/0xoo6VREZafKrAi8RhlSA2l/0g0f1E7BQprVc
 LUBKUKXZVmPO42ZwXG36UdQdpYQDxr//afSU5dtEAOqeLHHGSGBSksTq3rke61+tSSdV
 TJUFnuj/q+8xLHDGp7pIK7VmhyuBz6JN3dgmiB2eMZZ8ib50W6AoMcDGRzX/zruYiNmO
 qKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fi0vV/kF+CsBKSccmeD5rhECNTR0UPRdkNUxlQCOu6o=;
 b=kNZUyr3KK8UXXFzf1X+WC7UacmBCXzqEL2F2ALzIflLIwHDXTdd4AJotFxBHjGD03p
 lVuwfp+m/9z05sMZv1xZ2hOEiWVXVwmLsSx7Z/l7ab5gjL9XmvqkVv52G3/ueWSUhuXE
 bdKVXEHgrXxUr+ON1Lu82i16Ogz9k/gg0QpbxhjF13p3DCDxpYvzEevqJP9CN3KRJcwh
 sOZxNzJeTc5azdoGPqFuXesGaaqAKtPZFYuxgeuuIOoDReZ4nkBTOG8GPKl4r/36zLJS
 GK4CsqUJk03sScuRxk0j0UEB6LCK5vdLwDRopj84C/MTsnCjX/UtmoWHPHCCmulIucmP
 2Zcw==
X-Gm-Message-State: AOAM530xbAiwtYcVFBuou8EJTLMuuIpIpS5Y0DKU8CMO7toW4DGZcbNv
 v8SM6Gzo5PeQj9XQ0BdukurFGg==
X-Google-Smtp-Source: ABdhPJxEkcHSt/r0RUtDB7tfrUNpUFiVQ7CCqmPtNOJYrpOwquBntTt3/OkdihRXgW+frUet54s5gQ==
X-Received: by 2002:a17:90a:9411:: with SMTP id
 r17mr11310055pjo.49.1622328303013; 
 Sat, 29 May 2021 15:45:03 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m24sm7313476pfa.125.2021.05.29.15.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 15:45:02 -0700 (PDT)
Date: Sat, 29 May 2021 15:45:02 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 15:37:56 PDT (-0700)
Subject: Re: [PATCH] docs: kernel-parameters: mark numa=off is supported by a
 bundle of architectures
In-Reply-To: <20210524051715.13604-1-song.bao.hua@hisilicon.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: song.bao.hua@hisilicon.com
Message-ID: <mhng-145d2f8a-0697-4fff-a579-bce952033f25@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: song.bao.hua@hisilicon.com, aou@eecs.berkeley.edu,
 linux-doc@vger.kernel.org, catalin.marinas@arm.com, corbet@lwn.net,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, paulus@samba.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 23 May 2021 22:17:15 PDT (-0700), song.bao.hua@hisilicon.com wrote:
> risc-v and arm64 support numa=off by common arch_numa_init()
> in drivers/base/arch_numa.c. x86, ppc, mips, sparc support it
> by arch-level early_param.
> numa=off is widely used in linux distributions. it is better
> to document it.
>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cb89dbdedc46..a388fbdaa2ec 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3513,6 +3513,9 @@
>
>  	nr_uarts=	[SERIAL] maximum number of UARTs to be registered.
>
> +	numa=off 	[KNL, ARM64, PPC, RISCV, SPARC, X86] Disable NUMA, Only
> +			set up a single NUMA node spanning all memory.
> +
>  	numa_balancing=	[KNL,ARM64,PPC,RISCV,S390,X86] Enable or disable automatic
>  			NUMA balancing.
>  			Allowed values are enable and disable

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!
