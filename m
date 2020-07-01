Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF463210C89
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 15:46:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xjDj02tgzDr0x
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 23:46:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=dYwQW22j; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xj9f6ls0zDqPF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 23:43:34 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id l6so7909096pjq.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 06:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mp3kZB+WljYlToUgRKHu/jMatrXibHPg1FspuaVdS+E=;
 b=dYwQW22jG+1U/8wxe99npchEcHOVVxkAEfKn6EBHer8enDnZPRaJ5nzspLL5jxwR7E
 8c6AvaHExACDpMcSpNKAKYnhHPOqDFAuRaNYxN8Hxrsw/QZbGOrdK0NOggJHl9AxSJgs
 BdPFufpE696CTqP0ZSQJiMeB/Vf1M790yE0S6UfvzUcW/2LK3Cll1WaQxPF72JBBNiAi
 uNmww608IStODIzkXWWB+ivDstxmDBFHqxk0XqSa0PCNUdKh4Ts6OZk4XhvUDLi977z9
 tRq/B+DQOlpjSRZ9yIK6lLqMnhcWWTEtAYB9JXJiCaKrLlWYMNjb0yZxPI5ky8TpWAqd
 O5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mp3kZB+WljYlToUgRKHu/jMatrXibHPg1FspuaVdS+E=;
 b=PE4V/wSB/R79aUxypn3Qjpv00aSe4bqRaHW5v7OE2l3gNMRq46wdQoLdcwLO4QIbBP
 t5rKtTVR/2EERq5nMu4pqGGmrjQ0n2tONfdGhlt5h9/jJTosfSfQHW7BfVkKENxbYsJJ
 iUImPnCqQpjdHuuULbltIV7a2hVdm0GwZ9a9O6CpehPhvv20QgSxYb3ym7zx6ylF/xHl
 Lgmetr6eOfcTl6wBSqgah6bpzIMRS4SakoG7VjtG47TJKs4bH9ZdC5GR6nbgqfmtMH3Y
 Al15KIiPS3t6RSU4XT+1cplhn5/BPMnkBLYogM25rcW2/ajNM96mSsRPU6FnA4mv7fy4
 QSPA==
X-Gm-Message-State: AOAM531sJ287EwlFA1ROjM6/Zwnrp1vLIhg/ASJU84mFunVRWZrZRM/b
 40epqS4JHpdofRZ19s/Dw70AAw==
X-Google-Smtp-Source: ABdhPJwvetMLus+odkxVKs2TAwFJf3HuNkqQjK/vuqbHNuGPdXyOvoQGErv/SGur7kel3VcwfskpPQ==
X-Received: by 2002:a17:902:690b:: with SMTP id
 j11mr14712438plk.313.1593611011686; 
 Wed, 01 Jul 2020 06:43:31 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:64c1:67b1:df51:2fa8?
 ([2605:e000:100e:8c61:64c1:67b1:df51:2fa8])
 by smtp.gmail.com with ESMTPSA id g4sm5868990pfi.68.2020.07.01.06.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 06:43:31 -0700 (PDT)
Subject: Re: rename ->make_request_fn and move it to the
 block_device_operations v2
To: Christoph Hellwig <hch@lst.de>
References: <20200701085947.3354405-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <bffb89d5-b51a-5f5a-15f4-b891f1f053ef@kernel.dk>
Date: Wed, 1 Jul 2020 07:43:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200701085947.3354405-1-hch@lst.de>
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
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org, dm-devel@redhat.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/1/20 2:59 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series moves the make_request_fn method into block_device_operations
> with the much more descriptive ->submit_bio name.  It then also gives
> generic_make_request a more descriptive name, and further optimize the
> path to issue to blk-mq, removing the need for the direct_make_request
> bypass.

Thanks, I'll try this again.

-- 
Jens Axboe

