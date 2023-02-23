Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F1C6A0C65
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 16:00:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMx6H3NY1z3cMs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 02:00:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EB6dxFuO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EB6dxFuO;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMx5N1p1vz30hl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 01:59:50 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id i10so4299385plr.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 06:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k+yWMvIWvw3WCrNeIHfg2T45OrUG0bC11D4EFok9F+M=;
        b=EB6dxFuO49E9hfnx+Osyz4QjHI3/kf2CZqPTbL8bZbPI2QTYpJp+BuVJf6x9/Op3aS
         xof+1Uoax1p7nvbELL+hvfbo39TWfpBmEBoy9EpUsAQdrTSvZuTrHRoWXL0gdYKaEor+
         FlUMT4ZM537FZvyLzQVS2uN0IxwQHFIi6aHEt02yLOvzx/nI4cU6h6Jhn6sPqf2zGz3q
         7n1Fj4k/PR8q2dQfzWmocEZdEerzfVqSvdFp8in5t8rCq1veO/qkTc35xDsvKZ7O1cgU
         codFdh6jBnohjFOUx2BlZiCyA2YSs+IROp6V+lyMbfz4+T3nV1nwcz5dHnaW98oy8QVz
         yOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+yWMvIWvw3WCrNeIHfg2T45OrUG0bC11D4EFok9F+M=;
        b=r5g356xR0mZdZ2Wtmm7rdFSPhjl1guYmMJuHudjNILtUP5vLTPI1YlMucF/hp9jqQI
         IIRtk+WmtlmqBv8ubZ3DAxuDN48YSPc73wA+BCmAU3yRuoqJNOz52YRiwehX1J2tv1ue
         fmoO9uXJmvqb0jNiEenG4/dfirnu45LeZXz3AvLB/qOgj/EMZLUvz37dC8zWZ9bU14/G
         rTGfClBlm84jNDmkKGKUisvLcX4LV+ABNJ26y37uYoBkuVa1nao3OPLZTVvT5CuZPJZ0
         fNTWyiDHntDvt7ToHCmSX7WTt6a2HZiAb3ZFtcW8c2KqQeBHE9U8xE5cu5VCo33eqlYC
         W6PQ==
X-Gm-Message-State: AO0yUKVpyjVBjxgJwXyh0konf4W7FI0XO1+205cTOHsZcWkmFjSv3v92
	anMnGs0x61Bh/7I/BbbKeqI=
X-Google-Smtp-Source: AK7set/Qc2kRq6mVoIFJONVn7gWNZxeDHePlIGkq7CYhB6h9Zfh2pnK8s5XWdm4snMLVlByeQRXokw==
X-Received: by 2002:a05:6a20:3d0c:b0:c7:1bac:6ef9 with SMTP id y12-20020a056a203d0c00b000c71bac6ef9mr12306390pzi.46.1677164386983;
        Thu, 23 Feb 2023 06:59:46 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
        by smtp.gmail.com with ESMTPSA id bm2-20020a056a00320200b005ac419804d5sm1703160pfb.98.2023.02.23.06.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 06:59:46 -0800 (PST)
Date: Thu, 23 Feb 2023 14:59:34 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 16/35] mm/mmap: write-lock VMAs before merging,
 splitting or expanding them
Message-ID: <Y/d/Vs1R/+ldNeuG@localhost>
References: <20230216051750.3125598-1-surenb@google.com>
 <20230216051750.3125598-17-surenb@google.com>
 <Y/d9b5Ev6vAEzzVO@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/d9b5Ev6vAEzzVO@localhost>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundati
 on.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023 at 02:51:27PM +0000, Hyeonggon Yoo wrote:
> On Wed, Feb 15, 2023 at 09:17:31PM -0800, Suren Baghdasaryan wrote:
> > Decisions about whether VMAs can be merged, split or expanded must be
> > made while VMAs are protected from the changes which can affect that
> > decision. For example, merge_vma uses vma->anon_vma in its decision
> 
> Did you mean vma_merge()?
> 
> > whether the VMA can be merged. Meanwhile, page fault handler changes
> > vma->anon_vma during COW operation.
> > Write-lock all VMAs which might be affected by a merge or split operation
> > before making decision how such operations should be performed.
> >
> 
> It doesn't make sense (to me) to update vma->anon_vma during COW fault.
> 
> AFAIK children's vma->anon_vma is allocated during fork() and
> page->anon_vma is updated on COW to reduce rmap walking because it's now
> unshared, no?
> 
> As patch 26 just falls back to mmap_lock if no anon_vma is set,
> I think we can assume nothing updates vma->anon_vma (and its interval
> tree) if we are holding mmap_lock in write mode.

*Not interval tree, as it can be modified by other processes*

> 
> Or am I missing something?
> 
> --
> Regards,
> Hyeonggon
> 
