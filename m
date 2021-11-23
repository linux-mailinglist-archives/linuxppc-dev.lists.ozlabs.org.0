Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B30B1459B8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 06:24:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hysyh4mC0z2yX8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 16:24:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MVtXRG23;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MVtXRG23; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hysy24tb9z2yKN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 16:24:08 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id b11so16036825pld.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 21:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=gddto/L6Aad3/eTtAsktG3OlA6e9jo3+yT5FuWCGdUU=;
 b=MVtXRG23MM5zqlX9Q2R6bODByUJHde+JqlsBG4BvQI2FAMd7ctYMHTzMO4Vjbe1jPo
 4qKPTvvHZKb8gXr4Tl8pueCVS0OcbGpI5PmVcPasvX20oy46gtzaogJxB3xaXptLyIH/
 YWNQtAyUG8Nbn7nzFVgCX7dKEUc+7MXCAyrPnUN4AHUIttGOaNXW0nMKn+PTK/GPWPAP
 MBIxu6VrUDbBDQf3n14ERLLrRDip1B7Kl4sHIY/ZCanXAUo+SOaIoKvn4LV5kP1oLeYb
 xHJFscw0QYEXfQJW0HdpST+9RvfkfW0KD4m3GifFLbhQfws/j8cWCcfmvcYIFXSR/R2q
 sGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=gddto/L6Aad3/eTtAsktG3OlA6e9jo3+yT5FuWCGdUU=;
 b=fuSmxRs5XcQQPeYi3FtYr/jdhWMU8zr1yztbSiSAdY8EQ9QsM40imwIpyoe80c2iZ2
 0mMFLf+m4nfhVEC1vlI2oad9DygibbdjdhTW31Zt4keYmHCEwuopNrUzv6HZ6WoovHjA
 V/9egXq3jqv9BXMXSxH7wYvYHfyLP/5x5+zDggglwBGgdyZKZVSFje8uneTLwG5lFRSQ
 QLO6VS5bhbtvII4pmtuIghuTDAm01C62i55np+gsL4W4C7F0+D1NDwznb010bR1PFBri
 bcMLsQHVD/1Fs+vmj/QUVl4lmbPEH6j2/rBWtfz7pTc71b8y+4aYQKALdO9IRihr2agG
 ER3w==
X-Gm-Message-State: AOAM530zfwP8a4nFKsxZ/2YlCyhTfYrDFrP9bqoPbHg/maU7Wrug7x9u
 UZkFgytNf+to3FoDpXL6j0ZQnKUVZ2CtIA==
X-Google-Smtp-Source: ABdhPJz4K9fFUXOLFtOJp5c9bqkbQ+HVwF4sCqdqkWZV1rON+fkQm5L8z2YC4LIrKe+/saa8YJs9Zw==
X-Received: by 2002:a17:90b:4b8d:: with SMTP id
 lr13mr38997248pjb.239.1637645045796; 
 Mon, 22 Nov 2021 21:24:05 -0800 (PST)
Received: from localhost (220-244-84-117.tpgi.com.au. [220.244.84.117])
 by smtp.gmail.com with ESMTPSA id g22sm11211100pfj.29.2021.11.22.21.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 21:24:05 -0800 (PST)
Date: Tue, 23 Nov 2021 15:24:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH V4 0/1] powerpc/perf: Clear pending PMI in ppmu callbacks
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1626846509-1350-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <40F23366-66BE-4063-8516-445E41E19EC6@linux.vnet.ibm.com>
In-Reply-To: <40F23366-66BE-4063-8516-445E41E19EC6@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1637644730.h2erjs9iz0.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Athira Rajeev's message of November 20, 2021 12:36 am:
>=20
>=20
>> On 21-Jul-2021, at 11:18 AM, Athira Rajeev <atrajeev@linux.vnet.ibm.com>=
 wrote:
>>=20
>> Running perf fuzzer testsuite popped up below messages
>> in the dmesg logs:
>>=20
>> "Can't find PMC that caused IRQ"
>>=20
>> This means a PMU exception happened, but none of the PMC's (Performance
>> Monitor Counter) were found to be overflown. Perf interrupt handler chec=
ks
>> the PMC's to see which PMC has overflown and if none of the PMCs are
>> overflown ( counter value not >=3D 0x80000000 ), it throws warning:
>> "Can't find PMC that caused IRQ".
>>=20
>> Powerpc has capability to mask and replay a performance monitoring
>> interrupt (PMI). In case of replayed PMI, there are some corner cases
>> that clears the PMCs after masking. In such cases, the perf interrupt
>> handler will not find the active PMC values that had caused the overflow
>> and thus leading to this message. This patchset attempts to fix those
>> corner cases.
>>=20
>> However there is one more case in PowerNV where these messages are
>> emitted during system wide profiling or when a specific CPU is monitored
>> for an event. That is, when a counter overflow just before entering idle
>> and a PMI gets triggered after wakeup from idle. Since PMCs
>> are not saved in the idle path, perf interrupt handler will not
>> find overflown counter value and emits the "Can't find PMC" messages.
>> This patch documents this race condition in powerpc core-book3s.
>>=20
>> Patch fixes the ppmu callbacks to disable pending interrupt before clear=
ing
>> the overflown PMC and documents the race condition in idle path.
>>=20
>> Changelog:
>> changes from v3 -> v4
>>   Addressed review comments from Nicholas Piggin
>>   - Added comment explaining the need to clear MMCR0 PMXE bit in
>>     pmu disable callback.
>>   - Added a check to display warning if there is a PMI pending
>>     bit set in Paca without any overflown PMC.
>>   - Removed the condition check before clearing pending PMI
>>     in 'clear_pmi_irq_pending' function.
>>   - Added reviewed by from Nicholas Piggin.
>>=20
>> Changes from v2 -> v3
>>   Addressed review comments from Nicholas Piggin
>>   - Moved the clearing of PMI bit to power_pmu_disable.
>>     In previous versions, this was done in power_pmu_del,
>>     power_pmu_stop/enable callbacks before clearing of PMC's.
>>   - power_pmu_disable is called before any event gets deleted
>>     or stopped. If more than one event is running in the PMU,
>>     we may clear the PMI bit for an event which is not going
>>     to be deleted/stopped. Hence introduced check in
>>     power_pmu_enable to set back PMI to avoid dropping of valid
>>     samples in such cases.
>>   - Disable MMCR0 PMXE bit in pmu disable callback which otherwise
>>     could trigger PMI when PMU is getting disabled.
>> Changes from v1 -> v2
>>   Addressed review comments from Nicholas Piggin
>>   - Moved the PMI pending check and clearing function
>>     to arch/powerpc/include/asm/hw_irq.h and renamed
>>     function to "get_clear_pmi_irq_pending"
>>   - Along with checking for pending PMI bit in Paca,
>>     look for PMAO bit in MMCR0 register to decide on
>>     pending PMI interrupt.
>>=20
>> Athira Rajeev (1):
>>  powerpc/perf: Fix PMU callbacks to clear pending PMI before resetting
>>    an overflown PMC
>=20
> Hi,
>=20
> Please let me know if there are any review comments for this patch.
>=20
> Thanks
> Athira

It seems good to me. It already has my R-B. Would be good if we can
get this one merged.

Thanks,
Nick
