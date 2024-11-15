Return-Path: <linuxppc-dev+bounces-3253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C979CE75B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 16:02:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqgGf4kDKz30PD;
	Sat, 16 Nov 2024 02:02:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731682922;
	cv=none; b=POwDE9IlsdF42gQdd/U9yuQodEsPj++CVXg7OueKIV3lh9VGDWx+ansclefVlKQ6ypt0kFmcLAN2UFPQo7aN3Uhw5wPFgIjKphVXLT+k0QJ5KQfc0CGsaDL0JZeVTDS4B6DaR36aqSMKVYHHM5moMh7u520mHtbEPagIxvNYWVa+LB0QwQOK1PmJXXnYgz1UC+kDa02F58Tkk8OFdlB5bJTQxP5mHH75dyNnFFd9rFDt/kqIRhyq2G94sD6kOnAPr5TsT8pYZyM6ihNuJidTfulpyGrqNKBCaF9jCumvyWQLsldF1EHbg1WhsImkZLIbX7QX/evYk0y0OKsKtr0ICw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731682922; c=relaxed/relaxed;
	bh=D2FKaoiwY2mfiK/eCo1qaJWV79rWuXXZrs0onoCnNZ0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=jiIyEWpaLIv0IlOguR8i90n5d36OKRHuAKGxVPO+0QTVw+8MoRy2T5h0MZcsDhheDnjkZkdMPh2XDDzyqU6JZDKpIxql0+OjYfmJoQTWWLT8MtySvi5xp5vaTGgcZ/TqBIasJ4vwINfLMUnBXZ2ENE198An4E+79tJCXbMzz/Fhvatns5wqMcWHALpKU9kf9Fs2REBoQ5nNORZKISQ8RiNM/ckcEOB4Xmw1ohNe/L69NIY3RWpNqG+31N+DGRSVpGZDO1xNmGXB+0XSmcX40f6UsevRJ5+jL8sBM/fTUxwb5Aqpn2x497/c0XyRGmTd0RgKEnitQllX6yGjq7Bs2ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QPgm5Mjj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QPgm5Mjj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqgGd0cxjz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 02:01:59 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ea12c1c78dso964353a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 07:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731682915; x=1732287715; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D2FKaoiwY2mfiK/eCo1qaJWV79rWuXXZrs0onoCnNZ0=;
        b=QPgm5Mjj+TFyw55hbJigpg+RxdYlKEq5fhycmoeW+5nohUwOFOCZOx8LqU3yUqjqY3
         2//Lfdlb/dXHIA3leKEiL6f1Xg6C1iG87nIT2LBSod5zHoehZ/xH6Z5v1Plbydbi6ztJ
         YZ1NqGbSpENkTw5Ce+pJVKeFkNuHriuHV8NYyfL3OkesUWQ7SA2tgGAnfwrv7AcY4Jqg
         Z8zq2nJehahsY/wWwRZe0s7AnbeaF6kyfym5cUj9oNg3wyEtVzc2nMQYqDoyoFvNTDnh
         VxsOO1CHUsbKCleSrhA4RotdvXzXGVuIXAnJC5VS5rUTa3P26rrGJJVr4F9NStnmy1AC
         yQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731682915; x=1732287715;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D2FKaoiwY2mfiK/eCo1qaJWV79rWuXXZrs0onoCnNZ0=;
        b=EeT9ljs5U0v8qD5nWcmZRbk9cEe2FvErJGtpb/WbCbfS9JY26eu1LHc4GCmGS/ShnA
         0wPiZZUNCjuBmcoMr0sRq9ueOYVgnpx7LgXLzKqpPRIUEX8E1RfjgX/1KuBuI/bq1Por
         kuXPIcoEmYFvIlQk4DOTrMerO3nNoyv0BXxJh+SlktF7bw5Y9zo1MDZHyybjHurJAhRk
         7ASJw9BuC0fCQgvkQc0olWQo28mlonoPgRTCRTrf0W2H0IUDUyFqtzUm/vP1cnQmF5Dw
         xMdP90L7WSZoNe92i0nJOrYarknsMdNSAEN72q1kMmQvP1ZYv3kEbdNtDWAkrGxVTKlX
         yexw==
