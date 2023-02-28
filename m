Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 364706A5682
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 11:22:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQtjL0ZG0z3cKm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 21:22:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MjOzX8b5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=msl0000023508@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MjOzX8b5;
	dkim-atps=neutral
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQqxm5dQDz3bjv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 19:18:18 +1100 (AEDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-536bbef1c5eso248573417b3.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LD5KPX7LVPT7ALOji1Tt20TiXcy2sKJ/9LNj91SBJig=;
        b=MjOzX8b51IkE7h+Ejr3WIRfO2MHzdszZ2VopDPBIW/lvHvcihCjikECXp5AHTHXVxF
         Y3ucbcBwobPWBSE31Xa1PbSt5extM2rnvpa7VUg43Ht/Wvl2A8BoJLOJ6J7x7LGX98YZ
         xYweDqrXXorDas1cZ4brQwwE8PQrHX+JMimZREe6jc/6H/48vBX28wtTtAealmZ1guLE
         25b+DhRV2enigRdN3uKSIJ3G0Gy9rL8guLs8MjYr0aMPxWYTgDJBIQfaEnJZidx9nTEE
         Um463Pmf94OtbeJrL7N/a/5816g3sPeYNwvBnPMDO6zCDX76YiZiKj4aFOE9JA/L1Y1X
         OlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LD5KPX7LVPT7ALOji1Tt20TiXcy2sKJ/9LNj91SBJig=;
        b=6qdjbZ3Zlm515S9ChriJLPB8tKq0wEbCAg/zKjrYqaDdmXAsrmbkwpHtSNc6fqn3uc
         btNObdTUQ4SPVb2lO1XwE2xGYp90u1sZ6Nf7Atwyw4joF6jR58uf9uQbTqB9Rx4/MLH0
         nUEvwUz0QILDMH7wdCZO4q3lM5QtubAY6gtZef4Eihx3EtWCjSaAMY4Sb6b4QPiPgR2P
         T8q0Yk2WouoYa0WFzEFfVD8S4uslij1/Xr+HotFAky+Y/uXpvYaUi9H5VpRGsSQcaw8b
         XujdODufasJKt0U0r4OMi9ilm68s4Im6vbaiH/+P/j44KOFXnFuzaJv/Pnykf6LcnMFc
         VE0w==
X-Gm-Message-State: AO0yUKX8kKDfZQAVjDpxM8+JGBaRzyJ+swOE2oAZkOk+Hm52PuxBQVvn
	WkN1coISZE6C56AYk7XiPNfoWbkGQ68E6O1F42M=
X-Google-Smtp-Source: AK7set+y5FLVXs+Yn5Y205wNgJuzeERu7oWP4puNYaoJVrVgE6Nf2v3LuDfF5BldXJwgXqCpI2sP2kx73BuLcMfGZjI=
X-Received: by 2002:a81:431c:0:b0:52e:b22b:f99 with SMTP id
 q28-20020a81431c000000b0052eb22b0f99mr1120913ywa.4.1677572293484; Tue, 28 Feb
 2023 00:18:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7000:a309:b0:480:bd65:1f87 with HTTP; Tue, 28 Feb 2023
 00:18:12 -0800 (PST)
From: =?UTF-8?B?546L5piK54S2?= <msl0000023508@gmail.com>
Date: Tue, 28 Feb 2023 16:18:12 +0800
Message-ID: <CAPge7ycxEpms_wQoDoCncz743N2BfzVCZPLmbHCVTs6ZKSp=nA@mail.gmail.com>
Subject: Symbol cpu_feature_keys should be exported to all modules on powerpc
To: stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 28 Feb 2023 21:21:59 +1100
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
Cc: Kevin Hao <haokexin@gmail.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Just like symbol 'mmu_feature_keys'[1], 'cpu_feature_keys' was referenced
indirectly by many inline functions; any GPL-incompatible modules using such
a function will be potentially broken due to 'cpu_feature_keys' being
exported as GPL-only.

For example it still breaks ZFS, see
https://github.com/openzfs/zfs/issues/14545

[1]: https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220329085709.4132729-1-haokexin@gmail.com/
