Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDD03FFAA5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 08:51:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H17jw6QgMz2ywK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 16:51:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=K/qIFLcW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=K/qIFLcW; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H17jF3rzXz2yHW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 16:50:39 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id u6so3601370pfi.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Sep 2021 23:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=0BQ9u2y+lw4VEtzEXjzN4NZ3IpjygaobSG94tsEQOB0=;
 b=K/qIFLcWBPxAbl2ywxgXJE7YZyHmsP6nhL7IpT7DAAX6NFt6nPHyvf0YrSBgQfiylr
 7dl2n5nhxJmv0oH+QIgd9rBVOpqcoFBfHG7tPeB5StXo6jj+Dn/V/zMVaEBVt8sNarj6
 dzfcBJrm0i2gf7wSE3vYt5mIOIDVpUgHnh0s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=0BQ9u2y+lw4VEtzEXjzN4NZ3IpjygaobSG94tsEQOB0=;
 b=DuhxGsSuZxcLPgiMt7kM3fOzQRcEscAdzjcL7fZWRgdtw7g/Ss6uI+lHg3dxcT93bN
 SeSToNOpCwJW6vzYZI0MKTUpkRffxCthos6fD0gbZAtKaiPoFqaUxOBVwvvs3cMG5PFa
 TDsYcpvPGYnJS0Z4iEJgP7XaYvUjN66azeWve8xrIwV714vao6/iXd4NsgUS3IgrsMQc
 lSjTDWecTC2NRFUsnKKnuuCeLqL/CaDyCvLaVYDjCELk17D1I6g+7UMbqC3Y/RU8dwWs
 kB6A+JnPglLBwGY5i7fARBC+LxZXjq63kfI0kp5z02IlGgUCVik44n6TOrHxAnhAE+Cy
 kHcw==
X-Gm-Message-State: AOAM532juHDU7qj2vSMtNA8ZfGO3coS6Gc1lREq6fjqy3z7roKG02jCb
 CBL79qFoSbNCzut6Y8xK820RXw==
X-Google-Smtp-Source: ABdhPJyp7NknuFpIcPAgK+njiE3tqC94g8/kN/2XtEpH0MA3stL+2JFabeSEdyw88uMsuVCmN0FLRA==
X-Received: by 2002:a63:e64a:: with SMTP id p10mr2274483pgj.263.1630651836290; 
 Thu, 02 Sep 2021 23:50:36 -0700 (PDT)
Received: from localhost ([2001:4479:e200:df00:ddd7:1b3:9327:fcf5])
 by smtp.gmail.com with ESMTPSA id y3sm5045324pge.44.2021.09.02.23.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 23:50:35 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/machdep: Remove stale functions from ppc_md
 structure
In-Reply-To: <24d4ca0ada683c9436a5f812a7aeb0a1362afa2b.1630398606.git.christophe.leroy@csgroup.eu>
References: <24d4ca0ada683c9436a5f812a7aeb0a1362afa2b.1630398606.git.christophe.leroy@csgroup.eu>
Date: Fri, 03 Sep 2021 16:50:32 +1000
Message-ID: <87ilzi5f0n.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

> ppc_md.iommu_save() is not set anymore by any platform after
> commit c40785ad305b ("powerpc/dart: Use a cachable DART").
> So iommu_save() has become a nop and can be removed.

I wonder if it makes sense to have an iommu_restore() without an
iommu_save. Only dart_iommu.c defines an iommu_restore(), but I couldn't
figure out if it was safe to remove and it seems like it still did
something...

> ppc_md.show_percpuinfo() is not set anymore by any platform after
> commit 4350147a816b ("[PATCH] ppc64: SMU based macs cpufreq support").
>
> Last users of ppc_md.rtc_read_val() and ppc_md.rtc_write_val() were
> removed by commit 0f03a43b8f0f ("[POWERPC] Remove todc code from
> ARCH=powerpc")
>
> Last user of kgdb_map_scc() was removed by commit 17ce452f7ea3 ("kgdb,
> powerpc: arch specific powerpc kgdb support").
>
> ppc.machine_kexec_prepare() has not been used since
> commit 8ee3e0d69623 ("powerpc: Remove the main legacy iSerie platform
> code"). This allows the removal of machine_kexec_prepare() and the
> rename of default_machine_kexec_prepare() into machine_kexec_prepare()

I think you should also remove the prototype from
arch/powerpc/include/asm/kexec.h

Apart from that:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel Axtens
