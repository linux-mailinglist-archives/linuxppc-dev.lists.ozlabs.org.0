Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B003514E6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 14:51:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB32x0ylZz3bxC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 23:51:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Riw9oFPZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Riw9oFPZ; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB32S5kf1z304G
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 23:50:54 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id l76so1451687pga.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 05:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=s1v3fidAYDpwmLsyI5kHChmXm/+w0yZzvzB0w7Tgtn4=;
 b=Riw9oFPZzaNTT4R3g5BsHaUof30xmJ0yPOmxdgN/f/zIZHzzRts8PU4v2f6psxvKHT
 0SPIa8Cu7FV5oYfrtVjTJtGOOxqVRMCV0pr45/srrZdGy5x3Z9dO7LtffmWsd1t6fh0F
 uosAn5RMToaH06zCNe/QCbC/nQUemS84yXRmYpT0y21HiflhWWIBfwPipyXOR4TKBWnr
 BOUQc41gHu91eXCKjax/6rtis+5PkPUepvE2TgYDA8LHTH1IPPhc43WpV+gUi7DmTIJn
 l0guZ7wCoWK4B7a6fDMqneL0KU/8hCuN/3eY+/JZNqxiWFfWllzgTpGLwUfeZqJ3vgT8
 5ftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=s1v3fidAYDpwmLsyI5kHChmXm/+w0yZzvzB0w7Tgtn4=;
 b=Ivl6s10JuXgK+L0OPZqZN3DdOs3quYQy2WSmshOxnyuA7ihi4/69O5zsGWIOou0iUQ
 m9gxoFdPrXTLyULcRDBS2bKdIIiUs8a8Cyvk4MnjobvFfWq2v7HozFoml9rYA8TRB2rb
 BXUcJRRiQEFuz58UJVCdls4W6rI36ApJ0zmb8HvCY/BTicnatTyB9AFPqjPXeZvQHR4I
 X/401XdbuFMagsJavdv4lTlyAuJZdOqgjZeGzJj9N7m5rOBiSTb4kuFmJD+8tVjGO5gE
 RZYsJSPP5FVmNhRQw/jprrZTDvBoQodV/QURmNtvgQF3yiLv5u0Xjb/CpVD5SF7pG3vK
 fo9w==
X-Gm-Message-State: AOAM532404qi16mr6OKNExOunAaiRmrrIYGD90kaOuQFj5xhv5v/X5Sx
 f7EHRzNmZD/UGB2fJr+m7NA=
X-Google-Smtp-Source: ABdhPJzfhpYvO0cpWWfWq2DxWO3CZ6eATE9FgV1oxNarp20S0GGDV2HDjc+SPO3/zZv4OpXGySRPzA==
X-Received: by 2002:a63:5214:: with SMTP id g20mr1274977pgb.158.1617281449682; 
 Thu, 01 Apr 2021 05:50:49 -0700 (PDT)
Received: from localhost ([1.128.223.232])
 by smtp.gmail.com with ESMTPSA id k10sm5475701pfk.205.2021.04.01.05.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 05:50:49 -0700 (PDT)
Date: Thu, 01 Apr 2021 22:50:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 8/9] powerpc/xive: Map one IPI interrupt per node
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20210331144514.892250-1-clg@kaod.org>
 <20210331144514.892250-9-clg@kaod.org>
