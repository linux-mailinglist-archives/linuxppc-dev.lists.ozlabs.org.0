Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4C45A0593
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 03:23:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MClbK1lWTz3bY3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 11:23:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gvVKg2CD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gvVKg2CD;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MClZj06Byz2xGR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 11:22:51 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id e19so17592906pju.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 18:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=4jpjSKYQ5drvwby1kseXiEttV1Bf01U63VDKIWMUEwE=;
        b=gvVKg2CDOAcLH5077A3+YJDyjKAjnz/qbdAE2KfX547BRg5nmRnBTdectp/MOkarPY
         WkJboDY93ZkqWqe7DHT4F1CVlSn346tyCYFjZgoHtKvsfsHxRGL+K2kN3mynB/DVjtzv
         9o+3ToBaiJ/bEglZ5GPS0WfP5PBd61J0pB2bORWjvPtkcWKyLcrCBMO9UZ/xqS9dcTLM
         PaWTg7xYj5Mj/qaeCSAQbpsYGQWikTfaCQC7Gs+9EijcLJ79Xq9h5E6IiYUIew37byty
         t5EBKIxNTx8j5IEi+X2IPBEDmPhlPW1Thd6YnqqNSO0I7ZpH0tc6DFLipkFzcSnVcV8y
         3jEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=4jpjSKYQ5drvwby1kseXiEttV1Bf01U63VDKIWMUEwE=;
        b=DnYTBQ/cLVw1/Oo34hutjaRHSIZ7BB/DRjMMy3zPkUOVuxVEuqHC07RhPLa+d+ZOg2
         duTtiIRODsQeVJCB+f0uIQSfcFVmBMwZ4ujJPgLQZW3VoPrMqPWHC2IhecQIQwNU+rcM
         EOQgyveSYQHsmjmK+OeBxV/Sk8ncAmaa3BFKsa2qNFBfScmJJaG6bUXwow2PRi2LUG5r
         UO//MVtA6PPX6wE0qyd1oiNxKl0WLNaiTNnn6l0Q1xZm4b6WGKx5XhaftWPPQqEW4WRZ
         fyUD/501kFDtg31GeCgVrgdhBZaaxxSBFoAeGkxKBkp7c+rxCP55B9H788UxiaLXCAl0
         JJUA==
X-Gm-Message-State: ACgBeo3XOYhSJ4xNlNX6a426mKM24UbOQaDMH5Lr8p2HkJ7Fl9Ego73p
	P/Ak2ZX4gi12kvEDQ6pmGtg=
X-Google-Smtp-Source: AA6agR4wPwlBCWSaIt11REAWgXVtuDtq5cnfbybo5ytxx4mmzRusDvyAH/fiEJrFbbQjPp/7RCY9Jg==
X-Received: by 2002:a17:90b:2682:b0:1fb:119d:5acf with SMTP id pl2-20020a17090b268200b001fb119d5acfmr11064587pjb.237.1661390568457;
        Wed, 24 Aug 2022 18:22:48 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id w185-20020a6230c2000000b0052ac12e7596sm13597503pfw.114.2022.08.24.18.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 18:22:46 -0700 (PDT)
Message-ID: <c100477ab300d3e017ff1746a0be103e98048c49.camel@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/rtas: Fix RTAS MSR[HV] handling for Cell
From: Jordan Niethe <jniethe5@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 25 Aug 2022 11:22:41 +1000
In-Reply-To: <87bks9luep.fsf@mpe.ellerman.id.au>
References: <20220823115952.1203106-1-mpe@ellerman.id.au>
	 <20220823115952.1203106-2-mpe@ellerman.id.au>
	 <ae28ea837d733d5bdb86c9c2e44c74808fa5ee8b.camel@gmail.com>
	 <87bks9luep.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-7"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Cc: rmclure@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-08-24 at 22:04 +-1000, Michael Ellerman wrote:
