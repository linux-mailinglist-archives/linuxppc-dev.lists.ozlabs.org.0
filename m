Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 839AB3234B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 01:55:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlcsW3t6Nz3cT4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 11:55:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KlX7NGyC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KlX7NGyC; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dlcs60YxNz30Jy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 11:55:04 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dlcs10wNNz9sBy;
 Wed, 24 Feb 2021 11:55:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1614128103;
 bh=UiZeBUw8NFAldykWq/oUNxpIv1S9JxNSl0/0Ye1W0/Q=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KlX7NGyC9ECViLb4AghJjx6iiOvRbORR6TgKgZiVzt7gQtZj29nwcSlhNHc16Zk9z
 cak+LN8eTHuRNhxZByetblt5M9UVarLdXvLb0f2HgtfvDsppqQQ+85PDP3fYYjtliv
 VKA27qdfpYjla5whyFVAQ8i2gUx6ClpFTnnpP8mlQPTyo1GztuxJjeUwJaYul++zz9
 4RPGbjXgascC1Ys7VYJl4f44TtCAeT/2EGP0/bV4d/NEBnrLw1X0PnmPCw1cePnbhO
 kpyGTwxXPyW5N6oM8iT0+H5EE0upRwC7LGpOGIx8UA/3AfYAXlvDVd9BLr98Cz3ty/
 4NqOFg4aCre/w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Olof Johansson <olof@lixom.net>, Christian Zigotzky
 <chzigotzky@xenosoft.de>
Subject: Re: [PASEMI] Nemo board doesn't boot anymore because of moving
 pas_pci_init
In-Reply-To: <CAOesGMgtAXPQRThhkF5QR25R+F68F5C_HSUvFPW0Wk1DcpCwvA@mail.gmail.com>
References: <13741214-bafc-1ee5-4157-854c14dae17c@xenosoft.de>
 <CAOesGMgtAXPQRThhkF5QR25R+F68F5C_HSUvFPW0Wk1DcpCwvA@mail.gmail.com>
Date: Wed, 24 Feb 2021 11:55:00 +1100
Message-ID: <877dmythcr.fsf@mpe.ellerman.id.au>
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Olof Johansson <olof@lixom.net> writes:
> Hi,
>
> On Tue, Feb 23, 2021 at 1:43 PM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
>>
>> Hello,
>>
>> The Nemo board [1] with a P.A. Semi PA6T SoC doesn't boot anymore
>> because of moving "pas_pci_init" to the device tree adoption [2] in the
>> latest PowerPC updates 5.12-1 [3].
>>
>> Unfortunately the Nemo board doesn't have it in its device tree. I
>> reverted this commit and after that the Nemo board boots without any
>> problems.
>>
>> What do you think about this ifdef?
>>
>> #ifdef CONFIG_PPC_PASEMI_NEMO
>>          /*
>>           * Check for the Nemo motherboard here, if we are running on one
>>           * then pas_pci_init()
>>           */
>>          if (of_machine_is_compatible("pasemi,nemo")) {
>>                  pas_pci_init();
>>          }
>> #endif
>
> This is not a proper fix for the problem. Someone will need to debug
> what on the pas_pci_init() codepath still needs to happen early in the
> boot, even if the main PCI setup happens later.

I looked but don't see anything 100% obvious.

Possibly it's the call to isa_bridge_find_early()?

static int __init pas_add_bridge(struct device_node *dev)
{
	...
	/*
	 * Scan for an isa bridge. This is needed to find the SB600 on the nemo
	 * and does nothing on machines without one.
	 */
	isa_bridge_find_early(hose);

	return 0;
}


cheers
