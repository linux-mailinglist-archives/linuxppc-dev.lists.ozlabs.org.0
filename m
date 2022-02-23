Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F55D4C0D2B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 08:24:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3SFq4Zhjz3bbb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 18:23:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ktP30Bk0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ktP30Bk0; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3SFC4rR7z2xrc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 18:23:26 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id om7so1850130pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 23:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=EOPvqJnN6EER3o6NuxWSETUrM8ZR51JTTZ69Q2dCYjU=;
 b=ktP30Bk0FMtgXwlXyk3LquCzwsslk8QDVz4m6Og/CwjmllUJL5Q6XSeBlUHSvKEexW
 gXV6UCnAuaQW9sCf/RwrRNSy16PeAT6aj6cu0oRyYVTbKEChhKDvBchh8LbLXyW2nVKQ
 SrI03PGDxBiOZ9jk1bQViZDMMpbq4QAcJyHn7tdQHstcPTM6EvN2u9H0huLzXT2JN3NB
 P8QtWnyLu2HbWw+bDGhRHBW7dkFfFLrpZCXr4gpvpHZrd30nD68Oc6Z5Qx55doTUipLz
 7T+aYr7LprwIBWH8mrBMAeNpaxuuqfNgXwRP8DW68UmQwiUMDq0e9XrHGANlmpeBjRep
 LFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=EOPvqJnN6EER3o6NuxWSETUrM8ZR51JTTZ69Q2dCYjU=;
 b=HH8DabnlswWRmQ/mt/SoMPD2X69r+8lGRz+SQAPPGPiSkiiMNMOw1pITMRYx0Rh3ib
 dwOL/rHEePBdBtwyBN1L69Sh/w++iL3IJRVBj9G1v4W+aEwxiMGsJ9+5fyhQfkIJV+Tc
 B6230aNneJ+723P5rywbbU5AlAhV2cA/Tzaztqtir3qXTuD1F0o4TrI1tuIk3/7E5VCY
 gTei6WP2nzKQf/+668H1aixCkoMotRr6dgNp8J9ItipaC1wUOPzxR8gLLxItLwSMlzA0
 LCBNv2CL2VYAstnjGTud7jBO/uO1cgl9eo84/6AfkFR+EylH3ghboJom7WK/kkWRAv6w
 FjXg==
X-Gm-Message-State: AOAM5313+0MXzAh0mG2kDgzJVanHmsIfTsmLKwIxvCy489+mGl4yK9/g
 C0/Eb0/+nJG4kAi2J/EuKVI=
X-Google-Smtp-Source: ABdhPJxesuhUOQxlZlRbJZi3McgdPT8DNa2qZp7nB7Z9aJcirwgyvGIHHNqu8disfnAyZMqx0hr9dQ==
X-Received: by 2002:a17:902:8306:b0:14f:a386:6a44 with SMTP id
 bd6-20020a170902830600b0014fa3866a44mr15569959plb.140.1645601004358; 
 Tue, 22 Feb 2022 23:23:24 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id k18sm19566712pfi.10.2022.02.22.23.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 23:23:23 -0800 (PST)
Date: Wed, 23 Feb 2022 17:23:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 6/9] powerpc/pseries/vas: Close windows with DLPAR core
 removal
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
 <50c1cf6b3427bcd89fdfcf2f1245b3a42aab8391.camel@linux.ibm.com>
In-Reply-To: <50c1cf6b3427bcd89fdfcf2f1245b3a42aab8391.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645600472.tj95v3iuyt.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Haren Myneni's message of February 20, 2022 6:00 am:
>=20
> The hypervisor assigns vas credits (windows) for each LPAR based
> on the number of cores configured in that system. The OS is
> expected to release credits when cores are removed, and may
> allocate more when cores are added. So there is a possibility of
> using excessive credits (windows) in the LPAR and the hypervisor
> expects the system to close the excessive windows so that NX load
> can be equally distributed across all LPARs in the system.
>=20
> When the OS closes the excessive windows in the hypervisor,
> it sets the window status in-active and invalidates window
> virtual address mapping. The user space receives paste instruction
> failure if any NX requests are issued on the in-active window.

Thanks for adding this paragraph. Then presumably userspace can
update their windows and be able to re-try with an available open
window?

in-active can be one word, not hyphenated.


>=20
> This patch also adds the notifier for core removal/add to close
> windows in the hypervisor if the system lost credits (core
> removal) and reopen windows in the hypervisor when the previously
> lost credits are available.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/vas.h       |   2 +
>  arch/powerpc/platforms/pseries/vas.c | 207 +++++++++++++++++++++++++--
>  arch/powerpc/platforms/pseries/vas.h |   3 +
>  3 files changed, 204 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 27251af18c65..6baf7b9ffed4 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -34,6 +34,8 @@
>   */
>  #define VAS_WIN_ACTIVE		0x0	/* Used in platform independent */
>  					/* vas mmap() */
> +/* Window is closed in the hypervisor due to lost credit */
> +#define VAS_WIN_NO_CRED_CLOSE	0x00000001

I thought we were getting a different status for software
status vs status rturned by hypervisor?

> diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platform=
s/pseries/vas.h
> index 2872532ed72a..701363cfd7c1 100644
> --- a/arch/powerpc/platforms/pseries/vas.h
> +++ b/arch/powerpc/platforms/pseries/vas.h
> @@ -83,6 +83,9 @@ struct vas_cop_feat_caps {
>  struct vas_caps {
>  	struct vas_cop_feat_caps caps;
>  	struct list_head list;	/* List of open windows */
> +	int nr_close_wins;	/* closed windows in the hypervisor for DLPAR */
> +	int nr_open_windows;	/* Number of successful open windows */
> +	u8 feat;		/* Feature type */
>  };

Still not entirely sold on the idea that nr_open_windows is a feature
or capability, but if the code works out easier this way, sometimes
these little hacks are reasonable.

Thanks,
Nick
