Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 654B61ABCBB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 11:24:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492v1C49X8zDr10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 19:23:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492txd1YSXzDrQV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 19:20:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L8qgkmXk; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 492txb6Dsbz8sy0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 19:20:51 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 492txb4tD7z9sRN; Thu, 16 Apr 2020 19:20:51 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L8qgkmXk; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 492txb37BLz9sP7
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 19:20:51 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id t4so1132317plq.12
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=ISswPnrNrNb7nFmczeJsSdHsuzmn6GJTNiO2AA6ZMvY=;
 b=L8qgkmXkYeu5jJTg+ipIJY8BQF5APB04ZGGEk43KAKB0lojbpQytpa19pr5OsPtK3r
 u0gE4p2/Sm7ipWuK8kmQLOm/OFyF5ubhyH5b5GpTxa/OYaK4NRrvY9Fql9R0cd717HbX
 Remjjhg2Y7P1uqUZZJlb3MxqGVrRV+FoGhLYW9icz2UWTSKwJ1nE/OYAIwmpPqcZfLOM
 U7LlkemoVeiNYs4FpIggxNz+yeMHdZin7xrdISnv77d8dGRH6vJokPQnH+fF5jzZYN48
 dhk4jkhYGQwFPqCyMjI1SxcuZkGPWc1g96C9E3iDo0eZ32YYPwtkN+HkyWovgvqf72ne
 A16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ISswPnrNrNb7nFmczeJsSdHsuzmn6GJTNiO2AA6ZMvY=;
 b=ofIymh0xV01Tut+RhQiyIIxDdTYLLRxZWLBlK3ouHAWOT5P2VC0abI8tc/GvGiOyr0
 h5CoxwJgoHYN640eNNGQnvMRcBjzrnFmVr21e1JM+S9AeLS/MwJHf1DBA0WeH5GLvSnY
 s4HI+cJ741S3ysFbQ9Dy537EfPRwwhUUwdts13F55aQudfmf4SZrB9y9ZntPnn1DXtcn
 aRgnqmnb2JnW0PPNlQ2a1922jyQ4rAX2u4uYdbACiansxk2PIb8AEHwLtMUGpVCOXRqV
 xZm5OrDJm4NnfrLEBGfEMITkcYMpadrErKKKquwIggMFvgS8Fp8m1zknuMBtAvc0Vjbb
 TQNw==
X-Gm-Message-State: AGi0PuboxaR9LiSlK2vbdoA9+lEOHi4ONna8DRw6WBk00DR5RVcfG+nZ
 vjd+0Fmh1Fs4ArKUr/R5sY4=
X-Google-Smtp-Source: APiQypIfIWa7ne5B8iyA/iiIAXtW+KwIwjFSYx6zfx/UL24qnf0VWGrY9kqZvVTlfGCEuBUTUc5CVQ==
X-Received: by 2002:a17:90a:fe8:: with SMTP id 95mr4064190pjz.45.1587028849247; 
 Thu, 16 Apr 2020 02:20:49 -0700 (PDT)
Received: from localhost ([203.18.28.220])
 by smtp.gmail.com with ESMTPSA id i128sm7106767pfc.149.2020.04.16.02.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 02:20:48 -0700 (PDT)
Date: Thu, 16 Apr 2020 19:20:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [Skiboot] [PATCH v7 0/4] Support for Self Save API in OPAL
To: ego@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org, linuxram@us.ibm.com, mpe@ellerman.id.au,
 oohall@gmail.com, pratik.r.sampat@gmail.com, Pratik Rajesh Sampat
 <psampat@linux.ibm.com>, skiboot@lists.ozlabs.org
References: <20200416075341.75268-1-psampat@linux.ibm.com>
In-Reply-To: <20200416075341.75268-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1587026695.tnsg4h9617.astroid@bobo.none>
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

