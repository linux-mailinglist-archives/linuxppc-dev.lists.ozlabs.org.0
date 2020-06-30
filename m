Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CA220EB7A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 04:31:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wpJB5CPMzDqgV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 12:31:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bIriXmoh; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wpGN22RjzDqQT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 12:29:32 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id f18so10482403wrs.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 19:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=fG2+FlqjbrdlLbr3Ppcqc3zl/OoR7H2pDj/tVDccong=;
 b=bIriXmohgKziJJP/cp+ODrk3HzaUmkMIXU1VeFWkC9Y7Gh3gvxW7kDuvebiWlEIbX0
 dF+7zKxXWVixBgcINDP0/bXyrpksoI0TLLKU68kJT5qbpi2MUZ2e1vFBj/KnGJP8icPu
 QWwR2GYoPmzv/NpVjCdlsE0CW8nkqzjJE3NCZ4b1CzIWc++lS7TfyGiQ8gvD/4QicCZv
 QlInoexH02eCKAPJCI0m8tH4MGCiLkSRRcC547qFPCYmDPiAdbbqYUkjXLk6zOATtHcl
 FyduJAtq9rro3kSoca2SWwinrnD0CGmwF0NyJReM/y3dXo/6jEVc3Y2ohhh6Z2IDGczT
 CaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=fG2+FlqjbrdlLbr3Ppcqc3zl/OoR7H2pDj/tVDccong=;
 b=GysqGS5VFsjlbmFdyKJCERV8yRem0+j7fZZzJMsCXmEkdZoFACPRtTZ9ft85t2djn7
 gyAY4WnQGSI3B8umhJx9wDfK4mUfDOa3dbDCAVxBdgt0pGHOJ9O870vcppbxj5ziiXSZ
 kFd+81DKtosXg6vA4RW/dWvFnAAAtLgBOMYO/3tA1a2bKl4V8p2c2Zu7VgB3SiqKT0ic
 h4Nlkz+uWnZsfqa8Ql1euJOKtvXSwBojSeHM7bSrH0rUJ9mE2CrU3sH8lk1C7ZJY948V
 F3NEBd6RHDfsg3vHZrdz3F2CDck49/M0se/K0c8k2NJTaiZkxhLsMPRCFZhQ2OGq896P
 nEgA==
X-Gm-Message-State: AOAM532+i6MzCDHBlK96i2zAIEia49DREO5y5ND134XYOByKdC0zLBdW
 lbyXYb2jwG3k3PhsAHTmZNc=
X-Google-Smtp-Source: ABdhPJxQy/N+VHD3JrQe6Tp7EZYtKpUgN45eNTRvW+FDA05VVkkCSsrogKCJ1TUhuvWPNWWH5nxT6Q==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr19488668wrt.108.1593484169436; 
 Mon, 29 Jun 2020 19:29:29 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id a22sm1792381wmj.9.2020.06.29.19.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 19:29:28 -0700 (PDT)
Date: Tue, 30 Jun 2020 12:29:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] xmon: Reset RCU and soft lockup watchdogs
To: Anton Blanchard <anton@ozlabs.org>, linuxppc-dev@lists.ozlabs.org
References: <20200630100218.62a3c3fb@kryten.localdomain>
In-Reply-To: <20200630100218.62a3c3fb@kryten.localdomain>
MIME-Version: 1.0
Message-Id: <1593484122.fip6nom71z.astroid@bobo.none>
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
Cc: Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Anton Blanchard's message of June 30, 2020 10:02 am:
> I'm seeing RCU warnings when exiting xmon. xmon resets the NMI watchdog,
> but does nothing with the RCU stall or soft lockup watchdogs. Add a
> helper function that handles all three.
>=20
> Signed-off-by: Anton Blanchard <anton@ozlabs.org>

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/xmon/xmon.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 7efe4bc3ccf6..d27944e38b04 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -481,6 +481,13 @@ static inline int unrecoverable_excp(struct pt_regs =
*regs)
>  #endif
>  }
> =20
> +static void xmon_touch_watchdogs(void)
> +{
> +	touch_softlockup_watchdog_sync();
> +	rcu_cpu_stall_reset();
> +	touch_nmi_watchdog();
> +}
> +
>  static int xmon_core(struct pt_regs *regs, int fromipi)
>  {
>  	int cmd =3D 0;
> @@ -718,7 +725,7 @@ static int xmon_core(struct pt_regs *regs, int fromip=
i)
>  	else
>  		insert_cpu_bpts();
> =20
> -	touch_nmi_watchdog();
> +	xmon_touch_watchdogs();
>  	local_irq_restore(flags);
> =20
>  	return cmd !=3D 'X' && cmd !=3D EOF;
> --=20
> 2.26.2
>=20
>=20
