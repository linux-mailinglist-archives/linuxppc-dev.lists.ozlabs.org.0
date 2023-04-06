Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DD46D8F01
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 08:01:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsW8s3fdgz3fKh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 16:01:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n0t34YKy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsW8075RQz3f8T
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 16:00:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n0t34YKy;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PsW7w348jz4x1f;
	Thu,  6 Apr 2023 16:00:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680760845;
	bh=YRNkNOtv5CRb7IJxJSjCFFfZ5DdmME38REU3Q+2j574=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n0t34YKydwmH6p+3G/JWUr21t0gHEKDCLoRhw/S23s3mrkeglgnL/c7/4IUb2ikSu
	 yxo2NfQYyKRTe5gYBrleIaHx3wlpDO2T72a9naivJ8ppf3zIbYBB8AxA7bsyP4bKxX
	 o6EjnTvJZN81DfIO6CYXYCI2CEr1klgZKpL8kJ3YII5g+B8Dg0ypaWorI9e+4qYgM3
	 hrk50P1fBCmVVxG0Bk60SUqQut8Qy/gHUGBzVuOl4Suus7Lw+I16758MxIqyQDiJ20
	 z23xp12LwTpxgycXthNeYVVmLZgUSUaDuRSaq5d3swb+EQLGssUoOZpCZuYEhTEkY6
	 VoMk0CHxN8cKQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Ellerman <patch-notifications@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Anatolij Gustschin <agust@denx.de>, Arnd Bergmann <arnd@arndb.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rob Herring
 <robh@kernel.org>
Subject: Re: [PATCH] powerpc: Use of_address_to_resource()
In-Reply-To: <168074339913.3678997.5583804591970225065.b4-ty@ellerman.id.au>
References: <20230319163154.225597-1-robh@kernel.org>
 <168074339913.3678997.5583804591970225065.b4-ty@ellerman.id.au>
Date: Thu, 06 Apr 2023 16:00:41 +1000
Message-ID: <878rf5k0s6.fsf@mpe.ellerman.id.au>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <patch-notifications@ellerman.id.au> writes:
> On Sun, 19 Mar 2023 11:31:53 -0500, Rob Herring wrote:
>> Replace open coded reading of "reg" or of_get_address()/
>> of_translate_address() calls with a single call to
>> of_address_to_resource().
>> 
>> 
>
> Applied to powerpc/next.
>
> [1/1] powerpc: Use of_address_to_resource()
>       https://git.kernel.org/powerpc/c/2500763dd3db37fad94d9b506907c59c2f5e97c6

I actually merged v3, b4 got confused when sending the thanks.

cheers
