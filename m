Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5304289B729
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 07:30:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UsKnHN5d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCd3J0DHCz3vZZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 15:30:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UsKnHN5d;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCd2Y1pbBz3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 15:29:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712554197;
	bh=iMWIRrwu8jzlwq3GFwobpQXIdHqfklC2x5296qQNRHU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UsKnHN5dUA5W0rjVFcwQj5HDYvEHusqogP0tHn2kalVa91OM2idgYC2m6oywCccHn
	 20FOcjzQeTxSX/TNcljO0PtQeHSikB6hwmGZLi9+pdBhaigjbzBmhfzSCowQyox1AB
	 M8ZC6Nl7a6+sbocmAHfxGj/Xlr1fxJqAzI6XPx5zHMntsMAgYheeHS13xKkMzmkym4
	 t0VtffZzOe60AjdZZOuo8CgV1vpgZWyrEhAKfjbc1xIOmg8wyIdPmQbyOubEnH1tHG
	 UDV589rMWSfeRpqkCEgEaUPYy9XmYedZWEuZI4rNpfpGoTdTsMJjIgT+i3tzqHjXuh
	 AYWYO2yb9DORA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VCd2X6SD4z4wd3;
	Mon,  8 Apr 2024 15:29:56 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Finn Thain <fthain@linux-m68k.org>
Subject: Re: [PATCH v2] serial/pmac_zilog: Remove flawed mitigation for rx
 irq flood
In-Reply-To: <2cb53463-897b-8f3f-7238-9fe87622b54d@linux-m68k.org>
References: <0df45bedded1249f6c6ec2c2fb0d9879da1841b7.1712273040.git.fthain@linux-m68k.org>
 <87v84w7be3.fsf@mail.lhotse>
 <2cb53463-897b-8f3f-7238-9fe87622b54d@linux-m68k.org>
Date: Mon, 08 Apr 2024 15:29:56 +1000
Message-ID: <87sezwbewb.fsf@mail.lhotse>
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
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-m68k@lists.linux-m68k.org, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Finn Thain <fthain@linux-m68k.org> writes:
> On Fri, 5 Apr 2024, Michael Ellerman wrote:
>
>> I assume you have tested this on an actual pmac, as well as qemu?
>> 
>
> I tested the patched driver and its console functionality using Zilog SCC 
> hardware in a Mac IIci, as well as QEMU's q800 virtual machine.
>
> That should suffice from a code coverage point-of-view, since 
> pmz_receive_chars() is portable and independent of CONFIG_PPC_PMAC.
>
> Moreover, I don't know how to get my PowerMac G3 to execute the kludge 
> that's to be removed here. I can't prove it's impossible, though.

Thanks. That's good enough for me.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
