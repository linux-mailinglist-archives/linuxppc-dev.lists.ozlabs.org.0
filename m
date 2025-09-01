Return-Path: <linuxppc-dev+bounces-11573-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9378B3E55C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 15:38:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFqht1ZCnz2ywh;
	Mon,  1 Sep 2025 23:38:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756733934;
	cv=none; b=WQYSAuJZ+lAxFKnB2PJOjbo7eImqCbnFm6zqrF4Z8f5pVf/1tMS2/CguV+rL21kbPpo3foZNv1MvmA7IPALd6C0U5VqEe1mk9rtOaT1lqknud0mwsfLIbXYzI1yGSGy4SU4MTlr9by0o76Wu7aYVGAgA2V+xUIMsezOtAbQMVKyHmpT7t2ElLRoMFllg/xTDytLeTjWMTolhfUYx8kiuCZZKFDSHKWhruS9D4+XcQXsea5U3Xdog6NCGqbTpjD+Ka25Dw/w6lqa4fzdmukB5eHBl1ws4OFzO0btuSYGakXZWfUiDqzMDctgIJiJxX4WGo8KEjxkME5teP/ri8oT7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756733934; c=relaxed/relaxed;
	bh=WYwpi82W7VIihj8uBfuL+qMQaHX4FplKNy0RIRsXcCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nfU98iOfL5jf5nQ/iHDtZ3ChPBa/7ptXq781qwN/rLS2OPL1Wl/afOaaL8ajf+mpW3B2N6GfJYJ/iGGN0Atj6saGTkdfXUpW0K0SNR2D1CLZUisugjcT+YHye1ImPX4JPlmgLx5R+2YCCmCWjituxrATGYUPXh51OGNIzbfQIyUAb+jnVyi5Hw81cYcMqetLIa6IX6fpXrLK9Wz8cCGjoq4Fbym7WnK7+Dq2pPYLTAtYfzgr/GRAfd6LDTBCweOViUDaNWJ09aPN0scROTxEDW1GyOQw+f0RrUNJqc+ttZaaFh56sEFPvv7t3ae/gdccIXMXZ0clEEGZCdHivifGAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YRG/ThSg; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ak46Uone; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YRG/ThSg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ak46Uone;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFqhs2fRLz2ywC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 23:38:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756733928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WYwpi82W7VIihj8uBfuL+qMQaHX4FplKNy0RIRsXcCU=;
	b=YRG/ThSg+vf5ZEJ0hj2j8TYCJ4er4FkTLnR1/gq83+s3TxcBZqDhnQySUgR9xO7vhHDhmn
	AbEZAOz+jBQGdZPcNm63wz97VnaIYBcnnpqiseo6iNrP2L37bjQm+cU2EoXTCjAktb+2t8
	l5LNVEYzkIPyOgP7qjr6/Xdz8/W0Js4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756733929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WYwpi82W7VIihj8uBfuL+qMQaHX4FplKNy0RIRsXcCU=;
	b=Ak46UonehMniajiTrRMr6wCXxaH61dDahe/bdZBz+kZ9v7Of+5h2gWW8tsR77s8+GkY7m/
	hsY9BWVh9EzwO3+Qbclt8eHnoDvlL7mv88QAXrkKuTPVAV3qBLntjBv7lnQM8Oemw+b7kK
	MmOL0IhEV1NTTJxQOuREdyAexfOFw/Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-aSbeuOZGOrKCeoYEMdlZWQ-1; Mon, 01 Sep 2025 09:38:47 -0400
X-MC-Unique: aSbeuOZGOrKCeoYEMdlZWQ-1
X-Mimecast-MFC-AGG-ID: aSbeuOZGOrKCeoYEMdlZWQ_1756733926
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3cceb92ea73so2518216f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Sep 2025 06:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756733926; x=1757338726;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYwpi82W7VIihj8uBfuL+qMQaHX4FplKNy0RIRsXcCU=;
        b=oNDmvrpKw3pXJ3SqPbqxMmq/xuy/UqjIzqgRBMTBiJa3Ub2NkIAd0lNhFuCJKpxGnF
         YnUCgQDr91Ij+P1YtmivLY0d9affJRJQLytdBGFUcUmj/qN0iaLoaDVsps+FJHWZB9Va
         CFewyD/+Me+hf67V+2SfM7IZa8PonXyhR90/RfEGflJFZHGTwoh5yGgUIiBOknDRXrT/
         ek0wIeU2kkF6ep9PoqJpKo+EwMLHpH1+VovdtuLBEfM8urxbSGNubyVC0V4xI3Gd5JpA
         OYcR9mj8l6D1Nx+HAbgYRHZbb0A/nrs0izxFKnU5cIMas/1VgHnbSgjp8junkh1PSSxg
         M3YA==
X-Forwarded-Encrypted: i=1; AJvYcCWQXg0/eCjkV1MCUWGN/lUSEa76kB2jmZKWtaSyOYo26fUfGCkW1ABudlMlJ5sJ6ZGklu9JKVhwmyicIvQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxXiSuUo56NCcBwjunSgdxYT68PqKaHFzeXfdRnUm68xnHe2APg
	9cbacGi1Ul4In2kehLtKf8KjVdJgJtqReU6kP0aI5xOXLbfYaz4cOsFi4pzQX8VqHbVOXBl+KWB
	wEK8KY+Z7TWYsyok51dntnqLBqWMqsQu4mvl4RfGIP2YFV7iebHqdGgXWrhzZSLDFohM=
