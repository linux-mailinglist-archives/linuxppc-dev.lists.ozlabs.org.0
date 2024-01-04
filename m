Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAFF824597
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 16:59:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=FUmp0dq1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5WVW3HyKz3brK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jan 2024 02:59:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=FUmp0dq1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5WTk2SsQz3bZK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jan 2024 02:58:32 +1100 (AEDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-35fc6eb9075so1852305ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jan 2024 07:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704383909; x=1704988709; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+LkB4Vo+u25oWI7sGQO48sDZuLcvpPhc24u586CsWs=;
        b=FUmp0dq1eTKyVteC9g0DTWlAa7v+5DATvu2wc14+xjJUXm4ukH+i88KUWSyD51zmjt
         Aq7JfhBSkaQAT0+ywBX9VuALP3Qx3jFCBJAM3Y+hp9DqryVQG2zAmOW/jqoJuPPgBz92
         obb+/o3SwUltSGdciV7MFNbGuoSOgxW4CSd7c2d3oJAIVbloKyUoY0/0ATbxKLjoqJ6s
         Ezq1QThGnwbffK/GlyofikLaTchPw0AtjfGAoFCQeYdI0ptt9k6m7Tfmol4Rzs5LHvWx
         RZMsdYr0cjaktH4LUbWuRyDYW1vgj0I4dOQytD4oivHD0NutzMa1UZWwmRnvLGJWrErb
         53ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704383909; x=1704988709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+LkB4Vo+u25oWI7sGQO48sDZuLcvpPhc24u586CsWs=;
        b=UikUczYaEB22m+uN6KMLFL1jtlDpWwLkkRLhvtg9xwXufj+VNfwBm9Pzw76aV8LBh9
         3jwAgbz2BSwSrZ/oXyjBhSwOZ/Niub3fPobY9oyglhh2Kl1lts157RhWTRKksOJNfYtd
         avknqS7zcJBpBhF6yWE1zVpMCMpDLBzl2J7Y0GFiSatvBiqD2v8osJQqau0UHYj9A4yi
         7928I6dpCYH0iFmFFVYAbKfvYnn+8aofsmFDHT42vP+ZhtgAdwMj0GYBvN4ynHnBp7K7
         YhzdW5/Hu/y8Tv6zXnkf+lHCbBPqqVbhpDez0nci4c4CJ+pUXwKiUlrVxKvti6bjv6rt
         CYZQ==
X-Gm-Message-State: AOJu0YxQ/jVtNJWE3T3APmXEGpJ8APKHnBhVMHmQfLsL8SGZt72JUui4
	bH1lkhTcVun5h0RJU8I16dTidah5aqHlXg==
X-Google-Smtp-Source: AGHT+IH0j3oQCRY8sxvQe5xsZpHeGls13odOGuU65eTJqn0FYIyylaRiHWDyo9dxY5HyEPL4psyAAg==
X-Received: by 2002:a05:6e02:b48:b0:35f:f023:f8e2 with SMTP id f8-20020a056e020b4800b0035ff023f8e2mr508987ilu.17.1704383909345;
        Thu, 04 Jan 2024 07:58:29 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:b86c:e734:b34:45c6? ([2605:a601:adae:4500:b86c:e734:b34:45c6])
        by smtp.gmail.com with ESMTPSA id v16-20020a92d250000000b0035d6559c5b9sm9232707ilg.64.2024.01.04.07.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 07:58:29 -0800 (PST)
Message-ID: <84389bc3-f2e7-49c5-a820-de60ee00f8a7@sifive.com>
Date: Thu, 4 Jan 2024 09:58:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
 <20231228014220.3562640-8-samuel.holland@sifive.com>
 <CAAhV-H5TJPqRcgS6jywWDSNsCvd-PsVacgxgoiF-fJ00ZnS4uA@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAAhV-H5TJPqRcgS6jywWDSNsCvd-PsVacgxgoiF-fJ00ZnS4uA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Huacai,

On 2024-01-04 3:55 AM, Huacai Chen wrote:
> Hi, Samuel,
> 
> On Thu, Dec 28, 2023 at 9:42 AM Samuel Holland
> <samuel.holland@sifive.com> wrote:
>>
>> LoongArch already provides kernel_fpu_begin() and kernel_fpu_end() in
>> asm/fpu.h, so it only needs to add kernel_fpu_available() and export
>> the CFLAGS adjustments.
>>
>> Acked-by: WANG Xuerui <git@xen0n.name>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>> (no changes since v1)
>>
>>  arch/loongarch/Kconfig           | 1 +
>>  arch/loongarch/Makefile          | 5 ++++-
>>  arch/loongarch/include/asm/fpu.h | 1 +
>>  3 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index ee123820a476..65d4475565b8 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -15,6 +15,7 @@ config LOONGARCH
>>         select ARCH_HAS_CPU_FINALIZE_INIT
>>         select ARCH_HAS_FORTIFY_SOURCE
>>         select ARCH_HAS_KCOV
>> +       select ARCH_HAS_KERNEL_FPU_SUPPORT if CPU_HAS_FPU
>>         select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>>         select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>>         select ARCH_HAS_PTE_SPECIAL
>> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
>> index 4ba8d67ddb09..1afe28feaba5 100644
>> --- a/arch/loongarch/Makefile
>> +++ b/arch/loongarch/Makefile
>> @@ -25,6 +25,9 @@ endif
>>  32bit-emul             = elf32loongarch
>>  64bit-emul             = elf64loongarch
>>
>> +CC_FLAGS_FPU           := -mfpu=64
>> +CC_FLAGS_NO_FPU                := -msoft-float
> We will add LoongArch32 support later, maybe it should be -mfpu=32 in
> that case, and do other archs have the case that only support FP32?

Do you mean that LoongArch32 does not support double-precision FP in hardware?
At least both of the consumers in this series use double-precision, so my first
thought is that LoongArch32 could not select ARCH_HAS_KERNEL_FPU_SUPPORT.

Regards,
Samuel

