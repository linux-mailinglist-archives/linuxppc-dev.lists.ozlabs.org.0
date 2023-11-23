Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B167F61D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 15:46:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=KO5PP2st;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbgsW2M9kz3vdT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 01:46:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=KO5PP2st;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sbgrd3dkBz3bTN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 01:45:19 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-35beca6d020so3356315ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 06:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700750716; x=1701355516; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kuvt9r8KOWX1BiAT/c30zg7sLb0Byjj11/nVghaWWms=;
        b=KO5PP2steGN3LxSDHDNemQGyLsU4UJPLNuuAxEKQcXCmoo+fEVoREf8JNsehDvhIVv
         eu2iRJISqhXQespD2D+W6goGt5J7sbzmmrpLcjn2yDowUvUGJ8pPxreT0oQOPb2f6pJb
         YOc5axYPqxzsnV/Fc4hgpowoiCGpb6QtsL8rl+Qq1740QfvqxzxNtDvUnLhyBIQxONlr
         wui0OShwyoKCGu2FlOo/Y6+co7cc0WN4gF+gWCwh9bUGxhaMFUfncsqKcZeSiczrDJE7
         EzimtQ0TnMqAgudWTwXVNovD/JONPuBp2CmZXA++hy4e1kC54mO8yFubvsRqnZJ8nqBl
         e6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700750716; x=1701355516;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kuvt9r8KOWX1BiAT/c30zg7sLb0Byjj11/nVghaWWms=;
        b=dERFksPoSbvJPyOTBULd4WKOI2A3Y9xU64vgVx6m81JvvZJms8sGgqSDWS7ZfJ+IKK
         sPr8S/GNW8DLxrbJX02Rcx3VFmExjAO/hDv2RAzEQFDFvgw+MDrHCqDlEoqjQFYFXXtL
         Gxgxy+hKQDC94iAz552ml9/4Ah+z4eIczrQXAfU2GEVslug8W22PDY21FRCtYVoAPRai
         4EI6bgFEy+Dqj1kqhmBwMJMTJfzXctOntwlC9pEHSbV3goBUFmHXgfUbiep/AKloPd4P
         doatfcJX4BOV3Qcswh/kOtoAc0p9pYAco3FJAcoBgXADCgqnYJOy/6qT12VHagtPP1UO
         Cd0Q==
X-Gm-Message-State: AOJu0YyRCWnT3EYT6yku5uRjXS57y5LFxrRoKRyu2dqmHMAyYpWv6t/R
	m4fnvPzm+lxoHWkbsgjLQTz8aA==
X-Google-Smtp-Source: AGHT+IE6CculVp3F9Rtnr1OLtgszPmbMIieHBv875RrP/HPj2Ga5BLKHDujelRLOHcuKwZeQTRYzTQ==
X-Received: by 2002:a05:6e02:1285:b0:34f:70ec:d4cf with SMTP id y5-20020a056e02128500b0034f70ecd4cfmr5459643ilq.8.1700750716253;
        Thu, 23 Nov 2023 06:45:16 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:8976:165c:1b8d:1b61? ([2605:a601:adae:4500:8976:165c:1b8d:1b61])
        by smtp.gmail.com with ESMTPSA id s2-20020a056e021a0200b0035aeaed5112sm391231ild.84.2023.11.23.06.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 06:45:16 -0800 (PST)
Message-ID: <313e9a3e-0fe5-45e1-a164-1d55fb52898a@sifive.com>
Date: Thu, 23 Nov 2023 08:45:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] RISC-V: Add stubs for
 sbi_console_putchar/getchar()
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-2-apatel@ventanamicro.com>
 <70ff59ea-378c-4d53-899a-eafffcad22fd@sifive.com>
 <CAK9=C2U9aJDDd0JUhRqyLCF3dfyY5QBUrgyH+PKsT+pUKiB1xQ@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAK9=C2U9aJDDd0JUhRqyLCF3dfyY5QBUrgyH+PKsT+pUKiB1xQ@mail.gmail.com>
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
Cc: Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Anup,

On 2023-11-23 4:38 AM, Anup Patel wrote:
> On Wed, Nov 22, 2023 at 4:06 AM Samuel Holland
> <samuel.holland@sifive.com> wrote:
>> On 2023-11-17 9:38 PM, Anup Patel wrote:
>>> The functions sbi_console_putchar() and sbi_console_getchar() are
>>> not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
>>> stub of these functions to avoid "#ifdef" on user side.
>>>
>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>> ---
>>>  arch/riscv/include/asm/sbi.h | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>>> index 0892f4421bc4..66f3933c14f6 100644
>>> --- a/arch/riscv/include/asm/sbi.h
>>> +++ b/arch/riscv/include/asm/sbi.h
>>> @@ -271,8 +271,13 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>>>                       unsigned long arg3, unsigned long arg4,
>>>                       unsigned long arg5);
>>>
>>> +#ifdef CONFIG_RISCV_SBI_V01
>>>  void sbi_console_putchar(int ch);
>>>  int sbi_console_getchar(void);
>>> +#else
>>> +static inline void sbi_console_putchar(int ch) { }
>>> +static inline int sbi_console_getchar(void) { return -ENOENT; }
>>
>> "The SBI call returns the byte on success, or -1 for failure."
>>
>> So -ENOENT is not really an appropriate value to return here.
> 
> Actually, I had -1 over here previously but based on GregKH's
> suggestion, we are now returning proper Linux error code here.
> 
> Also, all users of sbi_console_getchar() onlyl expect a negative
> value upon error so better to return proper Linux error code.

Alright, makes sense to me.

Regards,
Samuel

