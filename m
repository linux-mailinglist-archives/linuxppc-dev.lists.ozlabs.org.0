Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E84A1570F8E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 03:33:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhjvj6Y3hz3bnY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 11:33:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ilWwUWRB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ilWwUWRB;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lhjv12G8Jz3bnY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 11:33:16 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id o15so6311214pjh.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 18:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=A7qUftFMsHtAgHz7tg5ybnJxuA39QPif4EqnUQa2+ls=;
        b=ilWwUWRBr2jcKjIgdGL97r01HtkS3jZpsabezxx1tUPUQ7nwzkvbBQbHRnZjyQHG4a
         MTQaJauz2iosj/AQx2pFgDEGzCjs6RZtqEpfF4gFACV0PkzxpUgLKQV0r7SkoOS8p+M6
         dkt68QM01GF7GmRIGvuVT1L4E6RCx066fAv8uES+/UuTbIGmK31aN4iXmUm6tF5eQPB7
         5cr+316tp2G1/YM/tLLU7xm2kSvI7d4CRF8fGbsy8L1SfQhezD8s3MKooY5XZQOW0peI
         yfloIeERrassAa9MWw/8ENoGPGt/oQ0X2g97fHelcTTOEjUWFON4xU58FfyK6IAAdjiL
         f9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=A7qUftFMsHtAgHz7tg5ybnJxuA39QPif4EqnUQa2+ls=;
        b=H8emaneTqfVsA+4KXZ+pHk+YI4VKV/Gl6h04BaUOiCQFHmCw/ux/Ta+SXeEZh+TH6F
         jEDXIz1bCN7eePUTNAp5ZryyetMLmRApn/KHEAURqjOmTA+8JGz08lNVe9dZViHcZB0Z
         3GfWkP0qUqMLjjATye+dsOJJZBrXBqKr8MC+ost6XFyKuLAQtTTX/ePGKd8DRkF/5zHZ
         asVpumREPcYLuIkrFBpOYwrgaL3VIkVpnsSTipweveGc9dbXd+VGmkxupQUaseG4yYI5
         kSP35Imewfc0tCoQillTew5Ccxiq/MB/UagRx8mLgVt8L9+0z1aCdbLNzkD1FfpI7kx6
         syXw==
X-Gm-Message-State: AJIora9W1+Co1El0OHMSy6dTCLOUsnqQoG+gTUYWwqiMZmh95hVFWQJT
	SuF37VYkDz8YO0nnjVj6iYA=
X-Google-Smtp-Source: AGRyM1vCis+SHHXbUUZKdGWzSbZvOUw5k1uVmPkRtryAVoujeVtXJWzlAcnGlKYgxE8ZNZyVCCoiVA==
X-Received: by 2002:a17:902:ea09:b0:16c:3f7a:adf7 with SMTP id s9-20020a170902ea0900b0016c3f7aadf7mr11199465plg.103.1657589593546;
        Mon, 11 Jul 2022 18:33:13 -0700 (PDT)
Received: from localhost (193-116-203-247.tpgi.com.au. [193.116.203.247])
        by smtp.gmail.com with ESMTPSA id f8-20020a17090ab94800b001ef42b3c5besm5450818pjw.23.2022.07.11.18.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 18:33:12 -0700 (PDT)
Date: Tue, 12 Jul 2022 11:33:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 1/4] powerpc/mobility: wait for memory transfer to
 complete
To: benh@kernel.crashing.org, haren@linux.vnet.ibm.com, Laurent Dufour
	<ldufour@linux.ibm.com>, linux@roeck-us.net, mpe@ellerman.id.au,
	nathanl@linux.ibm.com, paulus@samba.org, wim@linux-watchdog.org
References: <20220627135347.32624-1-ldufour@linux.ibm.com>
	<20220627135347.32624-2-ldufour@linux.ibm.com>
In-Reply-To: <20220627135347.32624-2-ldufour@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1657588908.mis26ebam4.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Laurent Dufour's message of June 27, 2022 11:53 pm:
> In pseries_migration_partition(), loop until the memory transfer is
> complete. This way the calling drmgr process will not exit earlier,
> allowing callbacks to be run only once the migration is fully completed.
>=20
> If reading the VASI state is done after the hypervisor has completed the
> migration, the HCALL is returning H_PARAMETER. We can safely assume that
> the memory transfer is achieved if this happens.
>=20
> This will also allow to manage the NMI watchdog state in the next commits=
.
>=20
> Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/mobility.c | 42 +++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/pla=
tforms/pseries/mobility.c
> index 78f3f74c7056..907a779074d6 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -427,6 +427,43 @@ static int wait_for_vasi_session_suspending(u64 hand=
le)
>  	return ret;
>  }
> =20
> +static void wait_for_vasi_session_completed(u64 handle)
> +{
> +	unsigned long state =3D 0;
> +	int ret;
> +
> +	pr_info("waiting for memory transfert to complete...\n");

                                            ^ extra t (also below)
> +
> +	/*
> +	 * Wait for transition from H_VASI_RESUMED to H_VASI_COMPLETED.
> +	 */
> +	while (true) {
> +		ret =3D poll_vasi_state(handle, &state);
> +
> +		/*
> +		 * If the memory transfer is already complete and the migration
> +		 * has been cleaned up by the hypervisor, H_PARAMETER is return,
> +		 * which is translate in EINVAL by poll_vasi_state().
> +		 */
> +		if (ret =3D=3D -EINVAL || (!ret && state =3D=3D H_VASI_COMPLETED)) {
> +			pr_info("memory transfert completed.\n");
> +			break;
> +		}
> +
> +		if (ret) {
> +			pr_err("H_VASI_STATE return error (%d)\n", ret);
> +			break;
> +		}
> +
> +		if (state !=3D H_VASI_RESUMED) {
> +			pr_err("unexpected H_VASI_STATE result %lu\n", state);
> +			break;
> +		}
> +
> +		msleep(500);

Is 500 specified anywhere? Another caller uses 1000, and the other one=20
uses some backoff interval starting at 1ms...

> +	}
> +}
> +
>  static void prod_single(unsigned int target_cpu)
>  {
>  	long hvrc;
> @@ -673,9 +710,10 @@ static int pseries_migrate_partition(u64 handle)
>  	vas_migration_handler(VAS_SUSPEND);
> =20
>  	ret =3D pseries_suspend(handle);
> -	if (ret =3D=3D 0)
> +	if (ret =3D=3D 0) {
>  		post_mobility_fixup();
> -	else
> +		wait_for_vasi_session_completed(handle);

If this wasn't required until later patches, maybe a comment about why=20
it's here? Could call it wait_for_migration() or similar too.

Looks okay though from my basic reading of PAPR.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> +	} else
>  		pseries_cancel_migration(handle, ret);
> =20
>  	vas_migration_handler(VAS_RESUME);
> --=20
> 2.36.1
>=20
>=20
