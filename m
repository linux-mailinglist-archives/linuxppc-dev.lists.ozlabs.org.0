Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 210A2521263
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 12:39:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyF0973gkz3cd7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 20:39:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=T6qTS7KH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=T6qTS7KH; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyDzD4R0cz3c9H
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 20:38:31 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id m12so2631129plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=6xgLoNI7AnkdMdRdHZQagLXDT+gwi8Sv7gdjtmJ1fxI=;
 b=T6qTS7KHImoKYcUCIh2yTrk/nUW/TK4BnMIPOFRnS9ToQQVZJX9ZQlKbCYW31c0IO1
 sld+XwFSToNAnhrZX50PHWDSBciQxB1A1RxgrcgIGnv6JHAzjXReB/MXWFCFV1eqNL8R
 zBQ7FeiOEgXkvzCOiwCT0pSLOrweX9bIzu5VO4rO5gOMQVvJQXKNQ3nj+sxXeS2UYmnB
 Th/dZASZ6FfFx9+0esk1NwNw8WLNRmvGyDvRgR4GIQQpmPPg/dYU3gadMQHwJAjLI+Dx
 aXMMfwDArKIjZPekEHfETJ+t1AGFD6AQCbQx3K9QxF3fKNhbNDXdBr+9DlvJlXOLF214
 WLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=6xgLoNI7AnkdMdRdHZQagLXDT+gwi8Sv7gdjtmJ1fxI=;
 b=6izYcL/5eLuQ0jJ4E4fXlCmX1EZ1mMAaDH4SFzpY1+RPgnA0hdWn7ovUF0zBHh9KbT
 Ez9gisbe1RjRLoGxfKS4nn5fhToFSf2cpoL2rO/JEef9wSims42tlFt6K4r0kO2OSjnl
 8rp9UVt3wxPJENDbVcXH8XKGQLpOm/08yWZiXVJ9L+c0iHKlj4BJ1VdjdW7Tz5rknRna
 /su16YZo/XiIq6CEcz+XYwa5u+T0BI/58UN5a3S2xJ9djpMYnrCGhdQqhKP2iX4FYNp4
 QtmUtYb6I0w8vsUxeVfG7FA0bGqhZ3muQToMGEFE2TNujaGn4lq/V6eVTrnQ8E8d5s0v
 DzAw==
X-Gm-Message-State: AOAM533r3xBGRwMz6GgsGznDp1RBClcNVMoWUg1kUdxBW5b2Y0n7zU8U
 nPUV7ypUjonH7GipdR0Fyd8=
X-Google-Smtp-Source: ABdhPJy2sDqUG4iE+M+9nKV8e7Dm6QX1UaW6u+uuX44X6Avdb00Clu5Sf5FhxTQSr0RHx4FiuKvk6Q==
X-Received: by 2002:a17:90b:314e:b0:1dc:d143:a15d with SMTP id
 ip14-20020a17090b314e00b001dcd143a15dmr23660047pjb.111.1652179108887; 
 Tue, 10 May 2022 03:38:28 -0700 (PDT)
Received: from localhost (193-116-127-232.tpgi.com.au. [193.116.127.232])
 by smtp.gmail.com with ESMTPSA id
 j192-20020a638bc9000000b003c14af505fcsm10107925pge.20.2022.05.10.03.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 03:38:28 -0700 (PDT)
Date: Tue, 10 May 2022 20:38:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 20/29] init/main: Delay initialization of the lockup
 detector after smp_init()
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Thomas Gleixner
 <tglx@linutronix.de>, x86@kernel.org
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-21-ricardo.neri-calderon@linux.intel.com>
In-Reply-To: <20220506000008.30892-21-ricardo.neri-calderon@linux.intel.com>
MIME-Version: 1.0
Message-Id: <1652178524.7j2o02lrl8.astroid@bobo.none>
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

Excerpts from Ricardo Neri's message of May 6, 2022 9:59 am:
> Certain implementations of the hardlockup detector require support for
> Inter-Processor Interrupt shorthands. On x86, support for these can only
> be determined after all the possible CPUs have booted once (in
> smp_init()). Other architectures may not need such check.
>=20
> lockup_detector_init() only performs the initializations of data
> structures of the lockup detector. Hence, there are no dependencies on
> smp_init().

I think this is the only real thing which affects other watchdog types?

Not sure if it's a big problem, the secondary CPUs coming up won't
have their watchdog active until quite late, and the primary could
implement its own timeout in __cpu_up for secondary coming up, and
IPI it to get traces if necessary which is probably more robust.

Acked-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Cc: Andi Kleen <ak@linux.intel.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Stephane Eranian <eranian@google.com>
> Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
> Cc: iommu@lists.linux-foundation.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: x86@kernel.org
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> ---
> Changes since v5:
>  * Introduced this patch
>=20
> Changes since v4:
>  * N/A
>=20
> Changes since v3:
>  * N/A
>=20
> Changes since v2:
>  * N/A
>=20
> Changes since v1:
>  * N/A
> ---
>  init/main.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/init/main.c b/init/main.c
> index 98182c3c2c4b..62c52c9e4c2b 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1600,9 +1600,11 @@ static noinline void __init kernel_init_freeable(v=
oid)
> =20
>  	rcu_init_tasks_generic();
>  	do_pre_smp_initcalls();
> -	lockup_detector_init();
> =20
>  	smp_init();
> +
> +	lockup_detector_init();
> +
>  	sched_init_smp();
> =20
>  	padata_init();
> --=20
> 2.17.1
>=20
>=20
