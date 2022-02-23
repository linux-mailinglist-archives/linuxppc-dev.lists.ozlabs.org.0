Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 650974C0D57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 08:34:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3STq4Sz2z3bb0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 18:34:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l5xl3duu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=l5xl3duu; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3ST922wVz2x9g
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 18:33:47 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id s1so558391plg.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 23:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=/o23ZtAwyLwIVTOqPgV8vbZRuErXGEFETLbo72rRMWM=;
 b=l5xl3duud18M/3grWBaXtUMW7v2j9kriaCj9T62NY7P43T3orDd7HEK9KTgrlfWr6z
 +eU/WC3QhZZNVesQYDCW4r6TcLGSM8AwjFL2ugrUuqegNxMQolc50P+W1Imp+ViPgIRr
 WBfMpSzObXDosJosRAmJ0kGZvezkUOmHUVgOBP0wH7+C6xagDtem+Z4wjAY82SGMl2rx
 k6z8ehAuvP8i/rE9wRKSCzI+TBUfJrTAJEIxjI1K19r7aMJu5nbG7h/Paj9jm0Ac58yE
 cav0r35+2RYOhePeNioWZ5tw16Ob+RDWX/AogEpvwxq9NgebjO7fq2owC2kHWgO8ujzF
 F/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=/o23ZtAwyLwIVTOqPgV8vbZRuErXGEFETLbo72rRMWM=;
 b=bNLSVzfouhCi4V+w9rR6stMejz6YvEi151NA9QRWJeZXXeqU6/hxG1r1QE5dzzTOh0
 l7Plozw2oZ3aB5b5BCyXbhtTdQcfeajcebdQ/b4dW2t1ktHcahlEOIafaWc8uU5HuDcZ
 voxn4ZsJmgvzdjdBUdzIPsm3V5b3w1z+lQVvti5os+W7HxyeMxJ2t1ZoeqcomRvD063h
 Re9G2Y3CacCODmVWliOnTOJVH1zYLfSZdm8sIp9ugGiCJkwnMgVRVxWPRf3rrNXIKIYV
 lJdE1qgsRWMNKIMJfJmHnwonKu+Hxk+3s0e9pK6wT+5/Jax8jPab85rd7GASEhmha8Uu
 nk/A==
X-Gm-Message-State: AOAM531mkwvNb1mDSkIhfEoHcl9kK48K9LHyox+gXOL+NpY6DL/Aq6Ig
 REplCwYFu5aSR/Grc2PGqwY=
X-Google-Smtp-Source: ABdhPJyLMDwHObTWHS6InATzUgnBYk+Ws0n0vhLUOFV6cfmybkyCW2UbzEjPSLk9l7z7hINCKhg+VA==
X-Received: by 2002:a17:902:d647:b0:14e:ec42:2d86 with SMTP id
 y7-20020a170902d64700b0014eec422d86mr25915046plh.38.1645601625881; 
 Tue, 22 Feb 2022 23:33:45 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id o7sm19119424pfk.184.2022.02.22.23.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 23:33:45 -0800 (PST)
Date: Wed, 23 Feb 2022 17:33:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 9/9] powerpc/pseries/vas: Write 'nr_total_credits' for
 QoS credits change
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
 <790aac27437fdd13b6e1dac36682b123f9050b04.camel@linux.ibm.com>
In-Reply-To: <790aac27437fdd13b6e1dac36682b123f9050b04.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645601513.45xu2b6rs6.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of February 20, 2022 6:03 am:
>=20
> pseries supports two types of credits - Default (uses normal priority
> FIFO) and Qality of service (QoS uses high priority FIFO). The user
> decides the number of QoS credits and sets this value with HMC
> interface. With the core add/removal, this value can be changed in HMC
> which invokes drmgr to communicate to the kernel.
>=20
> This patch adds an interface so that drmgr command can write the new
> target QoS credits in sysfs. But the kernel gets the new QoS
> capabilities from the hypervisor whenever nr_total_credits is updated
> to make sure sync with the values in the hypervisor.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/vas-sysfs.c | 33 +++++++++++++++++++++-
>  arch/powerpc/platforms/pseries/vas.c       |  2 +-
>  arch/powerpc/platforms/pseries/vas.h       |  1 +
>  3 files changed, 34 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/vas-sysfs.c b/arch/powerpc/pl=
atforms/pseries/vas-sysfs.c
> index e24d3edb3021..20745cd75f27 100644
> --- a/arch/powerpc/platforms/pseries/vas-sysfs.c
> +++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
> @@ -25,6 +25,33 @@ struct vas_caps_entry {
> =20
>  #define to_caps_entry(entry) container_of(entry, struct vas_caps_entry, =
kobj)
> =20
> +/*
> + * This function is used to get the notification from the drmgr when
> + * QoS credits are changed. Though receiving the target total QoS
> + * credits here, get the official QoS capabilities from the hypervisor.
> + */
> +static ssize_t nr_total_credits_store(struct vas_cop_feat_caps *caps,
> +				       const char *buf, size_t count)
> +{
> +	int err;
> +	u16 creds;
> +
> +	/*
> +	 * Nothing to do for default credit type.
> +	 */
> +	if (caps->win_type =3D=3D VAS_GZIP_DEF_FEAT_TYPE)
> +		return -EOPNOTSUPP;
> +
> +	err =3D kstrtou16(buf, 0, &creds);
> +	if (!err)
> +		err =3D vas_reconfig_capabilties(caps->win_type);

So what's happening here? The creds value is ignored? Can it just
be a write-only file which is named appropriately to indicate it
can be written-to to trigger an update?

Thanks,
Nick
