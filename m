Return-Path: <linuxppc-dev+bounces-13972-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C63C43567
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 23:25:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3r8b5ltyz3btS;
	Sun,  9 Nov 2025 09:25:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762640703;
	cv=none; b=dK1TR61MBwYJGPXZzpaBYF4ZMx3SP8w5TXAG2ZWmo8imAUdeiQv7ZdMFR1euZFPmfXH3BjRvKm6V3H2v3wI53p+JypFvLa4CNFQuShHoVtEC+2voUSAfu2vNlsGAPI7MwkPQgtAmTtWMlC0H1sGNFx+9lX+G1VERp3OU3ieZ8SZcqrQSx00Fj+Hm8Ei9g7gIztXgAVdXdxxyVCBx0yuvi51gfxF1VAASCSPF4SdRd3TJFGmrp5+wKWCp1H4g5Nn9EkdqEDSQLVAJjN5f1QXmoLxWtmPdFOFi02oxOpKRdFk4dhGVHNvDql5a56Vxj4DmiG2NjTCDOY871tbHz0zLiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762640703; c=relaxed/relaxed;
	bh=rIK9zYAgTOFKn0gaT0fUYRv/pXw/XsmvNmFsqqYFUAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MM/xrm1G2yBdHhnCrk2L/tNHhC65Ww2AGvf9sC31PExpKMwFLFb1iQwgtmdfy7sc7VZreW2bo4pRvElyFFCFRd0SjbrZxa2FTFaQSEhsFXYiw6Yuy8QbHjVYdk08a7+ZuKSNIZLKuF8YSMcGy/Zesn6HkTYVGRwd+7/UA792U8l+9mZ9fDV1w5fqz+8eWvw6tPERLUr4d4YvJUrjmo9cG0YyHL9c8X8m0gn6C8UGih/nqs/QCxciD6y4ezVrV/Q0lCfFPGkMX3GoEQzfmPU1GVEtYBrsE0/Zrg+blha9PuLXhPt77d0lO63o7nL8aXndgavxthzxCo+DfqLLu7GWeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass (client-ip=209.85.219.51; helo=mail-qv1-f51.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.51; helo=mail-qv1-f51.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3r8Y6rv0z2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Nov 2025 09:25:00 +1100 (AEDT)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-882451b353fso1504456d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Nov 2025 14:25:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762640697; x=1763245497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIK9zYAgTOFKn0gaT0fUYRv/pXw/XsmvNmFsqqYFUAk=;
        b=n4lD9/B7/IeW2D4tPqp/DV+0UhHyHaXSY/TC7+xBW/IZf9OCxwP6VeB7XCYdOZpOUQ
         9Q4eM9gV+IPxF8P/dKYl7NuYsw5z/7ezlBAO4byzK5UqiCU5Np3VSPMh6Y6KdyirRdXS
         Hjw8imWA6vGAkTv7/cVp6ewPcmuIQjPplsnZDGKsU4wrRLZTTb0VVFMF2H1QDfFuAVN1
         ESXwNmXFSC7yyfD/y/Yzx1gmYMMff6zRo1trEhMYqz2rliBg+XtLDwMhkjayEKW1Sb7m
         8cbS+55RrqeWgYtMfGv0yXaXx1UBWflK0ykJEq/b6l/7AHMMoQ8rabRmYYe4ieBHLgJw
         xl+w==
X-Gm-Message-State: AOJu0YyIuiUXMfC+4TQzV2FeudtZTD9AQPXudACMxtmc+ofWfiw7bzPG
	8yxEDcfC6ZEG8Ss7FJ70+MKXb0VeGurTi/n9kLipycT62C+P35pNUCCG
X-Gm-Gg: ASbGncsD7934FzsY4kVNaj5aGoNO4LPk8vZwqSkQXo5PnGECDhtp4izULmO2OOXW1jM
	Dl86nDZHv9GZuIpq9ZH0ID4aw0D9ntUrs7mcLyV49bkGAxq8Z70fonncMRzI612J1q8SfTGPVGG
	vNmAu+cU/7ImZNQaJA+xKQaGkahTd4QvxCKCGHTw5IPnX4RROXIDJzfh1uAEUCAfqkHoopfU3QR
	+XtCaktwDb/DKRqj1N2zVpF6J4r8R6/D4YFpmhf+1d4p8sVfZ2EVKowagWXiYp38f1mJeTKzaPb
	nmOM+YfD9EExvRDKBKHaAWquDlsgzUAUJCHYnJXMqUBpAGo1bqFUYQtm3Hdud0mf7+w4hj+oGVo
	1/RvYt5RldQXfs15kMky1/5QHDyK0CmpU17quXEagQioYu4JQ31geGkqtFER9FYIlJhSoFuTU/d
	jy
X-Google-Smtp-Source: AGHT+IEjXFwr+Srm4QmfVRgu2vNEak6lu57AWOlSK22OF1wICTm1uk8SpWxSTMr5t0Nyhn7q3c8MDQ==
X-Received: by 2002:a05:6214:daf:b0:880:5851:3c61 with SMTP id 6a1803df08f44-882384ae832mr39079716d6.0.1762640697346;
        Sat, 08 Nov 2025 14:24:57 -0800 (PST)
Received: from [192.168.2.45] ([65.93.187.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88238928a80sm21582896d6.9.2025.11.08.14.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Nov 2025 14:24:56 -0800 (PST)
Message-ID: <baf4fd6c-1796-47cb-a9bb-72521a217453@vasilevsky.ca>
Date: Sat, 8 Nov 2025 17:24:44 -0500
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
Subject: Re: [PATCH] powerpc: Fix mprotect on book3s32
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nadav Amit <nadav.amit@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mm@kvack.org
References: <20251027-vasi-mprotect-g3-v1-1-3c5187085f9a@vasilevsky.ca>
 <878qgg49or.ritesh.list@gmail.com>
Content-Language: en-US
From: Dave Vasilevsky <dave@vasilevsky.ca>
In-Reply-To: <878qgg49or.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-11-08 14:16, Ritesh Harjani wrote: 
> Shouldn't we flush all if we get tlb_flush request for full mm? e.g.
> Something like this maybe? 
> 
> +void hash__tlb_flush(struct mmu_gather *tlb)
> +{
> +       if (tlb->fullmm || tlb->need_flush_all)
> +               hash__flush_tlb_mm(tlb->mm);
> +       else
> +               hash__flush_range(tlb->mm, tlb->start, tlb->end);
> +}

That seems reasonable, I should be able to test it next by next
weekend and re-submit.

> Thanks again for pointing this out. How did you find this though?
> What hardware do you use?

I'm on an iBook G3 from 2001, running Arch Power:
https://archlinuxpower.org/. I found the bug because SheepShaver has a
configure test for mprotect, which was failing--I was quite surprised!

The bug reproduces easily on qemu (with the `mac99` machine), if you'd
like to try yourself.

-Dave



