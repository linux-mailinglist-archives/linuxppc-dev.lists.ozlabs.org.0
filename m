Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BACD780D0B4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 17:13:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=I1jduFE1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Spmxp1f20z30fp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 03:13:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=I1jduFE1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Spmwx5Bcsz2yLr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 03:12:32 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-77f44cd99c6so308460885a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 08:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702311148; x=1702915948; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpS7YigJlvbtafE8s+IgfD2mhqkpNW2HnzWlJXZ6u0Q=;
        b=I1jduFE1ZO3RzgQ7TifMvRvjKrOfYCChDDTkqfTu0g8IaeJoySqtSWRNF3t6AH/1Wo
         Oc9KPeGbeom+pfLGwiSmCS+h/D+BVb9YsTsU3cObpsdzPK74dzHWSJqTr6Qd/hdkj3Fy
         PYTwHeAC9q+81XC8Q4Y1iFPTKAlsn9fTVIlLjg1asxVA4Nx1N8/WbXG2lz+fANcQQN5p
         DrLM3F+fbsFpkTJkzJcgzOwv0jVqyKnRYuj7o+Omq3F7fHNj2CUEYsjhzoRnuP5Ui3gK
         msR08dFq+XVAhNFiQIY7emca0YuaW37prpHuFD7LwOt+UXZdTmM5FE03JqT3M6q+yjxL
         Zwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311148; x=1702915948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpS7YigJlvbtafE8s+IgfD2mhqkpNW2HnzWlJXZ6u0Q=;
        b=I4iQvOQRZMQlnjXwkWe113jfZsLhEu5OlvxaDBovWktTXhsFwKtIfjdMSSMjS8qTAE
         yNi4XEt3M9W2J2s+TiP0zCVX5xpdkwUxf4YkYT6Eco7FWamgNeITQjk3COFCuh3hWTU3
         GPKfSjzLd6/Fkhfls58HNFlYKhb2ujicNawBWKO/9/6TvebqvSr4EgIWWiyXqGGtAf+7
         XYklaIDnxBUXuo/rlU24AWlvP9K5ve49vSPhhrwOftzHvKAWR9plO5kqNChUCz0j1V8J
         gwdtENxSN39xX/ydjXafpzZK8uM7hgrf1eouqa0SANUsjMhuZU5HPd0Ib6im3hfGG58u
         8KWA==
X-Gm-Message-State: AOJu0Yyeu/0Wzdtlwx3zkCpD2CFt5wKpk7CWTrv/l5Cik7SLt4SwkLQN
	pOT8EtpY1bWb16VOAtQ/zvkABg==
X-Google-Smtp-Source: AGHT+IEC8jdvAnetFbqJVF6lQQw8UXKnB/IQiMsN2t2NyqglmpS9Xy9aZsTAJAYPyNV0NsZe4DU6SA==
X-Received: by 2002:a05:620a:15a8:b0:77d:855d:1b09 with SMTP id f8-20020a05620a15a800b0077d855d1b09mr6457241qkk.0.1702311148452;
        Mon, 11 Dec 2023 08:12:28 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:f8a3:26ec:ac85:392e? ([2600:1700:2000:b002:f8a3:26ec:ac85:392e])
        by smtp.gmail.com with ESMTPSA id a15-20020a05620a066f00b0077d78afc513sm3014865qkh.110.2023.12.11.08.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 08:12:28 -0800 (PST)
Message-ID: <7c40dfe8-f245-413f-a424-bde52ce21b6a@sifive.com>
Date: Mon, 11 Dec 2023 10:12:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/12] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-6-samuel.holland@sifive.com>
 <ZXczty+Y6dTDL4Xi@infradead.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZXczty+Y6dTDL4Xi@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-12-11 10:07 AM, Christoph Hellwig wrote:
>> +CFLAGS_REMOVE_neon1.o += $(CC_FLAGS_NO_FPU)
>> +CFLAGS_REMOVE_neon2.o += $(CC_FLAGS_NO_FPU)
>> +CFLAGS_REMOVE_neon4.o += $(CC_FLAGS_NO_FPU)
>> +CFLAGS_REMOVE_neon8.o += $(CC_FLAGS_NO_FPU)
> 
> Btw, do we even really need the extra variables for compiler flags
> to remove?  Don't gcc/clang options work so that if you add a
> no-prefixed version of the option later it transparently gets removed?

Unfortunately, not all of the relevant options can be no-prefixed:

$ cat float.c 
int main(void) { volatile float f = 123.456; return f / 10; }
$ aarch64-linux-musl-gcc float.c 
$ aarch64-linux-musl-gcc -mgeneral-regs-only float.c 
float.c: In function 'main':
float.c:1:33: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
    1 | int main(void) { volatile float f = 123.456; return f / 10; }
      |                                 ^
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
    1 | int main(void) { volatile float f = 123.456; return f / 10; }
      |                                                     ~~^~~~
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
$ aarch64-linux-musl-gcc -mgeneral-regs-only -mno-general-regs-only float.c 
aarch64-linux-musl-gcc: error: unrecognized command-line option '-mno-general-regs-only'; did you mean '-mgeneral-regs-only'?
$ 

