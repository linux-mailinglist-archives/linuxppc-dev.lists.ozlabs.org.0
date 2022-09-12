Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A224F5B5B8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 15:47:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR7FS4m3gz300V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 23:47:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=azbUkrG7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=azbUkrG7;
	dkim-atps=neutral
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR7Dn1DRqz2yWK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 23:46:46 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-3450990b0aeso101182417b3.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=rx0FZgTO9IBRagj5Cbyi8/i3+E1D6OoMHMzWe4zqNzk=;
        b=azbUkrG7cwFkn9DeX7B5eU2E6cvjPeREaFlQ3AMkCzsas9cqfPY2dD8gSX+0lK4GHY
         kDqnIfB3KCzkuergCYvfNcznscxCLlJyA25Uah4+iXR01P7grHLV6PMTfYkdXt1xR3YR
         lc2yxAoS6HW4CvhmgZtD4sO9oIvZtFjcWJSM4ZoUz6PpvNFh3SrI+6SX4kF5o1CluuSb
         mBZx5Lyt2pEbRMSII2JzyKV/7H/n+DTotm++iXGDyqCKY1Qhh2xf6PlWrhXfQEGN0ytx
         9SIRSeHPYJAWfcMtZSs1voPA+NghqMFwX6LYOPk3RRe4zmtuGp2POVzyWcCZeoGU4A0n
         P6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=rx0FZgTO9IBRagj5Cbyi8/i3+E1D6OoMHMzWe4zqNzk=;
        b=Ntw9vHUaQx0fucAVPTYvVAVY8Co1T1foPzxMitYt66E1rlqS3sTwlPVAaamMhre4qp
         OOkzlOSxOFvpRCpbqCUFQqmRh+VILZjaK9uDs6HColze8Z/71emcDDLFZ7L0CmzswRWC
         TrmRQID7fUmXO66s0onS0o7SxyvYGeuZbjhuK4BTolmzkAraLUVhXoM7isq+nJFpg69a
         Ygiw92s9zi7r394P+A3Fi9ZVhiiix4WX/YIcd7scgrfEWRP5hG2ol6/VMbSFoD9JbdYf
         b6rTvf0IDKw0kChBbIezaK2zABci3w1lHn3pZx7kTyz+VRQI/BZkEyGG5nksQ9BG0N43
         ojMg==
X-Gm-Message-State: ACgBeo0x6Sk0GyMHefdUzAI7Z2sGCBrcHD11wwy+/Cl0G4nzUVKZxyPl
	/a4RnqBefe55TTNS+SAFpv4RIqOCk/YGdJMu1sA=
X-Google-Smtp-Source: AA6agR7npTsXp5Eh0fjwXRhZVPwc+KWxi6IL4YUNFlFsuoKzYxKVXYjVnaz/m2qfW/MtX7cnzsfFlehsR+kcMKFmHdE=
X-Received: by 2002:a0d:f2c6:0:b0:329:c117:c990 with SMTP id
 b189-20020a0df2c6000000b00329c117c990mr22531545ywf.464.1662990403462; Mon, 12
 Sep 2022 06:46:43 -0700 (PDT)
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 12 Sep 2022 15:46:32 +0200
Message-ID: <CAKXUXMzQDy-A5n8gvHaT9s21dn_ThuW0frCgm_tXMHPUhLY2zA@mail.gmail.com>
Subject: State of RFC PATCH Remove CONFIG_DCACHE_WORD_ACCESS
To: Joe Perches <joe@perches.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	kernel-janitors <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Joe, hi Ben,

While reviewing some kernel config, I came across
CONFIG_DCACHE_WORD_ACCESS and tried to understand its purpose.

Then, I discovered this RFC patch from 2014 that seems never to have
been integrated:

https://lore.kernel.org/all/1393964591.20435.58.camel@joe-AO722/
[RFC] Remove CONFIG_DCACHE_WORD_ACCESS

The discussion seemed to just not continue and the patch was just not
integrated by anyone.

In the meantime, the use of CONFIG_DCACHE_WORD_ACCESS has spread into
a few more files, but replacing it with
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS still seems feasible.

Are you aware of reasons that this patch from 2014 should not be integrated?

I would spend some time to move the integration of this patch further
if you consider that the patch is not completely wrong.


Best regards,

Lukas
