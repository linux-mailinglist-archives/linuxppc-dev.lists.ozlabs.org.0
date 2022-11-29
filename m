Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEDC63BDD1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 11:21:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLyzs1CtPz3bWF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 21:21:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IKtnWYVB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IKtnWYVB;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLyyv1Yxmz2xl5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 21:20:37 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id a9so9791584pfr.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 02:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlzH68aAdq2typVQgzv4cKuoeqj0178P8nMpq9iGJtg=;
        b=IKtnWYVBI7MpnhujXCxxnBSLlXcdK7kUOi1aL+kdCPNIJN5uoHuFH9ld2h0D7jYfR5
         NCG5HUSYwAVz80Pb2jyCaOjXrrQpgYK/bzl69OnAuPI+aUsrVQGMkZSKwTkxen8WVW6u
         QaIwSwjv8AzF4zBUvQ7DQRQVDfUfbB+9TkkQ1XJVxePV1T9vvQ9lnpglhnViqIv8sIG9
         EG6yaIhyuFPLwdR3FOPq3Mnh4GbbSC1biAVPu/HQP5pXmkPRaFdVMgv52x/OfI19lF5C
         7evRiE9TQZsjD/seY0wEbjLtjptCvdP12kb+TvCvRpcxatppXjJ9zeLiMDyOM3UZgjRf
         OyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QlzH68aAdq2typVQgzv4cKuoeqj0178P8nMpq9iGJtg=;
        b=WBtYGysD5z9+xXCXx29GneXEio3VrFk6CqZPnE30pkJS0aFm824zQGNkrb4OnFRInr
         lOj/2HtEL7M2wqCzFxU29bOkEyeL4XPrW2jvnxnWJ5Xr5tg8MrGZe8uWxXDFPmsnSf/5
         QlCV2X1aIB003rv0zBZ+c1YTY+9KZd0ga+6DqftH+w//4n0hwHXkmRb9QotVHZznI2yr
         Km0HimG414PvfSWYvdpJj4TO4Pd1TO0X8xBwADh2NFefBzJz4J/34p3xiQyiCwajTBRQ
         3rs6tlcjmyquNFiDhcxBQ5twUTudPkxXlTJmQjbMZUzP5g29ktMgMVKXltSv7T+VqybY
         WDtQ==
X-Gm-Message-State: ANoB5pnKLPmtNGJQjwdNsFWAh6Nd0C8snFwWIGXJVgQEdKZfDaVFjOqC
	pZqffThOYBZ15Tdx+0MqUBLfQdrRa+AOiw==
X-Google-Smtp-Source: AA0mqf5yrySi7gNrdRX2i8P3qSbZbhHrVKYkh/b9/ZO9SQcqRyNSerN1ZJKLb9PxpDeGhJl+gvuiPg==
X-Received: by 2002:a05:6a02:118:b0:477:cce0:49d with SMTP id bg24-20020a056a02011800b00477cce0049dmr22913573pgb.74.1669717234208;
        Tue, 29 Nov 2022 02:20:34 -0800 (PST)
Received: from localhost (193-116-112-94.tpgi.com.au. [193.116.112.94])
        by smtp.gmail.com with ESMTPSA id l4-20020a17090a384400b00212c27abcaesm1021057pjf.17.2022.11.29.02.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 02:20:33 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Nov 2022 20:20:29 +1000
Message-Id: <COOPCXXM1F8D.14MC5S84PB97E@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v4 5/7] powerpc/64s: Zeroise gprs on interrupt routine
 entry on Book3S
X-Mailer: aerc 0.13.0
References: <20221129044354.1836018-1-rmclure@linux.ibm.com>
 <20221129044354.1836018-5-rmclure@linux.ibm.com>
