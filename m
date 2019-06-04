Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA37350E1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 22:31:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JNq65YHXzDqVQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 06:30:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.193; helo=mail-oi1-f193.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JNnZ3Z2JzDqR3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 06:29:38 +1000 (AEST)
Received: by mail-oi1-f193.google.com with SMTP id q186so16633193oia.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 13:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ShuaCglHMPdgyal6GGIwZRaEUD77Ogg+O3HSaYQ63/E=;
 b=nEUqFsC/wKx9nfmvUGVq1/zbGpFNJ6NLA/cdxPzqC3QyWSYL07KAAL3LoAGR5F+J4A
 ZBcdz4wPu6rpYP41A4yis1RmjRQfiW3XeQEztcUHqoTL9DBwSO+2oJO64nSCE8yfgbCR
 YwdKIeREwksVAqJQYCiy5QoT5TPo8WHT10Rg7BLtqIrd9jojG/aVqmvXRQ30NHA6qCJ4
 geWm+Iu5W9Ns027y3WYGIOHczcscyqY7Q/DitNHGVqRsVzy+TmbUAzQHHJcScJp26WL4
 QfiQjnIsPIIfkZB++yERy7Nk/KyGKgzNZqvYgguobSaV/mSoYhl0hVoCo4ClCXqX/Mw3
 VjYQ==
X-Gm-Message-State: APjAAAV9OJsgASMCsptfNVSaJAR2J/SrldKBFEHHvfKoin3w12sxWv2R
 +Ck0Hzo5NBAadhRmxiKwI5tKg+zZIm4=
X-Google-Smtp-Source: APXvYqx1IbthGyXA78DuHou4nFBVq1EFPjKV93u1NgcR5poDl31LTXP3kkbcnYXz5+hwu29G7wpoew==
X-Received: by 2002:aca:5bd6:: with SMTP id p205mr5534173oib.67.1559680174927; 
 Tue, 04 Jun 2019 13:29:34 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com.
 [209.85.210.42])
 by smtp.gmail.com with ESMTPSA id g16sm6192442otl.40.2019.06.04.13.29.33
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 13:29:34 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id l15so1093479otn.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 13:29:33 -0700 (PDT)
X-Received: by 2002:a9d:6058:: with SMTP id v24mr441623otj.110.1559680173629; 
 Tue, 04 Jun 2019 13:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190513111442.25724-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190513111442.25724-1-rasmus.villemoes@prevas.dk>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 4 Jun 2019 15:29:22 -0500
X-Gmail-Original-Message-ID: <CADRPPNRfAk2ZWJQt=Wx5SEqvw4iSpzkj8_XvHa_CZYHDAxFgxg@mail.gmail.com>
Message-ID: <CADRPPNRfAk2ZWJQt=Wx5SEqvw4iSpzkj8_XvHa_CZYHDAxFgxg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] soc/fsl/qe: cleanups and new DT binding
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Scott Wood <oss@buserror.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
 Rob Herring <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 13, 2019 at 6:17 AM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> This small series consists of some small cleanups and simplifications
> of the QUICC engine driver, and introduces a new DT binding that makes
> it much easier to support other variants of the QUICC engine IP block
> that appears in the wild: There's no reason to expect in general that
> the number of valid SNUMs uniquely determines the set of such, so it's
> better to simply let the device tree specify the values (and,
> implicitly via the array length, also the count).
>
> Which tree should this go through?
>
> v3:
> - Move example from commit log into binding document (adapting to
>   MPC8360 which the existing example pertains to).
> - Add more review tags.
> - Fix minor style issue.
>
> v2:
> - Address comments from Christophe Leroy
> - Add his Reviewed-by to 1/6 and 3/6
> - Split DT binding update to separate patch as per
>   Documentation/devicetree/bindings/submitting-patches.txt
>
> Rasmus Villemoes (6):
>   soc/fsl/qe: qe.c: drop useless static qualifier
>   soc/fsl/qe: qe.c: reduce static memory footprint by 1.7K
>   soc/fsl/qe: qe.c: introduce qe_get_device_node helper
>   dt-bindings: soc/fsl: qe: document new fsl,qe-snums binding
>   soc/fsl/qe: qe.c: support fsl,qe-snums property
>   soc/fsl/qe: qe.c: fold qe_get_num_of_snums into qe_snums_init

Series applied to soc/fsl for-next.  Thanks!

Regards,
Leo

>
>  .../devicetree/bindings/soc/fsl/cpm_qe/qe.txt |  13 +-
>  drivers/soc/fsl/qe/qe.c                       | 163 +++++++-----------
>  2 files changed, 77 insertions(+), 99 deletions(-)
>
> --
> 2.20.1
>
