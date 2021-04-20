Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 687E4365337
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 09:24:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZvK33kXz30Bk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 17:24:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fossix-org.20150623.gappssmtp.com header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=Cr3apiOe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Cr3apiOe; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZtw3zj6z2xZt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 17:24:24 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 u14-20020a17090a1f0eb029014e38011b09so15120151pja.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 00:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:reviewed-by:date
 :message-id:mime-version;
 bh=O1OrhR38q4N2avuzNsnSKvEpxjKEnimSEKoMMTI3jEY=;
 b=Cr3apiOezxEVepCDhOQQyT15ul3v/Xx3qyN1c0k1SMc/c8HIEnxndMfoQO5lRiKhjV
 RV477qN4G3Th2fBac+o5mTKOJ+VRczoKz12w10XlyBJu10Cxezy2R3hvl77vRzJx8yyj
 Fqqf+AtEcZggHhFYhmhqgZuNVQZ0Fx58E0xwnNsBLe77r/Cdhmst+Chn22Gz4scW00Mz
 AzThL9JWA2u24BUEX84s0O2xjO1Ap984Kn2MXzIEHgYqMq1jfk/ThGJXKg92EVjHPQIJ
 fa27HGG150roXf9pGANY2CLxr5NBjChVYYBV0C1Pivcw1WXXyvsYAdDpeB8GU5+Gs8qa
 dApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :reviewed-by:date:message-id:mime-version;
 bh=O1OrhR38q4N2avuzNsnSKvEpxjKEnimSEKoMMTI3jEY=;
 b=iy+34Y1yEvpplXDicqcqZhp9hnIPDpRuPsLp7zBkqgyGcPbG1/j5PMNqchS5H6IUYz
 bOzHKMFrup+6qfvwnjqdH6H0mUJPg/eJcW4IJv9Sx1z77XBItdm2AWGQJyv30PNk+fuW
 0CxpH+f/v9bjcaXojwdvvimbji4lusyatql8takBWQnRUxtOmyRoc4xpCf7685S5RAYX
 +v/k/vQD/yWyG2xrh82ZVIYhm6eU9YELVQ7DEXb9YIQtHPUiQpX5VlicfkVuqy7VbHoM
 PoSa9i/i8b+0ZLyX1A8VL0hTPzF7mIRh+Wsgt1tZwjrWicWfULk5ntSMfunEUQqfenPD
 MH8g==
X-Gm-Message-State: AOAM532N6INy7UCVfm2zU36RUmlHcww/DzxCKd9ZXBCxHC2pJ3DetUnU
 mtk5PlaNmMxSPhkBif5dpW9+YA==
X-Google-Smtp-Source: ABdhPJx+QT1ziDSztABYFkJSAA17XStiINosL6qdHFnLWZM8oEJcEJ1DF1jP+tyUfJ+u35LBeNIQCA==
X-Received: by 2002:a17:90b:249:: with SMTP id
 fz9mr3338742pjb.167.1618903461120; 
 Tue, 20 Apr 2021 00:24:21 -0700 (PDT)
Received: from localhost ([103.21.79.4])
 by smtp.gmail.com with ESMTPSA id 14sm14233546pfl.1.2021.04.20.00.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 00:24:20 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc/mce: save ignore_event flag unconditionally for UE
In-Reply-To: <20210407045816.352276-1-ganeshgr@linux.ibm.com>
References: <20210407045816.352276-1-ganeshgr@linux.ibm.com>
Reviewed-by: Santosh Sivaraj <santosh@fossix.org>
Date: Tue, 20 Apr 2021 12:54:16 +0530
Message-ID: <87bla9zae7.fsf@fossix.org>
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

Reviewed-by: Santosh Sivaraj <santosh@fossix.org>

Thanks,
Santosh
> -- 
> 2.26.2
