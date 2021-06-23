Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B3A3B19C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 14:19:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G92Pl6ScNz3083
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 22:19:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=uged.al header.i=@uged.al header.a=rsa-sha256 header.s=google header.b=GO2ZF8gT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ugedal.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=odin@ugedal.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=uged.al header.i=@uged.al header.a=rsa-sha256
 header.s=google header.b=GO2ZF8gT; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G92PG22tjz2xv2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 22:18:56 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id c23so4511129qkc.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 05:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uged.al; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qDRcpkPWRJWGf8beIyUh3pmIbeYu5uw6hjZK+7uqw64=;
 b=GO2ZF8gTrGoor6bAQv7Ga4LzmxcMS7s+6dwFOmRjn/lShgRRvcbsAb/8HdF2OTFWks
 vSQMts7V+F0+PkWVCCtoVVfpLv1T2aWaVANdxAm99/ORShdDXAxAfMAhcoKh0OACg3Sk
 XGXxmDvVFUrEZPw/lgdemHfwQXAYkqJ40zVMommj2xVJS9JfTbOeH0P84Ah5NxHb8hyt
 nnZLHI+jZddq/Ku3RYGOxWEGmN0gpPRyXxg9YzQv7aIi56cyABy+ya9YriashxkasD9z
 P649CBR7Pa2OKv1fY755DsuUBOzWvqb2/+tmxgM1hyBqNi62ekva7wpkapxNzszjYtnI
 1hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qDRcpkPWRJWGf8beIyUh3pmIbeYu5uw6hjZK+7uqw64=;
 b=W6EeJGO3o+hkXVIm/rKhMIljd0F33g0Gf9IjYOJMN7Oq6uF6KTGaIkuN8UQe4m9N7K
 u0A1P+ROVSYHLsthoyCq3wGJc44rxpA3y3QR8PPCRE8N+XgVvMP0XjAWJdhJrEYEMvX8
 KNBwiS4tjgvTEIwriGX/gqNu3x6/Z53ihIrMiSgHqI39LnCnlI5vU9r7sx4Mr46NJdhJ
 pktsVywfDS9EdJR+ksmY1ZxyjHokHKj6oZTBPKMuNq80vsuunDAJaVKj5481XNrQiR6V
 6iT6MaCyD3N13Q+d9o6s0x9mqTSbbOmmPsPzfNDDBbj6fZG7ux+A8erAUCAeFuCmqZzS
 lDVw==
X-Gm-Message-State: AOAM533XVIlpZL8kES7sh/8TeKTPdU7MFuNcjjIKD8yUX2KPVu3T16Q4
 a/WiJamuD+o5Z2hX+8WE76EcwETWF2IR0RiSqY6R+Q==
X-Google-Smtp-Source: ABdhPJxev0KnShuL3Rs3lB+8v7NabmTZw1GN9AeY4AQxWHCqkTXXbcc7ylQC6fHYGg/5sAmykunyyjZeP5g1gb2dZSM=
X-Received: by 2002:a37:b3c5:: with SMTP id
 c188mr10078431qkf.242.1624450732991; 
 Wed, 23 Jun 2021 05:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book>
 <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
 <20210623071935.GA29143@vingu-book>
 <CCB4222F-000A-44E8-8D61-F69893704688@linux.vnet.ibm.com>
 <6C676AB3-5D06-471A-8715-60AABEBBE392@linux.vnet.ibm.com>
 <20210623120835.GB29143@vingu-book>
In-Reply-To: <20210623120835.GB29143@vingu-book>
From: Odin Ugedal <odin@uged.al>
Date: Wed, 23 Jun 2021 14:18:16 +0200
Message-ID: <CAFpoUr01xb9ZJF9mb2nmZDpUHXFH3VSbY3AU8-1owV-_7wVTPg@mail.gmail.com>
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
To: Vincent Guittot <vincent.guittot@linaro.org>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Odin Ugedal <odin@uged.al>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Wouldn't the attached diff below also help when load is removed,
Vincent? Isn't there a theoretical chance that x_sum ends up at zero
while x_load ends up as a positive value (without this patch)? Can
post as a separate patch if it works for Sachin.


diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index bfaa6e1f6067..def48bc2e90b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3688,15 +3688,15 @@ update_cfs_rq_load_avg(u64 now, struct cfs_rq *cfs_rq)

                r = removed_load;
                sub_positive(&sa->load_avg, r);
-               sub_positive(&sa->load_sum, r * divider);
+               sa->load_sum = sa->load_avg * divider;

                r = removed_util;
                sub_positive(&sa->util_avg, r);
-               sub_positive(&sa->util_sum, r * divider);
+               sa->util_sum = sa->util_avg * divider;

                r = removed_runnable;
                sub_positive(&sa->runnable_avg, r);
-               sub_positive(&sa->runnable_sum, r * divider);
+               sa->runnable_sum = sa->runnable_avg * divider;

                /*
                 * removed_runnable is the unweighted version of
removed_load so we
