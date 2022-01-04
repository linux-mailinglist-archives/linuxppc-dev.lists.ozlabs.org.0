Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93047483EAA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 10:02:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSmph48v7z3bjB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 20:02:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ge9MpmvZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ge9MpmvZ; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSmp01bpzz2xBF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jan 2022 20:01:58 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id x194so8967634pgx.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jan 2022 01:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Y2So0W6YNqWs/Z4tBX4iOrfUiW0ok+XM4vYBaYW+6r0=;
 b=ge9MpmvZKoxQve02hCmyWjv069pRt5BrkAgBhn5YzfzsRm7ZpM2biqjjYh/B3P9oJJ
 z30fmzDilPrdODJo5JLOBxhnzmdF48uLO4Gd3XASU6IhWbXMJiTqPk0m2kkgQIajOhtG
 3yJ41lJB+6CCQu58wr0GKmtpltuVhhUJewCQ2qm5Pxh84HtzRpBVUtU/mLPZkab1hnrq
 Q29v3nFWK+ddiS0Noq0dSNIeY8bzJuipO1/49ZlJj0I4UmZgLdEJOOLcek82kyykL/7g
 RrW9c1MlbDAbel3NwYq//h3MurElo9+dHRI+aQXar3+4wWYrXijXobtnL37cVCXlxDCd
 muNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y2So0W6YNqWs/Z4tBX4iOrfUiW0ok+XM4vYBaYW+6r0=;
 b=FOyTp4foeQLXHm1n/npM/JHAY3sLamO9J9uWdtKBTWu7/qKWNcleBb2ur72BWaOHYJ
 zwB8mZEKgd1IuelUDy18VrZnju7cfo4Q9WTMYHdYWLi9M52yahQztW3HRbdSbKYDWL9f
 s76RRvu0xPkcD86PJI3TQ/Y96OU/LHir5EVK9o1FFo7iTOCemqurvb8Yz/nuqm9GdP1c
 r3T+tbwqEeiNu+Lf4S6tNuKYcO+PwkqRG+zlmw3mKO+/G8XKdf7rR1CgLXFQrJHpwLkj
 URoeO6RJ6AzaUvzMNhkb6bCqbi08zWz+Ge7unD+95ynyfVrUE0aCwZxYuEii+qdZUaud
 RwWg==
X-Gm-Message-State: AOAM532oSkwx5PhUBpXvm3ux3pvdL1+N2xPKBnFBdMwI4qjgEQ2+cSzT
 T4affW8AvmouruY2NVIsVCuT0g==
X-Google-Smtp-Source: ABdhPJze1p4UGEBkPj9+JKeFQTqSvEyiY3ZQvi+ep0cx7TO3xzwhO45/0viweKhn5n810FvANZXOzA==
X-Received: by 2002:a05:6a00:198a:b0:4bb:4621:f074 with SMTP id
 d10-20020a056a00198a00b004bb4621f074mr49693499pfl.69.1641286914547; 
 Tue, 04 Jan 2022 01:01:54 -0800 (PST)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id oa9sm40441238pjb.31.2022.01.04.01.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 01:01:53 -0800 (PST)
Message-ID: <f9e1693a-d880-3c0a-f8e6-be4cda059650@ozlabs.ru>
Date: Tue, 4 Jan 2022 20:01:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH 2/3] KVM: PPC: Fix vmx/vsx mixup in mmio emulation
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20211223211528.3560711-1-farosas@linux.ibm.com>
 <20211223211528.3560711-3-farosas@linux.ibm.com>
 <1640427087.r4g49fcnps.astroid@bobo.none> <87zgomq7nn.fsf@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <87zgomq7nn.fsf@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 28/12/2021 04:28, Fabiano Rosas wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
> 
>> Excerpts from Fabiano Rosas's message of December 24, 2021 7:15 am:
>>> The MMIO emulation code for vector instructions is duplicated between
>>> VSX and VMX. When emulating VMX we should check the VMX copy size
>>> instead of the VSX one.
>>>
>>> Fixes: acc9eb9305fe ("KVM: PPC: Reimplement LOAD_VMX/STORE_VMX instruction ...")
>>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>>
>> Good catch. AFAIKS handle_vmx_store needs the same treatment? If you
>> agree then
> 
> Half the bug now, half the bug next year... haha I'll send a v2.
> 
> aside:
> All this duplication is kind of annoying. I'm looking into what it would
> take to have quadword instruction emulation here as well (Alexey caught
> a bug with syskaller) and the code would be really similar. I see that
> x86 has a more generic implementation that maybe we could take advantage
> of. See "f78146b0f923 (KVM: Fix page-crossing MMIO)"

Uff. My head exploded with vsx/vmx/vec :)
But this seems to have fixed "lvx" (which is vmx, right?).

Tested with: https://github.com/aik/linux/commits/my_kvm_tests



-- 
Alexey
