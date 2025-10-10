Return-Path: <linuxppc-dev+bounces-12772-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F3ABCCFF3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Oct 2025 14:54:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjmsz5sNMz2yrX;
	Fri, 10 Oct 2025 23:54:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1031"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760100887;
	cv=none; b=Yha7XkekAAro+FS6ZAeBvKsr/+Gzi8PUUuUYBs7r0B/KFj0qRzPenB87Fe6aIqCniCMVVCbdb/awVm/GdDNjEeu4oSP8ETK/M8pJqxxSkz7JIkyrNCJGAhBOaqoDUoap1cO2LgjLnu/rfQpgkxd/w8aGY8XQr2Yx0iGKNoIJ2LQ1KpKFJwH7mpU0zgH1v/1Vjbu6nM319JxHbCHHxz2jZIXUNi7BMPMoMEL266Y1GUP6MHNOmUnNV3JA+uz81ALR3pQmcdfi9p6oBi3dpTqCYyzp0dGJzXt/XkAkN3uM4403r80AgrR6EMDNAG5YwKuJPjqcxRYOmwDeqVZIV6VLrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760100887; c=relaxed/relaxed;
	bh=kldC2zud6k9mqSCmtlg6o1ObXhcirCSqMnvOGGq4r3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X605r8aO1xscCky24NooCzEuwivD+Wi9blCe9BZ4S9yHXIGILL2jMzaS0Gcr+amXoXcRf0hHWL21dpiYhoE3ML24Gnk95+btVHsWBxyD6E/zj2/OuFWhB8RRUcHKyZ1F2ooSaTkePOgsbRBP10beF76BaB0r/UiJpN9AEMqMWQPIFhGYsK0yyv0eFMefLQbeN6fVybHq1gGdbo/9v9W7s2gFKFlVjY597pr42ygiEtoRIH5uQIyfynb1xmuMVaopgouOgS60C/bdhXXoIi+y8EU+rwemb4VGzZq7OuulM3NwstWFsiOblQPvf2jvs441ulVaGPsaly/x7dk1JVwBTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TY7Vm+1h; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=wangjinchao600@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TY7Vm+1h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=wangjinchao600@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cjmsy2sPXz2yqR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 23:54:45 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3306eb96da1so1655922a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 05:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760100883; x=1760705683; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kldC2zud6k9mqSCmtlg6o1ObXhcirCSqMnvOGGq4r3s=;
        b=TY7Vm+1hEfMlhJxRzn96QvJfNDaFS+pRnDCNE72k0WDRAznYSll/E2aGVdhYpOPkyJ
         cEb5wEhB95CButqE1nV2udHvRTeawI6cx1wyCf3OBPZJA25lEUH2u+kV93Mh27NzQrQI
         IJmo8NoUMwNWRP/MOULcsWRcE6kgwk6end667z8B/PnIXgHTXJtipoJvVvJyiyN/eAf2
         UPeSTxNXfgFI9BKIDgwayvXt39pm/Km8+UQtH07cVOaqIHMiXgCaiY5yJ7tTKYAJgKqy
         Nu39o6GpiEu/YrPRHvrUNuNRzCwNbo4X4q1TjRVRHRKhRIzO+1UnW4N035UoY1M4yhnj
         Jf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100883; x=1760705683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kldC2zud6k9mqSCmtlg6o1ObXhcirCSqMnvOGGq4r3s=;
        b=pKxDxqqWsTi/DxXpYwOPIDi51fGW8J5dC9jznV4F3rhrlxaX+qZjcK7T22IcyZv39Q
         9XXTYRvBciwch4+09Ls+Ghgz0L66oHDlhXf0B/Tir52M+prOJT36Yw7b1icoEOBhmVya
         OZ0P3LEOogOxuvkwkVEOp1LfLmuZd1hUg0ypciWsmweswmwcvJ0tB0C+s+ZzbE+AvC9X
         gab9607Ehf/h8m7bNTnMXVPdAQKogrrCaQ+t23EUpbG6XSAzbSAOHBD04TMspgVk5zzu
         BCuVl7OVNoyWi/EgF2wV+LMzuUvXstcc4r/tiRmjJyFAU85v2iOY3CFfTF7Z9X7FqRAY
         ISeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCF1diXrvsvFzXfD7Ljun8HTMfiEYLjIcETUNnd7FhT72vPEopI38+lSk7Ncq5BEVm5LqHxd55ZeLYoBI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwhD2G32SnfkW5ZBogPfWWCYFiLRyosAk8bs2atFS52Rqs/gnwi
	judg7Yyi/Z7du/HF7HVHrndrskmir60OqcAmvV7u5PsWSragHZWixLZU
