Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C59377C8C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 09:44:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sXpXbQ7X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQ3FD2Zhnz3cRn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 17:44:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sXpXbQ7X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=mjguzik@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQ3Cc0spxz3cLl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 17:43:07 +1000 (AEST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1c4de3b9072so1453255fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 00:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692085384; x=1692690184;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dopEln9VPZxL0Iq2JZLCcr+rwxXbLb8d+hQCQTunBsQ=;
        b=sXpXbQ7X0/LnTySjZDkaO9nHDDYr/pU3abQLw5n+GIKm504OloCtIss+QlRkXMojYd
         lnsMof65iO5zpZY4PDmzq4MvCqh87E7X54BHvQSyyEBEsvQLKlRcO9PFHOwnoC26UxSi
         0EOZolvVtmL/fjRleZjuvqGddQNE1ZoIFWROwVG2UGNYm6q4+PQ4gJr4l2gvaDj98KI7
         LNthh1PBVu5kZzVpkcc4O5PE+NiDnj53oYq5p6Usr6X7mva8914eox15YAr9OxM1pcMm
         bfXnNogduAOX/QmakZMZx8O5v4D5wLTjB0DaOjr43HLmAUvjt7TZ5afaza86l8WrDnrm
         0KsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692085384; x=1692690184;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dopEln9VPZxL0Iq2JZLCcr+rwxXbLb8d+hQCQTunBsQ=;
        b=ez2WQh2unC6oNuPUHp8oOrJ5qpi54B70s8iKD/bJKtqVfOHO+ZY2TgctBVlVKcZf2S
         9ovrphYWqOi4/3TZT4c73kEFAs8kNBfhvVSdYN6+6ZsKZqw8GZtmvWzDif+2Zm2oHZb9
         qb2Y8JRJdEyxjEhQFp4FUdSG20YARn8eGWFPDmu9zq7t7UvrcXVOWFgk/FQmBd5KF0e9
         AZ1UPbsKosFhmJVWb2WSuK3z1sV/rRhuF1ohcMxJMyTJFtrUf2pur3e7eZyQc20/X/L5
         FnvJe7NcTQ4oU5K4BXuvEl7PQ//afweQdbVMc+LJYo/N832G0MynmhRYhpbfSBwDopzP
         BGtQ==
X-Gm-Message-State: AOJu0YzRSl1a5O8moIjBUiEzUnMz6ntaVd/gso9iFqzdCps9SR2JzLcL
	75Oc9dmEfjxm03PEUj9Ak7XG7ujKifhc7K1sB0w=
X-Google-Smtp-Source: AGHT+IH21/5w6crwWPD7vIv/j0w3adsBN5eHck6Oh1Qn4awi8woAnlWJm3VwnpYegg1T9u8cFeJOGx/7gnb2bXKv5QE=
X-Received: by 2002:a05:6870:15d5:b0:1bf:9f6:b810 with SMTP id
 k21-20020a05687015d500b001bf09f6b810mr11562135oad.36.1692085384532; Tue, 15
 Aug 2023 00:43:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:745a:0:b0:4f0:1250:dd51 with HTTP; Tue, 15 Aug 2023
 00:43:04 -0700 (PDT)
In-Reply-To: <CAHk-=whbOEhPUL1m8Ua-+-E7kJXED4xa+duzRF-wJKR84NAPWg@mail.gmail.com>
References: <202308151426.97be5bd8-oliver.sang@intel.com> <CAHk-=whbOEhPUL1m8Ua-+-E7kJXED4xa+duzRF-wJKR84NAPWg@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 15 Aug 2023 09:43:04 +0200
Message-ID: <CAGudoHFFdFa=0y0XSEMNF4eucngxHKs7tby3rf32A-Wn1cqivQ@mail.gmail.com>
Subject: Re: [linus:master] [locking] c8afaa1b0f: stress-ng.zero.ops_per_sec
 6.3% improvement
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: feng.tang@intel.com, linux-ia64@vger.kernel.org, lkp@intel.com, fengwei.yin@intel.com, ying.huang@intel.com, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, kernel test robot <oliver.sang@intel.com>, linux-alpha@vger.kernel.org, oe-lkp@lists.linux.dev, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/15/23, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> On Tue, 15 Aug 2023 at 07:12, kernel test robot <oliver.sang@intel.com>
> wrote:
>>
>> kernel test robot noticed a 6.3% improvement of stress-ng.zero.ops_per_sec
>> on:
>
> WTF? That's ridiculous. Why would that even test new_inode() at all?
> And why would it make any difference anyway to prefetch a new inode?
> The 'zero' test claims to just read /dev/zero in a loop...
>
> [ Goes looking ]
>

Ye man, I was puzzled myself but just figured it out and was about to respond ;)

# bpftrace -e 'kprobe:new_inode { @[kstack()] = count(); }'
Attaching 1 probe...

@[
    new_inode+1
    shmem_get_inode+137
    __shmem_file_setup+195
    shmem_zero_setup+46
    mmap_region+1937
    do_mmap+956
    vm_mmap_pgoff+224
    do_syscall_64+46
    entry_SYSCALL_64_after_hwframe+115
]: 2689570

the bench is doing this *A LOT* and this looks so fishy, for the bench
itself and the kernel doing it, but I'm not going to dig into any of
that.

>>      39.35            -0.3       39.09
>> perf-profile.calltrace.cycles-pp.inode_sb_list_add.new_inode.shmem_get_inode.__shmem_file_setup.shmem_zero_setup
>
> Ahh. It also does the mmap side, and the shared case ends up always
> creating a new inode.
>
> And while the test only tests *reading* and the mmap is read-only, the
> /dev/zero file descriptor was opened for writing too, for a different
> part of a test.
>
> So even though the mapping is never written to, MAYWRITE is set, and
> so the /dev/zero mapping is done as a shared memory mapping and we
> can't do it as just a private one.
>
> That's kind of stupid and looks unintentional, but whatever.
>
> End result: that benchmark ends up being at least partly (and a fairly
> noticeable part) a shmem setup benchmark, for no actual good reason.
>
> Oh well. I certainly don't mind the removal apparently then also
> helping some odd benchmark case, but I don't think this translates to
> anything real. Very random.
>
>                     Linus
>


-- 
Mateusz Guzik <mjguzik gmail.com>
