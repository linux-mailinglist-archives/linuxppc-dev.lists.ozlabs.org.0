Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2688FDD1C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 05:01:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dM0pcqhm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvpyP0Swdz3cXl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 13:01:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dM0pcqhm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvpws1Xjbz3cZP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 13:00:29 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-6570bd6c3d7so316408a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2024 20:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717642827; x=1718247627; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULW+2oU3rQhVwjAM90zTIQPs8hm5yJ6yXFIdCR2GhYU=;
        b=dM0pcqhmLtqZZIJxIyyFQXROn9fbiui3hFrCjYN1tfoA/VVpGkV+2ZreBJc8+t9lvO
         Y694hr3ZQTeLQFwq9xowKdVY187Ct1MB7T2mIigUFmkOvCW/k3DPivrcnK5QPgWsj93H
         +nnalT3zpSmVDcXqd5Zm8SjRXI6DWuQ1L6HLVQDNCwrTxjGskH+u+vtcxEB5E1Ds4uJC
         WGyPpNDoprP8rSHKd3GkqNUovM+qkL3acaiFLb2HfmqACnAiGZjt1WYgDwgUDU8Silos
         PFygaKaCGbmcMD934/FAkcXXhVDi0MO1tfcOlv9MCCgKZdMojGPCJpgaNJv7d899Jis3
         ZaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717642827; x=1718247627;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ULW+2oU3rQhVwjAM90zTIQPs8hm5yJ6yXFIdCR2GhYU=;
        b=PRg7hM5bL6wtpdVmUGvhsyVaUIDDvtjNxd2Hzj/x9hoCuhDwSI5eNqxIz+zxay/gBa
         HpqD4qmLxxK3BCE8QAvN5Pkx5uiz/poib+ol6AI/RRTnwUvFqVHiGyUGBvPfEYvZuWxg
         u3Bs0U/R6PK+yrWANQULA8z+5ypl6Yg5TVHhqO9QtCoYZQCUxrm8fzOP9D44BdL5bc2L
         hA9lPKFgjsnvbCwIqWS1Wvj28h+qr2U9OdhIfTnvuIrXJoOC/PLbY7UBm1SahU/jS6EL
         7qEtSUD0zCt3GIEd8Gt4oqkHoMgUExHsS8vndKJSdDyjnA7yxTFiDfAfIdZWzyPXDxyn
         HhDA==
X-Gm-Message-State: AOJu0YwhgPADLh/pNDU2LrRmBrS94IwxM1dh/6L4m2aJdmrOqFh7To+u
	803OTi/LEItfBypAsTohnxU99BjGyreDASYjmeN9GdflO6xr4962
X-Google-Smtp-Source: AGHT+IFwZO9iXZrSZ7eiieLv2g0azsGpXlp5ks3oSLXWkKXxnEw8h9uCN3zGrnxcvFbRPe9VPVGm/Q==
X-Received: by 2002:a05:6a20:6a26:b0:1b0:1a02:4131 with SMTP id adf61e73a8af0-1b2b6e59824mr5312544637.2.1717642827073;
        Wed, 05 Jun 2024 20:00:27 -0700 (PDT)
Received: from localhost (110-175-65-7.tpgi.com.au. [110.175.65.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7cd7f6sm2642725ad.122.2024.06.05.20.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 20:00:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Jun 2024 13:00:19 +1000
Message-Id: <D1SLK9T4ODZO.11N6J5D94530R@gmail.com>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Gautam Menghani" <gautam@linux.ibm.com>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>, <aneesh.kumar@kernel.org>,
 <naveen.n.rao@linux.ibm.com>, <corbet@lwn.net>
Subject: Re: [PATCH v2 0/2] Fix doorbell emulation for v2 API on PPC
X-Mailer: aerc 0.17.0
References: <20240605113913.83715-1-gautam@linux.ibm.com>
In-Reply-To: <20240605113913.83715-1-gautam@linux.ibm.com>
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jun 5, 2024 at 9:39 PM AEST, Gautam Menghani wrote:
> Doorbell emulation for KVM on PAPR guests is broken as support for DPDES
> was not added in initial patch series [1].
> Add DPDES support and doorbell handling support for V2 API.=20

Looks good, thanks. So fix for v1 doorbells is coming?

Thanks,
Nick

>
> [1] lore.kernel.org/linuxppc-dev/20230914030600.16993-1-jniethe5@gmail.co=
m
>
> Changes in v2:
> 1. Split DPDES support into its own patch
>
> Gautam Menghani (2):
>   arch/powerpc/kvm: Add DPDES support in helper library for Guest state
>     buffer
>   arch/powerpc/kvm: Fix doorbell emulation for v2 API
>
>  Documentation/arch/powerpc/kvm-nested.rst     | 4 +++-
>  arch/powerpc/include/asm/guest-state-buffer.h | 3 ++-
>  arch/powerpc/include/asm/kvm_book3s.h         | 1 +
>  arch/powerpc/kvm/book3s_hv.c                  | 5 +++++
>  arch/powerpc/kvm/book3s_hv_nestedv2.c         | 7 +++++++
>  arch/powerpc/kvm/test-guest-state-buffer.c    | 2 +-
>  6 files changed, 19 insertions(+), 3 deletions(-)

