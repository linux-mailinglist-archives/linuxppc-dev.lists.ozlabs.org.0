Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 031EB35FD54
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 23:33:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLG1B6Bjtz3byW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 07:33:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=0tr5XttJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::52d;
 helo=mail-ed1-x52d.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=0tr5XttJ; dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLG0m2zgvz2yxb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 07:32:55 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id w23so25462106edx.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 14:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9+EL53n0yuorpfM8ie1VXCwkfxK+pJPw69S7mTIt8DE=;
 b=0tr5XttJwbvea5EmEXKETAgihhgArhValkDY6QV52Pgie1fo8twOPe56FbMI5H9QUp
 ZkL2JpeyHdxVyvBu10a3ikiauCGmNxyBmo1qx8fY879eH4giNDCFrdUi+KxI1qcREw9m
 zNtext8+fcYXOvqY/Mtq/zET9XWIrHLB9FRqBVYnHzaOpN5h1g85xPRZ+RfbjdBhvQ3M
 aZy+ZL0NmvyHYkZMn+FQDCQQbuLXBjQHNphYtIo1ibtKLuTGM5L75QdnBYt2iWtiCIbq
 uChl4ul+z4qvQnMxGGYPMdPcZXz5jQtVQg1SmMBLWm4TTaBXmRGL4LSWCUV87y7oPAdS
 7gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9+EL53n0yuorpfM8ie1VXCwkfxK+pJPw69S7mTIt8DE=;
 b=VKKHcXLOpqEmEjOBDm2nNIRj3CxPmZlVZaBs6qKz0b4yLmsvbBY1L8CWpXr7DGJplf
 OcwWvqrdkcUA6hJ8XuZ532m836s14yGY2hjOCNoONWlitUWYhG8wvb9WKAo2F1B8LUgF
 y1HdU+0xwRPmEadDLtHQrl2sbUIQ0ejaeFL4KV67T94RKRpxR0pwjaGENYIl87ngYGBJ
 b9Sv5Szg+vAwoiL8MlvUCK1jm7MiGLnLnNw6AOyk/XJrxR1ObsJV+032kUz8WalWV+xY
 zWVzhiwu2pT6bF0efVpuLHxZKYD/SZWWLpRh/megFD6PgN81VsI2fIFv3gQLgsMFXBdK
 JqSA==
X-Gm-Message-State: AOAM532wRJ1bHUqM/an3QQO+H6khfRe4pirl4ouwddihFaVCH4sgcwcw
 TF091FQN6euRS3Y0/rTdcOkr5ESnPV8q5CIbLy3gbaujKxY=
X-Google-Smtp-Source: ABdhPJx2m8GLYdi4bgKhHMXOir3vZoU1jwxM4yQbbNjzw7AislrWHIKadhfbXeg9srvTbLQFSv4rr7zEZV+rj12WwME=
X-Received: by 2002:aa7:cd7b:: with SMTP id ca27mr298423edb.354.1618435971843; 
 Wed, 14 Apr 2021 14:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210414124026.332472-1-vaibhav@linux.ibm.com>
In-Reply-To: <20210414124026.332472-1-vaibhav@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 14 Apr 2021 14:32:40 -0700
Message-ID: <CAPcyv4iU3cmjRsDevDJmJc72xo-QffUu3SGCwvRh5bitG-facw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/papr_scm: Reduce error severity if nvdimm stats
 inaccessible
To: Vaibhav Jain <vaibhav@linux.ibm.com>
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Ira Weiny <ira.weiny@intel.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 14, 2021 at 5:40 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>
> Currently drc_pmem_qeury_stats() generates a dev_err in case
> "Enable Performance Information Collection" feature is disabled from
> HMC. The error is of the form below:
>
> papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Failed to query
>          performance stats, Err:-10
>
> This error message confuses users as it implies a possible problem
> with the nvdimm even though its due to a disabled feature.
>
> So we fix this by explicitly handling the H_AUTHORITY error from the
> H_SCM_PERFORMANCE_STATS hcall and generating a warning instead of an
> error, saying that "Performance stats in-accessible".
>
> Fixes: 2d02bf835e57('powerpc/papr_scm: Fetch nvdimm performance stats from PHYP')
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 835163f54244..9216424f8be3 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -277,6 +277,9 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
>                 dev_err(&p->pdev->dev,
>                         "Unknown performance stats, Err:0x%016lX\n", ret[0]);
>                 return -ENOENT;
> +       } else if (rc == H_AUTHORITY) {
> +               dev_warn(&p->pdev->dev, "Performance stats in-accessible");
> +               return -EPERM;

So userspace can spam the kernel log? Why is kernel log message needed
at all? EPERM told the caller what happened.
