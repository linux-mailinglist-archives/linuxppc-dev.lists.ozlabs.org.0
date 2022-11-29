Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA37863BD39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 10:47:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLyDf4J0Fz30Qy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 20:47:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Yl1gbUuW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Yl1gbUuW;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLyCl46yFz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 20:46:43 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id q71so12490894pgq.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 01:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TXnQj88iIezmg86apNXmmPrNwPIXq2HN1hg2I7yfok=;
        b=Yl1gbUuW2WDAN6PdTk9iBO1XToKZztusEGIsNZ53zwr8myM/ljquO1cKfRLO/TP65+
         M75iVo2W2s4A4zM13nHlTCrMPFwHi7MQdMo0aEXsgrjQund6BrJmU7KxRCVuDSO8iCsz
         BHtjuM4OKveswetix1r8Ie75t4WmBxT54Y6JdxXtlWyueKAAlhYaLzD5i2GlkLfdBkJF
         ZwR3GyteqS4UT7gQPmIcd0HXI43p/LQIKT4xVCtDum7TnYiiCmZa1G0SSi20OsK84EaH
         v5c1JknXWnB+mQN88qdMsAwbu7S8PS95jiEMbL3gPgs9bCZJZPLonEcL9mSwIW7r/wHg
         EnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5TXnQj88iIezmg86apNXmmPrNwPIXq2HN1hg2I7yfok=;
        b=cEqCvSsWn1iGs2VFlNWEfsqsURGggRIrR8P+H/QF3nBold1CKHPYfOAvgyEsrhXTIS
         HE5AS66dxfMVo5G6GR2N2jOD31ShHqOs/PiUXbgBwfvZeyey4+/KvM6ZPtM4eYXWTpN5
         Sk5tbtAOcj0gWlfZnaOAUYspV90ZOHyAS6KzljamIdUqg2uYm9JsQ9rPGcxC6Fcvo4yM
         UMbI3zLlFrkI1OyCgyax/znP9wu8WtQBUJzjpIl/2/ukmAMqYoMw46OkMFoijbwllffA
         lvJQ3VudZjw4cGuGGXYiXuoYisQeep1dbdn2Sj+6AnefNxAzLwBlKgDYXsi8e62D0UXq
         pLyg==
X-Gm-Message-State: ANoB5plgCTRZbN9dT+WK6q10HSMpwSmSN8pmTQZ2m2hMz8EQ53wnKhwY
	oKJ3uk3PKQCcqkfi9q4y1N95rCAVREHw7w==
X-Google-Smtp-Source: AA0mqf79k4zYG0Rxpch+Bks4Y/3oQawzAO/tQKgNOoXK3Y2TATV7wWWVJYIoPvSBxFS12sQFfhse5g==
X-Received: by 2002:a63:1965:0:b0:464:a9a6:5717 with SMTP id 37-20020a631965000000b00464a9a65717mr34037378pgz.584.1669715201071;
        Tue, 29 Nov 2022 01:46:41 -0800 (PST)
Received: from localhost (193-116-112-94.tpgi.com.au. [193.116.112.94])
        by smtp.gmail.com with ESMTPSA id c5-20020a170903234500b001885041d7b8sm3568719plh.293.2022.11.29.01.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 01:46:40 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Nov 2022 19:46:36 +1000
Message-Id: <COOON03KFVYJ.14339DE00OG14@bobo>
Subject: Re: [PATCH v4 3/7] powerpc/64: Sanitise common exit code for
 interrupts
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221129044354.1836018-1-rmclure@linux.ibm.com>
 <20221129044354.1836018-3-rmclure@linux.ibm.com>
In-Reply-To: <20221129044354.1836018-3-rmclure@linux.ibm.com>
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
> Interrupt code is shared between Book3E/S 64-bit systems for interrupt
> handlers. Ensure that exit code correctly restores non-volatile gprs on
> each system when CONFIG_INTERRUPT_SANITIZE_REGISTERS is enabled.
>
> Also introduce macros for clearing/restoring registers on interrupt
> entry for when this configuration option is either disabled or enabled.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> v4: New patch
> ---
>  arch/powerpc/kernel/interrupt_64.S | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/int=
errupt_64.S
> index 978a173eb339..1ef4fdef74fb 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -408,9 +408,11 @@ interrupt_return_\srr\()_user: /* make backtraces ma=
tch the _kernel variant */
>  _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	interrupt_exit_user_prepare
> +#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
>  	cmpdi	r3,0
>  	bne-	.Lrestore_nvgprs_\srr
>  .Lrestore_nvgprs_\srr\()_cont:
> +#endif

Looks pretty good. You might add a comment here to say nvgprs are always
restored, in the sanitize case. Not that it's hard to grep for.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick
