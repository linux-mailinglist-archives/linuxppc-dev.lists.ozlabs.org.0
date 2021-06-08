Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C203A060E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 23:30:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G03LV71Thz3dt4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 07:30:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=r6G1vcNc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=r6G1vcNc; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G03G66wbPz3cPQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 07:26:37 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id h16so135817pjv.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 14:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kNN1i0jrT7egcOu3/Gg1Kx3fRixlSMvnvYZBcIOdB0k=;
 b=r6G1vcNcZMXWXE6oDi0tLTFoeRKb4dnpyBZqrrJbmJwhBrCDaD1I7nyzN9J+47Zcb4
 9BF+Aq+xjvhTtlyr21YeXS6lD2Tbf6jDVsiwBnaP++TOlcPVHx2vFMzTrqQU+p9LTzZ0
 rvwrXYvPKkN7RFyyhxX57RGgHaG6v67wzF+cwyK+/OpOvNiXio42o1IuJEIjHzGMnKmx
 yDdIpf/30EykF5NoLqd/ESrGLwpjySkztMTAyEem8PU41Z6XgFncxxtj1l2xBlDLp5pI
 jZok4B0WsCatTx0KTbO/e9/Ev2SxFjLF6/PFL5q5w/ivFUBkq8dJ8Q311zak2hiPFXrT
 l1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kNN1i0jrT7egcOu3/Gg1Kx3fRixlSMvnvYZBcIOdB0k=;
 b=tAfUlod+ac6SyjR0FvmzrcKWnqYd4cVamMQjQdaXuUJraD4/TJzFPUcC0oaG60kmik
 aeawE3WntnSeYrwha9zxn5mLkV2wfVWzSzZNpzJoSP9Q4oWCTl1cYOhAtoHnqDQD1rm4
 Y7t4HQAG5XOfgCQMfO3Mm9Z4fD9D7WqrGcX/JO90yPgmN6ujM/AzabkBctFyeyy8DVTn
 dk6fWJltonYHqwUqUUkULegUZ9uC5qGamd19GpojNaQaJVX8E9DzXrDf1G0csh1GMxlb
 xfIbqCLDos158GAA+Acok7sMdC8DhhCN3aY6EwoVxn2cct3EPugpHjuR/3WfBOWPEmiS
 wYSQ==
X-Gm-Message-State: AOAM530wERBr+6Ou+h8IFCsGNWWSs3PhslSQDe+EfV3T3rgGBEgyz7fv
 M0r8FcVg/cyLZhq6V8qHYhq1aR9Fp+OoHA==
X-Google-Smtp-Source: ABdhPJyTM1saT9p8ZYGVelfuMPmeTYV1q7Z3qAgPiVEANKFqHtJZduf+t/dNGiht2a5I2zxw/1RELQ==
X-Received: by 2002:a17:902:8d92:b029:113:91e7:89d6 with SMTP id
 v18-20020a1709028d92b029011391e789d6mr1700511plo.85.1623187591661; 
 Tue, 08 Jun 2021 14:26:31 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
 by smtp.gmail.com with ESMTPSA id
 h8sm5800635pgr.43.2021.06.08.14.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 14:26:31 -0700 (PDT)
Subject: Re: [PATCH v2] libnvdimm/pmem: Fix blk_cleanup_disk() usage
To: Dan Williams <dan.j.williams@intel.com>
References: <162310861219.1571453.6561642225122047071.stgit@dwillia2-desk3.amr.corp.intel.com>
 <162310994435.1571616.334551212901820961.stgit@dwillia2-desk3.amr.corp.intel.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <1b2082fc-be01-ad2f-9dd5-aa66b1c0ce85@kernel.dk>
Date: Tue, 8 Jun 2021 15:26:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <162310994435.1571616.334551212901820961.stgit@dwillia2-desk3.amr.corp.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, nvdimm@lists.linux.dev,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-block@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/7/21 5:52 PM, Dan Williams wrote:
> The queue_to_disk() helper can not be used after del_gendisk()
> communicate @disk via the pgmap->owner.
> 
> Otherwise, queue_to_disk() returns NULL resulting in the splat below.
> 
>  Kernel attempted to read user page (330) - exploit attempt? (uid: 0)
>  BUG: Kernel NULL pointer dereference on read at 0x00000330
>  Faulting instruction address: 0xc000000000906344
>  Oops: Kernel access of bad area, sig: 11 [#1]
>  [..]
>  NIP [c000000000906344] pmem_pagemap_cleanup+0x24/0x40
>  LR [c0000000004701d4] memunmap_pages+0x1b4/0x4b0
>  Call Trace:
>  [c000000022cbb9c0] [c0000000009063c8] pmem_pagemap_kill+0x28/0x40 (unreliable)
>  [c000000022cbb9e0] [c0000000004701d4] memunmap_pages+0x1b4/0x4b0
>  [c000000022cbba90] [c0000000008b28a0] devm_action_release+0x30/0x50
>  [c000000022cbbab0] [c0000000008b39c8] release_nodes+0x2f8/0x3e0
>  [c000000022cbbb60] [c0000000008ac440] device_release_driver_internal+0x190/0x2b0
>  [c000000022cbbba0] [c0000000008a8450] unbind_store+0x130/0x170

Applied, thanks.

-- 
Jens Axboe

