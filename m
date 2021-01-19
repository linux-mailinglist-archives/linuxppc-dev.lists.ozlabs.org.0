Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EE72FAF43
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 04:59:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKZfp5dj2zDqxZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 14:59:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vI7IiA3J; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKZdC5QMQzDqyl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 14:58:23 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id p18so12177846pgm.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 19:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=APfSjC8lha7M2bwxfE1k9EduMMXfuaY2NfyE3k5SdcU=;
 b=vI7IiA3Jmfv14hLka8UwPlAEGRd+ah/GTg5h2SyqyEX7drCEbmxbTWlXOXbO1Gt/R/
 wJb+Xqw6OT43TtjLP/366scamxUqfNQ0BBF5Q0H3rk31UEkcKtfYFRKb+gg5JCwHENZS
 zyu2kUopCV3P8tynpV6XrE1LL/y6InlpnAHYvbU6lUirslNHfZt6gNN9tjtrikHofr55
 HJLi4fEJBKxLkHKx9GfiO+feVP7Y67PpoknUOQCNiabE5rAn03AkiqQ7wplfv6U2Ey9b
 DNHylVgupYTV+k+JWUM1xbzDCVjuvSe1/GGPqwewvsY8pQ8vq6CoVJ+CLEMAmQYv9A2B
 GXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=APfSjC8lha7M2bwxfE1k9EduMMXfuaY2NfyE3k5SdcU=;
 b=SGiN/O6IjkLCCAlvmGV5l7etfZP12VIQ4cOEwvSaWgYSIfcBG65DtZHSLuYO1bEE4F
 dEqelHvwOe/fGONb4aCFxtS9eag6XsdckN7NL5KiA9lhjR5Z3bkOGP9da20utd3OPazL
 qKpCcb6trs8JSe2vNT9wrO5UPpDQnLCTnM/+8DbMqpGG6Pb96osSc3tGmg/E+i8owOww
 IO0B9gp9KHpUSvvtGsbGbWtYGt865pUSVEZo6xVUqZDTkXEbGtbE7N7I5t0vmDhz9fLJ
 wQ5xs6pUkX+HqndXrsp92v6tOpjFGcNMOIES6xUXfeVzjOhNf6Nzd+xrIlFk667wQXHl
 CoCQ==
X-Gm-Message-State: AOAM532kTCeuzsgOzOzkbSUFHKq/qGsPFWDLlOVVbjAEfco4mBBzOnU/
 Y97jEy33uea7wIOof4MgdbLJN75Mbvc=
X-Google-Smtp-Source: ABdhPJy9yjpSeM6Ct/gvKsJrKDwTk9C83/OnvGOiUVCTuTBynppQ6iuBtVVvvBl4tlQfBjgsoEMPVA==
X-Received: by 2002:a63:4517:: with SMTP id s23mr2672682pga.267.1611028699720; 
 Mon, 18 Jan 2021 19:58:19 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id gt21sm878744pjb.56.2021.01.18.19.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 19:58:18 -0800 (PST)
Date: Tue, 19 Jan 2021 13:58:13 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3] powerpc/mce: Remove per cpu variables from MCE handlers
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20210115125845.28224-1-ganeshgr@linux.ibm.com>
In-Reply-To: <20210115125845.28224-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1611028087.3uko7j7l9g.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Ganesh Goudar's message of January 15, 2021 10:58 pm:
> Access to per-cpu variables requires translation to be enabled on
> pseries machine running in hash mmu mode, Since part of MCE handler
> runs in realmode and part of MCE handling code is shared between ppc
> architectures pseries and powernv, it becomes difficult to manage
> these variables differently on different architectures, So have
> these variables in paca instead of having them as per-cpu variables
> to avoid complications.

Seems okay.

>=20
> Maximum recursive depth of MCE is 4, Considering the maximum depth
> allowed reduce the size of event to 10 from 100.

Could you make this a separate patch, with memory saving numbers?
"Delayed" MCEs are not necessarily the same as recursive (several=20
sequential MCEs can occur before the first event is processed).
But I agree 100 is pretty overboard (as is 4 recursive MCEs really).

>=20
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
> v2: Dynamically allocate memory for machine check event info
>=20
> v3: Remove check for hash mmu lpar, use memblock_alloc_try_nid
>     to allocate memory.
> ---
>  arch/powerpc/include/asm/mce.h     | 21 ++++++++-
>  arch/powerpc/include/asm/paca.h    |  4 ++
>  arch/powerpc/kernel/mce.c          | 76 +++++++++++++++++-------------
>  arch/powerpc/kernel/setup-common.c |  2 +-
>  4 files changed, 69 insertions(+), 34 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mc=
e.h
> index e6c27ae843dc..8d6e3a7a9f37 100644
> --- a/arch/powerpc/include/asm/mce.h
> +++ b/arch/powerpc/include/asm/mce.h
> @@ -204,7 +204,18 @@ struct mce_error_info {
>  	bool			ignore_event;
>  };
> =20
> -#define MAX_MC_EVT	100
> +#define MAX_MC_EVT	10

> +
> +struct mce_info {
> +	int mce_nest_count;
> +	struct machine_check_event mce_event[MAX_MC_EVT];
> +	/* Queue for delayed MCE events. */
> +	int mce_queue_count;
> +	struct machine_check_event mce_event_queue[MAX_MC_EVT];
> +	/* Queue for delayed MCE UE events. */
> +	int mce_ue_count;
> +	struct machine_check_event  mce_ue_event_queue[MAX_MC_EVT];
> +};
> =20
>  /* Release flags for get_mce_event() */
>  #define MCE_EVENT_RELEASE	true
> @@ -233,5 +244,13 @@ long __machine_check_early_realmode_p7(struct pt_reg=
s *regs);
>  long __machine_check_early_realmode_p8(struct pt_regs *regs);
>  long __machine_check_early_realmode_p9(struct pt_regs *regs);
>  long __machine_check_early_realmode_p10(struct pt_regs *regs);
> +#define get_mce_info() local_paca->mce_info

I don't think this adds anything. Could you open code it?

Thanks,
Nick