In-Reply-To: <20221129044354.1836018-5-rmclure@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Nov 29, 2022 at 2:43 PM AEST, Rohan McLure wrote:
> Zeroise user state in gprs (assign to zero) to reduce the influence of us=
er
> registers on speculation within kernel syscall handlers. Clears occur
> at the very beginning of the sc and scv 0 interrupt handlers, with
> restores occurring following the execution of the syscall handler.
>
> Zeroise GPRS r0, r2-r11, r14-r31, on entry into the kernel for all
> other interrupt sources. The remaining gprs are overwritten by
> entry macros to interrupt handlers, irrespective of whether or not a
> given handler consumes these register values. If an interrupt does not
> select the IMSR_R12 IOption, zeroise r12.
>
> Prior to this commit, r14-r31 are restored on a per-interrupt basis at
> exit, but now they are always restored on 64bit Book3S. Remove explicit
> REST_NVGPRS invocations on 64-bit Book3S. 32-bit systems do not clear
> user registers on interrupt, and continue to depend on the return value
> of interrupt_exit_user_prepare to determine whether or not to restore
> non-volatiles.
>
> The mmap_bench benchmark in selftests should rapidly invoke pagefaults.
> See ~0.8% performance regression with this mitigation, but this
> indicates the worst-case performance due to heavier-weight interrupt
> handlers. This mitigation is able to be enabled/disabled through
> CONFIG_INTERRUPT_SANITIZE_REGISTERS.
>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> v2: REST_NVGPRS should be conditional on mitigation in scv handler. Fix
> improper multi-line preprocessor macro in interrupt_64.S
> v4: Split off IMSR_R12 definition into its own patch. Move macro
> definitions for register sanitisation into asm/ppc_asm.h
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 27 ++++++++++++++++++---------
>  arch/powerpc/kernel/interrupt_64.S   | 16 ++++++++++++++--
>  2 files changed, 32 insertions(+), 11 deletions(-)
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index 58d72db1d484..8ee3db3b6595 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -506,6 +506,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
>  	std	r10,0(r1)		/* make stack chain pointer	*/
>  	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
>  	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
> +	ZEROIZE_GPR(0)
> =20
>  	/* Mark our [H]SRRs valid for return */
>  	li	r10,1
> @@ -548,8 +549,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	std	r9,GPR11(r1)
>  	std	r10,GPR12(r1)
>  	std	r11,GPR13(r1)
> +	.if !IMSR_R12
> +	ZEROIZE_GPRS(9, 12)
> +	.else
> +	ZEROIZE_GPRS(9, 11)
> +	.endif

These unconditionally zero. Should be SANITIZE_ZEROIZE_GPRS()? Same
for a few more cases.

Hmm. r12 actually contains come-from-MSR here, which isn't really user
controlled. r9-r11 just got loaded with some user GPRs, but they're
the usual scratch registers and get used for other things later.

The whole interrupt entry file could probably use a spring clean, some
re-scheduling, data layout improvements, and more consistent use of
scratch registers... so I'm overly concerned about removing every
possible redundant instruction here if it makes things a bit harder
to follow. But we might be able to get rid of the above zeroize, with
a comment.

> =20
>  	SAVE_NVGPRS(r1)
> +	SANITIZE_ZEROIZE_NVGPRS()
> =20
>  	.if IDAR
>  	.if IISIDE
> @@ -581,8 +588,8 @@ BEGIN_FTR_SECTION
>  END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>  	ld	r10,IAREA+EX_CTR(r13)
>  	std	r10,_CTR(r1)
> -	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
> -	SAVE_GPRS(3, 8, r1)		/* save r3 - r8 in stackframe   */
> +	SAVE_GPRS(2, 8, r1)		/* save r2 - r8 in stackframe   */
> +	ZEROIZE_GPRS(2, 8)
>  	mflr	r9			/* Get LR, later save to stack	*/
>  	LOAD_PACA_TOC()			/* get kernel TOC into r2	*/
>  	std	r9,_LINK(r1)

r2 gets zeroed then used again in LOAD_PACA_TOC too.

Otherwise looks pretty good... Although CTR doesn't get zeroed and I
suppose it could be speculatively used as a source (e.g., bctr). CRs
other than 0 and sometimes 1 too, they're probably a bit less important
than CTR though. We don't use TAR in the kernel so that one should be
okay to leave (maybe with a comment).

That can be done another time, I'd like to see the GPR sanitising
patches go in... It *might* just be a matter of one mtctr in the
case of !RELOCATABLE kernel though to get the ctr...

Still-Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick
