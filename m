Return-Path: <linuxppc-dev+bounces-4682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38647A01EBA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 06:08:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRMdH5Hfxz2ykZ;
	Mon,  6 Jan 2025 16:08:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736140083;
	cv=none; b=KlZKMj8zeket93eHnxBKPwxXAVhdd8dYDbH1qBxRuwWL56H3NwnvMYPKF6bJaITNGd7zWc1z/3SKfIod9QAh+ndaMqCNZA2UPs8hIy5B+DNYuliiRVCLOJvNNiJfGTvVUJ4Ue2mamZFOunZO+hT64OE2LyPkBn+x5hDk+VWKLL/l/KQJuhdAR0WKkLeEb7HUynbjQUWCo5vOYm66DcSLVsK2stYldHpemjoGIFwmatIrFOaXl1lsRY1dJOfnysiOEfHNfFj1Y6TMPXmoOI453Y8oMM4LZuLxVK/dJtGft5Gh9vFlm2Gw9wN4GdZO7vcs0M+kMFopv1iOTExj9o0ecw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736140083; c=relaxed/relaxed;
	bh=LuPI2QoCWSGABhNaHmyyQbTaoQ2qivKcvMjG9VSzHt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OsqBBOTixNG8wIXq9Z0NN7nW5uYQNaZE+1EQpJPP9iyeYarm0cxsf6oBqE1iQjXofeK/EWUMHhyxmySSB6wQBIevlRrAndgAv4Tmg2XghV5TPpqnF0BaIzCVE+DE8Js/7sigtfxBuZ8ihxnT1INqFwKRKJxjDSjoarlIBfhhdV05nnFkbcocJ//1QiXb8ujUK9bo0FtVhlJ1ofrEINqu67WR3Ci9V/ESCNvp60fvEWwEPVu35SFSXpAgzJR9WcRzat5z2enR2oQAnMpgaETZE9NfaJNU0JqTLUIKdrT5HikOs4c5/Cu3MIhYjOkK4TNAsFjnBJEHoeSKjY6Nj/jZXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=U+FThZwt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=U+FThZwt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRMdF6YNMz2yjJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 16:08:00 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-216728b1836so179508785ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jan 2025 21:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736140077; x=1736744877; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LuPI2QoCWSGABhNaHmyyQbTaoQ2qivKcvMjG9VSzHt4=;
        b=U+FThZwtaKipr3sXWdcSJ0hjSgx908wmQWCStTWHOPtUfu44q+2CoYHp4SM/Y9YfXd
         CnWDlsc3RGPjvKwiW0pKjwGQ4TcRMDWyQAXi5VKwlsDDtvOIkf7KCGZsyhgX4ex8ZxVS
         cHSYNU2ZIiG1x4qmbOjAAeg73Ol/bZSPY8/EI8rzOpcNhVnQmYVF3ZkE/2CLcjPVm5em
         pgd+j4zc6HAWo/a6lR6r2PHp2mvF0mQL+BUZP8xK2/yfuMNUkGFeTGw41T5yl4LM247B
         wKDhqgFywdTEk/twlAYW4FsD/sNwdxgh3OlvGmCDPqU0LfjSBOHFA9vLu4c9jcy4iU5F
         7ABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736140077; x=1736744877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LuPI2QoCWSGABhNaHmyyQbTaoQ2qivKcvMjG9VSzHt4=;
        b=iANg7QEnv6dPpPmUmuqtooLB+lG3UCnmibhbIe9PNnDCfTkSUYZfXLPpQLgWxxhdx2
         MEJ3vR66sp2ansOxizSICcG5oWxWcha+NDckpuiNgKMdg5/j74p02V8dQqE+PYrd+oKf
         PcJf6n3CchDsBIauYLf4AVV/rY+x3/93aBYnZk8/qhDhxSEcOihyoZ81QN07nzG6/Htc
         3pyWtPUmfz3WXg8Tz5DH6ZYBfbX/O60fjTUA34m7iz7udOgEnuxusAsk4/wGXd/n8V1Y
         jyANMyQEKplqB3LVAfGUDmFiIl0IlHLCvun6FfoSB8Mnwjqfj8scHLWML/E90Xn06P0U
         Csrg==
X-Forwarded-Encrypted: i=1; AJvYcCXaShbOiTbPYC/T1wgzwe734j312mJPyx+bNSAxwR4WPlXlVMaQnAXL+FiU2z/7bD1fczzIz6MZ/Zbj5aw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMnMNOK8O0uvUNyn3ukCszydrNek45R11i4nGIkmYATOqc2kzw
	vrhBWP1e3jdczip35V2UcFnje16h6lLGC4eZGMJTKWzk+BbhnNIN0XVBPJ96kVg=
X-Gm-Gg: ASbGncuowZvrLFcv1U2whdeORajytIziNnBBazTlhtoyoYoPAjVhR11HRejCIoKs5gY
	3qV+uT+92OTmAZEsfrD5SJK7sJWcr9tNBvqbxAAWRhZwrAIcqjsgk8LKPTtOvD6khnyiA3X7Ta0
	YmH4yc50D/Y/75PXlFxDFByNMMQStnLaJPKr/cBQ81Pi3pAtGKu+ixhApJdXTMMnEWTF4rpvWKJ
	tx1UnZH01iRBmTI5GQZyAmBNFC0A9Dk8zqozaUukyAAQ+UlF0m/OQmPnHdx6Oda
X-Google-Smtp-Source: AGHT+IHO9h+H3nQtpCAylHi4N1tDhCEXwfFp2Ug4YvZcEwI3J7mIrB866g5t/GIXJEMR5ZJQFBtNMg==
X-Received: by 2002:a17:903:1209:b0:216:36ff:ba33 with SMTP id d9443c01a7336-219e6ebcfc7mr750060565ad.26.1736140077545;
        Sun, 05 Jan 2025 21:07:57 -0800 (PST)
Received: from [10.100.1.231] ([157.82.128.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96e94dsm285208985ad.67.2025.01.05.21.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 21:07:57 -0800 (PST)
Message-ID: <70daf544-f59f-404b-bec0-0d60e892a9e9@daynix.com>
Date: Mon, 6 Jan 2025 14:07:47 +0900
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] elf: Define note name macros
To: Baoquan He <bhe@redhat.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, kexec@lists.infradead.org, devel@daynix.com
References: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
 <20250104-elf-v2-1-77dc2e06db4e@daynix.com> <Z3s+QeMv8AaGbMGs@MiWiFi-R3L-srv>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <Z3s+QeMv8AaGbMGs@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025/01/06 11:21, Baoquan He wrote:
> On 01/04/25 at 11:38pm, Akihiko Odaki wrote:
>> elf.h had a comment saying:
>>> Notes used in ET_CORE. Architectures export some of the arch register
>>> sets using the corresponding note types via the PTRACE_GETREGSET and
>>> PTRACE_SETREGSET requests.
>>> The note name for these types is "LINUX", except NT_PRFPREG that is
>>> named "CORE".
>>
>> However, NT_PRSTATUS is also named "CORE". It is also unclear what
>> "these types" refers to.
>>
>> To fix these problems, define a name for each note type. The added
>> definitions are macros so the kernel and userspace can directly refer to
>> them.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   include/uapi/linux/elf.h | 86 ++++++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 83 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
>> index b44069d29cec..014b705b97d7 100644
>> --- a/include/uapi/linux/elf.h
>> +++ b/include/uapi/linux/elf.h
>> @@ -372,8 +372,6 @@ typedef struct elf64_shdr {
>>    * Notes used in ET_CORE. Architectures export some of the arch register sets
>>    * using the corresponding note types via the PTRACE_GETREGSET and
>>    * PTRACE_SETREGSET requests.
>> - * The note name for these types is "LINUX", except NT_PRFPREG that is named
>> - * "CORE".
>>    */
>>   #define NT_PRSTATUS	1
>>   #define NT_PRFPREG	2
>> @@ -460,9 +458,91 @@ typedef struct elf64_shdr {
>>   #define NT_LOONGARCH_HW_BREAK	0xa05   /* LoongArch hardware breakpoint registers */
>>   #define NT_LOONGARCH_HW_WATCH	0xa06   /* LoongArch hardware watchpoint registers */
>>   
>> -/* Note types with note name "GNU" */
>> +/* Note used in ET_EXEC and ET_DYN. */
>>   #define NT_GNU_PROPERTY_TYPE_0	5
>>   
>> +/* Note names */
>> +#define NN_PRSTATUS	"CORE"
>> +#define NN_PRFPREG	"CORE"
>> +#define NN_PRPSINFO	"CORE"
>> +#define NN_TASKSTRUCT	"CORE"
>> +#define NN_AUXV	"CORE"
>> +#define NN_SIGINFO	"CORE"
>> +#define NN_FILE	"CORE"
>> +#define NN_PRXFPREG	"LINUX"
> 
> No objection to make them clearer. Thanks for the effort.
> 
> Wondering where below arch specific macros are used. So you just
> added all NN_xxx for the corresponding NT_xxx? Not sure if this is
> needed if we don't use them at all in the current kernel.

Indeed I just added all NN_xxx. The kernel won't use the macros that are 
defined as "LINUX"; fs/binfmt_elf.c uses "LINUX" by default as the notes 
named "CORE" or "GNU" are exceptional.

Userspace applications may still be interested in these macros as 
demonstrated in:
https://lore.kernel.org/r/Z3f7zJwu8bu8HYln@e133380.arm.com

These macros also serve as documentation; correcting and clarifying the 
documentation is the main purpose of this series.

> 
>> +#define NN_PPC_VMX	"LINUX"
>> +#define NN_PPC_SPE	"LINUX"
>> +#define NN_PPC_VSX	"LINUX"
>> +#define NN_PPC_TAR	"LINUX"
>> +#define NN_PPC_PPR	"LINUX"
>> +#define NN_PPC_DSCR	"LINUX"
>> +#define NN_PPC_EBB	"LINUX"
>> +#define NN_PPC_PMU	"LINUX"
>> +#define NN_PPC_TM_CGPR	"LINUX"
>> +#define NN_PPC_TM_CFPR	"LINUX"
>> +#define NN_PPC_TM_CVMX	"LINUX"
>> +#define NN_PPC_TM_CVSX	"LINUX"
>> +#define NN_PPC_TM_SPR	"LINUX"
>> +#define NN_PPC_TM_CTAR	"LINUX"
>> +#define NN_PPC_TM_CPPR	"LINUX"
>> +#define NN_PPC_TM_CDSCR	"LINUX"
>> +#define NN_PPC_PKEY	"LINUX"
>> +#define NN_PPC_DEXCR	"LINUX"
>> +#define NN_PPC_HASHKEYR	"LINUX"
>> +#define NN_386_TLS	"LINUX"
>> +#define NN_386_IOPERM	"LINUX"
>> +#define NN_X86_XSTATE	"LINUX"
>> +#define NN_X86_SHSTK	"LINUX"
>> +#define NN_X86_XSAVE_LAYOUT	"LINUX"
>> +#define NN_S390_HIGH_GPRS	"LINUX"
>> +#define NN_S390_TIMER	"LINUX"
>> +#define NN_S390_TODCMP	"LINUX"
>> +#define NN_S390_TODPREG	"LINUX"
>> +#define NN_S390_CTRS	"LINUX"
>> +#define NN_S390_PREFIX	"LINUX"
>> +#define NN_S390_LAST_BREAK	"LINUX"
>> +#define NN_S390_SYSTEM_CALL	"LINUX"
>> +#define NN_S390_TDB	"LINUX"
>> +#define NN_S390_VXRS_LOW	"LINUX"
>> +#define NN_S390_VXRS_HIGH	"LINUX"
>> +#define NN_S390_GS_CB	"LINUX"
>> +#define NN_S390_GS_BC	"LINUX"
>> +#define NN_S390_RI_CB	"LINUX"
>> +#define NN_S390_PV_CPU_DATA	"LINUX"
>> +#define NN_ARM_VFP	"LINUX"
>> +#define NN_ARM_TLS	"LINUX"
>> +#define NN_ARM_HW_BREAK	"LINUX"
>> +#define NN_ARM_HW_WATCH	"LINUX"
>> +#define NN_ARM_SYSTEM_CALL	"LINUX"
>> +#define NN_ARM_SVE	"LINUX"
>> +#define NN_ARM_PAC_MASK	"LINUX"
>> +#define NN_ARM_PACA_KEYS	"LINUX"
>> +#define NN_ARM_PACG_KEYS	"LINUX"
>> +#define NN_ARM_TAGGED_ADDR_CTRL	"LINUX"
>> +#define NN_ARM_PAC_ENABLED_KEYS	"LINUX"
>> +#define NN_ARM_SSVE	"LINUX"
>> +#define NN_ARM_ZA	"LINUX"
>> +#define NN_ARM_ZT	"LINUX"
>> +#define NN_ARM_FPMR	"LINUX"
>> +#define NN_ARM_POE	"LINUX"
>> +#define NN_ARM_GCS	"LINUX"
>> +#define NN_ARC_V2	"LINUX"
>> +#define NN_VMCOREDD	"LINUX"
>> +#define NN_MIPS_DSP	"LINUX"
>> +#define NN_MIPS_FP_MODE	"LINUX"
>> +#define NN_MIPS_MSA	"LINUX"
>> +#define NN_RISCV_CSR	"LINUX"
>> +#define NN_RISCV_VECTOR	"LINUX"
>> +#define NN_RISCV_TAGGED_ADDR_CTRL	"LINUX"
>> +#define NN_LOONGARCH_CPUCFG	"LINUX"
>> +#define NN_LOONGARCH_CSR	"LINUX"
>> +#define NN_LOONGARCH_LSX	"LINUX"
>> +#define NN_LOONGARCH_LASX	"LINUX"
>> +#define NN_LOONGARCH_LBT	"LINUX"
>> +#define NN_LOONGARCH_HW_BREAK	"LINUX"
>> +#define NN_LOONGARCH_HW_WATCH	"LINUX"
>> +#define NN_GNU_PROPERTY_TYPE_0	"GNU"
>> +
>>   /* Note header in a PT_NOTE section */
>>   typedef struct elf32_note {
>>     Elf32_Word	n_namesz;	/* Name size */
>>
>> -- 
>> 2.47.1
>>
> 


