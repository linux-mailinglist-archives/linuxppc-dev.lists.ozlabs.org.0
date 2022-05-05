Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D45651C418
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 17:41:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvHwZ0nYfz3c96
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 01:41:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D0b/LzZP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D0b/LzZP; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvHvw4m8gz2yS3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 01:40:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD411B82C69
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 15:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0616C385A8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 15:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651765222;
 bh=L8Fn2QpjvRiO3TEnhoUJuJYihx1piB1iKAyPMCvAhec=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D0b/LzZPQf5y9jWOu6bvmEQDxT9PZEEe8Q6+tWNNAcbLbusUWmm1GzdV4SEK0MCxE
 Du/gNnBnBVkCtJdAQala4tdqWquBZ/mSroFHwAM1GO6Pqxrue8Pr1mESTKlWxEFq4d
 z5MbhPJd64pTo/3NqHi1ef+dQaNcVWgAoJTDwkoxmH2aUxBy5/6mE4mtRVJ1zk9ICD
 OwWdiTBWHpuw5Dg+kf3Iac09ETfvd9eQ8+Q1yiIxsydQwd7r/SkhI388cVUcoY67hm
 iBFK8oEa5jF0hvIqu4o3ZuThJsjCnQC2o+5CesQuq9ftDJuNmmsse8RB2MGVfbrioc
 C/Eal/XeLEVJw==
Received: by mail-pj1-f48.google.com with SMTP id iq10so4562446pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 May 2022 08:40:22 -0700 (PDT)
X-Gm-Message-State: AOAM53390ECm2YUzdWlNce0k0C0xj01VCGxV8iZ51fkvhArjh9wvXy9t
 XJzYDmSDiLWn/Q5bVYcpC8Nxxb4jZnXRnC79/A==
X-Google-Smtp-Source: ABdhPJzhmSe8MBSXLNIzfIAKACuSqoqdkwHZ3px74LTROha4izEqkIjWi4YfV/EIwUf9ri7fN/cX9xltHMn/uwh/Qi0=
X-Received: by 2002:a17:902:e481:b0:15c:dc24:64e8 with SMTP id
 i1-20020a170902e48100b0015cdc2464e8mr28432372ple.35.1651765222168; Thu, 05
 May 2022 08:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220504180822.29782-1-pali@kernel.org>
In-Reply-To: <20220504180822.29782-1-pali@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 5 May 2022 10:40:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLKjd3zPssbTo=mBfoa6nV144k9TamStk-jO3QbunmSAw@mail.gmail.com>
Message-ID: <CAL_JsqLKjd3zPssbTo=mBfoa6nV144k9TamStk-jO3QbunmSAw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/85xx: P2020: Add law_trgt_if property to PCIe DT
 nodes
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 4, 2022 at 1:09 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
>
> DT law_trgt_if property defines Local Access Window Target Interface.

Documentation?

fsl,law-trgt-if would be the preferred form.

> Local Access Window Target Interface is used for identifying individual
> peripheral and mapping its memory to CPU. Interface id is defined by
> hardware itself.

Normally, we avoid instance indices like this, but if it is more than
just documentation convention maybe that's fine.

Rob
