Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B88332F717E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 05:15:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH7BX19dlzDsYr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 15:15:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Bt/YsLES; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH78s4x8NzDsXN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 15:13:48 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id q7so5202123pgm.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 20:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gH2batcV0mbxPrXXyk1QXVRqwhKgMABpN1EolWS8Bvc=;
 b=Bt/YsLESU8pfLIriLUvINiSIxA3QNvd+U9KAshB6U0dfPrVvGAvL//YTnEF+Ixgpvp
 w8DRk5DW3Gkh/SUcONIZT5OHQNetp8sB3mwDav5gubUsZASegMzsqV9gMEz6iE0VyCBM
 bK9QmLRuXWg6Ftxn2kKEPNQvY/cEEHKIL8QLtLoGzgnY1WvyICKl089KnK4g+H6/GMca
 b+2F3O1Bdqs7QKHowOCVn/74iuY1Ai7O6T3/XE54mUYxWlpf4a7FW44i/Xgu5SianPaR
 Qk6blTIbE+3FiRf0ZEP4EFCgGyTGHz2UJ88HpycthfuZG9V9IYI94FRh8R/x4JVyl0t/
 Duwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gH2batcV0mbxPrXXyk1QXVRqwhKgMABpN1EolWS8Bvc=;
 b=UTJrt96nwTH/6VuksQA5yLCSniJJksSce3VgVedtoYKBne89Ep0/X2E6c30ZO6NpCx
 +2dPDO37O0bxP0zpJdzT6ZrgNmfy0HlGxWA/j/Vx5UZmynzKZH4XonbXpAgMkHue1WmJ
 +oaYm8tm04RyH0A+kBX/hZFI0FV/ggPoFnYm5k9+tH6iSRsLh+5jQu+Owoq2y1DKlTrd
 9pZ9hvh+sv47T08CfkyiTvd/Ee90fjToOuG5c2S3pBzvPqZdaclgyUbeuF+U//IgdMkQ
 WjkfHts9QV7Ukxu1yKVGCpNjXTamZnV7CUPjcFBsgfa9vRTt04xyDpVh/7LNjQ3B+/kr
 9k9g==
X-Gm-Message-State: AOAM531bEeADVOS/wBgSWSE/rH19g6x5dDixqhmCf1cSkr7lzyI6c0ps
 dJRv5qpGSo+Z9PgvHXVb2C17dA==
X-Google-Smtp-Source: ABdhPJwX0pFecGXVi1Au2YvUiw+L9apCFfI5NeA4oARA1MEI+sWpcWBR/4GceFi9XopPlCq/8ITOTA==
X-Received: by 2002:a65:67cf:: with SMTP id b15mr10658149pgs.429.1610684025317; 
 Thu, 14 Jan 2021 20:13:45 -0800 (PST)
Received: from localhost ([122.172.85.111])
 by smtp.gmail.com with ESMTPSA id bk18sm2943602pjb.41.2021.01.14.20.13.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Jan 2021 20:13:44 -0800 (PST)
Date: Fri, 15 Jan 2021 09:43:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Robert Richter <rric@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Arnd Bergmann <arnd@arndb.de>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [PATCH 10/18] arch: powerpc: Stop building and using oprofile
Message-ID: <20210115041342.fqmdyply3ivygxgr@vireshk-i7>
References: <cover.1610622251.git.viresh.kumar@linaro.org>
 <fd155a0a1e52650ddc9ec57a1d211fdc777beddb.1610622251.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd155a0a1e52650ddc9ec57a1d211fdc777beddb.1610622251.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
 anmar.oueja@linaro.org, oprofile-list@lists.sf.net,
 Alexander Viro <viro@zeniv.linux.org.uk>, William Cohen <wcohen@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14-01-21, 17:05, Viresh Kumar wrote:
> The "oprofile" user-space tools don't use the kernel OPROFILE support
> any more, and haven't in a long time. User-space has been converted to
> the perf interfaces.
> 
> This commits stops building oprofile for powerpc and removes any
> reference to it from directories in arch/powerpc/ apart from
> arch/powerpc/oprofile, which will be removed in the next commit (this is
> broken into two commits as the size of the commit became very big, ~5k
> lines).
> 
> Note that the member "oprofile_cpu_type" in "struct cpu_spec" isn't
> removed as it was also used by other parts of the code.
> 
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

+ this to fix a warning:

diff --git a/arch/powerpc/platforms/cell/spufs/run.c b/arch/powerpc/platforms/cell/spufs/run.c
index 466006918003..ce52b87496d2 100644
--- a/arch/powerpc/platforms/cell/spufs/run.c
+++ b/arch/powerpc/platforms/cell/spufs/run.c
@@ -353,7 +353,6 @@ static int spu_process_callback(struct spu_context *ctx)
 long spufs_run_spu(struct spu_context *ctx, u32 *npc, u32 *event)
 {
        int ret;
-       struct spu *spu;
        u32 status;
 
        if (mutex_lock_interruptible(&ctx->run_mutex))
@@ -386,7 +385,6 @@ long spufs_run_spu(struct spu_context *ctx, u32 *npc, u32 *event)
                        mutex_lock(&ctx->state_mutex);
                        break;
                }
-               spu = ctx->spu;
                if (unlikely(test_and_clear_bit(SPU_SCHED_NOTIFY_ACTIVE,
                                                &ctx->sched_flags))) {
                        if (!(status & SPU_STATUS_STOPPED_BY_STOP))

-- 
viresh
