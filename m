Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E520E7154B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 07:08:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVgQg5Dckz3fDr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 15:08:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dv6daTg9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=isomorphik.ibm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dv6daTg9;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVgPq0TfSz3bgV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 15:07:42 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b0201d9a9eso21460565ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 22:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685423259; x=1688015259;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+chQfWh323w+27dHraYebdRRLXvKOD8PKILDuSWHtw=;
        b=dv6daTg99te4bKWwPR59JyeRJbPIP5MuRoAIgi/Nhj7ACSV1k9rXntYwihSV/M4uCm
         rxFwCdfubQA13rFjg0uQ/Ea3XW/0oaqas1SyZq7c+a6Xz841dJM9kH9behmj3bVCfVh9
         LxKMeDSbiwlvmoC0sIaX4P26cqgMVHLOHjgPlwBJ1jVpVEZreJvOD4VdFxKb1/rAlM9N
         yyRtKhvOehSoBDaEugHd9rWez8u4KVjULs8qfdv8SBtfsPTtqMUzfs4bU6WhIWaXnhuZ
         JtcKrfT/XrJnVykREaq8NinC2t2q/Y/Rz5nZ+31ooctYqjjV/ZWgikIlOgJCryh7qqPT
         Jolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685423259; x=1688015259;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+chQfWh323w+27dHraYebdRRLXvKOD8PKILDuSWHtw=;
        b=HEUON7pB4c0Un73MOPqBf6k0aaSTXt8BRAK2XWAE0M5EuqGfo55zdhIDVh6epM5UWZ
         FEEg8kXpdILKX/7RZa0diulZcUsunz1jlm6NQceNO/40SBjkhjsYUv3O+c5PULLwbiH+
         cHyibJZxNF9F2aVj3kHklj/htJUIhrlUEuIdt5+TZMWNruJMNxPZgSLCbDo4jzhwAloi
         C7SEJEAY8ocqHc3W1kZ/dxlcmCe6U9a6wt4bYUFJLEoGKX98bTqyc+F23/SpQKcF+9lJ
         mnjtjOHaoxKZwwp2pvWdqmxkTuUbnSDJxLQih9szeaImclCP0Dsr7+6u3J0Yfvl74SyR
         HM6Q==
X-Gm-Message-State: AC+VfDyrixdUHBS7v2UfNaUJMdgdRbIKbMFSSOGkn1NgqRq6SilSeSky
	cXDAXN/3jQaRCspRe2Bxc3S0VldCByc=
X-Google-Smtp-Source: ACHHUZ7+QLOItq0GusmDe4XxO8mVFQhrtuaXTbNQZnQpudc6CMXmLTHPFQO5PWjyZNg5GRkroKcnLg==
X-Received: by 2002:a17:902:fb8d:b0:1ae:35b8:d5ae with SMTP id lg13-20020a170902fb8d00b001ae35b8d5aemr1021209plb.19.1685423259071;
        Mon, 29 May 2023 22:07:39 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:1d04:bf1d:d493:7aac:cd29? ([2406:7400:56:1d04:bf1d:d493:7aac:cd29])
        by smtp.gmail.com with ESMTPSA id 9-20020a170902c10900b001a5fccab02dsm9190424pli.177.2023.05.29.22.07.38
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 22:07:38 -0700 (PDT)
Message-ID: <1307cbae-27ca-888a-968a-c53e4b89870d@gmail.com>
Date: Tue, 30 May 2023 10:37:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] powerpc/crypto: Fix aes-gcm-p10 link errors
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org
References: <20230525150501.37081-1-mpe@ellerman.id.au>
From: Vishal Chourasia <isomorphik.ibm@gmail.com>
In-Reply-To: <20230525150501.37081-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/25/23 20:35, Michael Ellerman wrote:
> The recently added P10 AES/GCM code added some files containing
> CRYPTOGAMS perl-asm code which are near duplicates of the p8 files
> found in drivers/crypto/vmx.
>
> In particular the newly added files produce functions with identical
> names to the existing code.
>
> When the kernel is built with CONFIG_CRYPTO_AES_GCM_P10=y and
> CONFIG_CRYPTO_DEV_VMX_ENCRYPT=y that leads to link errors, eg:
>
>    ld: drivers/crypto/vmx/aesp8-ppc.o: in function `aes_p8_set_encrypt_key':
>    (.text+0xa0): multiple definition of `aes_p8_set_encrypt_key'; arch/powerpc/crypto/aesp8-ppc.o:(.text+0xa0): first defined here
>    ...
>    ld: drivers/crypto/vmx/ghashp8-ppc.o: in function `gcm_ghash_p8':
>    (.text+0x140): multiple definition of `gcm_ghash_p8'; arch/powerpc/crypto/ghashp8-ppc.o:(.text+0x2e4): first defined here
>
> Fix it for now by renaming the newly added files and functions to use
> "p10" instead of "p8" in the names.
>
> Fixes: 45a4672b9a6e ("crypto: p10-aes-gcm - Update Kconfig and Makefile")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   arch/powerpc/crypto/Makefile                   | 10 +++++-----
>   arch/powerpc/crypto/aes-gcm-p10-glue.c         | 18 +++++++++---------
>   .../crypto/{aesp8-ppc.pl => aesp10-ppc.pl}     |  2 +-
>   .../crypto/{ghashp8-ppc.pl => ghashp10-ppc.pl} | 12 ++++++------
>   4 files changed, 21 insertions(+), 21 deletions(-)
>   rename arch/powerpc/crypto/{aesp8-ppc.pl => aesp10-ppc.pl} (99%)
>   rename arch/powerpc/crypto/{ghashp8-ppc.pl => ghashp10-ppc.pl} (97%)

I missed adding tested-by in previous reply.

After applying the patch, I was able to successfully build the Linux 
kernel v6.4-rc4.

I encountered no errors during the build process. The issue pertaining 
to multiple
definitions of certain functions appears to be resolved.

λ grep -i CRYPTO_AES_GCM_P10 .config
CONFIG_CRYPTO_AES_GCM_P10=y

λ grep -i CRYPTO_DEV_VMX_ENCRYPT .config
CONFIG_CRYPTO_DEV_VMX_ENCRYPT=y

  + make O=${BUILD_DIR} CC=clang ARCH=powerpc
CROSS_COMPILE=powerpc64le-linux-gnu- -j16 -s vmlinux modules

Thank you for the well-detailed fix.

Tested-by: Vishal Chourasia <vishalc@linux.ibm.com>

