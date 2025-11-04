Return-Path: <linuxppc-dev+bounces-13730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4FDC30A27
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 12:01:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d159f6kZgz3bfM;
	Tue,  4 Nov 2025 22:01:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762254086;
	cv=none; b=GIMkUHeiFTP5K1DCT2bOQdy04MA1Z0w/jd4JQi085eaJYhdm6B82YXoGdaSnDy+O3cmJTEfp0+SvQLAu1ax0ss6OeMQZFwZiW15SK8qFYW2OvG9NWItSKl2iTPx/OqRsFkgERfa9f2wG3CE1dzTXmo6XtioIBE/nYxuh+QqlutMVgnKCuDVk7Pz1CEMQ9Qf07OMkAZdOprj6YHXOEGkuAvgv/1us0FRwWp7xoUZzUhLBAeYrPjvINFBPAxgltNqdqDfA/9xtzeZ86TLClH//rBCpF9NVBcAppQGRO+2qQDUhq3Ni7EGKJ1yMkAfiJ3t51CCAOy4OUVmvGAvQLZAxGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762254086; c=relaxed/relaxed;
	bh=Ab6XclKIAeufIonZjTLz/qxdfnGFmorsfm6jfN5F/GU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=evEkCy9/XVzRX9vPuS3Bqq8ZOk02MVum/5OYCLwdCRbYrzeWyXF5apxB+E+a+Vp6suQ4a+OXBknq9oaa+mkyVzX+2kDKVaDroo3e7x49nySQBXMAamSmOnQH1NiFKoBqH5dh/8HFf4zyHOyGIu8lt6CnDcuIuaYtNahwkNyxDHXc9+eDl3kri1t4Eo/1I3oXLpbjaaDxKUUBekZcgHB7TRsBfzWcnmMklZ5MVTtp4zMfBIj/AQWtnViSwlP+yX1JiqUEqsZH5ImzxgH7qJ+ItOF1zyU0OzfUg8X8f/bV1oerPlscab5UEa63W5cA8rHzy7h9OENoS3A8bmutSgLtrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SXFTJZSl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SXFTJZSl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d159d6bHmz304H
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 22:01:25 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3402942e79cso7497914a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Nov 2025 03:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762254084; x=1762858884; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ab6XclKIAeufIonZjTLz/qxdfnGFmorsfm6jfN5F/GU=;
        b=SXFTJZSlss6zCcOIHrJA4ZNU7JZ8KBH2szbXH4vktqxLdqvO03llthnbAy6uwabWPP
         c1hjZ6UbA+3b3kI+TQ1H7Cs5QHkQDQmaZKWU1YjzgKHBVqf4T+QL2DRhVqpXy5umjn7D
         wLYOuCAEAFiaT401q2XIfPyqE68Af/q12xTDRFZlPHSZyDapP79qyJL/+Y7fw1KeMWR5
         gfRGL/LBdGs0dHQdDBeS0+VrRHsjJ4wNqQRM/r6R9ITlsL1oVC6G+WDEfHJX2cVE1+A6
         vtymf2vMzRLYziGQ5kIGEf5nXBf8FdQ1NwGxl1ArBEvwnwEM/ur5QZ9+8xAwlbx3e9PV
         7C6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762254084; x=1762858884;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ab6XclKIAeufIonZjTLz/qxdfnGFmorsfm6jfN5F/GU=;
        b=xFBljcI5pQHc0AE1vweeVuE0sZxohixQy8lMP+EkX3uH0TkCDXdLweo1BweeuONslg
         xhve3cPmN6SEdStoDzJe6hnO6GOHtg1ehNBhvFnzJQ0dPUPDCH2+RQ2TaetE7TilKUhr
         Lw5zF9vZQwhYIDQDSIMy6d9TCL97zOxZOhYw1nfg07F72xJb4/eWDMhF93rHB57isH+R
         N322n0ZhMCSJMlBqQ5CWAfcCDzxdJLdtCXbrHZiV57J9Bo0nCR1H13yQZRGnDVGW/7RO
         BKnzfXP92UE9m+WbYHzOrmOHt6NzUdAIb2DTe4F1chBaB5BC1J2h0Sdgz4jf2Yi1Q35D
         GPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXa893XVi1jnzbA046MV3JUgT2HQlcuxu0Wq1Hb98rnQaeRSbkD0WJrYED6R50rSy4g6HLbNVy9SGoUHQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwrS5oJ1REwZ8i6re1FAyxdMdNus3bssLbTUu1trSn5WtTAC2jT
	1CV8lkWPR7nuLwzxv9YqfPSLTvmCvFq1cmTJSFi2ll++k9aMAGg2XTujwRkzoZyY
