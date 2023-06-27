Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFE474056B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 23:02:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EEAFfmkX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrHGT5Qlnz30gs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 07:02:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EEAFfmkX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrHFX621Tz30Kf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 07:01:35 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b8062c1ee1so22693465ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 14:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687899692; x=1690491692;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=P+M7tEnjJDtu150UIK78eMZjmbGUtM7e5Fjt8nWZ0yk=;
        b=EEAFfmkXxvxLQKSckNGd2ZSV3KFogeID+Fu07F5vObGax9BbbGTHMjNPkWpqJAJVcH
         pQvHfFi3MuvS2en7hgib7UJpPWUapwBCg8rlberKLmSq3DFWM7/xIZN7INLmmqEHLsUh
         qitezyDQfhSscafezpHggVgt0WLI8tgIl0uMXCJdPAHvlcj4VIjJKb6j7/ZGCnIDizgv
         wo2zP75PWYpQesW5XMNkIMNlUWOk9aqZVrMomyrANyuVHFRGKdh0f6XzxRPe0kewrYvm
         0KzGKCqgMKcTqBBhxX7lyhj56QxI4SK/fKCSdPeLy85gsmtVFv88cBuoZEpsI4YCe97K
         o/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687899692; x=1690491692;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+M7tEnjJDtu150UIK78eMZjmbGUtM7e5Fjt8nWZ0yk=;
        b=SGb+isl8vr+Z9+pbgyq56isDheGnjTDmcYXTiU305/Y6fusWBOL/gAfQ9B5s9CLRWy
         8QoWKBP8kK7He/wjcU5NB31yhS3+bDpOW7BqMsvDF95VPjyrgmNRwHg/JAfxAGn6QGk9
         FNPbQVhmCXZg/lE0FOA1u43UKyJ1uVoYPXOw/rPEhH+Jx1VZxzWFUSroRVPmpMdLdxNQ
         jdFhLmxom4vIBCR6jRCjf+Esx6DCm3Ee3BggLpJ2h7rmGMNQThRqM55N57kBNeD/ro2x
         cqeRCJpUSyCXGv8shFFHCMQWTLrawP1nFJ++AhP3qMl1XJBjEipgZahknHbdZT59n1Hg
         piXg==
X-Gm-Message-State: AC+VfDxRUPb0Ck3hd3fRBmxdNbCy68IUmEIiaznVAx8P3JhKDxBnV1lt
	kJLUF3rO1WCDoFsfnOo5BkM=
X-Google-Smtp-Source: ACHHUZ5Ms+IS+/rtXxolIJxIsutHi1fnnUiL8cEAZTZ1vZL/Fg4JF6S5Mmuw32zf0DumOU0QNMHuig==
X-Received: by 2002:a17:902:f542:b0:1b5:91:4693 with SMTP id h2-20020a170902f54200b001b500914693mr14752161plf.1.1687899692466;
        Tue, 27 Jun 2023 14:01:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jl3-20020a170903134300b001ac6b926621sm6363521plb.292.2023.06.27.14.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 14:01:31 -0700 (PDT)
Message-ID: <2b7e8b1d-1697-6a25-434d-352f95e6fff2@roeck-us.net>
Date: Tue, 27 Jun 2023 14:01:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Content-Language: en-US
To: Dinh Nguyen <dinguyen@kernel.org>, Vishal Moola <vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com>
 <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
 <CAOzc2px6VutRkMUTn+M5LFLf1YbRVZFgJ=q7StaApwYRxUWqQA@mail.gmail.com>
 <cc954b15-63ab-9d9f-2d37-1aea78b7f65f@roeck-us.net>
 <b6a5753b-8874-6465-f690-094ee753e038@roeck-us.net>
 <CAOzc2pxdqeaRjYLfOqvMW-AEobTzD9xOP+MyP9nxgEbi1T2r7Q@mail.gmail.com>
 <c3751051-7fc7-7129-b9a7-ead71c576ace@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <c3751051-7fc7-7129-b9a7-ead71c576ace@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-openrisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, xen-devel@lists.xenproject.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/27/23 13:05, Dinh Nguyen wrote:
> 
> 
> On 6/27/23 14:56, Vishal Moola wrote:
>> On Tue, Jun 27, 2023 at 12:14 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On 6/27/23 12:10, Guenter Roeck wrote:
>>>> On 6/27/23 10:42, Vishal Moola wrote:
>>>>> On Mon, Jun 26, 2023 at 10:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>>
>>>>>> On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote:
>>>>>>> Part of the conversions to replace pgtable constructor/destructors with
>>>>>>> ptdesc equivalents.
>>>>>>>
>>>>>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>>>>>>> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
>>>>>>
>>>>>> This patch causes all nios2 builds to fail.
>>>>>
>>>>> It looks like you tried to apply this patch on its own. This patch depends
>>>>> on patches 01-12 of this patchset to compile properly. I've cross-compiled
>>>>> this architecture and it worked, but let me know if something fails
>>>>> when its applied on top of those patches (or the rest of the patchset).
>>>>
>>>>
>>>> No, I did not try to apply this patch on its own. I tried to build yesterday's
>>>> pending-fixes branch of linux-next.
>>>>
>>>
>>> A quick check shows that the build fails with next-20230627. See log below.
>>
>> Ah it looks like this one slipped into -next on its own somehow? Stephen, please
>> drop this patch from -next; it shouldn't be in without the rest of the
>> patchset which
>> I intend to have Andrew take through the mm tree.
>>
> 
> I apologize, but I queue this patch up for Linus and it's been pulled for this merge window. I didn't realize you were going to take this patchset through another tree.
> 
> Sorry about that.
> 

Yes, indeed, I just confirmed that all nios2 builds in the mainline kernel
are now broken.

Guenter

