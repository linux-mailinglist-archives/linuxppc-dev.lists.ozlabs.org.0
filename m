Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A02A6A5C8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 16:57:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PR27f0ZVkz3cZp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 02:57:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZSChi6PC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZSChi6PC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZSChi6PC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZSChi6PC;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PR26b22cJz3cMT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 02:56:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677599796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7pSWC5euLmUDx9YG5RWzWaGkcDB950fdhQfUYWKICc=;
	b=ZSChi6PCbVgB4ID1cv6gHwSECIe4OuDgIMTq9REYSJaYl9Bf5lSORAPqF9nF4FY6kYjdHP
	0rpMHiVugl0FfrSZ7kusLx2puVZVVd3rGCqTue3pS+eYTtT5A9Z1AGPyVPXzEsiDDvsgSV
	zDbR8uz7qH6HtSCPQlQ1dlM1cz+5/+s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677599796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7pSWC5euLmUDx9YG5RWzWaGkcDB950fdhQfUYWKICc=;
	b=ZSChi6PCbVgB4ID1cv6gHwSECIe4OuDgIMTq9REYSJaYl9Bf5lSORAPqF9nF4FY6kYjdHP
	0rpMHiVugl0FfrSZ7kusLx2puVZVVd3rGCqTue3pS+eYTtT5A9Z1AGPyVPXzEsiDDvsgSV
	zDbR8uz7qH6HtSCPQlQ1dlM1cz+5/+s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-an2piiWjNfKbpvr7I5_dgw-1; Tue, 28 Feb 2023 10:56:34 -0500
X-MC-Unique: an2piiWjNfKbpvr7I5_dgw-1
Received: by mail-wr1-f69.google.com with SMTP id j2-20020adfa782000000b002ca9ab26627so1456901wrc.23
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 07:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7pSWC5euLmUDx9YG5RWzWaGkcDB950fdhQfUYWKICc=;
        b=2531baUYaTunRgIs0gIWS81Gyixq4PB/uWXt1mnO19Ktn6KpRhWPo+9hO5+lOQ/gPO
         0MIN7XO2Wsgh8fModLz9GzKApO0sZGq3F+cgVpa2ai8n958DklnTyiAUy0nfmb802kmg
         RY5jbKBNUcxcXWtu+I1x197q+a8bvZi2qnSnAQJHZvis0tu+EyTwU9cStaSdkhBTKZ2u
         DJIVhuQpRI6UbBZ+I03acU1tP8ZgIj5cv7AkXcj7K5p5iaV78g7g3DEd0WerQ56fJL09
         xq8JCCBJjW8aoAKzgEIYeOBN0LVU/llc+G3/IUZby3dczxWjm+Y5CEszv6BNLEChZaeS
         T6iQ==
X-Gm-Message-State: AO0yUKUloPgOpiKGc9AROlK8rteSn3QSuCRiBto/Q3wG2WUzg6vQKgWX
	fh61a/3RCrQX3nlAPvELyRJY6w8Wt/7XIF2LD6XCzvG6e9N5u0ZcBLWTgFGTSwCMWUFFk0FiXs7
	W0nuL+zOgyB56f3z6L3PnMtZ8ew==
X-Received: by 2002:a05:600c:1e20:b0:3df:9858:c037 with SMTP id ay32-20020a05600c1e2000b003df9858c037mr9985240wmb.12.1677599793386;
        Tue, 28 Feb 2023 07:56:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/U2v9f8GltbBAhuiD5VLcyopD+EwumVs1dLk0qMzdF/fI8DkaFn74NX3LW8zhnIM6FtbCCQg==
X-Received: by 2002:a05:600c:1e20:b0:3df:9858:c037 with SMTP id ay32-20020a05600c1e2000b003df9858c037mr9985221wmb.12.1677599793078;
        Tue, 28 Feb 2023 07:56:33 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:b800:3757:baed:f95e:20ac? (p200300cbc706b8003757baedf95e20ac.dip0.t-ipconnect.de. [2003:cb:c706:b800:3757:baed:f95e:20ac])
        by smtp.gmail.com with ESMTPSA id hn6-20020a05600ca38600b003e21f01c426sm13465165wmb.9.2023.02.28.07.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 07:56:32 -0800 (PST)
Message-ID: <bd656b2c-9a20-dea9-dcef-9cc965bccc9e@redhat.com>
Date: Tue, 28 Feb 2023 16:56:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH mm-unstable v1 19/26] riscv/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-b8dc8a57-dde0-4995-bbb7-3948a95ba0b1@palmer-ri-x1c9a>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <mhng-b8dc8a57-dde0-4995-bbb7-3948a95ba0b1@palmer-ri-x1c9a>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, shy828301@gmail.com, peterx@redhat.com, linux-mips@vger.kernel.org, linux-mm@kvack.org, namit@vmware.com, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, aarcange@redhat.com, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, hughd@google.com, linux-csky@vger.kernel.org, rppt@linux.ibm.com, vbabka@suse.cz, jgg@nvidia.com, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, aou@eecs.berkeley.edu, jhubbard@nvidia.com, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28.02.23 16:50, Palmer Dabbelt wrote:
> On Fri, 13 Jan 2023 09:10:19 PST (-0800), david@redhat.com wrote:
>> Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
>> from the offset. This reduces the maximum swap space per file: on 32bit
>> to 16 GiB (was 32 GiB).
> 
> Seems fine to me, I doubt anyone wants a huge pile of swap on rv32.

Patch is already upstream, so we can't add tags unfortunately. Thanks 
for the review!

-- 
Thanks,

David / dhildenb

