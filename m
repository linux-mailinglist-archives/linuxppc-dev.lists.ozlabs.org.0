Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B76CA365335
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 09:23:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZsm510Pz301s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 17:23:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fossix-org.20150623.gappssmtp.com header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=dEr5M99l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=dEr5M99l; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZsL29jMz2xZt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 17:23:01 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id nk8so6194078pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 00:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=uCuS/cB4YZiJlCq7ud3/A4RuS13zTWOK52tEKreg/fI=;
 b=dEr5M99lbGaSE9G5XBYJs6N+ViDRVsTEh8fwUynKbW2Jy1VhlAe/B2LZdRw72JrZK7
 +8DI4hUanKOC7haCtEY5zwZhwIZONaZ3zvTXmWa8wANprEls91RT3hxl8SidmwEWai95
 6vEDUBh/PVGU80qaZooBeTlGW52JwSbzOJaI3lGWLeh5wW+PnEHiMREy4kKUjiGuUlJ7
 KCc67DDTT6j7A55d1OEnDD1jQHGK6ubZ+oQb6Z+aDXIVFsF6i9cJM/T/05zvJBYw65sl
 S4R8WfYwE5/Gz4z1DMNkC0lawHnuDuUYH00uwGcd4aqla01JojKnAvAfoWj5GjoZ9kpg
 x+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=uCuS/cB4YZiJlCq7ud3/A4RuS13zTWOK52tEKreg/fI=;
 b=tsZG2pszeB+QjZCWrjp2lzKqqKO/3MKpbhOkQelJTEXcYRQ8qWWSaRU3v5zCBQJv/r
 OYi/FdYdPUvU8MSdYtc5G1reI66VP7ylwLImBSYq/BQVM6zsLay7xMJMLuA384k8Y3Jo
 XYKn8cUWy8ToDt9xtV6Ang70H7deAtuv60baM6RDAB6B7kN8XK4PjGGeHllCzurMsCza
 6QmvLv7EJtQ0whqpSHrWRVvPEerdD1IRehj+BjuSHSs231Pc6E5BimG8HTFGjM5dAZvz
 1DV8tsHivthsBok1v4bSVcT63eWufhTVg0mQN+q5Nk3MiIEDtQ/+FJNQz+YVUFpfUKkU
 Di8g==
X-Gm-Message-State: AOAM531xct8dFdXy1ZcRiwqXUf4DEbD7KDjQmdLSy6pr+tZxXU9Zdo/S
 5J/G1X7sViVd5HQDbD3l8VVRlQ==
X-Google-Smtp-Source: ABdhPJxjKpxF+IBrp2fLed/h1EfiR/iguCib9COfdVek/gTYFiS4kxdlI4gIi1oh+NJujcshTKBkrg==
X-Received: by 2002:a17:903:20ca:b029:eb:6c72:fdbb with SMTP id
 i10-20020a17090320cab02900eb6c72fdbbmr28098732plb.18.1618903379773; 
 Tue, 20 Apr 2021 00:22:59 -0700 (PDT)
Received: from localhost ([103.21.79.4])
 by smtp.gmail.com with ESMTPSA id w6sm1261548pfj.85.2021.04.20.00.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 00:22:59 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc/mce: save ignore_event flag unconditionally for UE
In-Reply-To: <20210407045816.352276-1-ganeshgr@linux.ibm.com>
References: <20210407045816.352276-1-ganeshgr@linux.ibm.com>
Date: Tue, 20 Apr 2021 12:52:55 +0530
Message-ID: <87eef5zagg.fsf@fossix.org>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Ganesh,

Ganesh Goudar <ganeshgr@linux.ibm.com> writes:

> When we hit an UE while using machine check safe copy routines,
> ignore_event flag is set and the event is ignored by mce handler,
> And the flag is also saved for defered handling and printing of
> mce event information, But as of now saving of this flag is done
> on checking if the effective address is provided or physical address
> is calculated, which is not right.
>
> Save ignore_event flag regardless of whether the effective address is
> provided or physical address is calculated.
>
> Without this change following log is seen, when the event is to be
> ignored.
>
> [  512.971365] MCE: CPU1: machine check (Severe)  UE Load/Store [Recovered]
> [  512.971509] MCE: CPU1: NIP: [c0000000000b67c0] memcpy+0x40/0x90
> [  512.971655] MCE: CPU1: Initiator CPU
> [  512.971739] MCE: CPU1: Unknown
> [  512.972209] MCE: CPU1: machine check (Severe)  UE Load/Store [Recovered]
> [  512.972334] MCE: CPU1: NIP: [c0000000000b6808] memcpy+0x88/0x90
> [  512.972456] MCE: CPU1: Initiator CPU
> [  512.972534] MCE: CPU1: Unknown
>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
>  arch/powerpc/kernel/mce.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index 11f0cae086ed..db9363e131ce 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -131,6 +131,8 @@ void save_mce_event(struct pt_regs *regs, long handled,
>  	 * Populate the mce error_type and type-specific error_type.
>  	 */
>  	mce_set_error_info(mce, mce_err);
> +	if (mce->error_type == MCE_ERROR_TYPE_UE)
> +		mce->u.ue_error.ignore_event = mce_err->ignore_event;
>  
>  	if (!addr)
>  		return;
> @@ -159,7 +161,6 @@ void save_mce_event(struct pt_regs *regs, long handled,
>  		if (phys_addr != ULONG_MAX) {
>  			mce->u.ue_error.physical_address_provided = true;
>  			mce->u.ue_error.physical_address = phys_addr;
> -			mce->u.ue_error.ignore_event = mce_err->ignore_event;
>  			machine_check_ue_event(mce);
>  		}
>  	}

Small nit:
Setting ignore event can happen before the phys_addr check, under the existing
check for MCE_ERROR_TYPE_UE, instead of repeating the same condition again.

Except for the above nit



Thanks,
Santosh
> -- 
> 2.26.2
