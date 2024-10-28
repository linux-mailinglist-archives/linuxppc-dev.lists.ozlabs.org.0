Return-Path: <linuxppc-dev+bounces-2632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C49B2D47
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 11:49:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcVWz24VJz2xl6;
	Mon, 28 Oct 2024 21:49:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::535"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730112591;
	cv=none; b=CmirMX9yXpyST//JqPY8MlBpkdTKUGSTkbKYJc3EqVwsrV7+/9ZCOEmtSsUJQMB/7jOxZRPJxPVARLLyYZN8xQKLt6cg3tz6Kk/Uxjq5SP4rf71njtz7NkzF78P3fbs2lO2m1s3zJ4couaTk+g/9VzZCh/nmHzxFBEBIagHBcbDv/pTvTp1B5ofm3f9/tX7YI+BdbXd7jNTQAiOPBrgFv5TmJToMKUipf/k/4yn9L0t9MvLpbv258THCqZP32zHdfNRqzWYGe6HtvWvDLlo0KGhyL3/AhXmlxc6/2aD1NeOq+7xSgESPCwj6mY201OfJFd2sYL8c7FzQJoC1ORBwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730112591; c=relaxed/relaxed;
	bh=BADti5TEboUpz7hQZAwm95LJ4r/iBnqor7lFpH91gUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OubDCr6wcBSW/2D/D7fynDH5uiIvJJIgab8qyw61qjHQ6GhQxZZ63en11wIyy6DXS7tz9Jx6Yzty+XyWc2u+mFayR6vJUQF4YW/Fol/KsdFI/UeF3LpnTfhpaO//6wZ4gtU++tJj5sV5LLdhlY6VPB+17KLrS5Acr9ltmUS7jRBhJrTs2iHxaT6E0crdVxAG5uNZf+g/j8zzsirMrZws0F853XkcuBDhz8hoJjE47KrAKwvksk2XQqWNi2HhoXQcMGJ4h2KBqdN7C1U7PLniUwyXP7hLrD07ryaQnrBrN8D8oxzeGUyX18/eePACzoFb9uI2ejF6aRVHzlyAzq8OYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UxCh3izj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=usamaarif642@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UxCh3izj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=usamaarif642@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcVWx4FCdz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 21:49:47 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5cbb719839eso3706263a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 03:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730112582; x=1730717382; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BADti5TEboUpz7hQZAwm95LJ4r/iBnqor7lFpH91gUs=;
        b=UxCh3izj05w0y3xhNamRAXikEfSaOhLmYWCnmQ+c8eXToO/XnaPn6bip4MXki6eKYm
         6sJzJnTff5iRetrq0OkE5s0EStD92hWdpdncpd5esSxDu6rBV9/z8Q/b8wP1StaZUXpY
         1Noz0jjNiocLD6CeVRYUtJcDREzIe955QuWKKGAzM8KU9PclH4RzDfcwKr1smuAlAfAH
         B2wZEz3cbkEK+fowmGy+OhKyMxk2FCNDDDsj5Rbhwsnou2CgkJpn6963JfDrcBEIbItD
         EWD2t83VJjAzouSjAeEilnGMMKLJsfS5qy93MhGiW0ccjQ+pXc4X5cls/a+x7Vw6MPej
         kwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730112582; x=1730717382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BADti5TEboUpz7hQZAwm95LJ4r/iBnqor7lFpH91gUs=;
        b=a5ihptGpLTzIc0XwhqOepDUCf3xITKC+7xhsOpSIS2AC1lL9+TzZ73FcjGkcw6KYsm
         7XtLh7q4nJXjH5sJUmoyro+SlsZNT8+F1xkMb4wjPnmk3sZEGOxDDczjOdGqYoobnBFL
         5wmUmJllN7tIXaRyUJfSxHExeNRpDG9BX4d7a1BYGS2W7TNbOP6PQnr72AKtT2fEloGn
         OLYUrxthKJjRy1Kl8MVG0iWp60WojAq7VoMFcPv0fgkUp4j/C0feq7eSYzCfI2eJa3Sq
         OQx2tWPeYKGe0am3ekjYZoWw/IbvyBlVKyflbKhGcIN9Hf+XWSSxH9E+TAEeZx/4+D18
         NPEA==
