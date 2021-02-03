Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D9930D1DA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 04:01:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVmfw15c1zDwks
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:01:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fVdsbnku; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVjQN4WbvzDsTc
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 11:35:39 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id y205so15520492pfc.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Feb 2021 16:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=yTvNBUBuWsIxw6R/U2vVWkortCXwzQ9a8/Bc1slBAU8=;
 b=fVdsbnkunyJxQHb84tvJR4xwuRBBclUf52tb4UbDfcUUVze1Hy2PYG2hWHgj3Lpc4Z
 X52NcDkcovAVagCR/9wm+yunxmYFej2250tuIm5AOKWXThBru0Mc+sxQT5djoeyyscAL
 w/hTVvjZ74vQ9arB4twi6rQYbeQ/JILEgZS6GqNh81VCl9osHR7hrUbp70kVTty7atHQ
 QPPSo+ijAj8qO/15Xn2lrP9d31hI9+58no0c7UAjSqKbCTj5PnTcnd/u/IXTTfof7OB/
 kXK8dmpGSGqF45SQwr20TJ0KxVCCXSHgyZyKn4Ger0/xK669gJrPiHLr3CR1ip84bmBR
 +v4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=yTvNBUBuWsIxw6R/U2vVWkortCXwzQ9a8/Bc1slBAU8=;
 b=O7oJLF7SYLwprkdnBvLWqMh4WcYbaXLRJMiEyeeDdFRzi/CMDjrZGYGrvKze8/2JWl
 AkMbBxcCoKbtO7Z/cM2p27JUbipb7QDECYqThHD7sT+EkFN6w6AXfB0KJzYaaABbR0d2
 bm8T5Xd/DUUmTEh+SXJyppfKVYs2shZ7fzi/Gk6t+4JdMgX1PpyPLRrVG9/0nEp5Xqhv
 X3PgrUCeEhUBZl15+h9xIf721Yws8rUYiCk+U/L7mslHM79/4shi3JNm4WIw2ihlON/4
 XczV5aIMO0WQh1JZPFPEfF0cT4FRv6YCP3VgmGqYwV5+w6R3Tvms+RlR46UYL2YJrAXe
 SJ1w==
X-Gm-Message-State: AOAM5317ZFUqjsldwbI1upHR85XgmRnDKS+6hxy55yHU8m9hl3DGo8WA
 GJmybv99Js1DmsKhmEzGNu96WNaBGz0=
X-Google-Smtp-Source: ABdhPJx60+BwWdkwsPz+jdxkUzhcPN/LYlhGBI+F99d7g6LkdJH8mEh/420b8SKMtr2/PaIRLWnrDg==
X-Received: by 2002:a63:1e1e:: with SMTP id e30mr755707pge.156.1612312536426; 
 Tue, 02 Feb 2021 16:35:36 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id g198sm160356pfb.37.2021.02.02.16.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 16:35:35 -0800 (PST)
Date: Wed, 03 Feb 2021 10:35:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 42/42] powerpc/64s: power4 nap fixup in C
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-43-npiggin@gmail.com>
 <878s86dals.fsf@mpe.ellerman.id.au>
In-Reply-To: <878s86dals.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1612312291.c9czxn5gen.astroid@bobo.none>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of February 2, 2021 8:31 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> There is no need for this to be in asm, use the new intrrupt entry wrapp=
er.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/interrupt.h   | 15 +++++++++
>>  arch/powerpc/include/asm/processor.h   |  1 +
>>  arch/powerpc/include/asm/thread_info.h |  6 ++++
>>  arch/powerpc/kernel/exceptions-64s.S   | 45 --------------------------
>>  arch/powerpc/kernel/idle_book3s.S      |  4 +++
>>  5 files changed, 26 insertions(+), 45 deletions(-)
>=20
> Something in here is making my G5 not boot.
>=20
> I don't know what the problem is because that machine is in the office,
> and I am not, and it has no serial console.

I'll try it in qemu again, haven't tested that for a few rebases.
You can just drop this for now.

Thanks,
Nick
