Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCED6BA502
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 03:08:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pbv2c28KMz3chJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 13:08:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=aHXf6zaU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=aHXf6zaU;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pbv1d28Kcz3bbX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 13:08:02 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so367717pjp.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 19:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678846079;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqJu2BEDPepML92DLQ5OvgUAstRMzlQ9eysHMa3CrAA=;
        b=aHXf6zaUqySAf91usVWsf/WPytJ4oo/lfPrjMEou8J7jlCioJJeomAO3TJ0SF+P2/j
         qsCSNUhsTR/Z2z030RVnKEFmTuo0uTA3ussyQY+I/iEvHM+AdQdQRPxsd7+joss3SxvX
         7s1xa2PoRXTmeO9NJLI7tapu+jtfRK74DUiMc+33O3nhyTWPQUYtBVUs6hsTwgG3K5Bd
         sBRRA8JIkvIQ40yMTQ4RAz7yHXH2+KBETJHXuXjm1asXSDM02eKCMNFV9r9vJ8fqhS3B
         Lvw6Q0GmvlDhElQXD1UKYjST0kh/VoRQ8ufQ4YZqly44ZaISBLXOPjSE0cXB+yNTk88x
         N2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678846079;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqJu2BEDPepML92DLQ5OvgUAstRMzlQ9eysHMa3CrAA=;
        b=1HGBTnhwHPxN6X683SOrdnDHesRjQogywKyRFqvjt9FQoGyGN53o0kw4b+EITv2RcH
         aKvaeqVyIhonrOK/ScuEBEkX71+uXsWfB/o/9EsqSNatO+qmo/MqqJDxMbWibzLPPhum
         RtDX6sHMEZearrTf7z/17EDsOFQs5+iY2B3hGgrQZQfu/HX/v8WyLAogSShtw9pv5Sxr
         16V5GfFE7OD+vK+DWHG5YFTfgYph+2gS4EOM2EoIsa6mus/Pvm2x+u+VceqhGytU2EtX
         /uW1ARzXfpTejtQu8Tv2FbB+PTB0JWCeAEw8gppSAvyVbFpzgAKk5mH0/e4byG7hW+vl
         JNJQ==
X-Gm-Message-State: AO0yUKWjmEVHJP6OwmkVWQhIKi5iMksHdLU60/DwhHo5E9bNtNLup0dY
	/jifYHr0KWDFPtmtmEnmk9Sj7Q==
X-Google-Smtp-Source: AK7set/4d4meE0FaW+MSNz3OomO/EWSt91fL4Ho/JVwVfKyJpvpuMlf/6fPVmbw8HNSfdZgm+emhBQ==
X-Received: by 2002:a17:902:e54c:b0:1a0:428b:d8c5 with SMTP id n12-20020a170902e54c00b001a0428bd8c5mr1055599plf.45.1678846078774;
        Tue, 14 Mar 2023 19:07:58 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id a23-20020a170902b59700b00192aa53a7d5sm2400503pls.8.2023.03.14.19.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 19:07:58 -0700 (PDT)
Date: Tue, 14 Mar 2023 19:07:58 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Mar 2023 19:07:05 PDT (-0700)
Subject: Re: [PATCH v2 4/5] riscv: Select ARCH_DMA_DEFAULT_COHERENT
In-Reply-To: <Y/fmqwboOv/JhWf/@spud>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-9bf3f6be-12f9-466e-90b8-50f2d96971fe@palmer-ri-x1c9a>
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
Cc: tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, robin.murphy@arm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 23 Feb 2023 14:20:27 PST (-0800), Conor Dooley wrote:
> On Thu, Feb 23, 2023 at 11:36:43AM +0000, Jiaxun Yang wrote:
>> For riscv our assumption is unless a device states it is non-coherent,
>> we take it to be DMA coherent.
>> 
>> Select ARCH_DMA_DEFAULT_COHERENT to ensure dma_default_coherent
>> is always initialized to true.
>> 
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  arch/riscv/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 1d46a268ce16..b71ce992c0c0 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -233,6 +233,7 @@ config LOCKDEP_SUPPORT
>>  
>>  config RISCV_DMA_NONCOHERENT
>>  	bool
>> +	select ARCH_DMA_DEFAULT_COHERENT
>
> Since we are always coherent by default, I feel like you should put this
> in the main "config RISCV" section, where OF_DMA_DEFAULT_COHERENT
> currently is, no?

Seems reasonable to me.  With that

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

as I'm assuming these should all stay together.

Thanks!

>
> Wouldn't bother respinning for that unless the dma folk have comments
> for you.
>
>>  	select ARCH_HAS_DMA_PREP_COHERENT
>>  	select ARCH_HAS_SETUP_DMA_OPS
>>  	select ARCH_HAS_SYNC_DMA_FOR_CPU
>> -- 
>> 2.37.1 (Apple Git-137.1)
>> 
