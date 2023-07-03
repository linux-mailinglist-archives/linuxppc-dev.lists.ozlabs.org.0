Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB6B745574
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 08:24:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=OxNBsNc3;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Mh3osUCY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvbVx5ykfz3bqV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 16:24:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=OxNBsNc3;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Mh3osUCY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvbTz6tJQz30Kd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 16:23:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1688365409; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=h2wZhgnFTRaW48adXC7R9FkvMJt0cqe0pht6vrt0diiaSzKPAc0FDyifj26vamMXhE
    YhuFrrtnWNISk/8VrYXRsn1wch2/AH7EWJdpJrhGWdrEdjhVc8+fHUunE+5ANfnAwp1k
    K1/jwD5SHB5CKX3hBUY7JGNniRkyTH66OJSJABiBnvATUbc2ZlYKBtLW99Kk3lryP101
    V/DBFYogGUG9yBN8WA9Qv7i/BaXw96p/YzNfo3b+UXs6JKf3QCVmvtcLhqfkTq3rnMDC
    kMKJlB1hS0L5+jInEEQoSCeak/W1H3VZLGnxuQf/XUdKbKFmHSV8rFGVBFAgUgxQxvQh
    oH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1688365409;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=VigkN2P9VAqWMVxOPGmNVBtxL11TIs6XihUyRsbczCs=;
    b=Bv76Wo/XYZOMQXkKbsH0QMfaqvr8MspGFv/DWSEPzPKTwyotNKmPOfZ46S2pUcOlBr
    cmyw3n0s0rFXm4mRloYqs8UXmef/+TnQqWhWeCBNLwkqjIFYMJdLADLCQO2s8IYyi4AR
    KlO2Bm/fuKG5cMhnnXZaQ9mnL91ntxA1dWKj2YzFvNycLczW2iQaWH05qR5xuH2pAy8o
    jZEJkwWxcCgis/hi2iJ+ZOvU397FnIlkzzdo2ApA3t9dR3U6C3pM79VSBorJNC70mkXZ
    IIZN4xDH9uwES60i2xUBpz0s1H7RgSatWbZJfej/tqIpZsyyaHxvIM9If/P4rjNYYy0R
    q8uQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1688365409;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=VigkN2P9VAqWMVxOPGmNVBtxL11TIs6XihUyRsbczCs=;
    b=OxNBsNc3d7VvRr+7SL7aETVTNDLn1L9f5xSC+G2rFViyPImSg0u0TAfSmrOPXujx+p
    nTU+1umTZIghLQJylr/Kyc2dLbgNbfMTVyX8Fv8GZyOoH+2AEmlkP5v4zy5DC/43zub4
    slkRJv4jCwvRbrI4zh7gFoX8cvBeLH5LsFvUYQegJ30rFzUlsmeZhF76+z3yXtZIQyt5
    TUL+8xoXNaDwKS7fMz4+SznohvKhTvXjRMRXbqksyOH/SnoCZm+S9X1GblgcjwT8Cp60
    atR3hlXP7dLt+zwiiS01P0cnxbfA7RxSsqmTlzto82lZM8KxkUw++28hHQnfoNeroJeR
    wjNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1688365409;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=VigkN2P9VAqWMVxOPGmNVBtxL11TIs6XihUyRsbczCs=;
    b=Mh3osUCY+AsP/pYGNodti7Q+cGwfHJmZH0RBwCwVTTjUwm8fUh1B7pm7IHgOxIYEKf
    qFLx3be6Q6S3AeVsjiAQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4gJwiYnA2b8Im6fsBSfXOgxLFqo2dX1be4ZzRPQGO"
Received: from [IPV6:2a01:598:d035:1cd6:a8bc:1f79:6a95:4328]
    by smtp.strato.de (RZmta 49.6.0 AUTH)
    with ESMTPSA id N28a51z636NRvGH
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 3 Jul 2023 08:23:27 +0200 (CEST)
Message-ID: <1a205224-06d4-9337-5621-c9760c02f9e5@xenosoft.de>
Date: Mon, 3 Jul 2023 08:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] powerpc: isa-bridge: Fix ISA mmapping when "ranges" is
 not present
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Rob Herring <robh@kernel.org>
References: <20230505171816.3175865-1-robh@kernel.org>
 <168836167601.46386.17041701491443802315.b4-ty@ellerman.id.au>
Content-Language: en-US
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <168836167601.46386.17041701491443802315.b4-ty@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Darren Stevens <darren@stevens-zone.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03.07.23 07:21, Michael Ellerman wrote:
> On Fri, 05 May 2023 12:18:17 -0500, Rob Herring wrote:
>> Commit e4ab08be5b49 ("powerpc/isa-bridge: Remove open coded "ranges"
>> parsing") broke PASemi Nemo board booting. The issue is the ISA I/O
>> range was not getting mapped as the logic to handle no "ranges" was
>> inverted. If phb_io_base_phys is non-zero, then the ISA range defaults
>> to the first 64K of the PCI I/O space. phb_io_base_phys should only be 0
>> when looking for a non-PCI ISA region.
>>
>> [...]
> Applied to powerpc/fixes.
>
> [1/1] powerpc: isa-bridge: Fix ISA mmapping when "ranges" is not present
>        https://git.kernel.org/powerpc/c/79de36042eecb684e0f748d17ba52f365fde0d65
>
> cheers
Hello Michael,

This patch has already been applied. Link: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4927cb98f0eeaa5dbeac882e8372f4b16dc62624

Thanks,
Christian
