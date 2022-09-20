Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8565BD8F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 02:56:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWjm75Bt7z3bZs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 10:56:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XmmFhSUO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XmmFhSUO;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWjlK6CDXz3bY5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 10:55:41 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id w13so862413plp.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 17:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=RHgbrQQS8/+JRI4fJ9L/YfUqMozGNHE4N7jBc/7iinw=;
        b=XmmFhSUOIKhrhIGSZUGIk0rWBDlOYI/rHC3NsHaQKOvcOdFbUooh9xkzS9qLJHl6Ut
         2o0hlhgsV+AgotrF/h9KIP9HZBZx/ZPPQPbWR5l7LkOgQRgyYMbBklSm+zYyZKcHYIoe
         LWKe91gVZIhISXuVKGqP7neKYUhJz3UAlPCFoweX//63o2N1ULOd31qebgJBLH/ugCzP
         /Mh+thk9KEkVSgm3ucwyoivgL6x+xVEPUjjvD0XZKU/iK6AOwkldfDSW0vGO8t53Hkg+
         CYJE42LHk+En79M7KEV1HbNB/DJHNPeR7I7wJA0KdV1pN7yi3hDMpNzmku8Jr/fSL29+
         hZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=RHgbrQQS8/+JRI4fJ9L/YfUqMozGNHE4N7jBc/7iinw=;
        b=g1yAJfQVq+LzVk/rArliZy2qjvzbDeT977EI+1AnhBHO2/kB5aDManWoUW/z+5FHZs
         /huEjNsrmNKolNez2+BZhop5bmsvzi+Sii9omi4/mpUiLm0q9Ef/QqCmEYf6ixBemxEj
         REPWOwKPwmJ+F5RwOBTOqHGckMw/qC4RXT2boQNJ2jsJMqrzsbodFYQB2+xXg8AocQm1
         kUx00Tzro/rCPKq9oZmS1br6wWNBJqWoeGyvLCaFWAjux+evjleBlpBuzkGRuWym5bfa
         lhKwTdrJMZ9rarrQH6/815iOfEMDbKyF5xElVYEqQVPVv0wWGFpG7wY8sgxxcNO9Izq9
         WNTQ==
X-Gm-Message-State: ACrzQf1x0Btpo97rPMsRTsMXZefjAhe6lOEHGDCC+3i4nKWmo9j8Nswb
	fap3EcsuvkG6CWpwmpOGx4k=
X-Google-Smtp-Source: AMsMyM5N931Ufx2DP2GBIJFSR2Fz6QMfTGX0JOBoMxBtSje6a6JBDlYgBafeGnp94TU6AqbuccWBuw==
X-Received: by 2002:a17:902:710e:b0:170:8d34:9447 with SMTP id a14-20020a170902710e00b001708d349447mr2381731pll.126.1663635339151;
        Mon, 19 Sep 2022 17:55:39 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id y20-20020a170902ed5400b00174f7d107c8sm21179815plb.293.2022.09.19.17.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 17:55:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 10:55:33 +1000
Message-Id: <CN0TI9FW40N3.2POCSRW2SO9X5@bobo>
Subject: Re: [PATCH 07/23] powerpc/64s: Fix comment on interrupt handler
 prologue
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-8-rmclure@linux.ibm.com>
In-Reply-To: <20220916053300.786330-8-rmclure@linux.ibm.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Sep 16, 2022 at 3:32 PM AEST, Rohan McLure wrote:
> Interrupt handlers on 64s systems will often need to save register state
> from the interrupted process to make space for loading special purpose
> registers or for internal state.
>
> Fix a comment documenting a common code path macro in the beginning of
> interrupt handlers where r10 is saved to the PACA to afford space for
> the value of the CFAR. Comment is currently written as if r10-r12 are
> saved to PACA, but in fact only r10 is saved, with r11-r12 saved much
> later. The distance in code between these saves has grown over the many
> revisions of this macro. Fix this by signalling with a comment where
> r11-r12 are saved to the PACA.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reported-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> V1 -> V2: Given its own commit
> V2 -> V3: Annotate r11-r12 save locations with comment.
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index 3d0dc133a9ae..a3b51441b039 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -281,7 +281,7 @@ BEGIN_FTR_SECTION
>  	mfspr	r9,SPRN_PPR
>  END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	HMT_MEDIUM
> -	std	r10,IAREA+EX_R10(r13)		/* save r10 - r12 */
> +	std	r10,IAREA+EX_R10(r13)		/* save r10 */
>  	.if ICFAR
>  BEGIN_FTR_SECTION
>  	mfspr	r10,SPRN_CFAR
> @@ -321,7 +321,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>  	mfctr	r10
>  	std	r10,IAREA+EX_CTR(r13)
>  	mfcr	r9
> -	std	r11,IAREA+EX_R11(r13)
> +	std	r11,IAREA+EX_R11(r13)		/* save r11 - r12 */
>  	std	r12,IAREA+EX_R12(r13)
> =20
>  	/*
> --=20
> 2.34.1

