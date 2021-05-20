Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF4D38AE03
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 14:21:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm83d4pRfz3037
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 22:21:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LaoXb0Ov;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=LaoXb0Ov; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm8383jLvz2xfY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 22:20:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fm8331d0Bz9sW1;
 Thu, 20 May 2021 22:20:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1621513248;
 bh=VHMMJ0M6ATwGqRBTjP8RSaeA04g3CcNHybnZKi91DCg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LaoXb0Ov5mDWyDPz/w1z1nfGMuBPwnq9MCXxz2Z3lahu/SZiZfVm9seQEbVY23JFx
 +k1qe6oAYYsqjLJa8Wx+qpDCfNYpPRg0KfZhNgUoM3aD/wLNmhaADNrAKgBxTamaN6
 ZZNl5OqgbYJXhZO+ysuF1Joj95VOyOX8ZrUcNaKG58Gf6mySCgivZS50oUL/frFZCa
 HD6jm4Rf9W6/wFz8V6u/1rrq6U629xrNzGOLqc6j7HmgNdFuYNRFO1k36yJpGbDSx5
 4PTRujRk3Jrq1IPzNO+XOKkt33Dd9Ecu5nUASlmXc3GQmeU8EN6WQpnRUyA5C+wPXr
 MAUj78G3SF7sA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Zhen Lei <thunder.leizhen@huawei.com>, Geoff Levand
 <geoff@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/1] powerpc/ps3: Fix error return code in
 ps3_register_devices()
In-Reply-To: <20210518065853.7590-1-thunder.leizhen@huawei.com>
References: <20210518065853.7590-1-thunder.leizhen@huawei.com>
Date: Thu, 20 May 2021 22:20:45 +1000
Message-ID: <87tumxioki.fsf@mpe.ellerman.id.au>
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zhen Lei <thunder.leizhen@huawei.com> writes:
> When call ps3_start_probe_thread() failed, further initialization should
> be stopped and the returned error code should be propagated.

It's not clear to me that's a good change.

> diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
> index e87360a0fb40..9b6d8ca8fc01 100644
> --- a/arch/powerpc/platforms/ps3/device-init.c
> +++ b/arch/powerpc/platforms/ps3/device-init.c
> @@ -955,6 +955,8 @@ static int __init ps3_register_devices(void)
>  	/* ps3_repository_dump_bus_info(); */
>  
>  	result = ps3_start_probe_thread(PS3_BUS_TYPE_STORAGE);
> +	if (result < 0)
> +		return result;

If you bail out here you skip:

>  	ps3_register_vuart_devices();


Which I suspect means there will be no console output?

Presumably the system won't boot if the probe thread fails, but it might
at least print an oops, whereas if we return we might get nothing at
all. Though I'm just guessing, I don't know this code that well.

Anyway please leave this code alone unless you're willing to test your
changes, or at least provide a more thorough justification for them.

cheers
