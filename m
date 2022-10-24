Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B9D60B905
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 22:01:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mx5Yv1LgYz3cBM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 07:01:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sGYDK7eI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sGYDK7eI;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwk6n5gsGz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 16:25:20 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id k8so5692553wrh.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Oct 2022 22:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xZk2YhOyCsD5JgZA8622Psb4g9tdzFicF6waMAEX+tE=;
        b=sGYDK7eIYH5PqH/5Acy0XyaEjCscnyemwFKPlv0plAI4IwAFCznfoGKOXs1a7qYDrr
         ly2ism/XDhfqN7P+LUkOQ+8zw1DW3s9014bL3MpmA/VeepyZ997065xLFYnKak1tqGkq
         FoBa0umV34QeH83RdEplTs4i5Q4cLt0MSci1zU3y4K+5MRKk5kvOo6/OmTyP65vvmeaX
         Q5fVy3H/6NpDIslefYS/jRvBlP4GCt+4AychccYkqmARW0YsM+HURsaQVLlgY4KIgMaO
         8B0U5afdOstZ9Xnrvl2gDFtoZcogvKS6fdmiHd2ZOE5f9wxSOHws4RH0J6kyMAnRSo9m
         cgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZk2YhOyCsD5JgZA8622Psb4g9tdzFicF6waMAEX+tE=;
        b=ihSqbSNmErt35/psqaJbRVbFBFNytKaxQ9eVFSg2wV5cHsjRi/F3fDCQ3/nZhzU/d1
         knfznihfPFOTXQ73B9mjcbxfvUrEtG4A1ddXRzVx82863EDeEdGnOhjgYg1F1NYkd4zy
         uHKtDSLf1t4LnBFdmiivsg4XGlKtTR4KhZGFj2SwfFwbIxmRRG/UVqTMLSXBM/nraXO+
         VZntoiPaDNcU2J+Jcb8SY+zf7XlEVxUvFHeAWCnpeECs0HUp7lXlymX0tRP8BxLKFQux
         2xVVVpkmlWfNtzc4c99xIJ6ZN+YojDyIMCKgEOFZ6PeANE1gJSCJE32HL6KOTqAK7Pyp
         JfLA==
X-Gm-Message-State: ACrzQf0hxiHx7cm31E6rEp6sSuwhsbxfgS0CmI8M2j4IFTP/zJKDx9KL
	abk8cNCDaYiHIGvmACMZn0V4ZQ==
X-Google-Smtp-Source: AMsMyM6QxHnKrRaxO/sgu91YoPZwLII9g5woi4tdrjAvc7GmkjpM0AXJ+q3phtLN49229n5kcuKDXw==
X-Received: by 2002:adf:e196:0:b0:236:740f:f234 with SMTP id az22-20020adfe196000000b00236740ff234mr996926wrb.518.1666589113331;
        Sun, 23 Oct 2022 22:25:13 -0700 (PDT)
Received: from [10.50.0.10] (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003c6f27d275dsm7317108wmq.33.2022.10.23.22.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 22:25:12 -0700 (PDT)
Message-ID: <5f4b9276-92bf-2e04-8a42-8f416526b3a6@linaro.org>
Date: Mon, 24 Oct 2022 07:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v1 1/2] stackprotector: move CANARY_MASK and
 get_random_canary() into stackprotector.h
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org
References: <20221023203208.118919-1-Jason@zx2c4.com>
 <20221023203208.118919-2-Jason@zx2c4.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221023203208.118919-2-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Oct 2022 07:00:53 +1100
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Chris Zankel <chris@zankel.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, l
 inuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/10/22 22:32, Jason A. Donenfeld wrote:
> This has nothing to do with random.c and everything to do with stack
> protectors. Yes, it uses randomness. But many things use randomness.
> random.h and random.c are concerned with the generation of randomness,
> not with each and every use. So move this function into the more
> specific stackprotector.h file where it belongs.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   arch/x86/kernel/cpu/common.c   |  2 +-
>   arch/x86/kernel/setup_percpu.c |  2 +-
>   arch/x86/kernel/smpboot.c      |  2 +-
>   arch/x86/xen/enlighten_pv.c    |  2 +-
>   include/linux/random.h         | 19 -------------------
>   include/linux/stackprotector.h | 19 +++++++++++++++++++
>   kernel/fork.c                  |  2 +-
>   7 files changed, 24 insertions(+), 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

