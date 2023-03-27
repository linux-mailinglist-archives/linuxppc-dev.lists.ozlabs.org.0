Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BF06CAA02
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 18:11:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pld8w68G0z3fXY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 03:11:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ABcHt8rq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ABcHt8rq;
	dkim-atps=neutral
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pld7m0lXfz3fSX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 03:10:11 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id u8so4872349ilb.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 09:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1679933408; x=1682525408;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P8wCW2eNQTq5bveiunIDZcQtvm/yY3lsGh2Pmpq1+2Y=;
        b=ABcHt8rq3mXGaKlb7ZPHQfQjEwXFhf9FYKm0Blc2a7Ue4TuqwtjBblt5Cjd59rV81W
         6upHfDDHTGLePw2jmy8M2i3DwLK7sbKEPnxloaBl7KU1ruHs3X+gow6ts5bXzk+Iziho
         WIEuCEwFYMTG/ocm2ANxM/mP2odJGRI8hKesXiWRxwLkY3G2L2Zx4ddqur02TYlqZURD
         BrSFvV3U40aU3A/B6UbqYwIMVL8IvYsgMzEmzZL2WVIQiwD7LnPf6bHZXGzaa4XgJLzq
         PFKkW7mcEFMUjPw9x/ssS5f1N7mnYZeaFPxHCFEaw38w758yiPrUMmxn3/YImOztF5nn
         BluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679933408; x=1682525408;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8wCW2eNQTq5bveiunIDZcQtvm/yY3lsGh2Pmpq1+2Y=;
        b=ZhN62RVl4/3vod++BVcQdhzhrCh0boKTRmcwaepSqp9JT8s3WUVFLoMJg8HMb+VmCj
         mbnJFFDoZBka06fdw3CLPF+i0b17m7a8SB0kl8mv6yyZB1Sql70++eprhfMQjq/sg5eu
         kNC5MxU+kTfxQ+fXKH0e4cSGuRQqPZujcpm8qlZ1DxhWCpf0dmgexqTLUz8gWsocjUPZ
         PcqyX3anPEdTf8/2pxCQitTZpbooKj+4Ifzs2AHmsMJJoNRE/8w2BBPcRwovE/69fM0s
         xhlrWOBqBBKg0QfY6txmCjcYu+d3owkKf3tAVw7CDoQ865W5WCIPerOc7J4d2vElyzDs
         UkKg==
X-Gm-Message-State: AAQBX9fdV0s0VayUBjFsbOhljkzwH9LM4hQWKh7tsv4AfrRrs6RpTkwU
	mri7OimDBmFGm5bBMnrd2ju36A==
X-Google-Smtp-Source: AKy350bbBo+s1H2NwaJqhRMN47CKnOmvD/V0ytgI1MzDVDwqrjFg0VMWOhXnEMHFX3XKy8A0HiQr/g==
X-Received: by 2002:a05:6e02:b43:b0:317:94ad:a724 with SMTP id f3-20020a056e020b4300b0031794ada724mr7467300ilu.2.1679933407792;
        Mon, 27 Mar 2023 09:10:07 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id f15-20020a056e0212af00b00313fa733bcasm7984841ilr.25.2023.03.27.09.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 09:10:07 -0700 (PDT)
Message-ID: <7a8b9b72-746b-f94e-95f5-31006d5c63ca@kernel.dk>
Date: Mon, 27 Mar 2023 10:10:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] powerpc: don't try to copy ppc for task with NULL pt_regs
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
 <CRGYHQ3C77DV.1PXS812TV997N@bobo> <87wn32cn9s.fsf@mpe.ellerman.id.au>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87wn32cn9s.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/27/23 7:54?AM, Michael Ellerman wrote:
> "Nicholas Piggin" <npiggin@gmail.com> writes:
>> On Mon Mar 27, 2023 at 8:15 AM AEST, Jens Axboe wrote:
>>> Powerpc sets up PF_KTHREAD and PF_IO_WORKER with a NULL pt_regs, which
>>> from my (arguably very short) checking is not commonly done for other
>>> archs. This is fine, except when PF_IO_WORKER's have been created and
>>> the task does something that causes a coredump to be generated. Then we
>>> get this crash:
>>
>> Hey Jens,
>>
>> Thanks for the testing and the patch.
>>
>> I think your patch would work, but I'd be inclined to give the IO worker
>> a pt_regs so it looks more like other archs and a regular user thread.
>>
>> Your IO worker bug reminded me to resurrect some copy_thread patches I
>> had and I think they should do that
>>
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2023-March/256271.html
>>
>> I wouldn't ask you to test it until I've at least tried, do you have a
>> test case that triggers this?
> 
> I hit it once on one machine while running the mtr test from the other
> thread. I'm not sure what leads to it failing that way rather than the
> usual case of the mariadb test just printing an error.

That's how I hit it first too, then I wrote the reproducer to verify and
be able to test a patch.

-- 
Jens Axboe

