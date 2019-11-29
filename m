Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 575F710D81F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 16:54:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PfGN1MBGzDrCG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 02:54:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="lUT1A0bJ"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PfDM25zHzDr70
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 02:50:50 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id q13so14791568pff.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 07:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=zqzmkmsTqqNqAEU6sqwGU4uvEVY7myANFxGbhNa8Thk=;
 b=lUT1A0bJvuFzw968HjdP/fl9rNWARwc0PM4vYA/8yJCbJ/uaimus9hTdblQmfxlQKV
 Hk3pTRvXK/sBwKVtqmUD9m1Hj5DCnk2axhfyw3w3c/3Smxd9sx0XjgiViLi9GAWsZgST
 ImILVq57QBkrCOTfxSwjUOt8pRnJQmvRe1mYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=zqzmkmsTqqNqAEU6sqwGU4uvEVY7myANFxGbhNa8Thk=;
 b=KY9FCK/fCkUNXjPm1w+jaaZGRNX/CG5G+wwymb1QrWpDJV7Tp2BqlxM5nHdVZgc4Av
 ttKgSsS87lxhmIc9kU9mO8/qKWTpAEh/wp9LNBGvutPvls2HYRxdwLC3lX9Mf+4Zhf2K
 Bf55dt6ZIKLGtm+D9M5yv2fsEBt/iUEQJJcypKHBGA/NzOTE7eRY1SLCaYNiwn4kQrIs
 1lrpABi2zeeEnG96kgnGPtt8bqYfsusIu+vIoO6JEicSmLh/5zECE9dhW5rdMgT9JOsm
 R6eGkmaG9LRufpgrUnu3wTqcmSLv7oj3MmxH6PnWYle8mR16DAPRt6+zyeHYxTkd1HA0
 qqPw==
X-Gm-Message-State: APjAAAUyOOrtRpyWlLE3/x4XzBf8C0RrPPG16zU3jGpwmlZZM3eyY8j/
 NTKyXK3erHLo/eHuLnpKWub+bg==
X-Google-Smtp-Source: APXvYqyyUukfPuCBk8nUZGZ0bnjEmJYzBWHD+mlTLp6d97G4LvWRCazYGdcctIJCVgDXHXDcuWz1Gg==
X-Received: by 2002:aa7:93a7:: with SMTP id x7mr57797282pff.36.1575042647113; 
 Fri, 29 Nov 2019 07:50:47 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-4092-39f5-bb9d-b59a.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:4092:39f5:bb9d:b59a])
 by smtp.gmail.com with ESMTPSA id a22sm1465829pfk.108.2019.11.29.07.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 07:50:46 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Qian Cai <cai@lca.pw>
Subject: Re: XFS check crash (WAS Re: [PATCH v11 1/4] kasan: support backing
 vmalloc space with real shadow memory)
In-Reply-To: <27B18BF6-757C-4CA3-A852-1EE20D4D10A9@lca.pw>
References: <20191031093909.9228-1-dja@axtens.net>
 <20191031093909.9228-2-dja@axtens.net> <1573835765.5937.130.camel@lca.pw>
 <871ru5hnfh.fsf@dja-thinkpad.axtens.net>
 <952ec26a-9492-6f71-bab1-c1def887e528@virtuozzo.com>
 <CACT4Y+ZGO8b88fUyFe-WtV3Ubr11ChLY2mqk8YKWN9o0meNtXA@mail.gmail.com>
 <CACT4Y+Z+VhfVpkfg-WFq_kFMY=DE+9b_DCi-mCSPK-udaf_Arg@mail.gmail.com>
 <CACT4Y+Yog=PHF1SsLuoehr2rcbmfvLUW+dv7Vo+1RfdTOx7AUA@mail.gmail.com>
 <2297c356-0863-69ce-85b6-8608081295ed@virtuozzo.com>
 <CACT4Y+ZNAfkrE0M=eCHcmy2LhPG_kKbg4mOh54YN6Bgb4b3F5w@mail.gmail.com>
 <56cf8aab-c61b-156c-f681-d2354aed22bb@virtuozzo.com>
 <871rtqg91q.fsf@dja-thinkpad.axtens.net>
 <27B18BF6-757C-4CA3-A852-1EE20D4D10A9@lca.pw>
Date: Sat, 30 Nov 2019 02:50:43 +1100
Message-ID: <87y2vyel64.fsf@dja-thinkpad.axtens.net>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, linux-xfs@vger.kernel.org,
 Linux-MM <linux-mm@kvack.org>, Alexander Potapenko <glider@google.com>,
 Andy Lutomirski <luto@kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>>>> 
>>>>> Nope, it's vm_map_ram() not being handled
>>>> 
>>>> 
>>>> Another suspicious one. Related to kasan/vmalloc?
>>> 
>>> Very likely the same as with ion:
>>> 
>>> # git grep vm_map_ram|grep xfs
>>> fs/xfs/xfs_buf.c:                * vm_map_ram() will allocate auxiliary structures (e.g.
>>> fs/xfs/xfs_buf.c:                       bp->b_addr = vm_map_ram(bp->b_pages, bp->b_page_count,
>> 
>> Aaargh, that's an embarassing miss.
>> 
>> It's a bit intricate because kasan_vmalloc_populate function is
>> currently set up to take a vm_struct not a vmap_area, but I'll see if I
>> can get something simple out this evening - I'm away for the first part
>> of next week.

For crashes in XFS, binder etc that implicate vm_map_ram, see:
https://lore.kernel.org/linux-mm/20191129154519.30964-1-dja@axtens.net/

The easiest way I found to repro the bug is
sudo modprobe i915 mock_selftest=-1

For lock warns, one that goes through the percpu alloc path, the patch
is already queued in mmots.

For Dmitry's latest one where there's an allocation in the
purge_vmap_area_lazy path that triggers a locking warning, you'll have
to wait until next week, sorry.

Regards,
Daniel
