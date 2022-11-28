Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D916D639F71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:30:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL8Zl4tm7z3f24
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:30:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d4XqIBFx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d4XqIBFx;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL8Yr43rGz2xl2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:29:35 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id t17so8161469pjo.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 18:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2m8jzJkr+4ch/6ng6Jdu0j83M4Ya9F8Dew724n5Nlg=;
        b=d4XqIBFx2j+gQglPDTn3F6wI5TKHazMf6m4MwF2O71tUf0EnDaIg+/9DOqtxkZhCdC
         sJrZhiQIyOMnK3XQuc1swZ6Fm5X+NlSTy59tuxppKIK0l0SRTFrOPCf8MFE2VcshxpT/
         5VJ4jDpx46Omy0R3m0Dp/ZjbMx2+peYFRQNYFhmc8PitGRR8x5aN+ksD5YFKnlJUbMPg
         bEoWjsNmF6EsdqSzKTBYLS93oV1EgOa2khGN8l7c5K8HVC3MCQv5pcResiU5ows9TN8d
         TCyMkzs5ZG5oHtYJMdD3iAkft9XDQIqDz5TnOR+MREzVJf52w+0v9hdt6qeWKaYBe4uw
         GPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2m8jzJkr+4ch/6ng6Jdu0j83M4Ya9F8Dew724n5Nlg=;
        b=s1f7KryBvoemr4kT3hMyuCnk3ouXam6wRu3HY0x+uqjPzEpFoBMw3DvOjsrqVpANbD
         AJoK+86QoZdMVCn9kkbTYuZPNgGpnTQpSj/fy5D6ZpFnH1tMKN+TGH1iKoFZ7b7OIQrN
         OD5rsVE4GePFs5M1g0DQaNn21jKzPmuuRQqYZh7QpxjRhADCE/w2+uoevfN3fdUed8xU
         YdN4rs+imjTJi0LLF17HYlAP/n0xwv8Toz2SWoo8xNeBJPr1ENGrwiazOLUjWBV7Wjl0
         3M6jOkeVpFY3unNqWmV9MBsxh8pjOoq9bocNOfjtrS0LSln0UC/csK5gWaHD1Sf0TyNT
         XqCg==
X-Gm-Message-State: ANoB5pnpRiHx9eamu/tBR0aRBlUI9nSBItzYV0vVOjeu6g4DXDAk9rjs
	ubZqTtiJ+bv45h01TglmGh8=
X-Google-Smtp-Source: AA0mqf6QFAYhx9nxocAz4WCLkONpwXOXw0M/8AxskBeSPweWH5TuCd/gooFeibwb2R/OV+c9o3ebqA==
X-Received: by 2002:a17:90a:5d05:b0:219:57e:7790 with SMTP id s5-20020a17090a5d0500b00219057e7790mr16792221pji.3.1669602572713;
        Sun, 27 Nov 2022 18:29:32 -0800 (PST)
Received: from localhost ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902d50300b001891ad6eadasm3197931plg.251.2022.11.27.18.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 18:29:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Nov 2022 12:29:27 +1000
Message-Id: <CONKPQU112NE.1K5YZVFHQ7XU9@bobo>
Subject: Re: [PATCH 03/13] powerpc/rtas: avoid device tree lookups in
 rtas_os_term()
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nathan Lynch" <nathanl@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-4-nathanl@linux.ibm.com>
In-Reply-To: <20221118150751.469393-4-nathanl@linux.ibm.com>
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Nov 19, 2022 at 1:07 AM AEST, Nathan Lynch wrote:
> rtas_os_term() is called during panic. Its behavior depends on a
> couple of conditions in the /rtas node of the device tree, the
> traversal of which entails locking and local IRQ state changes. If the
> kernel panics while devtree_lock is held, rtas_os_term() as currently
> written could hang.

Nice.

>
> Instead of discovering the relevant characteristics at panic time,
> cache them in file-static variables at boot. Note the lookup for
> "ibm,extended-os-term" is converted to of_property_read_bool() since
> it is a boolean property, not a RTAS function token.

Small nit, but you could do that at the query site unless you
were going to start using ibm,os-term without the extended
capability.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index c12dd5ed5e00..81e4996012b7 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -947,6 +947,8 @@ void __noreturn rtas_halt(void)
> =20
>  /* Must be in the RMO region, so we place it here */
>  static char rtas_os_term_buf[2048];
> +static s32 ibm_os_term_token =3D RTAS_UNKNOWN_SERVICE;
> +static bool ibm_extended_os_term;
> =20
>  void rtas_os_term(char *str)
>  {
> @@ -958,14 +960,13 @@ void rtas_os_term(char *str)
>  	 * this property may terminate the partition which we want to avoid
>  	 * since it interferes with panic_timeout.
>  	 */
> -	if (RTAS_UNKNOWN_SERVICE =3D=3D rtas_token("ibm,os-term") ||
> -	    RTAS_UNKNOWN_SERVICE =3D=3D rtas_token("ibm,extended-os-term"))
> +	if (ibm_os_term_token =3D=3D RTAS_UNKNOWN_SERVICE || !ibm_extended_os_t=
erm)
>  		return;
> =20
>  	snprintf(rtas_os_term_buf, 2048, "OS panic: %s", str);
> =20
>  	do {
> -		status =3D rtas_call(rtas_token("ibm,os-term"), 1, 1, NULL,
> +		status =3D rtas_call(ibm_os_term_token, 1, 1, NULL,
>  				   __pa(rtas_os_term_buf));
>  	} while (rtas_busy_delay(status));
> =20
> @@ -1335,6 +1336,13 @@ void __init rtas_initialize(void)
>  	no_entry =3D of_property_read_u32(rtas.dev, "linux,rtas-entry", &entry)=
;
>  	rtas.entry =3D no_entry ? rtas.base : entry;
> =20
> +	/*
> +	 * Discover these now to avoid device tree lookups in the
> +	 * panic path.
> +	 */
> +	ibm_os_term_token =3D rtas_token("ibm,os-term");
> +	ibm_extended_os_term =3D of_property_read_bool(rtas.dev, "ibm,extended-=
os-term");
> +
>  	/* If RTAS was found, allocate the RMO buffer for it and look for
>  	 * the stop-self token if any
>  	 */
> --=20
> 2.37.1

