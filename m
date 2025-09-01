Return-Path: <linuxppc-dev+bounces-11574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 990FFB3E572
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 15:39:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFqk13X4nz2ywC;
	Mon,  1 Sep 2025 23:39:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756733993;
	cv=none; b=QaiOOWYcPMPvfhMuoWXWgdZkJbiFLr7CZ7d1Pg6vr+70A+PKbWguD8oqHGvdSTra5bJ4QzD+bYvIuyjzYkzjXwwu/GlemYk7H6r9Lz/4EWAVk91vQiKiNd1ooAp+PLTBWLvrA57EPYj7blozQh2LEnieaI2ukpc7LV8btjYBy/iwmjZzHwky04hQ66gMY24Hwr8LrvLgVc9FzcBff1yTXu3gCb+Ve8Nvcl1Qm3W4v5sL59Ze3WGTMVTpTqMLhwZU4ox0wfOGukfei39tM4RZiK2GUGIsY8VBMbLSbE+j2nZ4NbTMzXMLYh3Kh/KQEmF5ZREGxhpE1/mytzfWHkgsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756733993; c=relaxed/relaxed;
	bh=H3id/gOofLyuF/iZzklWJhNUkAhzxEH18RZFHORTa7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mP4gwzU4KOYBBgoP3XFPc+Us5ynOzNVrnxUKfe+qMweJ75AXiUXCfm3C2lQbmV776jjyPVHAmTIDoKiKphSQSKFzm+9tSsHaoH30Khh0jv/PeycSoMvFmX+etN+wnM5Kwtrm7PO1bRag08d/YDdigYMgnTeXiX2Nm5HOIDLzfVIWDDV1hPW8uPdQ5JnBZfpLJPiAjAI1bykCBNgfdVC5o0Uz7aFBDqdWwFVsvf95/ZkRFc21ePFaqHqR0VEXob/BgjdU2OB1eY90Mg/ZC4W6UGgVVNn0rdgz8NWKINikJWjm1W+DwaBLVz3QtKo9DMrkM9muKUU4iq2c+M6t3UCHRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OhIIMhDh; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S5nrA4z3; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OhIIMhDh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S5nrA4z3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFqk03XP3z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 23:39:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756733989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=H3id/gOofLyuF/iZzklWJhNUkAhzxEH18RZFHORTa7Q=;
	b=OhIIMhDhN0R9e+Qpi4e5rhyVhRYRQcc0i7MzxZ/PzPpDCXrV7EI5Z5wzzXSVR1a9nxXWYI
	lW28PCavEN3yDNWWrdQP/UTU9w/PhTXyBCXOrWLH4r2KlgMvNUSyTEfmbAPZI6A0fBESuY
	s/lWoMCFvoP13WdsDtmRy64Dg72jUWU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756733990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=H3id/gOofLyuF/iZzklWJhNUkAhzxEH18RZFHORTa7Q=;
	b=S5nrA4z35c09AVrVMVEYu9HROB7xDPqxipPRCtLU2RLNkXz+1KIXCCKshj3n0TwBOxomej
	D+kkFksgwX8R/ca4sDAxtdTsMPIRuvMS+6d4M2vR9CZ7nrghls21sF2uj/FrusTg4CHEMb
	NQcpCfyya+y1t0mWbjeTAvoAptPX9DI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-1ndKqgSgNdKhShIibHR3TQ-1; Mon, 01 Sep 2025 09:39:48 -0400
X-MC-Unique: 1ndKqgSgNdKhShIibHR3TQ-1
X-Mimecast-MFC-AGG-ID: 1ndKqgSgNdKhShIibHR3TQ_1756733987
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3ce7f782622so1854674f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Sep 2025 06:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756733987; x=1757338787;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3id/gOofLyuF/iZzklWJhNUkAhzxEH18RZFHORTa7Q=;
        b=g5VN3Zq2rJrTrCI7gIHQogQd1eNHBLFvTJZLkIBpqdMHpC9vmtEa69L6C4h35SjUYQ
         TGP+gbM3SqPXjGOPwl3gMez+7KVb/1BcIMlripaLXHL1vzagrxKuKMKQlIhogZXjqLGL
         o7qebdIi74BB67bRI6ca+Qg3W8iRSWrTuP5rjSdhfETRYCMbZDJXVtMicZ2cYK+2KwLQ
         BApRcI86ETfciuPLPp9Mayg5Bv1LKOhIX3Wljz+fY1n/xzjbeL0iw1x6QusEbgLL5HhM
         2cZ3YBb2pQNEKjSWMFa0TQbKzDUHwBw+fXf4qTK9/owTKBkwv+GFjODEwDWs7H2Ieyq9
         WiaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh62VZgRf2mrcGgvEkSqCbRCmMogFaEy4hZpyZVsU7sx/rwU8+QwglDhyxmjEktyG4vjCAUpFVDI7Vp4M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwC/S2+kBtGZl4iaGqXpuqfanXxYJiDGOVfydQ6dFCIc0uJsw8d
	ZQODqluGXJIjVfi+aPPBprA72MsIUJv/+0fdLisZSdmtymNRI/cLwIBmkWw1itf/ebLnkxcfmti
	fHefz8JxTzj7MwwkSfRnlf7ejsA5Pnf2+6m5+09ihPSMnAqmQ9zcsGJBHAYIXTfBrUZY=