In-Reply-To: <20210331144514.892250-9-clg@kaod.org>
MIME-Version: 1.0
Message-Id: <1617279896.hl1bn8g3eg.astroid@bobo.none>
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from C=C3=A9dric Le Goater's message of April 1, 2021 12:45 am:
> ipistorm [*] can be used to benchmark the raw interrupt rate of an
> interrupt controller by measuring the number of IPIs a system can
> sustain. When applied to the XIVE interrupt controller of POWER9 and
> POWER10 systems, a significant drop of the interrupt rate can be
> observed when crossing the second node boundary.
>=20
> This is due to the fact that a single IPI interrupt is used for all
> CPUs of the system. The structure is shared and the cache line updates
> impact greatly the traffic between nodes and the overall IPI
> performance.
>=20
> As a workaround, the impact can be reduced by deactivating the IRQ
> lockup detector ("noirqdebug") which does a lot of accounting in the
> Linux IRQ descriptor structure and is responsible for most of the
> performance penalty.
>=20
> As a fix, this proposal allocates an IPI interrupt per node, to be
> shared by all CPUs of that node. It solves the scaling issue, the IRQ
> lockup detector still has an impact but the XIVE interrupt rate scales
> linearly. It also improves the "noirqdebug" case as showed in the
> tables below.
>=20
>  * P9 DD2.2 - 2s * 64 threads
>=20
>                                                "noirqdebug"
>                         Mint/s                    Mint/s
>  chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys
>  --------------------------------------------------------------
>  1      0-15     4.984023   4.875405       4.996536   5.048892
>         0-31    10.879164  10.544040      10.757632  11.037859
>         0-47    15.345301  14.688764      14.926520  15.310053
>         0-63    17.064907  17.066812      17.613416  17.874511
>  2      0-79    11.768764  21.650749      22.689120  22.566508
>         0-95    10.616812  26.878789      28.434703  28.320324
>         0-111   10.151693  31.397803      31.771773  32.388122
>         0-127    9.948502  33.139336      34.875716  35.224548
>=20
>  * P10 DD1 - 4s (not homogeneous) 352 threads
>=20
>                                                "noirqdebug"
>                         Mint/s                    Mint/s
>  chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys
>  --------------------------------------------------------------
>  1      0-15     2.409402   2.364108       2.383303   2.395091
>         0-31     6.028325   6.046075       6.089999   6.073750
>         0-47     8.655178   8.644531       8.712830   8.724702
>         0-63    11.629652  11.735953      12.088203  12.055979
>         0-79    14.392321  14.729959      14.986701  14.973073
>         0-95    12.604158  13.004034      17.528748  17.568095
>  2      0-111    9.767753  13.719831      19.968606  20.024218
>         0-127    6.744566  16.418854      22.898066  22.995110
>         0-143    6.005699  19.174421      25.425622  25.417541
>         0-159    5.649719  21.938836      27.952662  28.059603
>         0-175    5.441410  24.109484      31.133915  31.127996
>  3      0-191    5.318341  24.405322      33.999221  33.775354
>         0-207    5.191382  26.449769      36.050161  35.867307
>         0-223    5.102790  29.356943      39.544135  39.508169
>         0-239    5.035295  31.933051      42.135075  42.071975
>         0-255    4.969209  34.477367      44.655395  44.757074
>  4      0-271    4.907652  35.887016      47.080545  47.318537
>         0-287    4.839581  38.076137      50.464307  50.636219
>         0-303    4.786031  40.881319      53.478684  53.310759
>         0-319    4.743750  43.448424      56.388102  55.973969
>         0-335    4.709936  45.623532      59.400930  58.926857
>         0-351    4.681413  45.646151      62.035804  61.830057
>=20
> [*] https://github.com/antonblanchard/ipistorm
>=20
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Very nice result but the default-on irqdebug code is quite a slowdown
even with your improvements.

Is the main cacheline bouncing in the fast path coming from=20
desc->irq_count++ of the percpu handler? Can we do something quick and=20
dirty like the attached patch?

All this stuff seems totally racy with percpu handler but maybe that
doesn't matter too much (and anyway it would be a much bigger change)

Thanks,
Nick

---
 kernel/irq/spurious.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/spurious.c b/kernel/irq/spurious.c
index f865e5f4d382..6b17b737ee6c 100644
--- a/kernel/irq/spurious.c
+++ b/kernel/irq/spurious.c
@@ -378,7 +378,8 @@ void note_interrupt(struct irq_desc *desc, irqreturn_t =
action_ret)
 			 * then we merily delay the spurious detection
 			 * by one hard interrupt. Not a real problem.
 			 */
-			desc->threads_handled_last &=3D ~SPURIOUS_DEFERRED;
+			if (desc->threads_handled_last & SPURIOUS_DEFERRED)
+				desc->threads_handled_last &=3D ~SPURIOUS_DEFERRED;
 		}
 	}
=20
@@ -403,6 +404,10 @@ void note_interrupt(struct irq_desc *desc, irqreturn_t=
 action_ret)
 			desc->irqs_unhandled -=3D ok;
 	}
=20
+	if (likely(!desc->irqs_unhandled))
+		return;
+
+	/* Now getting into unhandled irq detection */
 	desc->irq_count++;
 	if (likely(desc->irq_count < 100000))
 		return;
--=20
2.23.0



