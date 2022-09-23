Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D18E5E7532
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 09:51:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYkqJ54B7z3cfl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:51:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HmuuJ5pA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HmuuJ5pA;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYkpj6ThHz3c6m
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 17:50:36 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id b5so3358484pgb.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 00:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=FpT5bn5o7JVE5D2Az92PqCRK6kYn0QSWYWWOin2qKSI=;
        b=HmuuJ5pAKG3oUzDhd+1Uvh6e3PEH+X4FLPxhJqfl7sYqPLQ3q/2PBpfM9k0HeU7sKx
         LPILu981bmFdIGAZHlUt+L/GZyltJeyQlYxsoArGG5dhQqfI4cuk4Oc5pFqrBIgIX7K+
         S4qGDUQUbA3tZeYIWNzEKN55N5wV4mXV9ghpzB00ZfZFD4WiTK6SjDHDh30oZxuKOvz1
         6HUv7aHIU1tw4EpbRieCpAh75JeHHVadmcx17W/PmUN6CCEFSQrt1o+IUlaOZWzV6P5t
         AAaaXcrsyB7v45X3zCTp6jWkvq0BMdFOa/tkRi6MpbCSkwomF5ATSPfN/oxXSKN399pi
         gdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=FpT5bn5o7JVE5D2Az92PqCRK6kYn0QSWYWWOin2qKSI=;
        b=XQKpkFC0gGfLLdgqQGYteodi9Du9dYPgli7SQvJOcRhf3l4QlJnUGOiCq5lyic+Ssa
         mGg0bRjmosORM29WLRJ6W0OTytu+y9eQPpD42OxBMdBlSsIXV3Kx4lsW4/DUTZUyOttH
         8Bhoa4wTWkTQE12/4JQRVVF4BPcHxay3FlbeOec3YFcK1KCn+e78Pq4917YJi0/8cvUR
         VK7G8YVssENPMuDKQIxVKLkb8RBiz47ydbEl00YWEKeIUYuZSvMlXVgn7/ieSjQrMnIl
         yTk7AABmb64SqIic9seHhh5MlOWFo4DS7qdlzdKe+BW1VIWzd2VTiCp4t+JR6mc5/LGj
         6oSg==
X-Gm-Message-State: ACrzQf2wlzSKJMQs+UI4W3k0CHpRm856ZoQgTre3PdWuGulfVD2j9BpB
	sQ9ou1XGMvlmO7y0gNwX2KyqKNFgA5M=
X-Google-Smtp-Source: AMsMyM5DdEeqBAhnl6njt8Cm6ydbDSi88Mu2bmrj8DrNCY2wLYCdc/CugQ9mNHPmKdwrYlckxFWWTQ==
X-Received: by 2002:a63:4d5:0:b0:43c:4724:184f with SMTP id 204-20020a6304d5000000b0043c4724184fmr1731768pge.9.1663919434185;
        Fri, 23 Sep 2022 00:50:34 -0700 (PDT)
Received: from localhost (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902ea0800b00179b6d0f90esm2758830plg.159.2022.09.23.00.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 00:50:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Sep 2022 17:50:29 +1000
Message-Id: <CN3M7LAXFI0O.J739TZ6ZPHN0@bobo>
Subject: Re: [PATCH v6 21/25] powerpc: Provide syscall wrapper
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
 <20220921065605.1051927-22-rmclure@linux.ibm.com>
In-Reply-To: <20220921065605.1051927-22-rmclure@linux.ibm.com>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Sep 21, 2022 at 4:56 PM AEST, Rohan McLure wrote:
> Implement syscall wrapper as per s390, x86, arm64. When enabled
> cause handlers to accept parameters from a stack frame rather than
> from user scratch register state. This allows for user registers to be
> safely cleared in order to reduce caller influence on speculation
> within syscall routine. The wrapper is a macro that emits syscall
> handler symbols that call into the target handler, obtaining its
> parameters from a struct pt_regs on the stack.
>
> As registers are already saved to the stack prior to calling
> system_call_exception, it appears that this function is executed more
> efficiently with the new stack-pointer convention than with parameters
> passed by registers, avoiding the allocation of a stack frame for this
> method. On a 32-bit system, we see >20% performance increases on the
> null_syscall microbenchmark, and on a Power 8 the performance gains
> amortise the cost of clearing and restoring registers which is
> implemented at the end of this series, seeing final result of ~5.6%
> performance improvement on null_syscall.
>
> Syscalls are wrapped in this fashion on all platforms except for the
> Cell processor as this commit does not provide SPU support. This can be
> quickly fixed in a successive patch, but requires spu_sys_callback to
> allocate a pt_regs structure to satisfy the wrapped calling convention.
>
> Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V2: Generate prototypes for symbols produced by the wrapper.
> V3: Rebased to remove conflict with 1547db7d1f44
> ("powerpc: Move system_call_exception() to syscall.c"). Also remove copy
> from gpr3 save slot on stackframe to orig_r3's slot. Fix whitespace with
> preprocessor defines in system_call_exception.
> V5: Move systbl.c syscall wrapper support to this patch. Swap
> calling convention for system_call_exception to be (&regs, r0)
> V6: Change calling convention for system_call_exception in another
> patch.
> ---

Nice. Looks very clean.

> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
> index fcca06d200d3..e1f36fd61db3 100644
> --- a/arch/powerpc/kernel/vdso.c
> +++ b/arch/powerpc/kernel/vdso.c
> @@ -39,6 +39,8 @@
>  extern char vdso32_start, vdso32_end;
>  extern char vdso64_start, vdso64_end;
> =20
> +long sys_ni_syscall(void);
> +
>  /*
>   * The vdso data page (aka. systemcfg for old ppc64 fans) is here.
>   * Once the early boot kernel code no longer needs to muck around

What's this doing? Why can't it continue using the declaration in
syscalls.h?

Aside from that and the stray hunk to go in the previous patch,

Reviewed-by: Nicholas Piggin <npiggin@gmai.com>

Thanks,
Nick
