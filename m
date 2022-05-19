Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CF152C93C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 03:30:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3XP60nnVz3cJ2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 11:30:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j3bNQK/0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=amodra@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=j3bNQK/0; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3XNP6tBhz3bpR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 11:30:13 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 nk9-20020a17090b194900b001df2fcdc165so7381593pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 18:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ppQkdN3U3kYlVxMV5Z9jXIZ8+Vg0fdo5GtuLao/EQYo=;
 b=j3bNQK/0zS3hA2VcozHusb4jvoBqPS4vq1yRQ8vrnlFPnBDdJMUVDir2OKIkN6jRI1
 X15tVMft0nmInyzz1PiwM+sjfggKtF82q3s8nLHbKVOUAKzoWc8CtpzoBQsPSbgrUUmZ
 136nFNGXg+c/EK/XOopFQlWXJsOcR0TiMZzJ6KJobLOPuylfpB0X8VFSmEH5pxg9tOyn
 hsOU5McJAom1Kjc2H3Yb9n41FneHyOjdBts3kpa358vE+4CNOLsva4y0kFeq9MTD0E6N
 kZnLfIt0qKiwmDzEAwx4c4BED72KsxOEvc5fYHJClZ17Kp/pZwKBeHNRlTE2t0X8yPei
 iU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ppQkdN3U3kYlVxMV5Z9jXIZ8+Vg0fdo5GtuLao/EQYo=;
 b=NSDkoBmC3L2otXA3HWWMMSObfJyRS9uucpzy+CLk56aGGQKMUcJ2UnYFFWCRCys9Cn
 9+ykrm8PNefgd5m+nfgKBexfLR/TXlWmBvpKfdJRsXhM7soUm8KMi97jGopgm3rPcMcx
 GaQxDCRBD43SxMp6YVOm8s3uCBOPreXW2kkNhuASrSZmoCbHE+UtSVeX/TY/380AjTyL
 Ur/GZVGqUGlpV+1LI+RJufGeQteIM7rQ6eQQnShF53cMktKSOKJrpuYx+vScAZ0wCBOW
 VuSewxeKJdJohOTMsZH5P8nyaEQ/hSnsVpNQQGwOZdvM4KTGEXA/AmGGbGR7O5Y1uxqH
 UYnA==
X-Gm-Message-State: AOAM533dkYdgLl8zsd6zwh7QrjXnW36WpPV/R1QcWgS6Nth9pqyXiF3v
 d85bkCGxQvZLLf40jzna7ns=
X-Google-Smtp-Source: ABdhPJzHWBUDheBY0VRGgTkerfy/yu4Xv1QMTa0+i0a3eOA3C9cxNCy6qQGPXhtMuVxEyP7b/7lZfw==
X-Received: by 2002:a17:90b:33c6:b0:1dc:ba92:41bb with SMTP id
 lk6-20020a17090b33c600b001dcba9241bbmr2419489pjb.26.1652923808842; 
 Wed, 18 May 2022 18:30:08 -0700 (PDT)
Received: from squeak.grove.modra.org (158.106.96.58.static.exetel.com.au.
 [58.96.106.158]) by smtp.gmail.com with ESMTPSA id
 s14-20020a17090302ce00b0015eb200cc00sm2270091plk.138.2022.05.18.18.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 18:30:07 -0700 (PDT)
Received: by squeak.grove.modra.org (Postfix, from userid 1000)
 id EDFDF1140152; Thu, 19 May 2022 11:00:04 +0930 (ACST)
Date: Thu, 19 May 2022 11:00:04 +0930
From: Alan Modra <amodra@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/vdso: Fix incorrect CFI in gettimeofday.S
Message-ID: <YoWdnBdDhd8gk1hV@squeak.grove.modra.org>
References: <20220502125010.1319370-1-mpe@ellerman.id.au>
 <1652772528.r6qrwbbda5.naveen@linux.ibm.com>
 <877d6kpcfq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877d6kpcfq.fsf@mpe.ellerman.id.au>
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 17, 2022 at 10:32:09PM +1000, Michael Ellerman wrote:
> "Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
> > Michael Ellerman wrote:
> >>
> >> diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/vdso/gettimeofday.S
> >> index eb9c81e1c218..0aee255e9cbb 100644
> >> --- a/arch/powerpc/kernel/vdso/gettimeofday.S
> >> +++ b/arch/powerpc/kernel/vdso/gettimeofday.S
> >> @@ -22,12 +22,15 @@
> >>  .macro cvdso_call funct call_time=0
> >>    .cfi_startproc
> >>  	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> >> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
> >>  	mflr		r0
> >> -  .cfi_register lr, r0
> >>  	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> >> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
> >>  	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> >
> > <snip>
> >
> >> @@ -46,6 +50,7 @@
> >>  	mtlr		r0
> >>    .cfi_restore lr
> >>  	addi		r1, r1, 2 * PPC_MIN_STKFRM
> >> +  .cfi_def_cfa_offset 0
> >
> > Should this be .cfi_adjust_cfa_offset, given that we used that at the
> > start of the function?
>  
> AIUI "adjust x" is offset += x, whereas "def x" is offset = x.

Yes.

> So we could use adjust here, but we'd need to adjust by -(2 * PPC_MIN_STKFRM).

Yes.

> It seemed clearer to just set the offset back to 0, which is what it is
> at the start of the function.

Yes.  In detail, both .cfi_def_cfa_offset and .cfi_adjust_cfa_offset
are interpreteted by the assembler into DW_CFA_def_cfa_offset byte
codes, so you should get the same .eh_frame contents if using Naveen's
suggestion.  It boils down to style really, and the most common style
is to use ".cfi_def_cfa_offset 0" here.

-- 
Alan Modra
Australia Development Lab, IBM