Excerpts from Pratik Rajesh Sampat's message of April 16, 2020 5:53 pm:
> v6: https://lists.ozlabs.org/pipermail/skiboot/2020-March/016645.html
> Changelog
> v6 --> v7
> 1. Addressed comments from Gautham for reporting warnings and errors
>=20
> Background
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The power management framework on POWER systems include core idle
> states that lose context. Deep idle states namely "winkle" on POWER8
> and "stop4" and "stop5" on POWER9 can be entered by a CPU to save
> different levels of power, as a consequence of which all the
> hypervisor resources such as SPRs and SCOMs are lost.
>=20
> For most SPRs, saving and restoration of content for SPRs and SCOMs
> is handled by the hypervisor kernel prior to entering an post exit
> from an idle state respectively. However, there is a small set of
> critical SPRs and XSCOMs that are expected to contain sane values even
> before the control is transferred to the hypervisor kernel at system
> reset vector.
>=20
> For this purpose, microcode firmware provides a mechanism to restore
> values on certain SPRs. The communication mechanism between the
> hypervisor kernel and the microcode is a standard interface called
> sleep-winkle-engine (SLW) on Power8 and Stop-API on Power9 which is
> abstracted by OPAL calls from the hypervisor kernel. The Stop-API
> provides an interface known as the self-restore API, to which the SPR
> number and a predefined value to be restored on wake-up from a deep
> stop state is supplied.
>=20
>=20
> Motivation to introduce a new Stop-API
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The self-restore API expects not just the SPR number but also the
> value with which the SPR is restored. This is good for those SPRs such
> as HSPRG0 whose values do not change at runtime, since for them, the
> kernel can invoke the self-restore API at boot time once the values of
> these SPRs are determined.
>=20
> However, there are use-cases where-in the value to be saved cannot be
> known or cannot be updated in the layer it currently is.
> The shortcomings and the new use-cases which cannot be served by the
> existing self-restore API, serves as motivation for a new API:

Thanks for writing this up, it goes some way to help think about the=20
feature.

> Shortcoming1:
> ------------
> In a special wakeup scenario when a CPU is woken up in stop4/5 and
> after the task is done, the HCODE puts it back to stop. The value of
> PSSCR is passed to the HCODE via the self-restore API. The kernel
> currently provides the value of the deepest stop state due to being
> conservative. Thus if a core that was in stop4 was woken up due to
> special wakeup, the HCODE will now put it back to stop5 thus increasing
> the subsequent wakeup latency to ~200us.
> A mechanism is needed in place to update the PSSCR value each time the
> core is woken up due to special wakeup.

This seems like a shortcoming of the wakeup firmware that shouldn't need=20
any APIs to the kernel to solve, but the whole deep sleep wakeup seems=20
like a shortcoming so let's assume they won't do that for whatever=20
reason, then how much of a problem is this really? Are special wakeups=20
that frequent?

> Shortcoming2:
> ------------
> The value of LPCR is dynamic based on if the CPU is entered a stop
> state during cpu idle versus cpu hotplug.
> Today, an additional self-restore call is made before entering
> CPU-Hotplug to clear the PECE1 bit in stop-API so that if we are
> woken up by a special wakeup on an offlined CPU, we go back to stop
> with the the bit cleared.
> There is a overhead of an extra call

This is a self-restore call when we offline or online a CPU? That's not=20
a real problem either, is it?

> New Use-case:
> -------------
> In the case where the hypervisor is running on an
> ultravisor environment, the boot time is too late in the cycle to make
> the self-restore API calls, as these cannot be invoked from an
> non-secure context anymore
>=20
> To address these shortcomings, the firmware provides another API known
> as the self-save API. The self-save API only takes the SPR number as a
> parameter and will ensure that on wakeup from a deep-stop state the
> SPR is restored with the value that it contained prior to entering the
> deep-stop.
>=20

If the ultravisor is deployed in production only systems where we don't=20
use runtime deep-stop states, do we need to handle this case?

Thanks,
Nick
