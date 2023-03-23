Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B086C6884
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 13:37:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj4bz0kZvz3f7m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 23:37:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AAAhVbam;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KRQCNT9x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AAAhVbam;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KRQCNT9x;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj4Zz2XPPz3chd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 23:36:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679574982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C1ZeVwAMcdgE90JtmIiMiS75gDxyRrOisVDnsuVcwUo=;
	b=AAAhVbamgnbXMGpvILnESVBWJfC13tdALhhR/u3fHYlaYPcp238NOYGg4k6HLm/9YIeMZK
	Zz4BkySToZYE3qLRap7Pa7jgAhTTvy5OxC76fzaF3zF/MLNWVYs2yZ99kIMUSNHyB7sAy9
	AUdFHzD4RwlrKNqf3eBbofqBMdpfy0s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679574983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C1ZeVwAMcdgE90JtmIiMiS75gDxyRrOisVDnsuVcwUo=;
	b=KRQCNT9xbLcQ2pIjQhnJGzkj9pC4cE/ah59J88gU6Lg+TY4KIbsWs6abamzJS4JDbqX6bI
	WX4rMLpn7v10n/jSvSOyrN2zn5Gvcoh2iKHkAZkRrsIjmjZOmTnWNn7rHR2ef8ALesVerG
	PncazaRsW3yYpwdMv4n1OKhkrF/Wz+Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-ALXhIx2sP-GNYKIS64wXaQ-1; Thu, 23 Mar 2023 08:36:21 -0400
X-MC-Unique: ALXhIx2sP-GNYKIS64wXaQ-1
Received: by mail-wm1-f72.google.com with SMTP id bi27-20020a05600c3d9b00b003e9d0925341so10229468wmb.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 05:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679574980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1ZeVwAMcdgE90JtmIiMiS75gDxyRrOisVDnsuVcwUo=;
        b=vaKT+jxRTU9pMPMIYIQBY0JgCStUh00XHL1fHxwTauu5bBeiLsQUmWu8SwDDzorI2Q
         1bztPdh+w1+A1Qgv+GoPku+OT9y0PoN1hxSbUU5Q9vDvcfhtNmMw6TiNuyHFGzByt3jA
         72yUj9nbVlba+Z35MUllnYQI2nB1YId0XaDsTq7l0ftZufOb3FYbcnEeGILfn1iUZTuS
         IU3tSFqiY9S8IU+DlqbnpTbF5/NNAICXe4elq/rElvWisnJ4GQntD7DcOeZigGkzY9QN
         35QUdtCymDSrX5iul0/WlSk5/YBrSMRdV6hJKyxQmWUMyxKPWaYjc27gTnTapTc8kGMw
         ehDw==
X-Gm-Message-State: AO0yUKWT6hbZt2n1oFMFa/OQRKbl62Yjv4Umzb2EmVAtwUfnVAr5OBV9
	U+ga50EghvAbVpautwJfmxSmVMaf6iV/THO+MYh58fO4b5IoKcRfKSJS9o4MKyEZsz8jAGB5LGe
	BJKU5vfyU4NCTvmNHNftmjA2o0g==
X-Received: by 2002:a7b:c7c6:0:b0:3ed:c84c:7efe with SMTP id z6-20020a7bc7c6000000b003edc84c7efemr2405807wmk.7.1679574980325;
        Thu, 23 Mar 2023 05:36:20 -0700 (PDT)
X-Google-Smtp-Source: AK7set8oDnR+hiI0SXiFClKDLDWGr6LPzKLAvyQijtGW1h8/zF2dqcPY+2ZH3SbZTb15LmBbQxnPpA==
X-Received: by 2002:a7b:c7c6:0:b0:3ed:c84c:7efe with SMTP id z6-20020a7bc7c6000000b003edc84c7efemr2405798wmk.7.1679574980073;
        Thu, 23 Mar 2023 05:36:20 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-146.web.vodafone.de. [109.43.179.146])
        by smtp.gmail.com with ESMTPSA id s12-20020a1cf20c000000b003ed1f111fdesm1754301wmc.20.2023.03.23.05.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 05:36:19 -0700 (PDT)
Message-ID: <f03084cc-8ac6-b2cb-b2e8-39bc73843ab7@redhat.com>
Date: Thu, 23 Mar 2023 13:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [kvm-unit-tests v2 06/10] powerpc/sprs: Specify SPRs with data
 rather than code
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230320070339.915172-1-npiggin@gmail.com>
 <20230320070339.915172-7-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230320070339.915172-7-npiggin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/03/2023 08.03, Nicholas Piggin wrote:
> A significant rework that builds an array of 'struct spr', where each
> element describes an SPR. This makes various metadata about the SPR
> like name and access type easier to carry and use.
> 
> Hypervisor privileged registers are described despite not being used
> at the moment for completeness, but also the code might one day be
> reused for a hypervisor-privileged test.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> 
> This ended up a little over-engineered perhaps, but there are lots of
> SPRs, lots of access types, lots of changes between processor and ISA
> versions, and lots of places they are implemented and used, so lots of
> room for mistakes. There is not a good system in place to easily
> see that userspace, supervisor, etc., switches perform all the right
> SPR context switching so this is a nice test case to have. The sprs test
> quickly caught a few QEMU TCG SPR bugs which really motivated me to
> improve the SPR coverage.
> ---
>   powerpc/sprs.c | 589 +++++++++++++++++++++++++++++++++----------------
>   1 file changed, 394 insertions(+), 195 deletions(-)
> 
> diff --git a/powerpc/sprs.c b/powerpc/sprs.c
> index db341a9..dd83dac 100644
> --- a/powerpc/sprs.c
> +++ b/powerpc/sprs.c
> @@ -82,231 +82,407 @@ static void mtspr(unsigned spr, uint64_t val)
>   	: "lr", "ctr", "xer");
>   }
>   
> -uint64_t before[1024], after[1024];
> +static uint64_t before[1024], after[1024];
>   
> -/* Common SPRs for all PowerPC CPUs */
> -static void set_sprs_common(uint64_t val)
> -{
> -	// mtspr(9, val);	/* CTR */ /* Used by mfspr/mtspr */
> -	// mtspr(273, val);	/* SPRG1 */  /* Used by our exception handler */
> -	mtspr(274, val);	/* SPRG2 */
> -	mtspr(275, val);	/* SPRG3 */
> -}
> +#define SPR_PR_READ	0x0001
> +#define SPR_PR_WRITE	0x0002
> +#define SPR_OS_READ	0x0010
> +#define SPR_OS_WRITE	0x0020
> +#define SPR_HV_READ	0x0100
> +#define SPR_HV_WRITE	0x0200
> +
> +#define RW		0x333
> +#define RO		0x111
> +#define WO		0x222
> +#define OS_RW		0x330
> +#define OS_RO		0x110
> +#define OS_WO		0x220
> +#define HV_RW		0x300
> +#define HV_RO		0x100
> +#define HV_WO		0x200
> +
> +#define SPR_ASYNC	0x1000	/* May be updated asynchronously */
> +#define SPR_INT		0x2000	/* May be updated by synchronous interrupt */
> +#define SPR_HARNESS	0x4000	/* Test harness uses the register */
> +
> +struct spr {
> +	const char	*name;
> +	uint8_t		width;
> +	uint16_t	access;
> +	uint16_t	type;
> +};
> +
> +/* SPRs common denominator back to PowerPC Operating Environment Architecture */
> +static const struct spr sprs_common[1024] = {
> +  [1] = {"XER",		64,	RW,		SPR_HARNESS, }, /* Compiler */
> +  [8] = {"LR", 		64,	RW,		SPR_HARNESS, }, /* Compiler, mfspr/mtspr */
> +  [9] = {"CTR",		64,	RW,		SPR_HARNESS, }, /* Compiler, mfspr/mtspr */
> + [18] = {"DSISR",	32,	OS_RW,		SPR_INT, },
> + [19] = {"DAR",		64,	OS_RW,		SPR_INT, },
> + [26] = {"SRR0",	64,	OS_RW,		SPR_INT, },
> + [27] = {"SRR1",	64,	OS_RW,		SPR_INT, },
> +[268] = {"TB",		64,	RO	,	SPR_ASYNC, },
> +[269] = {"TBU",		32,	RO,		SPR_ASYNC, },
> +[272] = {"SPRG0",	64,	OS_RW,		SPR_HARNESS, }, /* Int stack */
> +[273] = {"SPRG1",	64,	OS_RW,		SPR_HARNESS, }, /* Scratch */
> +[274] = {"SPRG2",	64,	OS_RW, },
> +[275] = {"SPRG3",	64,	OS_RW, },
> +[287] = {"PVR",		32,	OS_RO, },
> +};

Using a size of 1024 for each of these arrays looks weird. Why don't you add 
a "nr" field to struct spr and specify the register number via that field 
instead of using the index into the array as register number?

  Thomas