X-Gm-Gg: ASbGnctNPMV4giB4upyezk/LC5bY+7SDHeyyx9B+34zak3CARuqBi9ydmcuxwMUGwcc
	+AKzCMUHVrltIukRJNAQfGjlK9+4ssP8rqETjfCQHCvVNwcnDiQ9RGtjMIEa27RD7iYbhLSo0zH
	rX9Qz+/asYNtlrpgCic5M9GanwWdO6lTp9xJ4mEV6RYddSOLuNCtrZyShPVDDmQ+nB55i8UhUD1
	HZBdILu03g6hpdi+dveddC7SZC99EfASxuhNywnpUTC1peIwWEjy0leEyE4L2NVYUUFkZCzvcUN
	p7RoRyFJBiAUTSKznD10ZD4Qmyvz2sWj1llpn+L+th6WqzLeXKu4HjP6UG2VtVNzR0D99IDU0zx
	oO50CVxfliO/waMy+vQWk4AnnT7z5GWZv4pph2XYhoXtQ2b68WEpVJutRdQHbKaduG4E=
X-Received: by 2002:a05:6000:659:10b0:3d2:633f:d02e with SMTP id ffacd0b85a97d-3d2634f1711mr4945709f8f.2.1756733987313;
        Mon, 01 Sep 2025 06:39:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF16bYB/CPbtI8bBu7Fukc9/QEkuztuZV5dc0Mxq3hfWjQ0mUxmJtka4Y09bvawf1aVKd4/5g==
X-Received: by 2002:a05:6000:659:10b0:3d2:633f:d02e with SMTP id ffacd0b85a97d-3d2634f1711mr4945678f8f.2.1756733986750;
        Mon, 01 Sep 2025 06:39:46 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm238421945e9.5.2025.09.01.06.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 06:39:46 -0700 (PDT)
Message-ID: <72558e21-2ebf-448a-a93a-3d1a3181a592@redhat.com>
Date: Mon, 1 Sep 2025 15:39:44 +0200
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
Subject: Re: [PATCH v2 3/4] arch: copy_thread: pass clone_flags as u64
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
 <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _clOk4ISmGehOu5HU60NyNqp6oYUkLRqa1OqyUaVCrU_1756733987
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
> Thus, this commit fixes all relevant interfaces of the copy_thread
> function that is called from copy_process to consistently pass
> clone_flags as u64, so that no truncation to 32-bit integers occurs on
> 32-bit architectures.
> 
> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
> ---
>   arch/alpha/kernel/process.c      | 2 +-
>   arch/arc/kernel/process.c        | 2 +-
>   arch/arm/kernel/process.c        | 2 +-
>   arch/arm64/kernel/process.c      | 2 +-
>   arch/csky/kernel/process.c       | 2 +-
>   arch/hexagon/kernel/process.c    | 2 +-
>   arch/loongarch/kernel/process.c  | 2 +-
>   arch/m68k/kernel/process.c       | 2 +-
>   arch/microblaze/kernel/process.c | 2 +-
>   arch/mips/kernel/process.c       | 2 +-
>   arch/nios2/kernel/process.c      | 2 +-
>   arch/openrisc/kernel/process.c   | 2 +-
>   arch/parisc/kernel/process.c     | 2 +-
>   arch/powerpc/kernel/process.c    | 2 +-
>   arch/riscv/kernel/process.c      | 2 +-
>   arch/s390/kernel/process.c       | 2 +-
>   arch/sh/kernel/process_32.c      | 2 +-
>   arch/sparc/kernel/process_32.c   | 2 +-
>   arch/sparc/kernel/process_64.c   | 2 +-
>   arch/um/kernel/process.c         | 2 +-
>   arch/x86/include/asm/fpu/sched.h | 2 +-
>   arch/x86/include/asm/shstk.h     | 4 ++--
>   arch/x86/kernel/fpu/core.c       | 2 +-
>   arch/x86/kernel/process.c        | 2 +-
>   arch/x86/kernel/shstk.c          | 2 +-
>   arch/xtensa/kernel/process.c     | 2 +-
>   26 files changed, 27 insertions(+), 27 deletions(-)
> 

(Adjust To: list)

Thanks!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