X-Gm-Gg: ASbGnctq1P+fiLmHuta9UvR8WL0IPh7W8/NzJ0EAq+zjJH0hn2bVdwq9UcAsiCB6L0Y
	atuxt22iU5hI2MH1MBw0563FN8Kw8zxZY0UQF2I4JcVxfYGOUaCKZAXHxs03DWuexpU/neoAgDY
	mDTpLiJKslYFmEs/whfsWFiXIKMTUvGg4bSXWW2uKTnyOXz3EOcm1A5QJRaBdijbqGSD9sYzWBS
	RS3SAQfqODTv+MSbOwwjunOrQ9K2bYOT9zlTes62Uf0gelMSdXTnDI2idJOn7Hp/rY8nOxlDyKR
	MlVSV5b+oZQQA33l7RDmF5HKmWrz6l6y98Hj53P9NwBW2VzBU1NwlkPTHRK9FRlmdkVecN4E4wB
	gipQ4q8VqtRDZqMsX/R/F4m0vRg48r2JptNickNODnkBGcGp8TWg9OV+YiKBZ6QWVeq4=
X-Received: by 2002:a05:6000:2102:b0:3d3:8711:d934 with SMTP id ffacd0b85a97d-3d38711dcc7mr3315100f8f.14.1756733925975;
        Mon, 01 Sep 2025 06:38:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3DliMw41VU4hxaIWHMLNG+OBiPKQ08qUXWAlqHFXtcpv953/vrh5P5rTJMXfl1jn2z2RQzw==
X-Received: by 2002:a05:6000:2102:b0:3d3:8711:d934 with SMTP id ffacd0b85a97d-3d38711dcc7mr3315078f8f.14.1756733925456;
        Mon, 01 Sep 2025 06:38:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d21a80c723sm10359081f8f.9.2025.09.01.06.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 06:38:45 -0700 (PDT)
Message-ID: <48ee3dd0-9af3-4513-aef2-25e185cce349@redhat.com>
Date: Mon, 1 Sep 2025 15:38:42 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] copy_process: pass clone_flags as u64 across
 calltree
To: schuster.simon@siemens-energy.com, Dinh Nguyen <dinguyen@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-perf-users@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org
References: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
 <20250901-nios2-implement-clone3-v2-2-53fcf5577d57@siemens-energy.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250901-nios2-implement-clone3-v2-2-53fcf5577d57@siemens-energy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h0sPi9dQYsHmjjVkcWDYRZJfrqcJ-NgIz7mCPFLy4YQ_1756733926
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 01.09.25 15:09, Simon Schuster via B4 Relay wrote:
> From: Simon Schuster <schuster.simon@siemens-energy.com>
> 
> With the introduction of clone3 in commit 7f192e3cd316 ("fork: add
> clone3") the effective bit width of clone_flags on all architectures was
> increased from 32-bit to 64-bit, with a new type of u64 for the flags.
> However, for most consumers of clone_flags the interface was not
> changed from the previous type of unsigned long.
> 
> While this works fine as long as none of the new 64-bit flag bits
> (CLONE_CLEAR_SIGHAND and CLONE_INTO_CGROUP) are evaluated, this is still
> undesirable in terms of the principle of least surprise.
> 
> Thus, this commit fixes all relevant interfaces of callees to
> sys_clone3/copy_process (excluding the architecture-specific
> copy_thread) to consistently pass clone_flags as u64, so that
> no truncation to 32-bit integers occurs on 32-bit architectures.
> 
> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   block/blk-ioc.c                | 2 +-
>   fs/namespace.c                 | 2 +-
>   include/linux/cgroup.h         | 4 ++--
>   include/linux/cred.h           | 2 +-
>   include/linux/iocontext.h      | 6 +++---
>   include/linux/ipc_namespace.h  | 4 ++--
>   include/linux/lsm_hook_defs.h  | 2 +-
>   include/linux/mnt_namespace.h  | 2 +-
>   include/linux/nsproxy.h        | 2 +-
>   include/linux/pid_namespace.h  | 4 ++--
>   include/linux/rseq.h           | 4 ++--
>   include/linux/sched/task.h     | 2 +-
>   include/linux/security.h       | 4 ++--
>   include/linux/sem.h            | 4 ++--
>   include/linux/time_namespace.h | 4 ++--
>   include/linux/uprobes.h        | 4 ++--
>   include/linux/user_events.h    | 4 ++--
>   include/linux/utsname.h        | 4 ++--
>   include/net/net_namespace.h    | 4 ++--
>   include/trace/events/task.h    | 6 +++---
>   ipc/namespace.c                | 2 +-
>   ipc/sem.c                      | 2 +-
>   kernel/cgroup/namespace.c      | 2 +-
>   kernel/cred.c                  | 2 +-
>   kernel/events/uprobes.c        | 2 +-
>   kernel/fork.c                  | 8 ++++----
>   kernel/nsproxy.c               | 4 ++--
>   kernel/pid_namespace.c         | 2 +-
>   kernel/sched/core.c            | 4 ++--
>   kernel/sched/fair.c            | 2 +-
>   kernel/sched/sched.h           | 4 ++--
>   kernel/time/namespace.c        | 2 +-
>   kernel/utsname.c               | 2 +-
>   net/core/net_namespace.c       | 2 +-
>   security/apparmor/lsm.c        | 2 +-
>   security/security.c            | 2 +-
>   security/selinux/hooks.c       | 2 +-
>   security/tomoyo/tomoyo.c       | 2 +-
>   38 files changed, 59 insertions(+), 59 deletions(-)
> 
> diff --git a/block/blk-ioc.c b/block/blk-ioc.c
> index 9fda3906e5f5..d15918d7fabb 100644
> --- a/block/blk-ioc.c

(adjust To: list)

Hopefully we caught most of them. The ones not called "clone_flags" are 
a bit nasty.

We could have split of some changes (e.g., trace event), but likely not 
worth  it.

Thanks!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


