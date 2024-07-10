Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC9C92C971
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 05:54:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=fCM6lj9T;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=scvggdjo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJkWB3bxhz3d36
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 13:54:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=fCM6lj9T;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=scvggdjo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJkVP4Rdqz3c5t
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 13:53:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1720583580; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=hoOnVnmAwl5/d6O9LWBGgLHtxLKdnVTiF88/W4WDqnUekf14Yd6qauuT9ix/8fa4hs
    18KUEeaHMHFqKlgFtHU5qv81L8TdZODAr+ng6RrXbmTiMS3SABIPwiIhb/SeXYnYINI/
    QVJhVAjdE95dBYV+Ns3/mQyjr8l2cnKwOjssCWjgewX8Q/MVF3EOAhXqt+lFptVWZQWn
    VP4GrtURgsyaqkpCUq2BKmrJ/9Cb8fHpuZiBBzKo4v2OQB/tnBAEcmJgrWY4wei99HbE
    dzOnpegCJ55xR3BYtWShJbRCFDAO+ewni/ugakPToNwtp+LTOReD/dczoQZEXYGHv3t9
    ObGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1720583580;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=KRsZudZaU66bfqcpsExsQgaeHpzwNOwn1WEuUI/OyRA=;
    b=sFWNg31SL3rE48PT+jPyiDJqH2ETQKNEcRv8KnLvMkcLRR5PoG0QmUS81hX4piJuz+
    9ObVjBq7OncAkHCi46XNlTfU8MNPUXtbcUFE9ZV11Aa4b9Y/ykh9gOpj3xH9guwWwZdO
    e8LGQ1SmwT9JyZoXjtR3vZSCDA5FglX4LEGN8Oou7ndzf3FAiYNQGuOAt/Kx4/4pwj3K
    uZNRbLUq9fGQQStAGG2K2Al+tDr+ztUyZEzGIMZ7nRm0+xWGUQAzKa/AGm6uKs2Gv5g+
    R2suadLKjsqVpqUWt7plcSlzhUIgm4/rNiMo7NWGGcrzFlvg18+CcWYPfTbK8A3i5YmC
    hSXA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1720583580;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=KRsZudZaU66bfqcpsExsQgaeHpzwNOwn1WEuUI/OyRA=;
    b=fCM6lj9TSrbNvTu5XpoCXJ+W+IzmaDucjm8UV2Iops2Zmc1RvCcS4LiNbmCl9FCrvg
    eX1qwJiImPWhFgEviVmpVCPD+vDBgLSuHmQgfzBUhbG4lmhVA2BEDqc8Ssuor6n4Ny4J
    EjPRTpf1G/nfcKbfjejDFhLlfooT1nubOIa32+BcCzNdPqCLfXvZpIy4BAPHvaU5Xc46
    PCnpJlMVVc+2N7NcJhH+1ckDREBP5Nmwt0Mr/Jt8FQdNqVkZMY9vWwBfEKB+A0ltO39T
    R4K33F1FPp3Bsn/nPRl9b8j+BT6nGOysqoPGfBAyeMYrh0TlvNJR+q2WBlsoZ5mAu9iC
    k7ew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1720583580;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=KRsZudZaU66bfqcpsExsQgaeHpzwNOwn1WEuUI/OyRA=;
    b=scvggdjooBCng+3I0Y9aHPMwxcrFQR67GZncRNUHpSXuYrvcxw9uczkCVwhVtNQzdr
    hf8T/fNvWKn9Q++3IQDg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedR43J0obSjfTFwxtSORXzhXD5BXQVVAX0YLHX9mRQ=="
Received: from [IPV6:2a01:599:819:be6d:c234:9ffb:cfc:6d3e]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e0838906A3qwiWE
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 10 Jul 2024 05:52:58 +0200 (CEST)
Message-ID: <c8010a06-9d8d-466a-9a83-ee25950f1885@xenosoft.de>
Date: Wed, 10 Jul 2024 05:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Michael Ellerman <mpe@ellerman.id.au>, Marc Zyngier <maz@kernel.org>
References: <aeaa9b78-5853-473e-b985-b10241e88e0d@xenosoft.de>
 <8FDD860C-4DA4-46EF-BAD6-8F68837DA993@xenosoft.de>
Content-Language: en-US
In-Reply-To: <8FDD860C-4DA4-46EF-BAD6-8F68837DA993@xenosoft.de>
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
Cc: apatel@ventanamicro.com, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

The RC7 of kernel 6.10 boots without any problems [1] if we use the 
second irq patch [2]. Is it possible to add this patch to the mainline 
kernel?

Thanks,
Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=58643#p58643
[2] 
https://github.com/chzigotzky/kernels/blob/main/patches/X1000/of_irq_v4.patch
