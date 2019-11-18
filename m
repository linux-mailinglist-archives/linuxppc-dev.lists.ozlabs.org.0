Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 467DBFFD5A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 04:31:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GZHv3BGfzDqXl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 14:31:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="eNgIem4/"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GZFl62dBzDqXB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 14:29:46 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id l24so8903764pgh.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2019 19:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=slCYCjmvNMTbkkbIU6vyjGQZT2Z+twrEjOEJUYrjB/c=;
 b=eNgIem4/xFKAvMK2zwOdZD70pAGJmpiUSO3H3mk4jnGgs/M6C0pK0Ot0PaeENzJWz8
 NQxszyDzkVM/ugqnd17zTKwmrmHSymGjZNUZasac1wraguqXDrA5ZjjKnZHH2eu6l+C7
 /DSvb3fpMuGvwkpIpZuLQtA9tXYgIFdp97zfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=slCYCjmvNMTbkkbIU6vyjGQZT2Z+twrEjOEJUYrjB/c=;
 b=BOxDzwbfen4bXh2lN/hP0rqG7UULucPi1clnoBd2Lxgn8O7h3rAKtZ+9zzI6BV5Vxi
 TdkHLigTgLqvKzstvoBGfNndE1GxulCvr5jj/USGzgQCdQERsDPxz1Fq5yrZJiKv9jIq
 U6/7uWLuifpIILMfBDygFTYAJItJ95PxpuCc0wpCQpM7qd4WccZd/qe6o+/P2HJKO2TZ
 a7WQl2mbvFYJK7d7yqEF2sucTfBKVh3B3nzm0PKK71xIAXJxjbUJgtIrsReSHlfL1kXC
 UZQnNDTKn8lYH74BqlxEh1slDrw+l2t4sJrcvXsiaHc9Y9UI9ECHTq9K5WtB3EXwAg2o
 jUzw==
X-Gm-Message-State: APjAAAX3tF/3VpLRAyXyzfJfDry7I3lfPsVmqfI7NlBfd2210zBnd59v
 cGohHEu9dOc9PDNjvpNNdlGx+g==
X-Google-Smtp-Source: APXvYqyRNgmF3OA7FCUV2xqL8GrsOdtKk0DM+NkVYniatqzTJKRhvCByMpDGpwM4hGX6fuRUrrrZvA==
X-Received: by 2002:a63:b502:: with SMTP id y2mr7469398pge.317.1574047782524; 
 Sun, 17 Nov 2019 19:29:42 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-f1d8-c2a6-5354-14d8.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:f1d8:c2a6:5354:14d8])
 by smtp.gmail.com with ESMTPSA id j17sm18141516pfr.2.2019.11.17.19.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 19:29:41 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Qian Cai <cai@lca.pw>, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 x86@kernel.org, aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: Re: [PATCH v11 1/4] kasan: support backing vmalloc space with real
 shadow memory
In-Reply-To: <1573835765.5937.130.camel@lca.pw>
References: <20191031093909.9228-1-dja@axtens.net>
 <20191031093909.9228-2-dja@axtens.net> <1573835765.5937.130.camel@lca.pw>
Date: Mon, 18 Nov 2019 14:29:38 +1100
Message-ID: <871ru5hnfh.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Qian Cai <cai@lca.pw> writes:

> On Thu, 2019-10-31 at 20:39 +1100, Daniel Axtens wrote:
>>  	/*
>>  	 * In this function, newly allocated vm_struct has VM_UNINITIALIZED
>>  	 * flag. It means that vm_struct is not fully initialized.
>> @@ -3377,6 +3411,9 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>>  
>>  		setup_vmalloc_vm_locked(vms[area], vas[area], VM_ALLOC,
>>  				 pcpu_get_vm_areas);
>> +
>> +		/* assume success here */
>> +		kasan_populate_vmalloc(sizes[area], vms[area]);
>>  	}
>>  	spin_unlock(&vmap_area_lock);
>
> Here it is all wrong. GFP_KERNEL with in_atomic().

I think this fix will work, I will do a v12 with it included.

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index a4b950a02d0b..bf030516258c 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3417,11 +3417,14 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 
                setup_vmalloc_vm_locked(vms[area], vas[area], VM_ALLOC,
                                 pcpu_get_vm_areas);
+       }
+       spin_unlock(&vmap_area_lock);
 
+       /* populate the shadow space outside of the lock */
+       for (area = 0; area < nr_vms; area++) {
                /* assume success here */
                kasan_populate_vmalloc(sizes[area], vms[area]);
        }
-       spin_unlock(&vmap_area_lock);
 
        kfree(vas);
        return vms;


