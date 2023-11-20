Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2347F1DED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 21:20:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=drfkBeZ7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYzQJ12cTz3dK1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 07:20:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=drfkBeZ7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYgB82rdzz2yMJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 19:08:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D3856B80957;
	Mon, 20 Nov 2023 08:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A1BC433C7;
	Mon, 20 Nov 2023 08:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700467709;
	bh=QMNsDP0c3wU0R8MGCChHFJcFNN26tGc7u8Q3eKjWako=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=drfkBeZ7knrJUUq+sDJcQCtTekQKqH0TgRnowvH+Ku96T8RpAr+xUWgKM6gzdlYUD
	 ZPJSVmXi+9LkVwzlD2QarajyQ2x12WaoHLOpz2Uw+Zg4uq8BPnbr6QTllroN+d101+
	 bYe9algddwme/e5/ZHJFdufT6d5+xTOG4Z+sELFJ5nWWi2wWsrXcHy74IaRxoIlkiM
	 MUTcfsx5oCckRp41bLQe2CbFBsJnK6ysrpvYtgjDmp/zKFzm3XgP9zmYmFt8fmUWx+
	 Eezn4jp4iUnejB/IRWMgyvdnhuk6+1MBuB+JnJGjGpCFy8lGTJl9L1qilqq8YQQTOQ
	 T5RZ71iHTKerg==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 03/13] powerpc/rtas: Add function return status
 constants
In-Reply-To: <20231117-papr-sys_rtas-vs-lockdown-v4-3-b794d8cb8502@linux.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-3-b794d8cb8502@linux.ibm.com>
Date: Mon, 20 Nov 2023 13:38:21 +0530
Message-ID: <87fs10ludm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 21 Nov 2023 07:17:50 +1100
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
writes:

> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> Not all of the generic RTAS function statuses specified in PAPR have
> symbolic constants and descriptions in rtas.h. Fix this, providing a
> little more background, slightly updating the existing wording, and
> improving the formatting.
>

Reviewed-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>

> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/rtas.h | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index c697c3c74694..b73010583a8d 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -201,12 +201,25 @@ typedef struct {
>  /* Memory set aside for sys_rtas to use with calls that need a work area. */
>  #define RTAS_USER_REGION_SIZE (64 * 1024)
>  
> -/* RTAS return status codes */
> -#define RTAS_HARDWARE_ERROR	-1    /* Hardware Error */
> -#define RTAS_BUSY		-2    /* RTAS Busy */
> -#define RTAS_INVALID_PARAMETER	-3    /* Invalid indicator/domain/sensor etc. */
> -#define RTAS_EXTENDED_DELAY_MIN	9900
> -#define RTAS_EXTENDED_DELAY_MAX	9905
> +/*
> + * Common RTAS function return values, derived from the table "RTAS
> + * Status Word Values" in PAPR+ 7.2.8: "Return Codes". If a function
> + * can return a value in this table then generally it has the meaning
> + * listed here. More extended commentary in the documentation for
> + * rtas_call().
> + *
> + * RTAS functions may use negative and positive numbers not in this
> + * set for function-specific error and success conditions,
> + * respectively.
> + */
> +#define RTAS_SUCCESS                     0 /* Success. */
> +#define RTAS_HARDWARE_ERROR             -1 /* Hardware or other unspecified error. */
> +#define RTAS_BUSY                       -2 /* Retry immediately. */
> +#define RTAS_INVALID_PARAMETER          -3 /* Invalid indicator/domain/sensor etc. */
> +#define RTAS_UNEXPECTED_STATE_CHANGE    -7 /* Seems limited to EEH and slot reset. */
> +#define RTAS_EXTENDED_DELAY_MIN       9900 /* Retry after delaying for ~1ms. */
> +#define RTAS_EXTENDED_DELAY_MAX       9905 /* Retry after delaying for ~100s. */
> +#define RTAS_ML_ISOLATION_ERROR      -9000 /* Multi-level isolation error. */
>  
>  /* statuses specific to ibm,suspend-me */
>  #define RTAS_SUSPEND_ABORTED     9000 /* Suspension aborted */
>
> -- 
> 2.41.0