X-Gm-Gg: ASbGncvZvT7D71LNHWzRElECkLiZKhJykBHteMFbbsxOd6CJsRr9Y0jAKwb3AUq5odZ
	D080k7+svuH88r7tPuEIuvzNyfo/OyB1FLO57G9IVexfKhT3Kr82TBLBEm3qunRehqDs57rXzL/
	sO9vLUz/tKhEHUSPrj/04irlBJnMOL3HqtH1jx41khB61VlipACK7MalSwSqI5TrobmNRc7FC3T
	oIJPSQM1TVTxiFK88mSF1kmneJ8+eDKRWb0XHYx70twYgxLV+aMrZGLxFAYdkpmbGbhQNvwTWTs
	3H5wubvnkxngVrwHcwbM6cIXP4tEBZ13P7Ixq3oRQTLwZXajH0z7GjXgwQqwhlJgCd5e3oQ0nYy
	dAZhnL6X6+y8cx6WCEUaDWEjdru6o/+jbGuxDCklXym7wDfYe
X-Google-Smtp-Source: AGHT+IEIxCl6Q477ztznNVKd7XMjfZA1OsWCmkCbiDx+RmUOwYB7lB3n8z2Z0BX7PWzMCBFIeSxkEA==
X-Received: by 2002:a17:90b:4d8b:b0:329:e703:d00b with SMTP id 98e67ed59e1d1-33b51386449mr15424797a91.19.1760100883216;
        Fri, 10 Oct 2025 05:54:43 -0700 (PDT)
Received: from [127.0.0.1] ([2a12:a301:1000::20f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b62631266sm2912083a91.3.2025.10.10.05.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 05:54:42 -0700 (PDT)
Message-ID: <a4c80b15-fed0-4ba5-acc1-240ceb7278e4@gmail.com>
Date: Fri, 10 Oct 2025 20:54:18 +0800
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
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup
 detector
To: Ian Rogers <irogers@google.com>
Cc: Doug Anderson <dianders@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>,
 akpm@linux-foundation.org, catalin.marinas@arm.com, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, acme@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
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
References: <aMpRqlDXXOR5qYFd@mdev>
 <CAP-5=fV05++2Qvcxs=+tqhTdpGK8L9e5HzVu=y+xHxy9AqLMmg@mail.gmail.com>
 <CAD=FV=VNmjTVxcxgTQqjE7CTkK2NVGbRxFJSwv=yOHU8gj-urQ@mail.gmail.com>
 <CAP-5=fW64xHEW+4dKU_voNv7E67nUOFm27FFBuhtFii52NiQUQ@mail.gmail.com>
 <CAD=FV=U3ic707dLuUc+NfxtWF6-ZyRdE0OY2VA6TgvgWKCHUzg@mail.gmail.com>
 <CAP-5=fVkw6TLjVuR3UCNs+X1cwVmYk7UFABio4oDOwfshqoP_g@mail.gmail.com>
 <CAD=FV=UWkZx8xQD=jBkOO6h2f5tw_KCoqhHciw5hkEOYU=GM8A@mail.gmail.com>
 <CAP-5=fXTFHcCE8pf5qgEf1AVODs2+r+_nDUOiWgdQeEgUBHzfA@mail.gmail.com>
 <CAD=FV=VuDYiu5nL5ZeZcY2b+YXOzZtSu2E4qBBHz9fWTW8gPhg@mail.gmail.com>
 <CAP-5=fX4=fV70N3GCdXgV6o-YoJynnSppxJp0MwdRrtsyDrs0w@mail.gmail.com>
 <aOdbRI3BaMCbyvtv@mdev>
 <CAP-5=fUAato=+jyNNESCX3SjWMEEJQ697VvWiBFCi5wKs_JQCA@mail.gmail.com>
Content-Language: en-CA
From: Jinchao Wang <wangjinchao600@gmail.com>
In-Reply-To: <CAP-5=fUAato=+jyNNESCX3SjWMEEJQ697VvWiBFCi5wKs_JQCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10/9/25 21:22, Ian Rogers wrote:
> On Wed, Oct 8, 2025 at 11:50 PM Jinchao Wang <wangjinchao600@gmail.com> wrote:
>>
>> On Tue, Oct 07, 2025 at 05:11:52PM -0700, Ian Rogers wrote:
>>> On Tue, Oct 7, 2025 at 3:58 PM Doug Anderson <dianders@chromium.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On Tue, Oct 7, 2025 at 3:45 PM Ian Rogers <irogers@google.com> wrote:
>>>>>
>>>>> On Tue, Oct 7, 2025 at 2:43 PM Doug Anderson <dianders@chromium.org> wrote:
>>>>> ...
>>>>>> The buddy watchdog was pretty much following the conventions that were
>>>>>> already in the code: that the hardlockup detector (whether backed by
>>>>>> perf or not) was essentially called the "nmi watchdog". There were a
>>>>>> number of people that were involved in reviews and I don't believe
>>>>>> suggesting creating a whole different mechanism for enabling /
>>>>>> disabling the buddy watchdog was never suggested.
>>>>>
>>>>> I suspect they lacked the context that 1 in the nmi_watchdog is taken
>>>>> to mean there's a perf event in use by the kernel with implications on
>>>>> how group events behave. This behavior has been user
>>>>> visible/advertised for 9 years. I don't doubt that there were good
>>>>> intentions by PowerPC's watchdog and in the buddy watchdog patches in
>>>>> using the file, that use will lead to spurious warnings and behaviors
>>>>> by perf.
>>>>>
>>>>> My points remain:
>>>>> 1) using multiple files regresses perf's performance;
>>>>> 2) the file name by its meaning is wrong;
>>>>> 3) old perf tools on new kernels won't behave as expected wrt warnings
>>>>> and metrics because the meaning of the file has changed.
>>>>> Using a separate file for each watchdog resolves this. It seems that
>>>>> there wasn't enough critical mass for getting this right to have
>>>>> mattered before, but that doesn't mean we shouldn't get it right now.
>>>>
>>>> Presumably your next steps then are to find someone to submit a patch
>>>> and try to convince others on the list that this is a good idea. The
>>>> issue with perf has been known for a while now and I haven't seen any
>>>> patches. As I've said, I won't stand in the way if everyone else
>>>> agrees, but given that I'm still not convinced I'm not going to author
>>>> any patches for this myself.
>>>
>>> Writing >1 of:
>>> ```
>>> static struct ctl_table watchdog_hardlockup_sysctl[] = {
>>> {
>>> .procname       = "nmi_watchdog",
>>> .data = &watchdog_hardlockup_user_enabled,
>>> .maxlen = sizeof(int),
>>> .mode = 0444,
>>> .proc_handler   = proc_nmi_watchdog,
>>> .extra1 = SYSCTL_ZERO,
>>> .extra2 = SYSCTL_ONE,
>>> },
>>> };
>>> ```
>>> is an exercise of copy-and-paste, if you need me to do the copy and
>>> pasting then it is okay.
>> Can we get whether a perf event is already in use directly from the
>> perf subsystem? There may be (or will be) other kernel users of
>> perf_event besides the NMI watchdog. Exposing that state from the perf
>> side would avoid coupling unrelated users through nmi_watchdog and
>> similar features.
> 
> For regular processes there is this unmerged proposal:
> https://lore.kernel.org/lkml/20250603181634.1362626-1-ctshao@google.com/
> it doesn't say whether the counter is pinned - the NMI watchdog's
> counter is pinned to be a higher priority that flexible regular
> counters that may be multiplexed. I don't believe there is anything to
> say whether the kernel has taken a performance counter. In general
> something else taking a performance counter is okay as  the kernel
> will multiplex the counter or groups of counters.
> 
> The particular issue for the NMI watchdog counter is that groups of
> events are tested to see if they fit on a PMU, the perf event open
> will fail when a group isn't possible and then the events will be
> reprogrammed by the perf tool without a group. When the group is
> tested the PMU has always assumed that all counters are available,
> which of course with the NMI watchdog they are not. This results with
> the NMI watchdog causing a group of events to be created that can
> never be scheduled.

Addressing the PMU assumption that all counters are available would
resolve the issue. If perf managed reserved or pinned counters
internally, other users would not need to be aware of that detail.

Alternatively, perf could provide an interface to query whether a
counter is pinned. Having the NMI watchdog supply that information
creates coupling between otherwise independent subsystems.

> 
> Thanks,
> Ian
> 
>>>
>>> Thanks,
>>> Ian
>>>
>>>
>>>> -Doug
>>>>
>>
>> --
>> Jinchao



-- 
Jinchao

