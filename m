Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A87905BD9E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 04:11:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWlQs436Fz3bVB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 12:11:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZJhR60ds;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZJhR60ds;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWlQC22ycz2xjr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 12:10:58 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id o99-20020a17090a0a6c00b002039c4fce53so3825084pjo.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 19:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=OIUQCUoelhqJ528jhYlipmQzbyVMF2Cq15n51JVNzv0=;
        b=ZJhR60dsiu9hq2yO87nbr+2Tc4XVJsQCu4zKFM0sZVcZ4C2+mAWj4m8NHzA2AY7qxa
         l6go0SF6GLSN1sjF4uqghJtdzLbY0MedtmRUiQ2Vs0lEMkDphtLMWHdqNO+p6AUBF6rN
         rEUpz2g5iLxxpyhpgRF0pZQmwramPIRLgLEu4H4CO+wFSoNC00cc8sweogpQ7+1JOt0h
         n8on2sqWqS/0TZDfypfDVzbnk/FuCvs2s5gRSce27jKutK16u75fU9fZoZz62GZOaMVq
         glL2dfAqKHGSP8bE3YtxCmtyCfVjFtbVcS2aYS+jy5lBr4brw74+HP4Aga3be8rAM0zh
         bP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=OIUQCUoelhqJ528jhYlipmQzbyVMF2Cq15n51JVNzv0=;
        b=3icEaK8CHMfljGiKyMubbHLJIqOZ4jR6bbFS9pQT5vjRkL2r2Q2YjFWZakMP8CHwC3
         8L28CX76Er54O/nIs954D0w7L9eGu3+jPzKJFPNkZZd1OhIb7IxynolaBjqdWiPddPjN
         6JzG1R9pFM2fFobvvdejcYLD1vU8G0/+LMqPIHZnl0ysS28A1QK6c+ejn5dXX25I7qog
         N1HNqdJq3S0iZlyjity00XHtOO3YQmCfu7L+lBYX2kx679kkYU1CAmlMWKCHJA08X2SW
         EQr2PafqP6QxclFuYBXfy0+KENIalExid/rx0QAgOZqBTYGkucn9dusnzWxN4H7MTx9C
         GKbQ==
X-Gm-Message-State: ACrzQf2Nx5GCKrIfII1i2oKHcWfM2O4SnI5KRlk1fZlE2lOW9kykI+5+
	2I6hEZ0iUzAyb1A+PP1d8es=
X-Google-Smtp-Source: AMsMyM5eLNp7cTvF1oUFHtDo9rF9kY7xyXGwaR9CaFm9UlOXm8p8Vzu8Dy5gz6++MA5WCHNDNL14gA==
X-Received: by 2002:a17:90a:b00b:b0:203:a6de:5b0f with SMTP id x11-20020a17090ab00b00b00203a6de5b0fmr1288041pjq.134.1663639855053;
        Mon, 19 Sep 2022 19:10:55 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id x2-20020a17090300c200b00177c488fea5sm100483plc.12.2022.09.19.19.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 19:10:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 12:10:49 +1000
Message-Id: <CN0V3W8CZZU1.3K5F733ERJOK0@bobo>
Subject: Re: [PATCH 21/23] powerpc/64: Add INTERRUPT_SANITIZE_REGISTERS
 Kconfig
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-22-rmclure@linux.ibm.com>
In-Reply-To: <20220916053300.786330-22-rmclure@linux.ibm.com>
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

On Fri Sep 16, 2022 at 3:32 PM AEST, Rohan McLure wrote:
> Add Kconfig option for enabling clearing of registers on arrival in an
> interrupt handler. This reduces the speculation influence of registers
> on kernel internals. The option will be consumed by 64-bit systems that
> feature speculation and wish to implement this mitigation.
>
> This patch only introduces the Kconfig option, no actual mitigations.
>
> The primary overhead of this mitigation lies in an increased number of
> registers that must be saved and restored by interrupt handlers on
> Book3S systems. Enable by default on Book3E systems, which prior to
> this patch eagerly save and restore register state, meaning that the
> mitigation when implemented will have minimal overhead.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Thanks for adding this. Maybe I'm being sentimental and we might end
up just simplifying code by always doing it... for now I'm happier to
have the option.

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> V4 -> V5: New patch
> ---
>  arch/powerpc/Kconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index ef6c83e79c9b..a643ebd83349 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -528,6 +528,15 @@ config HOTPLUG_CPU
> =20
>  	  Say N if you are unsure.
> =20
> +config INTERRUPT_SANITIZE_REGISTERS
> +	bool "Clear gprs on interrupt arrival"
> +	depends on PPC64 && ARCH_HAS_SYSCALL_WRAPPER
> +	default PPC_BOOK3E_64
> +	help
> +	  Reduce the influence of user register state on interrupt handlers and
> +	  syscalls through clearing user state from registers before handling
> +	  the exception.
> +
>  config PPC_QUEUED_SPINLOCKS
>  	bool "Queued spinlocks" if EXPERT
>  	depends on SMP
> --=20
> 2.34.1