X-Gm-Gg: ASbGncsq6YAFcg5yvmEbgvZrxBMLj/Phf/XhJRKuvLiMDP/8JJVPT5rsYxW8DvYbzsT
	pJ7Zq2FLC2UeYRuBL5Z44pfYPtrpqDs49T8jd3Jv6RRuRugfZ+Cti0kofN+SdYD0jpaSJx9RV5i
	8gskQ3lWiDv2DO7OIx3WvUJnIw2/r39H2lOT/5GS53+JanA5Qbb4mSp5DfSw1tLCXWQpoLiDEJc
	+ZyZneEPyEDwT5GWnZN1wekXubumDdoDtu/dKyxNXr5I62hTDSUaarKACHXJNx5uSm3pSHLIMRF
	mR06eWrYnQ/yFpI4s/ZQ/kx2qSQf+qzQStyaCDbGwKoESTDhLgwMs0T2WjV5XCOSdust9wbp9JR
	C7EASl5NZItaV2tL4/tSp3/zIWWg9tSIHGIHYXNCIh++STByhhqkVnn6iV0AXCjWCXkUezQ==
X-Google-Smtp-Source: AGHT+IFhUFljNIpr0jYIPpg9DdgdyO4OfzVThDxcWuiPhHq2YUsCvhITskWN98lDONqYdPsc2uu0Gg==
X-Received: by 2002:a17:90b:57e5:b0:341:3ea2:b615 with SMTP id 98e67ed59e1d1-3413ea2c334mr7908860a91.15.1762254083595;
        Tue, 04 Nov 2025 03:01:23 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a15b6fsm4191556a91.18.2025.11.04.03.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 03:01:22 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Shivang Upadhyay <shivangu@linux.ibm.com>, kexec@lists.infradead.org
Subject: Re: [PATCH v5] powerpc/kdump: Add support for crashkernel CMA reservation
In-Reply-To: <722d72b5-cebf-48f2-8ad5-558ccd3c30f4@linux.ibm.com>
Date: Tue, 04 Nov 2025 16:21:41 +0530
Message-ID: <87tsza3waq.ritesh.list@gmail.com>
References: <20251103043747.1298065-1-sourabhjain@linux.ibm.com> <87y0on4ebh.ritesh.list@gmail.com> <7957bd55-5bda-406f-aab3-64e0620bd452@linux.ibm.com> <87wm463xtj.ritesh.list@gmail.com> <722d72b5-cebf-48f2-8ad5-558ccd3c30f4@linux.ibm.com>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> On 04/11/25 15:48, Ritesh Harjani (IBM) wrote:
>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>
>>
>>> I would like to keep kdump_cma_reserve() as is it because of two reasons:
>>>
>>> - It keeps setup_arch() free from kdump #ifdefs
>> Not really.
>>
>> Instead of kdump_cma_reserve(crashk_cma_size), one could call
>>
>> reserve_crashkernel_cma(crashk_cma_size) directly in setup_arch().
>
>
> reserve_crashkernel_cma() is not available unless the kernel is built 
> with CONFIG_CRASH_RESERVE.
> So, wouldn’t calling reserve_crashkernel_cma() directly from 
> setup_arch() lead to a build failure? Or
> am I missing something?
>

OOps.. I was assuming the #else CRASHKERNEL_CMA definition should get
called, but all of that logic itself is protected in
CONFIG_CRASH_RESERVE :(

Right to avoid #ifdef or IS_ENABLED in setup_arch..
it's better to have kdump_cma_reserve()

Thanks for pointing that out.


<snip>
obj-$(CONFIG_CRASH_RESERVE) += crash_reserve.o

kernel/crash_reserve.c

#ifdef CRASHKERNEL_CMA
int crashk_cma_cnt;
void __init reserve_crashkernel_cma(unsigned long long cma_size)
{
        ... 
}
#else /* CRASHKERNEL_CMA */
void __init reserve_crashkernel_cma(unsigned long long cma_size)
{
	if (cma_size)
		pr_warn("crashkernel CMA reservation not supported\n");
}
#endif

-ritesh


>>
>>> - In case if we want to add some condition on this reservation it would
>>> straight forward.
>>>
>> Make sense.
>>
>>> So lets keep kdump_cma_reserve as is, unless you have strong opinion on
>>> not to.
>>>
>> No strong opinion, as I said it was a minor nit. Feel free to keep the
>> function kdump_cma_reserve() as is then.
>>
>> -ritesh
>>