X-Forwarded-Encrypted: i=1; AJvYcCXOhc2vH2MPBUkGr3BmZKyIaQquKug+5CRGZtASbRTqqHkbmoQuOWl8XO5auUyd9ZI9e88bp2naaGd6TZc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyAmeAdhb+hvQ8icB4GANOiSyuKkKIZcQ+nTWJQ0/EZ4DtMDAfk
	vK35r0QeMLAMYfRleNeqOXfYww4cIvRiBJ3Er4AhSxNGgtlUwwxF
X-Google-Smtp-Source: AGHT+IEm+HFLbPsaDOWlAHThJ3+XtoGjdhXujglmfhVMP7yNqtZqIoTJpMUXVSYjXbaSqnnT3/SHtw==
X-Received: by 2002:a05:6402:5202:b0:5c9:5cff:3cc2 with SMTP id 4fb4d7f45d1cf-5cbbfa71a66mr5776613a12.29.1730112582021;
        Mon, 28 Oct 2024 03:49:42 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:eb:d0d0:c7fd:c82c? ([2620:10d:c092:500::5:1494])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb6258683sm3063919a12.20.2024.10.28.03.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 03:49:41 -0700 (PDT)
Message-ID: <71decb01-4241-4fb0-bc38-187e180d6ee5@gmail.com>
Date: Mon, 28 Oct 2024 10:49:40 +0000
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
Subject: Re: [PATCH v2] of/fdt: add dt_phys arg to early_init_dt_scan and
 early_init_dt_verify
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, will@kernel.org, leitao@debian.org,
 catalin.marinas@arm.com, tglx@linutronix.de, chris@zankel.net,
 saravanak@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-openrisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-csky@vger.kernel.org
References: <20241023171426.452688-1-usamaarif642@gmail.com>
 <CAL_JsqLBuzRYgnYHCdbdO4wneFNPe5_iEfbehvKK5M7bBuiyfA@mail.gmail.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <CAL_JsqLBuzRYgnYHCdbdO4wneFNPe5_iEfbehvKK5M7bBuiyfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 25/10/2024 23:15, Rob Herring wrote:
> On Wed, Oct 23, 2024 at 12:14 PM Usama Arif <usamaarif642@gmail.com> wrote:
>>
>>  __pa() is only intended to be used for linear map addresses and using
>> it for initial_boot_params which is in fixmap for arm64 will give an
>> incorrect value. Hence save the physical address when it is known at
>> boot time when calling early_init_dt_scan for arm64 and use it at kexec
>> time instead of converting the virtual address using __pa().
>>
>> Reported-by: Breno Leitao <leitao@debian.org>
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()")
> 
> This looks fine, but what is the symptom without this compared to
> before the above change? The original code in the referenced commit
> above didn't remove the reservation at all. Unless the current code
> does something worse, this is new functionality more than a fix (for
> stable).
> 
> Rob

After the series in [1] was merged, we always get a warning when kexecing
a debug kernel, which was reported by Breno in [2].
The issue is using __pa for a fixmap address in arm64 as described in [2],
which could result in removing a memory reservation for a completely
unrelated area.
That was introduced by the patch just before 
"arm64: Use common of_kexec_alloc_and_setup_fdt" [3], but arm64 switched to
using the common kexec fdt function in that commit. This commit is trying
to fix removing and corrupting any random memory reservation (and get rid
of the warning) that was introduced by [1], not adding a new functionality.

[1] https://lore.kernel.org/all/20210221174930.27324-7-nramas@linux.microsoft.com/ 
[2] https://lore.kernel.org/all/ZnFKEtqfqJkYflwL@gmail.com/
[3] https://lore.kernel.org/all/20210221174930.27324-6-nramas@linux.microsoft.com/

Thanks,
Usama

