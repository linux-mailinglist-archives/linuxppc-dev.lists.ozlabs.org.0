Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1FF6D7C20
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 14:01:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps3BJ37Jvz3f5N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 22:01:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P+Dw/F8n;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g7kiVUSt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P+Dw/F8n;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g7kiVUSt;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps39S0HS0z3bj0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 22:00:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680696023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RSlHLlJfuqzoKBsSMqongiC+StHcDiIfT1vSmb6xVfw=;
	b=P+Dw/F8nfqRsT1SxunmJf/x1jdDiEbgxXATtELrFwIqV1RWClahoK0GNst/6csJqPYAT8h
	KnJFw6dYSPM9onT+1vpHWcCxJjge2dlgSKNAwc3GVhUNx5FtI9YncVgjeYueVjNP6HLeV4
	WtQYtC3uyDVkVm8rR8GSWzsPW0pBuMI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680696024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RSlHLlJfuqzoKBsSMqongiC+StHcDiIfT1vSmb6xVfw=;
	b=g7kiVUStmMqlVf6kKVkdAaBI6r+wCGh1ipMKnr0c8EMjpfYZ4c2BiN7Ny8x9g4vBp3WYAM
	0dfvO5luk2oRbpGJ2yGEIL0bJDqwiYRwBes6k87LtPnkdMElgeeJOKlVuRoSmmNaAeB9Vp
	mLOBSm9pljj1GFwaDca8gEHWvDFtCXQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-CKuABGoqPI-DA49YMA0llw-1; Wed, 05 Apr 2023 08:00:22 -0400
X-MC-Unique: CKuABGoqPI-DA49YMA0llw-1
Received: by mail-wm1-f70.google.com with SMTP id iv10-20020a05600c548a00b003ee112e6df1so17440329wmb.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Apr 2023 05:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680696020;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSlHLlJfuqzoKBsSMqongiC+StHcDiIfT1vSmb6xVfw=;
        b=nORO4vvPvYXlcVCukZsLsyzMgMIim38kR4R3GOtJnpG+xvu0lDjGv3g9ipdns+mCw1
         aYCSng/2CYnyfNoeCRvl4ozc6hRot9yBJhUaXUw8hRJjFjCbwktL65BBpogfNtySsEQE
         DWnV2NBJLxu4tb4QdY28/8Nw8EWITTXlKa0Q6c4FcWu+0LlY42dCJmyNjc2oBn07a8GG
         F/o4SDQ1DRUr/fIn8HaWBueYtcGBpcrb+rNvTLJHjjjQBgzJ4MlN3RduGhCuScW+Il7w
         /z2exb6sOf0v3dtMrhKmtzYmZ34eEMKAI1O8g9o4XnABPFQ7pkICBngxiNbEK6kuz9mg
         TulA==
X-Gm-Message-State: AAQBX9cUYQ+5pgJV4tlCTPs2MLIpicIV9P7pRlAWin1VeWi9h98N2yA8
	HqWtLLQkJ+GpIEAyJrqDXAwMnJCcPmwpptIs2ZgGU1FR98Tgo72AOEDztJkn89ovHjsDK+58Ato
	RSDwtxU/+rXcFhUtN9CrLhHmYLg==
X-Received: by 2002:adf:f851:0:b0:2c6:85ef:4086 with SMTP id d17-20020adff851000000b002c685ef4086mr4082461wrq.32.1680696020599;
        Wed, 05 Apr 2023 05:00:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350a1LUfUOKuj3jMotBlpC19SVSB9cyW7enGegvzefcAmYdi8D6SEfOrURf0tsGiN5OpOE9NhWQ==
X-Received: by 2002:adf:f851:0:b0:2c6:85ef:4086 with SMTP id d17-20020adff851000000b002c685ef4086mr4082439wrq.32.1680696020257;
        Wed, 05 Apr 2023 05:00:20 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:d00:ca74:d9ea:11e0:dfb? (p200300cbc7030d00ca74d9ea11e00dfb.dip0.t-ipconnect.de. [2003:cb:c703:d00:ca74:d9ea:11e0:dfb])
        by smtp.gmail.com with ESMTPSA id b13-20020adff24d000000b002c573778432sm14717731wrp.102.2023.04.05.05.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 05:00:19 -0700 (PDT)
Message-ID: <480e9492-2043-4788-eaff-4995e9e3b56e@redhat.com>
Date: Wed, 5 Apr 2023 14:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
To: Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com> <ZC1Q7uX4rNLg3vEg@lothringen>
 <ZC1XD/sEJY+zRujE@lothringen>
 <20230405114148.GA351571@hirez.programming.kicks-ass.net>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230405114148.GA351571@hirez.programming.kicks-ass.net>
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, mtosatti@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05.04.23 13:41, Peter Zijlstra wrote:
> On Wed, Apr 05, 2023 at 01:10:07PM +0200, Frederic Weisbecker wrote:
>> On Wed, Apr 05, 2023 at 12:44:04PM +0200, Frederic Weisbecker wrote:
>>> On Tue, Apr 04, 2023 at 04:42:24PM +0300, Yair Podemsky wrote:
>>>> +	int state = atomic_read(&ct->state);
>>>> +	/* will return true only for cpus in kernel space */
>>>> +	return state & CT_STATE_MASK == CONTEXT_KERNEL;
>>>> +}
>>>
>>> Also note that this doesn't stricly prevent userspace from being interrupted.
>>> You may well observe the CPU in kernel but it may receive the IPI later after
>>> switching to userspace.
>>>
>>> We could arrange for avoiding that with marking ct->state with a pending work bit
>>> to flush upon user entry/exit but that's a bit more overhead so I first need to
>>> know about your expectations here, ie: can you tolerate such an occasional
>>> interruption or not?
>>
>> Bah, actually what can we do to prevent from that racy IPI? Not much I fear...
> 
> Yeah, so I don't think that's actually a problem. The premise is that
> *IFF* NOHZ_FULL stays in userspace, then it will never observe the IPI.
> 
> If it violates this by doing syscalls or other kernel entries; it gets
> to keep the pieces.

Yair is currently on vacation, so I'm replying on his behalf.

Indeed, RT userspace is supposed to not call into the kernel, that's the 
premise.

-- 
Thanks,

David / dhildenb

