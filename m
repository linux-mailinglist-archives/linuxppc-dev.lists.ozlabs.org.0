Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E3D570F62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 03:21:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhjds5zPLz3c6r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 11:21:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UuJ2ptTF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UuJ2ptTF;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhjdG3B0Jz3bmG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 11:21:21 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id s21so6272798pjq.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 18:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=TN/xzFsKJy/KrR3D1bB3jSCuV37Mh0yoh89Gfy+4Y04=;
        b=UuJ2ptTFwc5KV/f4BkJflvNQ2QS1YdV2qiGZM7RgpNhPHKkIKWbXr1x5anUVPj5DDQ
         5Lue1kQOrq9qDQDj/5OaOZW8/OLJym0ZNtsrbQ2CfUeRTj8E+wZFxF3W2uTfJd8lJdBE
         xa4qcKzU22Shu1Hdy/PcRGeSnAdL6JKgQuqcq6bGJVBJYaivikCE8O+4m27QPGD8NAZD
         CeBIEOqRLu9Z8dWqy6HprKt4alxHEYQHdamwxNjGuhNHicXpf214GdT4f1WHDAgfguEw
         MHCh49H4UFR89TSYfj6v+I7y+vz9q6UrIiui1NsrUzDrsjGX1oDYLId9lg5DgCAvmWlS
         Pcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=TN/xzFsKJy/KrR3D1bB3jSCuV37Mh0yoh89Gfy+4Y04=;
        b=HNdnXcR3o415ZhQlMtoEX5WQ+KiXqhTIu4nP8o0mJZMrkDQ+Skj3S1Z7TpgpJ1D1C9
         8SwSEptyZ83sl0sanyztzkq39IK6DTx3TvLn4gVOmmob6jURxWLeMxVeVrtXfs/yCz7f
         Q4/k8j0/3kkcJ0J1stCtOMqIYodQH+Lrm2htx7X+9fBYXSnWQOt89gyHmVy5Vs2qpCgV
         dUsyxsSsdyNqIPkkDiFpaf70lXyPi4zHisMUUFi0k37yqbtvCxuX8JBW1JDkaanGCQyZ
         wT5KbjOObeMHEC083LienMR+RAvbxvV0mjnbDeQOCzu1Mx+ij2dvMH+A4me339wOfLaf
         x+9A==
X-Gm-Message-State: AJIora/iga7W6cft3ZicN7HEbUfFPCSSyYvXr79JjVl+4XGhFgGM5l3w
	c16YApe9vK8nDNXjglMwFew=
X-Google-Smtp-Source: AGRyM1tRDSd4sEIVkkqteP1eS3o3wUOq1DPBZg07rmodSbbB85Hz/iemYQ7Yn+uxpJG/4+1oHjSFAQ==
X-Received: by 2002:a17:902:b488:b0:16a:7013:69f0 with SMTP id y8-20020a170902b48800b0016a701369f0mr21803286plr.118.1657588878144;
        Mon, 11 Jul 2022 18:21:18 -0700 (PDT)
Received: from localhost (193-116-203-247.tpgi.com.au. [193.116.203.247])
        by smtp.gmail.com with ESMTPSA id x15-20020a170902ec8f00b0016bdee4f24asm5412708plg.48.2022.07.11.18.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 18:21:17 -0700 (PDT)
Date: Tue, 12 Jul 2022 11:21:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/4] Extending NMI watchdog during LPM
To: benh@kernel.crashing.org, haren@linux.vnet.ibm.com, Laurent Dufour
	<ldufour@linux.ibm.com>, linux@roeck-us.net, mpe@ellerman.id.au,
	nathanl@linux.ibm.com, paulus@samba.org, wim@linux-watchdog.org
References: <20220627135347.32624-1-ldufour@linux.ibm.com>
In-Reply-To: <20220627135347.32624-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1657587920.49l4tue93d.astroid@bobo.none>
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
> When a partition is transferred, once it arrives at the destination node,
> the partition is active but much of its memory must be transferred from t=
he
> start node.
>=20
> It depends on the activity in the partition, but the more CPU the partiti=
on
> has, the more memory to be transferred is likely to be. This causes laten=
cy
> when accessing pages that need to be transferred, and often, for large
> partitions, it triggers the NMI watchdog.

Importantly, it can require page in of code that runs with irqs=20
disabled, which is unlike a guest normally runs under PowerVM
(but it can under KVM) which is why we enabled the watchdog under
PowerVM but not KVM. So, okay it makes sense to mak an exception
for this case.

Thanks,
Nick

> The NMI watchdog causes the CPU stack to dump where it appears to be
> stuck. In this case, it does not bring much information since it can happ=
en
> during any memory access of the kernel.
>=20
> In addition, the NMI interrupt mechanism is not secure and can generate a
> dump system in the event that the interruption is taken while MSR[RI]=3D0=
.
>=20
> Depending on the LPAR size and load, it may be interesting to extend the
> NMI watchdog timer during the LPM.
>=20
> That's configurable through sysctl with the new introduced variable
> (specific to powerpc) nmi_watchdog_factor. This value represents the
> percentage added to watchdog_tresh to set the NMI watchdog timeout during=
 a
> LPM.
>=20
> Changes in v3:
>  - don't export watchdog_mutex
>  - fix a comment in mobilty.c, wait_for_vasi_session_completed()
>  - fix a build issue when !CONFIG_PPC_WATCHDOG
>  - rework some printk and rename the sysctl variable.
>=20
> v2:
> https://lore.kernel.org/all/20220614135414.37746-1-ldufour@linux.ibm.com/
>=20
> Laurent Dufour (4):
>   powerpc/mobility: wait for memory transfer to complete
>   watchdog: export lockup_detector_reconfigure
>   powerpc/watchdog: introduce a NMI watchdog's factor
>   pseries/mobility: set NMI watchdog factor during LPM
>=20
>  Documentation/admin-guide/sysctl/kernel.rst | 12 +++
>  arch/powerpc/include/asm/nmi.h              |  2 +
>  arch/powerpc/kernel/watchdog.c              | 21 ++++-
>  arch/powerpc/platforms/pseries/mobility.c   | 85 ++++++++++++++++++++-
>  include/linux/nmi.h                         |  2 +
>  kernel/watchdog.c                           | 21 +++--
>  6 files changed, 135 insertions(+), 8 deletions(-)
>=20
> --=20
> 2.36.1
>=20
>=20
