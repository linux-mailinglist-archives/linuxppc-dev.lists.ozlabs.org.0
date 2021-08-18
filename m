Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F903F02EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 13:42:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqQxc21QHz3bjR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 21:42:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BNlt4g/p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BNlt4g/p; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqQwr00D9z30Gv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 21:42:02 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso8740116pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=eE37TLHYCz/B6ELciCXxrN+jhPgsmY8UHZGG/1hqcIo=;
 b=BNlt4g/pAkVnE2CMY7s+Zbbl2tRevuy2+ZeywjwarJ3BXv8xv3zrVS9TBFh615OrHr
 4vSR9pV69rZn4aG+X3YgMicIZnbGozAIpJnLe39l8XHpx9zZUycyjFVY/UFObT5kZemr
 1GYUfeOcu9ZwtNDRPBP06nkN69ySvELZe8ZqH6Ngr0eKhys3dguTIRsCyuRFjai1Git9
 pqcRnUXSe2i9xIvhYfYmy3+Ju8mkWda9B5dEiV1/qQzeH1N1VYCMIA0PaPmr6phrFx+B
 8BFfVL05FftPxvAvSI0FSyJEH70lLNADSwM3kbOqc8xBdrNkuWRO8++K5c0u5l5zI+DG
 iQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=eE37TLHYCz/B6ELciCXxrN+jhPgsmY8UHZGG/1hqcIo=;
 b=A6UJHoNgNg4Ot4cNj5aIzHqV6aEeeBLVZ2NmlkdwWzxF1ViODbHiOSQLWpGxo1rqt+
 ebngPmNZK3jOJsd+31/XGWLIUAjqnz88P8bRZAi65F2zQSRGRa6TksodxpKbYdNm+n5Q
 ViUOkl0xvH2BwjPLezfYw51+XaTs/ovME0Xa2AOlihusB0w0gs7poq3ZbIRyTUOjTyD/
 mwqhWu34xQl41qhE7NhQou1yybxWsdjF2gApYButxLjbju2n21wIKVQ0aCxM6vTc6yjZ
 cBdyQzN9BUcqc93Yos2ymWUjkkhRRiNs1Wj5v/yeN/ByAc//MM9e4STaAtOqUlNqg9Im
 1q0Q==
X-Gm-Message-State: AOAM533ekAkhiS9vh/SugUmJawQw/DOHbe8svd1VOmlmjPBh0ZBLCHH+
 dVPER+wVeOGfJ739YTKDX6XSWJbeCIk=
X-Google-Smtp-Source: ABdhPJx2w0y0NFHGDMZrd+Od7E/vPqkxg/D2MdorMHRpRIqJ5wkQXMWILnhp+DbdpFzatHQIO0NkHQ==
X-Received: by 2002:a17:90a:6502:: with SMTP id
 i2mr3053596pjj.129.1629286920578; 
 Wed, 18 Aug 2021 04:42:00 -0700 (PDT)
Received: from localhost (193-116-119-33.tpgi.com.au. [193.116.119.33])
 by smtp.gmail.com with ESMTPSA id c16sm5945579pfb.196.2021.08.18.04.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 04:42:00 -0700 (PDT)
Date: Wed, 18 Aug 2021 21:41:55 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 2/4] powerpc/64s/perf: add power_pmu_running to query
 whether perf is being used
To: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20210816072953.1165964-1-npiggin@gmail.com>
 <20210816072953.1165964-3-npiggin@gmail.com>
 <2e3108d7-8d11-d204-c605-fe51cd361586@linux.ibm.com>
In-Reply-To: <2e3108d7-8d11-d204-c605-fe51cd361586@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1629286381.q658eskbmg.astroid@bobo.none>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Madhavan Srinivasan's message of August 17, 2021 11:06 pm:
>=20
> On 8/16/21 12:59 PM, Nicholas Piggin wrote:
>> Interrupt handling code would like to know whether perf is enabled, to
>> know whether it should enable MSR[EE] to improve PMI coverage.
>>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/hw_irq.h |  2 ++
>>   arch/powerpc/perf/core-book3s.c   | 13 +++++++++++++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/as=
m/hw_irq.h
>> index 21cc571ea9c2..2d5c0d3ccbb6 100644
>> --- a/arch/powerpc/include/asm/hw_irq.h
>> +++ b/arch/powerpc/include/asm/hw_irq.h
>> @@ -306,6 +306,8 @@ static inline bool lazy_irq_pending_nocheck(void)
>>   	return __lazy_irq_pending(local_paca->irq_happened);
>>   }
>>  =20
>> +bool power_pmu_running(void);
>> +
>>   /*
>>    * This is called by asynchronous interrupts to conditionally
>>    * re-enable hard interrupts after having cleared the source
>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-bo=
ok3s.c
>> index bb0ee716de91..76114a9afb2b 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -2380,6 +2380,19 @@ static void perf_event_interrupt(struct pt_regs *=
regs)
>>   	perf_sample_event_took(sched_clock() - start_clock);
>>   }
>>  =20
>> +bool power_pmu_running(void)
>> +{
>> +	struct cpu_hw_events *cpuhw;
>> +
>> +	/* Could this simply test local_paca->pmcregs_in_use? */
>> +
>> +	if (!ppmu)
>> +		return false;
>=20
>=20
> This covers only when perf platform driver is not registered,
> but we should also check for MMCR0[32], since pmu sprs can be
> accessed via sysfs.

In that case do they actually do anything with the PMI? I don't think it=20
should matter hopefully.

But I do think a lot of this stuff could be cleaned up. We have=20
pmcs_enabled and ppc_enable_pmcs() in sysfs.c, ppc_set_pmu_inuse(),=20
ppc_md.enable_pmcs(), reserve_pmc_hardware(), etc and different users=20
call different things. We don't consistently disable either, e.g., we=20
never disable the H_PERFMON facility after we stop using perf even=20
though it says that slows down partition switch.

I started to have a look at sorting it out but it looks like a big
job so would take a bit of time if we want to do it.

Thanks,
Nick