X-Forwarded-Encrypted: i=1; AJvYcCXeU2Msd+GZ3KWpeOsDwn2VcW0iphppIKFViRpgAyYvBvtIIKZ9IUthZpNpP75ly6rfBuU6e+YCDCuF82o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz7uwved9Whvi6HuzSiV+/HmOu0C6B9o0AowGZvrKUBNBnO+KVR
	gyq7Ruj8BxvxNUz+rPrJK4J6e6iaRUkEkgOwsmUqGFN7meKC8wG/
X-Google-Smtp-Source: AGHT+IFF2Q7DDqTNLmh5BnAWYLBYmDo5Jo3WT8cy7DmLwoCWZ86DI74hImRwZEDcl86A8cSxwL7Pww==
X-Received: by 2002:a17:90a:e70c:b0:2e0:ab57:51ec with SMTP id 98e67ed59e1d1-2ea1557e7aemr3544553a91.30.1731682913530;
        Fri, 15 Nov 2024 07:01:53 -0800 (PST)
Received: from dw-tp ([171.76.87.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea02495969sm3016300a91.19.2024.11.15.07.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 07:01:52 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com> 
To: Narayana Murty N <nnmlinux@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-kernel@vger.kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, maddy@linux.ibm.com, naveen@kernel.org, vaibhav@linux.ibm.com, ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries/eeh: Fix get PE state translation
In-Reply-To: <20241107042027.338065-1-nnmlinux@linux.ibm.com>
Date: Fri, 15 Nov 2024 20:01:48 +0530
Message-ID: <87ttc8d0vf.fsf@gmail.com>
References: <20241107042027.338065-1-nnmlinux@linux.ibm.com>
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_BL_SPAMCOP_NET,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Narayana Murty N <nnmlinux@linux.ibm.com> writes:

> The PE Reset State "0" obtained from RTAS calls
> ibm_read_slot_reset_[state|state2] indicates that
> the Reset is deactivated and the PE is not in the MMIO
> Stopped or DMA Stopped state.
>
> With PE Reset State "0", the MMIO and DMA is allowed for
> the PE.

Looking at the PAPR spec - I do agree that it states the same. i.e.
The "0" Initial PE state means the "Not Reset", "Load/Store allowed" &
"DMA allowed" (Normal Operations). 

> The function pseries_eeh_get_state() is currently
> not indicating that to the caller because of  which the
> drivers are unable to resume the MMIO and DMA activity.

It's new to me, but could you help explain the user visible effect
of what gets broken. Since this looks like pseries_eeh_get_state() has
always been like this when it got first implemented.
Is there also a unit test somewhere which you are testing?

IIUC eeh_pe_get_state() was implemented[1] for supporting EEH for VFIO PCI
devices. i.e. the VFIO_EEH_PE_GET_STATE operation of VFIO EEH PE ioctl op
uses pseries_eeh_get_state() helper to query PE state on pseries LPAR.
So are you suggesting that EEH functionality for VFIO PCI device was
never enabled/tested before on pseries?  

[1]: https://lore.kernel.org/all/1402364517-28561-3-git-send-email-gwshan@linux.vnet.ibm.com/

Checking the powernv side of implementation I do see that it does
enables the EEH_STATE_[MMIO|DMA]_ENABLED flags in the result mask for
the callers. So doing the same for pseries eeh get state implementation
does look like the right thing to do here IMO.

> The patch fixes that by reflecting what is actually allowed.

You say this is "fixes" so I am also assuming you are also looking for
stable backports of this? If yes - could you please also add the "Fixes"
tag and cc stable? 

-ritesh

>
> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
> index 1893f66371fa..b12ef382fec7 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -580,8 +580,10 @@ static int pseries_eeh_get_state(struct eeh_pe *pe, int *delay)
>  
>  	switch(rets[0]) {
>  	case 0:
> -		result = EEH_STATE_MMIO_ACTIVE |
> -			 EEH_STATE_DMA_ACTIVE;
> +		result = EEH_STATE_MMIO_ACTIVE	|
> +			 EEH_STATE_DMA_ACTIVE	|
> +			 EEH_STATE_MMIO_ENABLED	|
> +			 EEH_STATE_DMA_ENABLED;
>  		break;
>  	case 1:
>  		result = EEH_STATE_RESET_ACTIVE |
> -- 
> 2.45.2

