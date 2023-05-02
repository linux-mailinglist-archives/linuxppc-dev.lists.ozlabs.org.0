Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C556F4026
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 11:29:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9ZXq5f3wz3c2j
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 19:29:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CA6nTYtv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9ZX02JpVz307T
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 19:28:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CA6nTYtv;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q9ZWz3n4Gz4x3n;
	Tue,  2 May 2023 19:28:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683019728;
	bh=qKYQ1fwc0XnXQiwQMyVM30/wF3PFC7F11fBieztVUfk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CA6nTYtvY7iwZC0ZTz4AJ9YGMSZMx2yF/jM6V9OvViGsZP5mZaram7rQX7aIYDVMM
	 xiA8Wf3EZL3646ENAujdx79AZpnIZzaedrN9LFZmxnvbU8Y2DWfwBmdy5RJX4tmFP6
	 tGo9PScpXuydUuuNFG0lsxoPOZhOux8zPEksgmQ8W05cA4YYxyJhM0J/GF2kZ6JQxB
	 f+loZ19L44P6WhfSAlfmn+OM6Wo5xfGrid1O9wHXbdRMbXISzHMfNGSbf4wIAVwB78
	 fisL+pw1jiflN2/y/e4AWg41FTIi2/n4laviA7Z8iid5M5Y4hacN29r6sTcewhZA8Z
	 tYE+xKVSFqB/g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
In-Reply-To: <301595ad-0edf-2113-b55f-f5b8051ed24c@xenosoft.de>
References: <301595ad-0edf-2113-b55f-f5b8051ed24c@xenosoft.de>
Date: Tue, 02 May 2023 19:28:45 +1000
Message-ID: <87ednz6q0i.fsf@mail.lhotse>
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
Cc: Olof Johansson <olof@lixom.net>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> Hello,
>
> Our PASEMI Nemo board [1] doesn't boot with the PowerPC updates 6.4-1 [2].
>
> The kernel hangs right after the booting Linux via __start() @ 
> 0x0000000000000000 ...
>
> I was able to revert the PowerPC updates 6.4-1 [2] with the following 
> command: git revert 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7 -m 1
>
> After a re-compiling, the kernel boots without any problems without the 
> PowerPC updates 6.4-1 [2].
>
> Could you please explain me, what you have done in the boot area?

There's a few possibilities, but nothing obvious.

To begin with can you please test the following commits?

77e69ee7ce07
e4ab08be5b49
eeac8ede1755

cheers
