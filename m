Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4167E482074
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 22:49:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JQ23f16pvz3096
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Dec 2021 08:49:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lixom-net.20210112.gappssmtp.com header.i=@lixom-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=qlkNIjcl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20210112.gappssmtp.com
 header.i=@lixom-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=qlkNIjcl; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JQ22v67Sfz2xYK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Dec 2021 08:48:37 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id g22so22400567pgn.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Dec 2021 13:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GEcklNFD65j4kAPxqT7FBidrmJ3x+5F/2wsu3+ms61k=;
 b=qlkNIjclBJdx5nlGVwRBbrGI01mALgjZRcAIg/yKcGlhViS1qVZ48FHhACsxBadAPm
 l+GtkjsldrP1F8v7qmBF5YQv7ylBT1aPWFar9lOOCcgBZiw/FucQi7323bxXloDLSmtG
 Jkyl/rBeYBWrXSi0AIQOV9J2oo/gJhGQWFWAHoNwqGPSD0xUbBB+kdM27StCY1KmF4r9
 CkJoMg6tCEtJGhMjFwwY/R143FN/CHrQWK9tXlQPMO5YMIYUM4mDTj716I/g5noUKAil
 XYPdw5Ahw9iLDEVNE9GTgHdsEzI1CpSLiAEtcAkx4Yv9GTC9vLhSYrZAvPqSuBl4LjPV
 k9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GEcklNFD65j4kAPxqT7FBidrmJ3x+5F/2wsu3+ms61k=;
 b=g/lgb/UxEMw+f2e1YSJUmmaFmBsa/ZhNxr4ZeYqaH++wJwC48p2Jjt/FW8L0gEKQls
 bniRMc80jq3KDdwYJ6EYAJpS0koqqTdDixo5Ms5vSa7Q5Wt/vXWzfr7NyEcJkhAqXg53
 vD1sg53QmsvXRHQ+Ttj9pOYhac4YGdkpphsyqHhLOpj0tznrP6r1fDv7fP8y/9V2IfMC
 El9mPalE+8tFPpI/SFSYjI3rK2qUPCC13zlu596RtMqwY3FcmRspZAxiVQVInL0lxTGa
 G3yAQmDIKQUATfsv/YmXK5rbOg8zeyJPGBkgJRq7gW33taNCBDeqaDu83JYlWXwxM1ig
 Rw2Q==
X-Gm-Message-State: AOAM533Dzf90ZaJcWZChgdu/3dK4j4DcgWaC+zl6e6k4E1GCm1JxiPD9
 Y4aIShpAVlTEwotrJtDJk6/yUGwq/m+3duNwoFiF2Q==
X-Google-Smtp-Source: ABdhPJxB2+L0Ilgtxo24InThDxdI6L7PXX8L6YGcNe9PhKz0Hrp3Pr2ndaWJaDS+U/lZleW8xu0XDuGdqqRipaSCzkM=
X-Received: by 2002:a63:b909:: with SMTP id z9mr29347618pge.26.1640900912949; 
 Thu, 30 Dec 2021 13:48:32 -0800 (PST)
MIME-Version: 1.0
References: <F651905D-FC8B-43D4-A5DC-FFAFEF5AD69F@xenosoft.de>
In-Reply-To: <F651905D-FC8B-43D4-A5DC-FFAFEF5AD69F@xenosoft.de>
From: Olof Johansson <olof@lixom.net>
Date: Thu, 30 Dec 2021 13:48:21 -0800
Message-ID: <CAOesGMgaTtP3Tjs9ZBj_OP6AzBWCK1n84iD6KdK4c+LUF=tgtw@mail.gmail.com>
Subject: Re: The PA6T is still vulnerable
To: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Cc: "R.T.Dickinson" <rtd@a-eon.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Matthew Leaman <matthew@a-eon.biz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 29, 2021 at 8:07 AM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> Hi All,
>
> The P.A. Semi PA6T is still vulnerable.
>
> Architecture:                    ppc64
> CPU op-mode(s):                  32-bit, 64-bit
> Byte Order:                      Big Endian
> CPU(s):                          2
> On-line CPU(s) list:             0,1
> Thread(s) per core:              1
> Core(s) per socket:              2
> Socket(s):                       1
> Model:                           1.2 (pvr 0090 0102)
> Model name:                      PA6T, altivec supported
> L1d cache:                       128 KiB
> L1i cache:                       128 KiB
> Vulnerability Itlb multihit:     Not affected
> Vulnerability L1tf:              Vulnerable
> Vulnerability Mds:               Not affected
> Vulnerability Meltdown:          Vulnerable
> Vulnerability Spec store bypass: Vulnerable
> Vulnerability Spectre v1:        Mitigation; __user pointer sanitization
> Vulnerability Spectre v2:        Vulnerable
> Vulnerability Srbds:             Not affected
> Vulnerability Tsx async abort:   Not affected
>
> Could you please check this issue?

I'm not sure where you are directing this inquiry, you sent it to: me
and the mailing list. So, just in case there's any expectation of a
response:

I'm not able to spend time investigating side channel exposures on
PA6T, the platform is unsupported and best-effort on spare time (of
which I don't have enough). I don't have hardware set up to test it at
the moment.

While enabling some of the powerpc shared mitigations wouldn't be a
lot of work (cache flushes, etc), I expect them to have performance
impact that needs some effort to measure/investigate.

Have you confirmed that the published exploits are reproducible on the platform?


-Olof
