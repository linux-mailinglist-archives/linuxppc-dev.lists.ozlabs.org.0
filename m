Return-Path: <linuxppc-dev+bounces-12266-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5101AB58CB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 06:19:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQpZ908NKz2yrF;
	Tue, 16 Sep 2025 14:19:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757987232;
	cv=none; b=BjsKy5di1yceIxliefRhMJOuy5mb1BkkSd1hdcG21yqpDhWWc0Jd/647jS7egkM9cBdUbhjz0SZlz9qzGW9Ap/GwQri50Wf6bvtIozPrUjic6pNx+uEtn8srTUUOpjPFv/XEJuERZnwO5hW6r722TUrMhPP0oIJEqD21qu4imbWtf0aAyeMfEIgcWpsJjtdJGvxy9fux54DtGq02ur5YbdjsRdejynZdMlDpuQrYHrZLN/fcWXtPVGGExRCZ2xXguzz+ejKde9URS2vUTXbSZhI4IU07C3zHdKVgn9rYxOzSCOm/WJYUxZTGmVsxSyl6fZ/FyDraQFGDvoW+BVytKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757987232; c=relaxed/relaxed;
	bh=RiFj7ZcI9WNx+PCt1N/twq4GLIPGrm80taj6KBbbDlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFTPcoBYxisR4YKdOU0T6DN2LwnCooZSGJFdNEwNF8eUm0S7epNtWy8XrJq99M3sO867fpnnCvz8iIF5ldpllHn/rxZ3ntz1XUu2IdFR21/VogdnJ5N5tF3/nLHCbwrbJ2kNw/+GQZtsLqhhv8EYOBLhPZvU5sQTZ01uOBdnblMWwghPfJ2SEl3cfQuz5R/dKS3XIFJ/Tp6vhnLVI1wWGf2x9z2P8TpPx/v6lsiAGgDtfcfUwh6lfJFxlIVKRqGw6ZjkouOburcvxncidqfUBv8F3h37rxd1OPoAhwUPnKVJYcTEy53o4MJitbPGV46/0dAcgBC3IpCHAvR9n4qKfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Eyh4GuX6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=wangjinchao600@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Eyh4GuX6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=wangjinchao600@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQlBl3q14z302b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 11:47:10 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7724df82cabso5030397b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 18:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757987227; x=1758592027; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RiFj7ZcI9WNx+PCt1N/twq4GLIPGrm80taj6KBbbDlU=;
        b=Eyh4GuX6GB5Iz5F3BNF1w+gOCW5DVmO5CuhrcmfAlp7FvFk+BRcuBTkqK/IXjG5J+5
         7fQHh2nut8kCxaiTWGCD3RZ+6ufvCk2IQPDUlEZdsnaZu8AkjVO77eTpaPHLGsbOrfMT
         zNN1HqKHi4G0W46P69A6OBJo+OObwYsuNmF7HziKsm/zZFtbb6rdgcMo4tGE67UbMPBv
         9jH4AuhbyU35C1tiZps7ufgmpNefQvSFev/odlknAOCZksEsRsdBElHWvODJGXct0Kmi
         7F9tjj6asBBfLv/Dd4KMjcuzodr6o4QIAiHb244yyPLveoF2R0aHJBFbpx/A4LRfHaLK
         jruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757987227; x=1758592027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RiFj7ZcI9WNx+PCt1N/twq4GLIPGrm80taj6KBbbDlU=;
        b=Upr9evZAsmPF579sI8SN4BmWbbQQcWP3tSEHAQ4IgHzZJ6vmqvNH6Y4iExihKzXld9
         CUV8pkS147xXHfDGejA7rqkCuf4x9JvNF87aU9RqXtgboZzz+9dANs68/xFuic+hIDkv
         gAIfUs+0qqmFhNHB9/QFa5xP1by9u0h2ZUiZ+VCQTTo9bZYhluJHqHWCiw4s0svuEH9D
         cxsma3MoEwa5nU+QxQO4DAsBH5swycbC6xom+lSXynY/e+yXxqff8asGaaYhni6xWAGM
         z7byZ3ZGZoRrNBxcN0l9CvoVnnrL5khS/UUa0fpmVltxfLc+rSZm01QUrCRIcrC7SjhV
         wsfw==
X-Forwarded-Encrypted: i=1; AJvYcCVFGR2f1BXugEyHUlElbCtmsZ3ErQYNzPjO7wB6ncjYaxoFojpILnJwQvrIPYReQFm8zqmf/Et6E91F93I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywhu3XfbS58lfVUqtDbJ/L6BHKJsLGjwA8hy80CaTBlWGTzXmJj
	uxXWPyPAYcj1spSf4reY8O+W0PxctRlA2Vhsvr+V7MCeXe4up1ZSdMVu
X-Gm-Gg: ASbGnctteGE4M8M6iOhvhjihLI+mNYBpwW4qMw0WVpXWS14TxYR8ty3bcxicmyfIAAc
	Xvf4s/METmjflg+vV4M6Upgl9P0b9L39hTpxvjgqsEIo8trSU95ztLtdzTXe6yGD/PyTFDebmhz
	AKBFVyS1Zu5NuSHf+gFPKPkaWDl5/K63NbAQtBUtit3yo0MMxYoFV57RskViCsnmzRP9sAV/1nA
	kDUzKm3ImMFiPICNIpqAURYeyYP+In07vLrDXzhVDFTIZkXmaKsIDM4RhS0lDfJfP1q8MfOQdDo
	2P2jDlQi/UhOi1A1MbE62n0q/Ssdp4Frbi5jjTCqAdNrOIV5Kzy2QNM+PDeejGt5T6YCy7CkxwD
	IwRmkdjYZs2M3vOamsJ8=
X-Google-Smtp-Source: AGHT+IHJPmOLXIdspKyA83O/BAcGlrfnU5dISVvn02DWV9qPvrZzZVyEnyHMg3+oATLbcf7uKM0HhA==
X-Received: by 2002:a05:6a20:7f90:b0:249:fd42:fa33 with SMTP id adf61e73a8af0-2602a28e8edmr15663072637.4.1757987227306;
        Mon, 15 Sep 2025 18:47:07 -0700 (PDT)
Received: from [127.0.0.1] ([2604:a840:3::30f3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793b5fasm14930150b3a.16.2025.09.15.18.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 18:47:06 -0700 (PDT)
Message-ID: <7366f87a-1924-4dac-8945-389e6674213f@gmail.com>
Date: Tue, 16 Sep 2025 09:46:53 +0800
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
Subject: Re: [PATCH] watchdog: remove HARDLOCKUP_DETECTOR_PERF
To: Doug Anderson <dianders@chromium.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>,
 akpm@linux-foundation.org, catalin.marinas@arm.com, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com, kees@kernel.org,
 masahiroy@kernel.org, aliceryhl@google.com, ojeda@kernel.org,
 thomas.weissschuh@linutronix.de, xur@google.com, ruanjinjie@huawei.com,
 gshan@redhat.com, maz@kernel.org, suzuki.poulose@arm.com,
 zhanjie9@hisilicon.com, yangyicong@hisilicon.com, gautam@linux.ibm.com,
 arnd@arndb.de, zhao.xichao@vivo.com, rppt@kernel.org, lihuafei1@huawei.com,
 coxu@redhat.com, jpoimboe@kernel.org, yaozhenguo1@gmail.com,
 luogengkun@huaweicloud.com, max.kellermann@ionos.com, tj@kernel.org,
 yury.norov@gmail.com, thorsten.blum@linux.dev, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org
References: <20250915035355.10846-1-cuiyunhui@bytedance.com>
 <aMfpwYPX6_i6ROOY@willie-the-truck>
 <20250915103506.GA3245006@noisy.programming.kicks-ass.net>
 <CAD=FV=Vr67+uRK2bYu34MDXRJN4w_VH_EO7OW4eVLJ3wqUUBog@mail.gmail.com>
Content-Language: en-CA
From: Jinchao Wang <wangjinchao600@gmail.com>
In-Reply-To: <CAD=FV=Vr67+uRK2bYu34MDXRJN4w_VH_EO7OW4eVLJ3wqUUBog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 9/15/25 23:42, Doug Anderson wrote:
> Hi,
> 
> On Mon, Sep 15, 2025 at 3:35 AM Peter Zijlstra <peterz@infradead.org> wrote:
>>
>> On Mon, Sep 15, 2025 at 11:26:09AM +0100, Will Deacon wrote:
>>
>>>    | If all CPUs are hard locked up at the same time the buddy system
>>>    | can't detect it.
>>>
>>> Ok, so why is that limitation acceptable? It looks to me like you're
>>> removing useful functionality.
>>
>> Yeah, this. I've run into this case waaay too many times to think it
>> reasonable to remove the perf/NMI based lockup detector.
> 
> I am a bit curious how this comes to be in cases where you've seen it.
> What causes all CPUs to be stuck looping all with interrupts disabled
> (but still able to execute NMIs)? Certainly one can come up with a
> synthetic way to make that happen, but I would imagine it to be
> exceedingly rare in real life. Maybe all CPUs are deadlocked waiting
> on spinlocks or something? There shouldn't be a lot of other reasons
> that all CPUs should be stuck indefinitely with interrupts disabled...
> If that's what's happening, (just spitballing) I wonder if hooking
> into the slowpath of spinlocks to look for lockups would help? Maybe
> every 10000 failures to acquire the spinlock we check for a lockup?
> Obviously you could still come up with synthetic ways to make a
> non-caught watchdog, but hopefully in those types of cases we can at
> least reset the device with a hardware watchdog?
> 
> Overall the issue is that it's really awkward to have both types of
> lockup detectors, especially since you've got to pick at compile time.
> The perf lockup detector has a pile of things that make it pretty
> awkward and it seems like people have been toward the buddy detector
> because of this...
> 
> -Doug

Should we support both modularization and changing the backend after 
boot, so that the user has the choice?

-- 
Jinchao

