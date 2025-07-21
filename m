Return-Path: <linuxppc-dev+bounces-10342-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36014B0CD64
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 00:59:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmG7W0qKRz2y2B;
	Tue, 22 Jul 2025 08:59:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753138791;
	cv=none; b=bA/MPfFEcpDbMoOAR3NmDUHjXoNcJjz5y2xefK+k0gsgnlT2XJoU5TfkdZzrGCYIVbJFjq7N5zmZ+JY5bVdECTwt2Zl5XjmiOu1yyxLMDJ3F+EIf+vD7yEG97/D1r9O3KcXk4ue4+sj0lTC26o1hYZxunEJHzcVkLeQBgMDgW65IeQsB29qO4lTiSdDkCiwVE1zZ2NpcbOjhy2ONkNSO327abTaNCzvhGgIesEdGdHtEp+C3nQeF8V9wMFO1/PTm+u/s91MZ/+CHrVsxVInu2yFn9h5lp3B8+8OJSj7sNKnvxxqCtbrnz+t8lVFQznwNw1LC8h9pX99VgRfcT5MRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753138791; c=relaxed/relaxed;
	bh=qziS/qpONFFAWWmGEcjsGqxLtdqROLsiMhv3HQa+DVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HKxi7vWsNIRVnYq359z+Ci7h03PVa8Dvzy3u8HLE5+Jt/vMuUNLNN/c56GAdA+xqSYI78SoBMopGUcCbf4fqwQNr6pPnQW6CSQ8JBqbPS6WrxrJVsSkruJbXy26/KIaHK8epps9dkncgcNbGGHhuoCwzQMugj/jH4JLCVOOPXqMoZTbhEqKX8izZXTAemxDm3Qx5WRBQkwYlvM6XyKlQTZjEm2F3xdHCbgc5rBWyZQpsWplbpY+vbeS9+PwsPXWOm0M6Td2858ZL3IEwpVkQMJ083zWMlplC9whcAf4v1IFEbUbNokB1BrXHhQuKaQuhvNZgdSS+Y2hsv2eHj27EXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jEIclP7Q; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jEIclP7Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmG7T3bRPz2xlL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 08:59:48 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ae0bf1616b9so77389566b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 15:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753138785; x=1753743585; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qziS/qpONFFAWWmGEcjsGqxLtdqROLsiMhv3HQa+DVo=;
        b=jEIclP7QxIcJyW+A53xnaXUQ9u5HK+Xd6Z1R8R3aLWVNOOn1fP3/+WYBpVhO8RFe6C
         ml2yspjJNDbjA5/XK1WK9p2ymvlpPWPVw0LEmacUWVo7QMmmysWDH3Iib8DymXe3pwE5
         62LcTMLDm7j9uvIny93ZPPnhcHwzPyCQ+f194HpJtUgQK4M/7ManCzxvemebPMV+IZ2J
         uvbHCNBxz80uOXT1MmTKbWnjPc5NcNcGb2x79EZEcNAJl+oEHzZj/IdonFtedD8iPTBA
         M2psS0nKkiwRLhxzI7KPh915sRY0wLg9KYaYLdxyIp7v9Kjbg4Zk4EqJ87qZs//d30D6
         2dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753138785; x=1753743585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qziS/qpONFFAWWmGEcjsGqxLtdqROLsiMhv3HQa+DVo=;
        b=DEsedqPOGYHJgAcZKV0vAwhuF0WsTDpJjEC3GlyOGcaw+9/BQaa73tj0yAiMEGcwKV
         KxgNWlp32m5OfvhOy6O4AtvAVAl3SOYbYUzWVD5MvunBWAQJfdRjuJH7jB+5o8zM4vQS
         1qHMPnw5bPbAZ3HjRLeN6FeSrFYXAVHpnX2peBNMiBSO58Ms2U6nN+IffsbhfaZcijho
         jyJ/0F7AeDwdq915p5Fzjo2e2DpFmZtr64wvElAkjR65ZhhqZeRw6QDJQqEBCGXeNzvY
         HuCTK8ueKw0zdEoQsLp1rCMsn5iYl3qZKlGSHWhio0iQbiywecwKZOoyZR2kK/K5lmMx
         oMEA==
