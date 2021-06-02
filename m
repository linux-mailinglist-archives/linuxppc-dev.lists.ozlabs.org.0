Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0267B3995C1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 00:11:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwNXS1wlpz308t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 08:11:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PPnd7cbd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PPnd7cbd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=PPnd7cbd; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=PPnd7cbd; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwNWt0lSbz2xfw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 08:10:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622671842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUjPsHJ5PuL6/0to9YlDMTSAeVkKxMJlKUQySExiimw=;
 b=PPnd7cbdSdZnyQkwBUNBpTBXHrFVLM+FxRphCu+vSx/o390jD3up818s70L0FDeSJFzUWz
 vchmeJqF6JLDSZEBxivSYcIaC03yTfHdmGFpPtZBtVTJLZS/fzblZoS35YQrlE5JuI7ieZ
 gpfD2pPPSf4RPSro6t9R3OczFVQttlA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622671842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUjPsHJ5PuL6/0to9YlDMTSAeVkKxMJlKUQySExiimw=;
 b=PPnd7cbdSdZnyQkwBUNBpTBXHrFVLM+FxRphCu+vSx/o390jD3up818s70L0FDeSJFzUWz
 vchmeJqF6JLDSZEBxivSYcIaC03yTfHdmGFpPtZBtVTJLZS/fzblZoS35YQrlE5JuI7ieZ
 gpfD2pPPSf4RPSro6t9R3OczFVQttlA=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-3fvU7sA4MomEUz6SkDaHcA-1; Wed, 02 Jun 2021 18:10:40 -0400
X-MC-Unique: 3fvU7sA4MomEUz6SkDaHcA-1
Received: by mail-oo1-f72.google.com with SMTP id
 b9-20020a4a87890000b0290248cb841124so178027ooi.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 15:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KUjPsHJ5PuL6/0to9YlDMTSAeVkKxMJlKUQySExiimw=;
 b=ttxFHjAYZfNsTX1BB0nW8tCehQ+Ld1yxvGAWZ5ukpeHvfVNO2UqgazD0by1TKf/08M
 s3+8l3A07otC/MI3s+yma1dWbdtPMgaMqWWrwX/O3dmTuxccvZF4KNEXp9c8Mz48Tw8k
 NhS5akHZimBM93uNhjDsFResREnU2+Vlt1OfUXpTIHORh781qBf35dBuQMpBzVnIL0MV
 3fIbya4gMemor/GSHE+o4rXENbgzKrpFByk1Ze30fimZUrKaIl61e2szQyANYnJYQt8K
 91ZqDq35/IQlUaJTO0BMLWIXEVBd0ItjHnDHepb3+9+7rKwXGHctHwMtWuqaTqXwSjDG
 i+xA==
X-Gm-Message-State: AOAM530elzMz45nFkG+IM9Mt/Kzlt0okg2Njy7eK18LboI08M95/6nqN
 42XfbQbwfV7YuGhH3T1p4jApNZEIUBtrmMehA7X6nw/9pOT4EG05Crj3/pdT7OK1ETQO5qwgyxg
 fjwR2HiGBmCfANCBmZZCbZuKiqQ==
X-Received: by 2002:a4a:250e:: with SMTP id g14mr26331503ooa.31.1622671840186; 
 Wed, 02 Jun 2021 15:10:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3zxkPypJY+pMoZE8TmBBmrm3L1q7RwDYe8CB03JX/l9KFF+IfYbxpLYjT9JpPttLssjAZEg==
X-Received: by 2002:a4a:250e:: with SMTP id g14mr26331490ooa.31.1622671840004; 
 Wed, 02 Jun 2021 15:10:40 -0700 (PDT)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id 15sm283172oij.26.2021.06.02.15.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 15:10:39 -0700 (PDT)
Subject: Re: [PATCH] powerpc/8xx: select CPM1 for MPC8XXFADS
To: Christophe Leroy <christophe.leroy@csgroup.eu>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
References: <20210601175304.2634549-1-trix@redhat.com>
 <50ed000a-c1af-8552-9d35-771b3bc131e5@csgroup.eu>
From: Tom Rix <trix@redhat.com>
Message-ID: <d50f61b0-e165-b3d3-d278-ef0514ddccc0@redhat.com>
Date: Wed, 2 Jun 2021 15:10:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <50ed000a-c1af-8552-9d35-771b3bc131e5@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/2/21 12:44 AM, Christophe Leroy wrote:
>
>
> Le 01/06/2021 à 19:53, trix@redhat.com a écrit :
>> From: Tom Rix <trix@redhat.com>
>>
>> With MPC8XXFADS, there is this linker error
>> ppc64-linux-ld: m8xx_setup.o: in function `cpm_cascade':
>> m8xx_setup.c: undefined reference to `cpm_get_irq'
>
> It looks like this config item is stale, it doesn't build any board 
> support, there is no define_machine() for this config item, no file is 
> linked to that config item.
>
> I think you should just remove that item from the possible choices.
>
Yes, this looks like a dead config and removing it is what to do.

I withdraw this change.

I am looking at sweeping the tree of dead configs.

Up a dir, my finder shows

PPC_MMU_NOHASH_32

is another (maybe) dead config.

Thanks for pointing this out,

Tom

> Christophe
>
>
>>
>> cpm_get_irq() is conditionally complied by CPM1
>> So add a select, like the other plaforms
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   arch/powerpc/platforms/8xx/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/powerpc/platforms/8xx/Kconfig 
>> b/arch/powerpc/platforms/8xx/Kconfig
>> index 60cc5b537a98..919082cdb2f1 100644
>> --- a/arch/powerpc/platforms/8xx/Kconfig
>> +++ b/arch/powerpc/platforms/8xx/Kconfig
>> @@ -10,6 +10,7 @@ choice
>>     config MPC8XXFADS
>>       bool "FADS"
>> +    select CPM1
>>     config MPC86XADS
>>       bool "MPC86XADS"
>>
>

