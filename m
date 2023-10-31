Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7B97DD83D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 23:26:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=o20+dDTq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKl9Q2tTsz3cV6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 09:26:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=o20+dDTq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=dimitri.ledkov@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKVDm4yRrz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 23:43:35 +1100 (AEDT)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 00FB93F1D9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 12:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698756209;
	bh=TWlHvfqzW08hhviWU907m+JvbPrmK9OV3LEKQy9qTqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=o20+dDTqkbrQXplDgrXglygao75sHLm0iyenSRj4O6izVUoAoH4hDHOtFxcoLdhD+
	 0SZAZxHCdkVxicQEpFkQeLLEayn8REdM3H6av8rEJCQ9Icsc7VyM3iDfWRzjXx1Whg
	 0IMF8IAOIp+bYYBtN5AvmLs5EtHxTnnhnUFjR6WMrLPPIVnNJ0xkwgwjjqse+u1QhD
	 z06OAuSzdVI4aYqNaNoZtte4KsCkbKMVR8VPSV5rwogUP5WKZrbh6HvAUx2yksBTwi
	 nvRtN5xc9fv++6IL89xQNNQZ2w05u/mavJLgVkh6xDcZS05UcBalWi1K2VFQumIzv0
	 l+9keEjCBOjmA==
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-32f790a39d2so1450727f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 05:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698756208; x=1699361008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWlHvfqzW08hhviWU907m+JvbPrmK9OV3LEKQy9qTqk=;
        b=fQaiwWmzn5miMKa8889uHgxbG6yfKdduOtaA7MbsL1M8aFvrwcoYfxN/F4sCxz+hXk
         0C/JYFNPksynUb3eRA0N2WYOziwVnZune7l+uwr3Rtw7yG91ZdMkIH9G8p33IozdKkEy
         JwLRGkDesOTfmVrw7H2Gi6kGkEyvZJH2+9ZDoirjY8zDC3srGIMQQprf5YziV/CntV0Z
         yrUYWESPmKtvGun32MkXEaHd/7OY+1lFyBr89k5EQBtJX+QWFDRK+R/GMes2QAbUukU8
         nMftxXsWIibLxnny1/NdatB1fvv72xAxQgFi2drThiRJ0NkrcHP6+5bP0pK3JXz1ch3r
         WKqQ==
X-Gm-Message-State: AOJu0YwhV1AfqNbAG17q60Upz97ewm+rEwXwiO+q/VJbnV89+SURza7Z
	+X2EacuFfByyS4Sb6YzaAzvsg8AAhx8zPDv38DXool9aD20UakSa8XM43SzhIt7fWWiZDU0hBst
	BJjf0/nt2DOtXnV9BdZeqiWKx1+JwDVtJ34pMWM7mhv9W/Np7C9t6fi99WAA=
X-Received: by 2002:a05:6000:2cb:b0:32f:7f2c:de2e with SMTP id o11-20020a05600002cb00b0032f7f2cde2emr7611016wry.36.1698756208350;
        Tue, 31 Oct 2023 05:43:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2Bt006mBK17Bc+TrTxp8GQwF9PfVFIAW7TfjXGIuFHSfstzZosDHrkRwJhCuJGaEX2N4iuuxX+GvsjnIAIR8=
X-Received: by 2002:a05:6000:2cb:b0:32f:7f2c:de2e with SMTP id
 o11-20020a05600002cb00b0032f7f2cde2emr7611001wry.36.1698756208055; Tue, 31
 Oct 2023 05:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <2721FCA5-6113-4B2E-8DA9-893105EE966C@linux.ibm.com>
