Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5201F416D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 18:53:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hGQz1kbKzDqPN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 02:53:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=mopsfelder@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ccAWUvi0; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hGNy0yWLzDqYk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 02:51:41 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id c185so21460618qke.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jun 2020 09:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KFUIgBAEpqmxUCRCiMeFSRY9BS3Pg56bgsdv+x4J77k=;
 b=ccAWUvi0Su7ig7qn3a01zq4OmKg1afLx2RkzVPm4VGj5XnZBduUkcZTRZhqhWr/N4d
 uQ3rJ00aHESeATMnmCHp45xs7MXTixgFG7DZ9uFJ0IGn5pDAS+1P4vMy0LjMGLNYQKbh
 aabhraOuH59/SYxhLm8TtCVnLlIkT7Ohhzk5KnuFxdNWPgv2i+KyU8ydwk/5ZX3j2hrY
 adlU4PbCfyTUGfjJRZm1CjmWwkTBW/rKQeuE98/awv0m5ltN3kgx1E07VpNpQgMhga5s
 KvsNEEoDkhb61AGYH2BFoMksxc9aPpT1gENqaHFBb21od+BUwN6tvl8Eu1AFREXEV/XG
 461Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KFUIgBAEpqmxUCRCiMeFSRY9BS3Pg56bgsdv+x4J77k=;
 b=qmPW/KRpMi11tqW60KPovvkp7pSyXocQnJE/c8ObHJa9YA+14xOxOuiI3f7LKrB8AJ
 K+YqDwJHl2JKBsxcBJJblUovpi2qpIQic1SV3A7PPedPMFiyd4DjtUJpc3k9nPj7Nl8e
 fmnQ/9iqhchKaoTlVpOulMc9a4ZDQbEYcjSUd4P4IZyJEmP/QBUj8A9kbgZosI0STbZc
 JGR5zYXL60zO6ts7qufmU+k7k2ELxbWGlQ9W3IJDQ0OH/HXTovalQ+aYg6Z/KVLvupsb
 ZpBfNvBfLiOqhMrXM2DN+UiplzItkvcHhKnFV6HTq75lWq5DgATFyFCtDfpSK8V92OLQ
 KZug==
X-Gm-Message-State: AOAM532kHX/E5O5hfwUAElWteY6IEDxEp1Ej4mcwjBJ2vAuXPex2m7+n
 W0c+J+5WdZ29J1QGLyQ7jxI=
X-Google-Smtp-Source: ABdhPJwMZ5BqcL8Xh1XCUm6+E7vxPZsaPGB6z95ZVgW7rBID1DFf72tiQycVb+s+6ErS4d7BQZeCtg==
X-Received: by 2002:a05:620a:2183:: with SMTP id
 g3mr28920830qka.254.1591721498921; 
 Tue, 09 Jun 2020 09:51:38 -0700 (PDT)
Received: from localhost ([2804:431:f725:71e2:2799:db80:ed1e:3ed1])
 by smtp.gmail.com with ESMTPSA id l9sm10010320qki.90.2020.06.09.09.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 09:51:38 -0700 (PDT)
Date: Tue, 9 Jun 2020 13:51:35 -0300
From: Murilo Opsfelder =?iso-8859-1?Q?Ara=FAjo?= <mopsfelder@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 0/7] Base support for POWER10
Message-ID: <20200609165135.GA12260@kermit.br.ibm.com>
References: <20200521014341.29095-1-alistair@popple.id.au>
 <159168035553.1381411.323672966899358346.b4-ty@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159168035553.1381411.323672966899358346.b4-ty@ellerman.id.au>
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
Cc: Alistair Popple <alistair@popple.id.au>, mikey@neuling.org,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 09, 2020 at 03:28:31PM +1000, Michael Ellerman wrote:
> On Thu, 21 May 2020 11:43:34 +1000, Alistair Popple wrote:
> > This series brings together several previously posted patches required for
> > POWER10 support and introduces a new patch enabling POWER10 architected
> > mode to enable booting as a POWER10 pseries guest.
> >
> > It includes support for enabling facilities related to MMA and prefix
> > instructions.
> >
> > [...]
>
> Patches 1-3 and 5-7 applied to powerpc/next.
>
> [1/7] powerpc: Add new HWCAP bits
>       https://git.kernel.org/powerpc/c/ee988c11acf6f9464b7b44e9a091bf6afb3b3a49
> [2/7] powerpc: Add support for ISA v3.1
>       https://git.kernel.org/powerpc/c/3fd5836ee801ab9ac5b314c26550e209bafa5eaa
> [3/7] powerpc/dt_cpu_ftrs: Advertise support for ISA v3.1 if selected
>       https://git.kernel.org/powerpc/c/43d0d37acbe40a9a93d9891ca670638cd22116b1

Just out of curiosity, why do we define ISA_V3_0B and ISA_V3_1 macros
and don't use them anywhere else in the code?

Can't they be used in cpufeatures_setup_start() instead of 3000 and
3100 literals?

> [5/7] powerpc/dt_cpu_ftrs: Enable Prefixed Instructions
>       https://git.kernel.org/powerpc/c/c63d688c3dabca973c5a7da73d17422ad13f3737
> [6/7] powerpc/dt_cpu_ftrs: Add MMA feature
>       https://git.kernel.org/powerpc/c/87939d50e5888bd78478d9aa9455f56b919df658
> [7/7] powerpc: Add POWER10 architected mode
>       https://git.kernel.org/powerpc/c/a3ea40d5c7365e7e5c7c85b6f30b15142b397571
>
> cheers

--
Murilo