X-Forwarded-Encrypted: i=1; AJvYcCVvmiGUpow8qAUGNvFHMJZA/FLmN4pvjzEcagyPlQqIAYfmt7V+dVufsCRzVn67M8uicKpftXgfwPCRRmg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YylBz16ZTktJTMRUdb8aSEJ3eW0bdi62IRfR20pzasmWFr+rGsI
	JNyCq1+ugUq+mpIwlfp9kRadaHgi4vopoxRMQ/giYy0fULwwsGh5B/83
X-Gm-Gg: ASbGnculYMAmdbgpCNWzrnI81Z8z3F+bI08Fd3sHuMwv50wNJ0j9Fog+rVEpY+s7zIi
	GeZpdP3tr3N2OL85ADzPDPuVx8GdAPmMxcxajsTlHk60SbECMGB/IGOpm7r8XTv7nZHlqAq0odb
	ubZ62wU5saPwCa+bNOHUBdK0RIaM7h+SolcoEymG86B6GPk/sBhiXApb797jU+edzdo69au4Gjx
	4fe+/G+oy+pB9JW3O6JZE/7BDNZEr5m2WYOU3ZXBSSQ2tizDCKHWWj7zhb8l27nM1e7C86vFvtq
	Z9PNHkEZzffMYbW5n0Uncu2jaJqbpAoVBBL2zl/MtHFDXCxQlRxhhmm9Rbnt6sXZaRyJeC/fPiz
	JyuTPklT72L7j7kK7joQyNrHSdLqvqYHrbuUvi65l8AmSqknIHC7wbHJ2NGEFX+gUwDxd
X-Google-Smtp-Source: AGHT+IFBO2iP/n38Feyyqa7ON62IpV2R/kvBKzJAAeBv02jcMXCr2o0KVEmn950sS2xc+ad0bPTgUA==
X-Received: by 2002:a17:907:1b05:b0:ae3:bd92:e6aa with SMTP id a640c23a62f3a-ae9c99adb7amr852181266b.6.1753138784434;
        Mon, 21 Jul 2025 15:59:44 -0700 (PDT)
Received: from [192.168.0.18] (cable-94-189-142-142.dynamic.sbb.rs. [94.189.142.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7d330sm755829066b.126.2025.07.21.15.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 15:59:43 -0700 (PDT)
Message-ID: <f10f3599-509d-4455-94a3-fcbeeffd8219@gmail.com>
Date: Tue, 22 Jul 2025 00:59:23 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] kasan: unify kasan_arch_is_ready() and remove
 arch-specific implementations
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250717142732.292822-1-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:

> === Testing with patches
> 
> Testing in v3:
> 
> - Compiled every affected arch with no errors:
> 
> $ make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
> 	OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
> 	HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld \
> 	ARCH=$ARCH
> 
> $ clang --version
> ClangBuiltLinux clang version 19.1.4
> Target: x86_64-unknown-linux-gnu
> Thread model: posix
> 
> - make ARCH=um produces the warning during compiling:
> 	MODPOST Module.symvers
> 	WARNING: modpost: vmlinux: section mismatch in reference: \
> 		kasan_init+0x43 (section: .ltext) -> \
> 		kasan_init_generic (section: .init.text)
> 
> AFAIU, it's due to the code in arch/um/kernel/mem.c, where kasan_init()
> is placed in own section ".kasan_init", which calls kasan_init_generic()
> which is marked with "__init".
> 
> - Booting via qemu-system- and running KUnit tests:
> 
> * arm64  (GENERIC, HW_TAGS, SW_TAGS): no regression, same above results.
> * x86_64 (GENERIC): no regression, no errors
> 

It would be interesting to see whether ARCH_DEFER_KASAN=y arches work.
These series add static key into __asan_load*()/_store*() which are called
from everywhere, including the code patching static branches during the switch.

I have suspicion that the code patching static branches during static key switch
might not be prepared to the fact the current CPU might try to execute this static
branch in the middle of switch.