In-Reply-To: <2721FCA5-6113-4B2E-8DA9-893105EE966C@linux.ibm.com>
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date: Tue, 31 Oct 2023 14:42:52 +0200
Message-ID: <CADWks+a9UJM9trjJf-VOi21rfA9eetXP8KPyThqP56kKpZ-yug@mail.gmail.com>
Subject: Re: [ppc64le] WARN at crypto/testmgr.c:5804
To: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 01 Nov 2023 09:25:51 +1100
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
Cc: linux-next@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 31 Oct 2023 at 14:09, Sachin Sant <sachinp@linux.ibm.com> wrote:
>
> Following warning is observed during boot of latest -next
> kernel (6.6.0-rc7-next-20231030 and todays -next) on IBM Power server.
>
> [ 0.085775] workingset: timestamp_bits=3D38 max_order=3D20 bucket_order=
=3D0
> [ 0.085801] zbud: loaded
> [ 0.086473] ------------[ cut here ]------------
> [ 0.086477] WARNING: CPU: 23 PID: 211 at crypto/testmgr.c:5804 alg_test.p=
art.33+0x308/0x740
> [ 0.086486] Modules linked in:
> [ 0.086489] CPU: 23 PID: 211 Comm: cryptomgr_test Not tainted 6.6.0-rc7-n=
ext-20231030 #1
> [ 0.086493] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 =
of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
> [ 0.086497] NIP: c000000000765068 LR: c000000000764ff4 CTR: c00000000075d=
a00
> [ 0.086500] REGS: c00000000ed7bb50 TRAP: 0700 Not tainted (6.6.0-rc7-next=
-20231030)
> [ 0.086503] MSR: 8000000000029033 <SF,EE,ME,IR,DR,RI,LE> CR: 80000284 XER=
: 20040002
> [ 0.086511] CFAR: c000000000765318 IRQMASK: 1
> GPR00: c000000000764ff4 c00000000ed7bdf0 c000000001482000 000000000000000=
2
> GPR04: c00000000ed7be60 000000000000000e 000000000000002f fffffffffffe000=
0
> GPR08: 0000ff000000ffff 0000000000000001 0000000000000008 000000000000000=
0
> GPR12: c00000000075da00 c000000aa7cec700 c00000000019da88 c000000006df9cc=
0
> GPR16: 0000000000000000 0000000000000000 c000000001309f98 000000000000000=
0
> GPR20: c000000001308d50 c000000001308d98 c000000000ffeaf0 c000000001309fb=
0
> GPR24: c000000000ffb330 c000000000ffdf30 0000000000000400 c000000019bfd48=
0
> GPR28: 0000000000000002 c000000019bfd400 c000000002bcf633 000000000000000=
e
> [ 0.086547] NIP [c000000000765068] alg_test.part.33+0x308/0x740
> [ 0.086552] LR [c000000000764ff4] alg_test.part.33+0x294/0x740
> [ 0.086556] Call Trace:
> [ 0.086557] [c00000000ed7bdf0] [c000000000764ff4] alg_test.part.33+0x294/=
0x740 (unreliable)
> [ 0.086563] [c00000000ed7bf60] [c00000000075da34] cryptomgr_test+0x34/0x7=
0
> [ 0.086568] [c00000000ed7bf90] [c00000000019dbb8] kthread+0x138/0x140
> [ 0.086573] [c00000000ed7bfe0] [c00000000000df98] start_kernel_thread+0x1=
4/0x18
> [ 0.086578] Code: fb210138 fb810150 3af76d20 3b80ffff 3a526d38 3a946d50 3=
ab56d98 3b380040 3ad837c0 2f9c0000 7d301026 5529f7fe <0b090000> 7f890034 55=
29d97e 419d03a4
> [ 0.086589] ---[ end trace 0000000000000000 ]---
> [ 0.086592] testmgr: alg_test_descs entries in wrong order: 'pkcs1pad(rsa=
,sha512)' before 'pkcs1pad(rsa,sha3-256)=E2=80=99
>
> Git bisect points to following patch:
> commit ee62afb9d02dd279a7b73245614f13f8fe777a6d
>     crypto: rsa-pkcs1pad - Add FIPS 202 SHA-3 support
>
> - Sachin

Patch to address this was submitted at
https://lore.kernel.org/all/20231027195206.46643-1-ebiggers@kernel.org/
and should address this issue.

--
okurrr,

Dimitri