+AD4 Jordan Niethe +ADw-jniethe5+AEA-gmail.com+AD4 writes:
+AD4 +AD4 On Tue, 2022-08-23 at 21:59 +-1000, Michael Ellerman wrote:
+AD4 +AD4 +AD4 The semi-recent changes to MSR handling when entering RTAS (firmware)
+AD4 +AD4 +AD4 cause crashes on IBM Cell machines. An example trace:
+AD4 ...
+AD4 +AD4 +AD4 diff --git a/arch/powerpc/kernel/rtas+AF8-entry.S b/arch/powerpc/kernel/rtas+AF8-entry.S
+AD4 +AD4 +AD4 index 9a434d42e660..6ce95ddadbcd 100644
+AD4 +AD4 +AD4 --- a/arch/powerpc/kernel/rtas+AF8-entry.S
+AD4 +AD4 +AD4 +-+-+- b/arch/powerpc/kernel/rtas+AF8-entry.S
+AD4 +AD4 +AD4 +AEAAQA -109,8 +-109,12 +AEAAQA +AF8-GLOBAL(enter+AF8-rtas)
+AD4 +AD4 +AD4  	 +ACo its critical regions (as specified in PAPR+- section 7.2.1). MSR+AFs-S+AF0
+AD4 +AD4 +AD4  	 +ACo is not impacted by RFI+AF8-TO+AF8-KERNEL (only urfid can unset it). So if
+AD4 +AD4 +AD4  	 +ACo MSR+AFs-S+AF0 is set, it will remain when entering RTAS.
+AD4 +AD4 +AD4 +-	 +ACo If we're in HV mode, RTAS must also run in HV mode, so extract MSR+AF8-HV
+AD4 +AD4 +AD4 +-	 +ACo from the saved MSR value and insert into the value RTAS will use.
+AD4 +AD4 +AD4  	 +ACo-/
+AD4 +AD4 
+AD4 +AD4 Interestingly it looks like these are the first uses of these extended
+AD4 +AD4 mnemonics in the kernel?
+AD4 
+AD4 We used to have at least one use I know of in TM code, but it's since
+AD4 been converted to C.
+AD4 
+AD4 +AD4 +AD4 +-	extrdi	r0, r6, 1, 63 - MSR+AF8-HV+AF8-LG
+AD4 +AD4 
+AD4 +AD4 Or in non-mnemonic form...
+AD4 +AD4 rldicl  r0, r6, 64 - MSR+AF8-HV+AF8-LG, 63
+AD4 
+AD4 It's rldicl all the way down.
+AD4 
+AD4 +AD4 +AD4  	LOAD+AF8-REG+AF8-IMMEDIATE(r6, MSR+AF8-ME +AHw MSR+AF8-RI)
+AD4 +AD4 +AD4 +-	insrdi	r6, r0, 1, 63 - MSR+AF8-HV+AF8-LG
+AD4 +AD4 
+AD4 +AD4 Or in non-mnemonic form...
+AD4 +AD4 rldimi	r6, r0, MSR+AF8-HV+AF8-LG, 63 - MSR+AF8-HV+AF8-LG
+AD4 
+AD4 I think the extended mnemonics are slightly more readable than the
+AD4 open-coded versions?

Yeah definitely. I was just noting the plain instruction as I think we
have some existing patterns that may be potential candidates for conversion to the
extended version. Like in exceptions-64s.S

	rldicl. r0, r12, (64-MSR+AF8-TS+AF8-LG), (64-2) 
	to 
	extrdi. r0, r12, 2, 63 - MSR+AF8-TS+AF8-LG - 1

Would it be worth changing these?

+AD4 
+AD4 +AD4 It is ok to use r0 as a scratch register as it is loaded with 0 afterwards anyway.
+AD4 
+AD4 I originally used r7, but r0 is more obviously safe.
+AD4 
+AD4 +AD4 +AD4  	li      r0,0
+AD4 +AD4 +AD4  	mtmsrd  r0,1                    /+ACo disable RI before using SRR0/1 +ACo-/
+AD4 +AD4 
+AD4 +AD4 Reviewed-by: Jordan Niethe +ADw-jniethe5+AEA-gmail.com+AD4
+AD4 
+AD4 Thanks.
+AD4 
+AD4 cheers

