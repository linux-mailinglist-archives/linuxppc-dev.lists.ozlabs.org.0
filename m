Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9394C2C19ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 01:24:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cg4Xm1kWLzDqSC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 11:24:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=i9XFnBH+; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cg4Vs106jzDqQS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 11:23:15 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id m9so15831535pgb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 16:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5ue+P3JzpGrU6tlzGx5XVuYQaSyzNcLFnV35XJjjspQ=;
 b=i9XFnBH+MXLis9WH+r0LmXB7kMbK3QJnfcO+0O2lFecH43DRqKs0w1BfAmToymVRCe
 Kq3WLay7IYMalLVYOYd1EN4jYdZrJZnIAaD9ge1SUKAcWTsguAeh2DvGkm4MXrAiN7iH
 X5XBeXPrtdx9uSLu4KVAV5Wr1nbUz9HRxf1us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5ue+P3JzpGrU6tlzGx5XVuYQaSyzNcLFnV35XJjjspQ=;
 b=ZK/WtIEf5oCpdm+Le4rdXwXdvZ4F7Vhp9lKdSa8P8W86CQNP+CqvSPQCc7s9+SD2QS
 lI4jxc951/UFE3GJt1JDfmiQMufe9M9axOsbkxwGKIdGSil2RR0jp0UaX7XZLXj8Xavv
 QqJVSZmHvHWwgArHWzc60kMQdqFMMkjTG2pLlkl48BlhU9U8j9uAcyF0SE6+sHzsHiHw
 rS2IaPT9kpTw5QRP8/Ue1k7FBkWN6a1R6R1IU9lXbNH0x7K3TqeTQnXwADNhFhNObAps
 frH4kY3L76sFc6vb+tCmrslO4juW44FnchfTZ8wboZCL+SLaujIJlJvsgo6nn/822dE8
 HPpQ==
X-Gm-Message-State: AOAM5303F2286BsBGTCaFy25WnikVQ7oFEikMKe9Ww80OoWixeI2jUtO
 13qa2VQej+XyalS321zqKDSQdA==
X-Google-Smtp-Source: ABdhPJzYctHCNliFHjrbwMjHJFs6e+hFtU/VNaPxXW2QdrQCHT7+xY7UbMaIV6qL8EKUz7UjqzVl4A==
X-Received: by 2002:a17:90a:f406:: with SMTP id
 ch6mr1619681pjb.134.1606177392399; 
 Mon, 23 Nov 2020 16:23:12 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-1113-ab2f-0962-4f90.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:1113:ab2f:962:4f90])
 by smtp.gmail.com with ESMTPSA id y19sm12837831pfn.147.2020.11.23.16.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 16:23:11 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure in Linus' tree
In-Reply-To: <160617472873.1817800.16473753588453276266.b4-ty@ellerman.id.au>
References: <20201123184016.693fe464@canb.auug.org.au>
 <160617472873.1817800.16473753588453276266.b4-ty@ellerman.id.au>
Date: Tue, 24 Nov 2020 11:23:08 +1100
Message-ID: <87h7pfhac3.fsf@dja-thinkpad.axtens.net>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks sfr and mpe.

> Applied to powerpc/fixes.
>
> [1/1] powerpc/64s: Fix allnoconfig build since uaccess flush
>       https://git.kernel.org/powerpc/c/b6b79dd53082db11070b4368d85dd6699ff0b063

We also needed a similar fix for stable, which has also been applied.

I guess I should build some sort of build process that tests a whole
range of configs. I did test a few but clearly not enough. Is there a
known list that I should be using? Something from kisskb?

Kind regards,
Daniel

Michael Ellerman <patch-notifications@ellerman.id.au> writes:

> On Mon, 23 Nov 2020 18:40:16 +1100, Stephen Rothwell wrote:
>> After merging most of the trees, today's linux-next build (powerpc64
>> allnoconfig) failed like this:
>> 
>> In file included from arch/powerpc/include/asm/kup.h:18,
>>                  from arch/powerpc/include/asm/uaccess.h:9,
>>                  from include/linux/uaccess.h:11,
>>                  from include/linux/sched/task.h:11,
>>                  from include/linux/sched/signal.h:9,
>>                  from include/linux/rcuwait.h:6,
>>                  from include/linux/percpu-rwsem.h:7,
>>                  from include/linux/fs.h:33,
>>                  from include/linux/compat.h:17,
>>                  from arch/powerpc/kernel/asm-offsets.c:14:
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: warning: data definition has no type or storage class
>>    66 | DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: error: type defaults to 'int' in declaration of 'DECLARE_STATIC_KEY_FALSE' [-Werror=implicit-int]
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: warning: parameter names (without types) in function declaration
>> arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'prevent_user_access':
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:180:6: error: implicit declaration of function 'static_branch_unlikely' [-Werror=implicit-function-declaration]
>>   180 |  if (static_branch_unlikely(&uaccess_flush_key))
>>       |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:180:30: error: 'uaccess_flush_key' undeclared (first use in this function)
>>   180 |  if (static_branch_unlikely(&uaccess_flush_key))
>>       |                              ^~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:180:30: note: each undeclared identifier is reported only once for each function it appears in
>> arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'prevent_user_access_return':
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:189:30: error: 'uaccess_flush_key' undeclared (first use in this function)
>>   189 |  if (static_branch_unlikely(&uaccess_flush_key))
>>       |                              ^~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'restore_user_access':
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:198:30: error: 'uaccess_flush_key' undeclared (first use in this function)
>>   198 |  if (static_branch_unlikely(&uaccess_flush_key) && flags == AMR_KUAP_BLOCKED)
>>       |                              ^~~~~~~~~~~~~~~~~
>> 
>> [...]
>
