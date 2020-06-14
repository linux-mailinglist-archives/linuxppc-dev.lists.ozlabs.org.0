Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A93201F8811
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 11:26:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49l8GK4NmkzDqSj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 19:26:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZLRTVaEI; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49l8DZ6C9BzDqHj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 19:24:28 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id bh7so5561781plb.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 02:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=LjAA27c4VWDjFfGcWx9GS5l8mgfJyTD1EWscKQYOWbY=;
 b=ZLRTVaEIrXhbcpccaEOa/nCovHZOjUDXgxdFOVwfdSPcXbe/r7jlbm9VeAJZPbT3OS
 KCDJ6ZyorSlK7AAxHzKcdb1c+ngSFO6v3MRZpBqvE520ZcatcNWk4m3JWHDWul7/8VQG
 bUGf95QWa0hKcRkWGFDOytb+TJxzpjTvnpRi/4BhdOKbzFOcf1Y9Q+vp0CeKDkhptMcT
 R4K04yKak27A5Alc3l8wmG8dcXbdsjBrR3uczTERCNT3Nj9Ya3hOv2Ka9jKr3q5Ubgei
 pj51LbgDZRQiD9symYXv5edSr6IGH6eGaE1SCo0wgfmpByFYTk9SW2tDy71rEpqdbkst
 F8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=LjAA27c4VWDjFfGcWx9GS5l8mgfJyTD1EWscKQYOWbY=;
 b=DGl13xQtkVgPOO/nASWlwuzGLzZ7eOCE6JFURsliyT/EbGcUIKUj27/eYD7K9uVfbw
 fFW6JzpFOfYv8Udo2n06DeiqiV07MNw5lIkzFXI1P3IiBseRRnpkcdUlbm1uzI7FNWWD
 9eTNdpGQkjHbavMbtLJgrhR2u3D2yz9zH5TRwUM4ZrP49cDuR+BamYNAwvdLcNIbcqiT
 /tai9/9m0CkTjVa+OPvciuEdU0FqqVZoBSJLfanRTP1wKmsFRZ1V8fruH8sOfR8yp6Sg
 V0wtl/udSnb6H4Iv3nsJl0/30wMvnMGoRs2ihtbcpBB4FITNLSOdR9rLAD/wPWpFfGKk
 uLYg==
X-Gm-Message-State: AOAM531glmsr4cg6ZJhaxUArTdvIDRHy8F9sRhvgPX7f0XL3SZs2APHr
 Jh00zjAz3bmosiBe0DbtvE3KUP1l
X-Google-Smtp-Source: ABdhPJyOXGeGacGFShJ6Hup4BvQDhnhY+/kr73K91VjVDtxb1joXvMlFLJnhZ2qV7hJmVICRMOYLxQ==
X-Received: by 2002:a17:90a:7608:: with SMTP id
 s8mr7275621pjk.159.1592126666137; 
 Sun, 14 Jun 2020 02:24:26 -0700 (PDT)
Received: from localhost (193-116-108-230.tpgi.com.au. [193.116.108.230])
 by smtp.gmail.com with ESMTPSA id iq19sm9351498pjb.48.2020.06.14.02.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 02:24:25 -0700 (PDT)
Date: Sun, 14 Jun 2020 19:24:18 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: indirect function call use bctrl rather than
 blrl in ret_from_kernel_thread
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20200611121119.1015740-1-npiggin@gmail.com>
 <1c6161a5-fa2f-9e19-a7f3-432bbfe3523b@csgroup.eu>
In-Reply-To: <1c6161a5-fa2f-9e19-a7f3-432bbfe3523b@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1592124658.jvrxm8juwi.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of June 11, 2020 10:26 pm:
>=20
>=20
> Le 11/06/2020 =C3=A0 14:11, Nicholas Piggin a =C3=A9crit=C2=A0:
>> blrl is not recommended to use as an indirect function call, as it may
>> corrupt the link stack predictor.
>>=20
>> This is not a performance critical path but this should be fixed for
>> consistency.
>=20
> There's exactly the same in entry_32.S
> Should it be changed there too ... for consistency :) ?
>=20
> ppc32 also uses blrl for calling syscall handler, should it be changed=20
> as well ?

Yes I would say so. I don't know much about 32-bit implementations but
MPC7450 at least has a link stack predictor.

Thanks,
Nick
