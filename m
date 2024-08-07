Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF58594AFF8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 20:47:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PzOaZ1m1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfK155gxXz3dL2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 04:47:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PzOaZ1m1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfK0P0Yzpz3d8R
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 04:46:59 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fc65329979so2552365ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 11:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723056415; x=1723661215; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tpC9ySwe8M6fSdhpIm+xj8j1jXUTjhtpDMTqhDvZzT0=;
        b=PzOaZ1m1TQ9wB+vMcwHlraT2w3hpeGhGMPQ3iq5UJlSId8lccygFhwCNBYdX5+WBm3
         FS2ea/NOg+6UFPS1GUINrOTdSZGUHhCaK5267lDststGQoiVNjX/C9cx1YWGWQUkLxAt
         A3HM7Umtp0CxBJYd97g/swfPTuJMkcIrkdbgv8IxFu29PtVCfI/6KJ0SCZXfX9+vGc9E
         uoz+IgzVTs/L9BieqREK6xL5x2VBS+UQOt78jM4PszHv574qCKcGWMy63cN3FVK3msEH
         nyXdyFp3f1y0wLWFagPkeS9sTO9nVUPcC5Pum30aXBABwQuATkGD5xV+u6FJKJEw/hXc
         quTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723056415; x=1723661215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpC9ySwe8M6fSdhpIm+xj8j1jXUTjhtpDMTqhDvZzT0=;
        b=R5YxneSttkfHXXVJFyXkK6HCdj77eq038RImw5Ssh3a6+t2/Z5ACvTTRcU4tRhweGC
         mekiuNOzMY8tS5fjSLexXs/Bs+78KGBVgBQh2TnZa3kuQJqDl7IClNcwjs9Maexo6gWG
         WnibCkPkRIiRG3lR/lguBqLJ8f7gN1WI3OvDOacxljGNGj4RTzvTiElqA53rkC+hfEIf
         ADNI3nYIH8+nzGYWBJdKKNWHfpeg7DqcfpAB9essfcfmvFud9qPRpfq8tDrXdaXpbPbD
         +MUifDOsgXoOFPKUIQly5ic3K8nYa1uQRN9S7wy6DNa/1JkWD5I4KS3PVFSNhAO/4yYA
         swAw==
X-Forwarded-Encrypted: i=1; AJvYcCX/bbuKnBznwc2Ff2SOo7kmG/5WPFAE+kHyrZQPLNsbWg546ExYekJgQrWAdFT2RG4HNghaqkMfsaA2O88i21H6ab4ywDgfoxuCkdlpZQ==
X-Gm-Message-State: AOJu0Yyz6rOg4bseZi378GpgH0rWWzHHDHEkFyZFkTldGolEp27daNYZ
	x75BHQcNwe4dJPe/5ShnDZWahJv5k/6c0a60AbE3iLF52mIjgc8r
X-Google-Smtp-Source: AGHT+IGtZ0lEec2H4PPVEP49dt0e1xkafz0BXB+rss67uYyyvRm22qS8xeq35r3Mid1LXrhtg5JHrg==
X-Received: by 2002:a17:903:183:b0:1fb:3b89:b130 with SMTP id d9443c01a7336-1ff57258ad3mr213021655ad.19.1723056414743;
        Wed, 07 Aug 2024 11:46:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59293a90sm109625685ad.235.2024.08.07.11.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 11:46:54 -0700 (PDT)
Message-ID: <262f4ecc-aa6f-4f5c-914c-732785790055@roeck-us.net>
Date: Wed, 7 Aug 2024 11:46:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 16/23] powerpc/e500: Switch to 64 bits PGD on 85xx (32
 bits)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <cover.1719928057.git.christophe.leroy@csgroup.eu>
 <ca85397df02564e5edc3a3c27b55cf43af3e4ef3.1719928057.git.christophe.leroy@csgroup.eu>
 <2c7adbc9-609d-41a9-8a3b-a63d59e21a1f@roeck-us.net>
 <AM0PR07MB496234BE973D5458C53517F29BB12@AM0PR07MB4962.eurprd07.prod.outlook.com>
 <4f46d614-0fbb-452b-a778-b7b3a7f6da8b@roeck-us.net>
 <b73e991e-5f66-455e-a271-e10511ebeaef@csgroup.eu>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <b73e991e-5f66-455e-a271-e10511ebeaef@csgroup.eu>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/7/24 03:11, Christophe Leroy wrote:
> Hi,
> 
> Le 31/07/2024 à 18:35, Guenter Roeck a écrit :
>> On 7/31/24 08:36, LEROY Christophe wrote:
>>>
>>> Hi Guenter,
>>> Thanks for this report. I'm afk this week, i"ll have a look at it in more détails next week.
>>> But to be sûre, does that Oops match the bisected commit ? Because pmd_leaf()  for e500 doesn't exist yet so pmd_write() shouldnt be called.
>>> I did validate all my changes with mpc8544 on qemu when i implemented this séries, using map_hugetlb mm selftest. What test tool are you using ?
>>
>> Nothing special; it is just a qemu boot test with various module test and debug options enabled,
>> using a root file system generated with buildroot.
> 
> I still don't get anything with mpc85xx_defconfig.
> 
> Can you tell with debug options you use and which module tests ?
> 

As a follow-up, reverting the following sequence of patches fixes the problem for me.

01f6be2efa3e (HEAD -> fixes-v6.11) Revert "powerpc/e500: switch to 64 bits PGD on 85xx (32 bits)"
6f9971be9b8c Revert "powerpc/e500: encode hugepage size in PTE bits"
f183504567cf Revert "powerpc/e500: don't pre-check write access on data TLB error"
0a3756093805 Revert "powerpc/e500: free r10 for FIND_PTE"
8487e2021e4d Revert "powerpc/e500: use contiguous PMD instead of hugepd"
23430a37c22d Revert "powerpc/64s: use contiguous PMD/PUD instead of HUGEPD"
1af7a0fb66bf Revert "powerpc/mm: remove hugepd leftovers"
c498c53e790d Revert "mm: remove CONFIG_ARCH_HAS_HUGEPD"

I was unable to revert just a subset since they all depend on each other.

Detailed logs:

With reverts:

https://kerneltests.org/builders/qemu-ppc-testing/builds/171/steps/qemubuildcommand/logs/stdio

Without reverts:

https://kerneltests.org/builders/qemu-ppc-master/builds/249/steps/qemubuildcommand/logs/stdio

Guenter

