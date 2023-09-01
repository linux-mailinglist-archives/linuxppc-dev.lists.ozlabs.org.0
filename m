Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E667900E9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 18:47:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=uQktDsyR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RckTk28qbz3c5H
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Sep 2023 02:47:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=uQktDsyR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ackerleytng.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3abxyzaskdiknpxr4yrb60tt11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--ackerleytng.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RckSs0mFqz3bwb
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Sep 2023 02:46:35 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c09c1fd0abso25091285ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Sep 2023 09:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693586793; x=1694191593; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xCon5474F9WwphxhfgFhUzbwn0ALvK9xFv6P5Xz3AWM=;
        b=uQktDsyRnMrPrZ/Gfik/gpxTkWW0Jp9rfDZRVwlffQ59tq6kJ+t13LAgnrNq9s2/a2
         SupP8pqhCBluubKB9efPTfFL9lN9vv/UjpiiYOLKJ0Q9PdbbaKmFqEtar0+BAZs5t+Ox
         JKP5SodQuj5Hln2N/JddFSmZbcru7q61o+TsCmwGeoXxOTImF970JWDwsMv8N+pJwd+9
         H/iOOAjy84cFF/HbGoMwBnJ3T6u+cXDkkXJPXZ7AsHHCWJ0vsK1KIPoKBPw/9Lc//e23
         jch25sBLLkde4d/Kp5qrLNFBjpWHfF99CfgXo1zFLk1BkZ6U4cxUdcLQbRt+b4NiHtwh
         SF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693586793; x=1694191593;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCon5474F9WwphxhfgFhUzbwn0ALvK9xFv6P5Xz3AWM=;
        b=FhN42efApgLhGn8xUwi5zlLtnAVk1GGu6ZWEysHpCQBbdbEdyMqOVC0gJwuqLKb3gg
         Du2+WIEIuLI6bEfxiDhNvBYuUdLBSIOgwsHIzHklWjVAc2IvrUgREWmOQXiazooqgh/H
         ZknKZ/tWBWS9ARaPI794kmZV/ELUzdDznYhbhbrFs3bc0J06bN3eLodT03xs91Rlk+g8
         CeaikZCJ/FHCK/hUIJsPyLYOul5j620h4hnqorfV8BKAFEUa+4hv8z1LDwqyOnF+MX0r
         MBpVKHNiOPKvvzl4F9ImnEkmC5RABjctiJQF5Wa/BXNBrlaRMH7iH7u2zelG7HdvirrJ
         Iv9w==
X-Gm-Message-State: AOJu0YzRDdXYMRBBqVgpA+3iIOOcXC+tngWN81irHPxg1ZXfLU4nOr++
	o9ODoXFC8b1CE6Pbxv0p5mEaPiWYOq4lWPqkWA==
X-Google-Smtp-Source: AGHT+IE7IWuztjp33Ush39YmsLck94qkQHf2UcyeDE5trFHuf5V0W6HBwaqY0C7q2Vl17GPr3mAIvAb6tklgxvjU0g==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a17:902:e887:b0:1bc:e6a:205e with SMTP
 id w7-20020a170902e88700b001bc0e6a205emr1066486plg.5.1693586792693; Fri, 01
 Sep 2023 09:46:32 -0700 (PDT)
Date: Fri, 01 Sep 2023 16:46:31 +0000
In-Reply-To: <f7aaf097-6f83-0ee9-e16d-713d392b2299@linux.intel.com> (message
 from Binbin Wu on Fri, 1 Sep 2023 11:45:43 +0800)
Mime-Version: 1.0
Message-ID: <diqz34zxg7tk.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Ackerley Tng <ackerleytng@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, david@redhat.com, linux-mips@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, linux-security-module@vger.kernel.org, paul@paul-moore.com, maz@kernel.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, palmer@dabbelt.com, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, michael.roth@amd.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, qperret@google.com, seanjc@google.com, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, jarkko@kernel.org, yu.c.zhang@linux.intel.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, linux-fsdevel@vger.kernel.org, liam.merwick@oracle.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Binbin Wu <binbin.wu@linux.intel.com> writes:

> <snip>
>
>>
>> I'm not sure whose refcount the folio_put() in kvm_gmem_allocate() is
>> dropping though:
>>
>> + The refcount for the filemap depends on whether this is a hugepage or
>>    not, but folio_put() strictly drops a refcount of 1.
>> + The refcount for the lru list is just 1, but doesn't the page still
>>    remain in the lru list?
>
> I guess the refcount drop here is the one get on the fresh allocation.
> Now the filemap has grabbed the folio, so the lifecycle of the folio now 
> is decided by the filemap/inode?
>

This makes sense! So folio_put() here is saying, I'm not using this
folio anymore, but the filemap and the lru list are stil using the
folio.

> <snip>
