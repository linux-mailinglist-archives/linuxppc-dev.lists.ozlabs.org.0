Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F4C3A5B98
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 04:33:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3Fql32LYz3bsm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 12:33:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cadI8RVI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cadI8RVI; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3FqL1pkzz2xZg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 12:33:02 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id ei4so8861643pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 19:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=hi1JkwtFcpKCljuihi5pbntE8L1PdYXhYCCxSqZJjbw=;
 b=cadI8RVIufgbtI7nDCbP1PxiS+dcSzYHd7a1QHyQdCWpfebHWJefpohUsDTd15qt+4
 0wo7kjIGmj558pX1WFit0dx9YG5OIlrZ5dFSbydvVQw3ySG+c4FehKWsK9KavAE+1tIB
 gLK9kg/WH3QdU+p82Fhl1RMueCONHvUCyxPtXTu26ROxFql/EcLNkOPKg77JjanIW5jX
 MNc3qEK+hQIfQiyNhi29dg7o4mXstdjgb+MPOqEqbPWb9ejPcKm2e4kTVSWynApHprnt
 AfORwT2rliB14+fpi8Y8UKfx8wodUb9QdMR3biQN2SUqk2CaaKvn0eHMY+Ydwjd9i/h0
 im5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=hi1JkwtFcpKCljuihi5pbntE8L1PdYXhYCCxSqZJjbw=;
 b=B7HOwji4ycudExM/NxKQQqaPJbVP4aR3s1k+y1ftzzID9bReLJWyd9YEWv4wQMIHns
 AE/zIsqqyZBHeWVyIv3zq+NIQuzE1WJe0SVKiSlst2r/+epgkHU0pPpRdFgIs0Wjp90B
 gibT4ZYNPKcbtM6VyMJfupd75pJHOP6BEy3tDBZEj0vR6mYiqZeVhArPMsbq3LZbTlZv
 D5FegVGNtx2V0DJUFiktt6WuonsrA5AV9eJBj7rL6gZIi5HC7yocn8mtjaCW7IXzAz47
 gixl2qLsJBENmwzfIzU1rIoBPh22mZ78QlAY7gHqIum/E4jFG04TkNi9nbAVH2kdKYjX
 LTYw==
X-Gm-Message-State: AOAM533sqUysl+zf4MvVIFvdCPgfz1k3xhOqCOQEtIK5VBPjxq6gn8BX
 oEMXAKwjXmDY769VqD9ZVEk=
X-Google-Smtp-Source: ABdhPJylIBqRXHV+bdoDmlhtyr0Kfnnibus2eXBUmY+L31Lx57+nhTH0BkqVoWjLepGuQ/75xcvF2Q==
X-Received: by 2002:a17:90a:2b46:: with SMTP id
 y6mr11397874pjc.157.1623637979365; 
 Sun, 13 Jun 2021 19:32:59 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id p19sm15285144pjv.21.2021.06.13.19.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 19:32:59 -0700 (PDT)
Date: Mon, 14 Jun 2021 12:32:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 09/17] powerpc/vas: Define QoS credit flag to allocate
 window
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <64c8e95b25f58c5e05c98765dab2bc8eb9b1483d.camel@linux.ibm.com>
In-Reply-To: <64c8e95b25f58c5e05c98765dab2bc8eb9b1483d.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623637934.3ehnhbfou2.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 13, 2021 9:00 pm:
>=20
> PowerVM introduces two different type of credits: Default and Quality
> of service (QoS).
>=20
> The total number of default credits available on each LPAR depends
> on CPU resources configured. But these credits can be shared or
> over-committed across LPARs in shared mode which can result in
> paste command failure (RMA_busy). To avoid NX HW contention, the
> hypervisor ntroduces QoS credit type which makes sure guaranteed
> access to NX esources. The system admins can assign QoS credits
> or each LPAR via HMC.
>=20
> Default credit type is used to allocate a VAS window by default as
> on PowerVM implementation. But the process can pass
> VAS_TX_WIN_FLAG_QOS_CREDIT flag with VAS_TX_WIN_OPEN ioctl to open
> QoS type window.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>

Flag name looks good now. Again I don't have the spec, so

Acked-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> ---
>  arch/powerpc/include/uapi/asm/vas-api.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/uapi/asm/vas-api.h b/arch/powerpc/inclu=
de/uapi/asm/vas-api.h
> index ebd4b2424785..7c81301ecdba 100644
> --- a/arch/powerpc/include/uapi/asm/vas-api.h
> +++ b/arch/powerpc/include/uapi/asm/vas-api.h
> @@ -13,11 +13,15 @@
>  #define VAS_MAGIC	'v'
>  #define VAS_TX_WIN_OPEN	_IOW(VAS_MAGIC, 0x20, struct vas_tx_win_open_att=
r)
> =20
> +/* Flags to VAS TX open window ioctl */
> +/* To allocate a window with QoS credit, otherwise use default credit */
> +#define VAS_TX_WIN_FLAG_QOS_CREDIT	0x0000000000000001
> +
>  struct vas_tx_win_open_attr {
>  	__u32	version;
>  	__s16	vas_id;	/* specific instance of vas or -1 for default */
>  	__u16	reserved1;
> -	__u64	flags;	/* Future use */
> +	__u64	flags;
>  	__u64	reserved2[6];
>  };
> =20
> --=20
> 2.18.2
>=20
>=20
>=20
