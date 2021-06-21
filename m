Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED23D3AE778
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 12:45:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7mPz5NjKz307J
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 20:45:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=uged.al header.i=@uged.al header.a=rsa-sha256 header.s=google header.b=RFQH5oxZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ugedal.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=odin@ugedal.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=uged.al header.i=@uged.al header.a=rsa-sha256
 header.s=google header.b=RFQH5oxZ; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7lJK5ck4z2yYS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 19:55:13 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id f70so28766774qke.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 02:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uged.al; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B9JDp9HOgPxFOjYO36t2fKrvGXWr9xGcLN7LKHpuyZs=;
 b=RFQH5oxZSZU3HJjB9ZugZzZVrBuZk/jeZyqnqPNqw9QZwYg6+9DxQzu8qWxefvfaFR
 ICnrY0AnYT7V0B0u5FneQ92Xtq1zpKfYijWuDa1cD+bknYtwrjfjlo0sMQWwCfAo4vdP
 sZvU9ISu8v98DyAdiDOQgvKL4PK7AWYACi19f2v2OyOeZziyLbV4tA3Fah3eb2u0Czzb
 pHMyffUwdcOY7vtaObvIPlWRWeSmv2fdaZXtrWIPSYDPLYJibZMhV5z9GHP9NoE1CdJ7
 6cT1CXuL4AHch+FNilt9yQYh2NnSLVEWEm9wjKqjH8gzFi857vvC4EV+sj7SsqT9ujSE
 KYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B9JDp9HOgPxFOjYO36t2fKrvGXWr9xGcLN7LKHpuyZs=;
 b=KIrrrKL5KQzHXffwMldwiznpxIyx+yfhwjzlSpNMgEpXc0RGE0PAhORWG5LBghXds6
 dTRKfaBJ5pOrXdc4YdpPOPNneyniDZ8aBwxMqe5fwG+f1LYxFXoelNv4FMryAqSuPoIP
 KrOARreLUcGH4xAUtAXKBV+TSuiN6demT4HrWnBWsvec+QKAeVFHWl0s6FHzDOCzr0c7
 x1rY+SQq3dTXCoS7R7jRpqWaUXq2+ReHU+pql9VN37L0+cDgnEN7rthZMY5Xebj1qrL7
 nBSoORGu96DQlrM9l03+ch0y4k/Tze4elJwPaNN+uk0WfujEM+64iNxAlkSb4yuHceoD
 YhXg==
X-Gm-Message-State: AOAM533MCh9zJTTuAnZnj/j4N/CeG89SJ+OKopJ6p2KciMYY7j8VgQ0d
 FJmHUXfd9QdMHWf1cZNcXe7RAw+1CIPg2vjmelOdQg==
X-Google-Smtp-Source: ABdhPJz50ZSywsY5Ml3VlgDQjgkgvqH5Bhf8Nt04S7JpxzIj+v3aXYDZi2QEXbLXd8sXKlaWP88HBFUsUtANv4dnkF4=
X-Received: by 2002:a37:8b47:: with SMTP id n68mr21534165qkd.209.1624269309012; 
 Mon, 21 Jun 2021 02:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <9D4A658A-5F77-4C33-904A-126E6052B205@linux.vnet.ibm.com>
 <CAFpoUr3g5t3Z0BtW4-jnYomc3cdY=V5=Zt94-C+fHOjGWa107w@mail.gmail.com>
 <CAKfTPtC=aXasuSNvn+A3152-4xoOTWROhJpZAVq6RLh1Hacpng@mail.gmail.com>
In-Reply-To: <CAKfTPtC=aXasuSNvn+A3152-4xoOTWROhJpZAVq6RLh1Hacpng@mail.gmail.com>
From: Odin Ugedal <odin@uged.al>
Date: Mon, 21 Jun 2021 11:54:29 +0200
Message-ID: <CAFpoUr2o2PVPOx+AvatjjUvqPTyNKE3C6oXejyU3HVMmtCnzvQ@mail.gmail.com>
Subject: Re: [powerpc][5.13.0-rc7] Kernel warning (kernel/sched/fair.c:401)
 while running LTP tests
To: Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 21 Jun 2021 20:44:21 +1000
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
 Peter Zijlstra <peterz@infradead.org>, Odin Ugedal <odin@uged.al>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

man. 21. jun. 2021 kl. 11:50 skrev Vincent Guittot <vincent.guittot@linaro.org>:
> This means that a child's load was not null and it was inserted
> whereas parent's load was null. This should not happen unless the
> propagation failed somewhere

My initial thought is that the patch below will fix it, if that is the
issue (that a leaf is inserted, but the propagation is not "completed"
in unthrottle). Might that be the case? Still working on reproducing
the issue tho.


diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index bfaa6e1f6067..015c5a5c1a4d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4930,12 +4930,7 @@ void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
                if (cfs_rq_throttled(cfs_rq))
                        goto unthrottle_throttle;

-               /*
-                * One parent has been throttled and cfs_rq removed from the
-                * list. Add it back to not break the leaf list.
-                */
-               if (throttled_hierarchy(cfs_rq))
-                       list_add_leaf_cfs_rq(cfs_rq);
+               list_add_leaf_cfs_rq(cfs_rq);
        }

        /* At this point se is NULL and we are at root level*/
