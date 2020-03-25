Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7B5191F94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 04:13:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nCqp5ZJPzDqth
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 14:13:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=swboyd@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=H4706YZq; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nC884ttnzDqcx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 13:42:29 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id w9so404839pjh.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 19:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=tJVGZmmA1bFjoevn7/qDYyyvIJ/eyc0u4ubgnC7ziTY=;
 b=H4706YZqf8/zScGoFg12vybnR9M2VsIQVJgSz3rS1dHY9dQHDGFEdxDFbUd7d1zTgX
 a1SAGpNqJGQq66/k++qcyoET2sxmyH3emD3uXnYHai1yW2TdH35PONdQL7aDm0PfPzyp
 tYlxhgWpkpR2jgcSCMS6Pg5GkhF65IhQxffKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=tJVGZmmA1bFjoevn7/qDYyyvIJ/eyc0u4ubgnC7ziTY=;
 b=EcJzQTFrCNTfQSKJnm1IBfMHj0ZB7rskGcIiwTYveCmE14d0iAM5iqEx2vSNff2r60
 6IlPdRt8w30na6/pxcANwacGY4nYpAyJ3jdFNUqbxjpuyWguXcuJPBviydntJHB/Blja
 JTrf6RXmFNpTzMa5A68pMGVfh2eigv2FH4WMgaLPRaoSIoQ3wzq+/A5WYoS5SMmVVuWj
 2eRkt+Kvdbt5onoQCZ0o0stKAEZBw8ZUg8kdxeRIn0eB6zN+PjKPxIdzaEb6WFV22x4q
 km3JPhMVnSYbdzKPPfe5l8janvyTCugyj1kxmaofCE9wO31txZ0OBPOP/lophJVfa1RK
 DiOg==
X-Gm-Message-State: ANhLgQ2pVNLkAcmSe8XnoLhrNreW6oaNcYF/fcxN2aqxcrkih+OdQ7iL
 TNFubH7rV+0r+RZa4bHznkHlCQ==
X-Google-Smtp-Source: ADFU+vtS5LbLrzS1jhzDwYVrTj6A9lZWX06g/Mga4Nlp7aFIrRyOCBB7aq2FIo/kyw4uUBQ1+JG/MQ==
X-Received: by 2002:a17:90a:33d1:: with SMTP id
 n75mr1033588pjb.167.1585104145832; 
 Tue, 24 Mar 2020 19:42:25 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id x4sm858194pgr.9.2020.03.24.19.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 19:42:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5cfeed6df208b74913312a1c97235ee615180f91.1582361737.git.mchehab+huawei@kernel.org>
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
 <5cfeed6df208b74913312a1c97235ee615180f91.1582361737.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH 3/7] docs: fix broken references to text files
From: Stephen Boyd <swboyd@chromium.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Tue, 24 Mar 2020 19:42:24 -0700
Message-ID: <158510414428.125146.17397141028775937874@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Wed, 25 Mar 2020 14:12:08 +1100
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
Cc: linux-arch@vger.kernel.org, linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, netdev@vger.kernel.org,
 linux-unionfs@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Mauro Carvalho Chehab (2020-02-22 01:00:03)
> Several references got broken due to txt to ReST conversion.
>=20
> Several of them can be automatically fixed with:
>=20
>         scripts/documentation-file-ref-check --fix
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/hwtracing/coresight/Kconfig                  |  2 +-
>=20
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/core=
sight/Kconfig
> index 6ff30e25af55..6d42a6d3766f 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -107,7 +107,7 @@ config CORESIGHT_CPU_DEBUG
>           can quickly get to know program counter (PC), secure state,
>           exception level, etc. Before use debugging functionality, platf=
orm
>           needs to ensure the clock domain and power domain are enabled
> -         properly, please refer Documentation/trace/coresight-cpu-debug.=
rst
> +         properly, please refer Documentation/trace/coresight/coresight-=
cpu-debug.rst
>           for detailed description and the example for usage.
> =20
>  endif

I ran into this today and almost sent a patch. Can you split this patch
up into more pieces and send it off to the respective subsystem
maintainers?
