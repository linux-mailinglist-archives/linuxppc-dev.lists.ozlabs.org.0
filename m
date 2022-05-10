Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC1F52128D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 12:47:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyF9R1nmfz3cFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 20:47:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h0kkPCMH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=h0kkPCMH; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyF8p3rrjz2xY0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 20:46:49 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id c14so14612462pfn.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 03:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ywkCd0VQclbYtbuLcC/2MBQIqOITw9zVVBZNkCemTOo=;
 b=h0kkPCMH6mPJCfovcbuIStuogjg+GSSyZfKyGX6j68msx5w4YZi0zrfa/0Dshwr3GN
 7RQ1KxIeG1PXDsecsjvmgUcAmrozA5BpQNdXi0GekocXEFlkce+AZEZUg2hxd74t7Q6b
 Gio+Nbtf97oPkaBTUiVEboPYAb85Lj3wwgK1nuRGqbKHKIb7Q1DrfNyYOXBo7RhiuBXk
 BRJbvO0Ri7yOfaOl8eZugNE1EkGkOuWjEy+ngDm4a4V57QfGr3D6FPMoIVpEbsEY4LDc
 vPdwCEsRw6QssvT0owD6Vo+zMVVeU/EruhI3A9lq3SKarrhL+NRBQqOw8YqKP16UoKKY
 qcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ywkCd0VQclbYtbuLcC/2MBQIqOITw9zVVBZNkCemTOo=;
 b=gkQJ7C3FVV8Q2YyxFFsypLCK13AsnsN1LVLalSiftpSSyfQX2mbl5zn3ZZcTj8GKfP
 C5/wlhO2YvVZGtS0oHgUj3s9qjfw5GQgNrX54s80/VNm38VxHzNsoC40UeKFCabEGauA
 uoaarCIXtHWfwi3l56etrHK9cBBxbWib82qqX6rY71qK1mwneWttrWpQNiNCgytnAidj
 X9e6fpqELFTufikPiVN0YFlGmjIGAmSvBKOZ5nDvhmLBtSvouXjOS4kkK658AOBTXRRQ
 jsz+7Ye1PxTW3XDhL+Rco5leVD/vXtpIwICtC3cs/yhK5YjHZaA+qoToRhHX8jXFDFNp
 8S0A==
X-Gm-Message-State: AOAM533LX54W/KeRp8bqaOIZiD0ko3/7sklVJM+haF8Hpt0K38AeGkmZ
 WWkjqahzDs68jXy867ooXbV6Fi6wkzA=
X-Google-Smtp-Source: ABdhPJzMrukhfzR4yG2wWMevWm9IkJ0FdxD4csfom41LNkkZtiJ1+e5zsn4K6SEBEKiso2xXU+F2/Q==
X-Received: by 2002:a63:cd41:0:b0:3c5:1242:3a0d with SMTP id
 a1-20020a63cd41000000b003c512423a0dmr16424233pgj.266.1652179607275; 
 Tue, 10 May 2022 03:46:47 -0700 (PDT)
Received: from localhost (193-116-127-232.tpgi.com.au. [193.116.127.232])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a170902bb9800b0015e8d4eb1ecsm1791916pls.54.2022.05.10.03.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 03:46:46 -0700 (PDT)
Date: Tue, 10 May 2022 20:46:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 24/29] watchdog/hardlockup: Use parse_option_str() to
 handle "nmi_watchdog"
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Thomas Gleixner
 <tglx@linutronix.de>, x86@kernel.org
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-25-ricardo.neri-calderon@linux.intel.com>
In-Reply-To: <20220506000008.30892-25-ricardo.neri-calderon@linux.intel.com>
MIME-Version: 1.0
Message-Id: <1652179333.fnu2fjiffn.astroid@bobo.none>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Stephane Eranian <eranian@google.com>, Ricardo Neri <ricardo.neri@intel.com>,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Ricardo Neri's message of May 6, 2022 10:00 am:
> Prepare hardlockup_panic_setup() to handle a comma-separated list of
> options. Thus, it can continue parsing its own command-line options while
> ignoring parameters that are relevant only to specific implementations of
> the hardlockup detector. Such implementations may use an early_param to
> parse their own options.

It can't really handle comma separated list though, until the next
patch. nmi_watchdog=3Dpanic,0 does not make sense, so you lost error
handling of that.

And is it kosher to double handle options like this? I'm sure it
happens but it's ugly.

Would you consider just add a new option for x86 and avoid changing
this? Less code and patches.

Thanks,
Nick

>=20
> Cc: Andi Kleen <ak@linux.intel.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Stephane Eranian <eranian@google.com>
> Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
> Cc: iommu@lists.linux-foundation.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: x86@kernel.org
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> ---
> Changes since v5:
>  * Corrected typo in commit message. (Tony)
>=20
> Changes since v4:
>  * None
>=20
> Changes since v3:
>  * None
>=20
> Changes since v2:
>  * Introduced this patch.
>=20
> Changes since v1:
>  * None
> ---
>  kernel/watchdog.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 9166220457bc..6443841a755f 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -73,13 +73,13 @@ void __init hardlockup_detector_disable(void)
> =20
>  static int __init hardlockup_panic_setup(char *str)
>  {
> -	if (!strncmp(str, "panic", 5))
> +	if (parse_option_str(str, "panic"))
>  		hardlockup_panic =3D 1;
> -	else if (!strncmp(str, "nopanic", 7))
> +	else if (parse_option_str(str, "nopanic"))
>  		hardlockup_panic =3D 0;
> -	else if (!strncmp(str, "0", 1))
> +	else if (parse_option_str(str, "0"))
>  		nmi_watchdog_user_enabled =3D 0;
> -	else if (!strncmp(str, "1", 1))
> +	else if (parse_option_str(str, "1"))
>  		nmi_watchdog_user_enabled =3D 1;
>  	return 1;
>  }
> --=20
> 2.17.1
>=20
>=20
