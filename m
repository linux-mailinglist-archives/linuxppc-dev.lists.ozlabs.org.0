Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F7E70A22B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 23:56:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNLJf2Hkdz3fJr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 07:56:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=qi8xAHod;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=qi8xAHod;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNLHn3PM6z3cjL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 07:55:31 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1ae763f9c0bso14988795ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 14:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1684533329; x=1687125329;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uXFG3N07SM/6noHGA5ZD0BhWKs4fe06jSmLKiYiFpA=;
        b=qi8xAHodXi1tTUlxkODdWEQyiAwma/a9BvGcwY/aQkz6Qrfgd/uYwIsQ3ftgzEUzB7
         gQPnW4y98zBiQ1VJR1u1WmO0yXGgMdTnoKC4h1pdaN0elORWUcBRgyEH9K9ragANYapi
         wvIqmSO9V822mFO1HA5NixmIP6q/D+Q5AwrBbbtETBnZBo3FeUikHs11UulsM7CkjzDJ
         J8h6sS8sJhSFcDl/4uQ/P1JP35ibHi6+NnvdLdBO39EeIwkui0FYW8krsRQlEj+OcJaT
         1EkX2USheSSzI+PFRacvW1yO7xokuC0lKYP8KIO4GPA1Hd/ORj085Er5URM/OrxF27lc
         9Zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684533329; x=1687125329;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uXFG3N07SM/6noHGA5ZD0BhWKs4fe06jSmLKiYiFpA=;
        b=As6NP9rl2xcVmPmTYZyllAkaQqTIb82Nm5+1C5At0LM1DeLNiQ1QS7Mh8xRSJvz5oA
         mOWK5SjNmkIASdlvLHTZ/oX4n/HuTtzEcHVNNghNEddlFKelgTBx32ODDWmbhGTaDCT7
         4OKciEdrm2CLNnsg2hPdYBxGzAlSb5gt0IPzMrO90890cxr3+g3diOOo6BeBIin3StHv
         iVpf/6mqEX8u8oqcVCkCEEkgcjYKMLtcV0q1ao+SCh9JVgGz/2ou6tgOo55lBL6zqQeJ
         seqLAmal8iBdLhtlGFeW1hCpfoMjne+zdV875GBmGlEORKeKegXzYfdMh2sC73YWG+zU
         bORw==
X-Gm-Message-State: AC+VfDzyD+3U15/fh1nodgjBhxGHRySAOI0kUkY7imHaAE1rwYN6Xyq8
	rIj+P55CG1e82iAe+wIGjGCefw==
X-Google-Smtp-Source: ACHHUZ5/ROOeL9x3rAVEVvDuoSZzBU2MR5h4O3UXzZfGGu9m3CMVQZIexSY6expZXuqtDJrP1h/97g==
X-Received: by 2002:a17:902:e746:b0:1aa:df9e:2d19 with SMTP id p6-20020a170902e74600b001aadf9e2d19mr4239865plf.54.1684533329317;
        Fri, 19 May 2023 14:55:29 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id g23-20020a170902869700b001a98f844e60sm80031plo.263.2023.05.19.14.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 14:55:28 -0700 (PDT)
Date: Fri, 19 May 2023 14:55:28 -0700 (PDT)
X-Google-Original-Date: Fri, 19 May 2023 14:55:05 PDT (-0700)
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
In-Reply-To: <87sfbsvvp0.fsf@igel.home>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-d3720bcf-5eda-46da-b640-0606ef3a60e2@palmer-ri-x1c9a>
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
Cc: aou@eecs.berkeley.edu, alexghiti@rivosinc.com, alex@ghiti.fr, linux-kernel@vger.kernel.org, npiggin@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 May 2023 14:48:59 PDT (-0700), schwab@linux-m68k.org wrote:
> On Mai 19 2023, Alexandre Ghiti wrote:
>
>> I have tested the following patch successfully, can you give it a try
>> while I make sure this is the only place I forgot to add the -fno-pie
>> flag?
>>
>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>> index fbdccc21418a..153864e4f399 100644
>> --- a/arch/riscv/kernel/Makefile
>> +++ b/arch/riscv/kernel/Makefile
>> @@ -23,6 +23,10 @@ ifdef CONFIG_FTRACE
>>  CFLAGS_REMOVE_alternative.o = $(CC_FLAGS_FTRACE)
>>  CFLAGS_REMOVE_cpufeature.o = $(CC_FLAGS_FTRACE)
>>  endif
>> +ifdef CONFIG_RELOCATABLE
>> +CFLAGS_alternative.o += -fno-pie
>> +CFLAGS_cpufeature.o += -fno-pie
>> +endif
>>  ifdef CONFIG_KASAN
>>  KASAN_SANITIZE_alternative.o := n
>>  KASAN_SANITIZE_cpufeature.o := n
>
> I can confirm that this fixes the crash.

Thanks.  Alex: can you send a patch?
