Return-Path: <linuxppc-dev+bounces-12715-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A0ABC60B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 18:38:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chdxV3MMFz30D3;
	Thu,  9 Oct 2025 03:38:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.167 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759941534;
	cv=pass; b=H1EIvcAjhPz+IlRHmELV+I4/69F+u+2eJjc3SW+Rc9d/De62eRb4yfz4Uvw9KyA8qbcCvdWYQolGFtibsh4M/PauigMg8oLr9DMDW35t22yZY9m8veyezXEzHxfYs8oU6wxEPun4qzonD1QaqRfFlKi1pG4QNfXR2BWaS8IjbJfAXS0pDbiFzxx3OTJpKQGSU4PSi9CaLEhvC+ZswhgCjWThBBITMwTv5pvKg+k1Vc2frpcaKRhNFeIvE7dir2JzZC5Kq0zTdrmo7O11GYPIP3i9HsF3NHYCW+dRs48hBCsfbOrZMibjEKoajKHmQG/UMoaxZCE1pngcKvZf7nm6rw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759941534; c=relaxed/relaxed;
	bh=YtMFp6hk0KZtRuvIuBOISOMZNCRxLqDo914yFlgZ7qc=;
	h=Message-ID:Date:MIME-Version:Subject:From:Cc:References:To:
	 In-Reply-To:Content-Type; b=MpcNuzrMt19RLmtKObuCoxJ/8Mcdw+jpt5TisHzJr6kpgnypvf7EqCtjx0plAifGcsGrOYsiEv8vWRisWyeFv7NVieTcPikn8jK3BqoDW7L5rMGrZVX+y09lAkjlzT4D6VMBPwnAG7Ayt81aO0u1u4CPTTl5/k02zSVAumnByjp+C0Zj0wIcIKcp+3/nVgtoOBGNBUnKrtGCIIkx4Cbr7k/ImjbClnl6zKnh11a6kIiNxz91sLgKUAgBneFH2z1ZUAgdHOYAlO0A5Vlu3f0EmoJikAADx2NExxpZCjziwpjE9Ayk53mPfbM9c7L0EGDfkZWLyAoN7Y/oPteEXlmB4A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WexDtBT0; dkim-atps=neutral; spf=pass (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WexDtBT0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 174 seconds by postgrey-1.37 at boromir; Thu, 09 Oct 2025 03:38:51 AEDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chdxR1dRSz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 03:38:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1759941343; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kSPZ41FRCnz9M0verzRrPJPBNP4I6pXCrP0PcKXoIZPA7kKq5lxclBo/Oa8mg+ZF9S
    VSjEtYpI2ofvSTi7O0mxgyGIM+Eqm8LbWdGi2NfVF1tdjAZaYlHkyY94aUIDkEa8LJE4
    80Ia+RdhQsuqbgz1SwJArf6BUD92f467pTpuWyPtzlKD9PHVZsyTQJ56UJ8wHIz1E3uB
    At9xUkSK2bz/W2IWPyQH5VV6bHH2lJx1xfulrRMUO/gzY4oQobEBLAVNihs6Ej5edYfx
    3h0rcH3PWxXJivfUNae4yJ2sxlXCf+t6kxDcgFUUuwN01auV/VXgSwl14E2aisF66BzX
    NUww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1759941343;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:To:References:Cc:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=YtMFp6hk0KZtRuvIuBOISOMZNCRxLqDo914yFlgZ7qc=;
    b=rHLRPvOvlH9pZ7cPEEG7hTgqTElKqOtUQFbrwqvhJQNkkkbtH5VxZfihN6fz1haXhA
    hWQqjVZfyb6lkQjSEPQBG18OqX6oyXgOet7mPcya/0mXwh4cW0YW5iREXjpdgbchJOHH
    MgsRUeI2R41O9snWRhMqbcJFYVveUySS0/o96pghrWatCI1DHQFGIzia/FwoWb8NGzmd
    rsju45zUWOjYlrltSbAiQoy2VOAY4fAlIGEJ+45bpz313P0bF0IlnkF+DLqjCRpXvN1G
    O/gatmCefchezEZMhDipkU4Hsck+3JuU6oA5kjlIeZo1igf+zCXbNMsJMYZmQMv9wEgX
    Ku6g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1759941343;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:To:References:Cc:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=YtMFp6hk0KZtRuvIuBOISOMZNCRxLqDo914yFlgZ7qc=;
    b=WexDtBT02414yWTb5YOODocdEC/B46AXE8dqvkOTXyWeK3Z/lC/Rnic7CaoGwy0/3t
    aGnmlMcKqzrs1eG66ss7PFUNc/2Md8i21AVCVYwQgoe8DjXWK2UiYJWRC62h9vbFoVo1
    YRKbXzzkDWg6Xwz/T2/qUMnXn1O+JKKxo6Rz3TIARE5srijFs5vkEoS+msT2pvp0JGmb
    P8B4S1gBVjUto2Oo9AzU92HtPmAM+SSDow3JkO3PyguwsdCdrYW39SBUx8kPFfeshXuN
    mGTVOIxusRlKBv8I/zmfUDmEdE/UIKajNCsMB7JlZPoxxpdSjisJN5ExORZ/lGrQ7dXm
    kSAw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIy+m7hjg"
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 53.4.2 DYNA|AUTH)
    with ESMTPSA id e28866198GZg2G9
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 8 Oct 2025 18:35:42 +0200 (CEST)
Message-ID: <db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de>
Date: Wed, 8 Oct 2025 18:35:42 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PPC] Boot problems after the pci-v6.18-changes
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
 <15731ad7-83ff-c7ef-e4a1-8b11814572c2@xenosoft.de>
 <17e37b22-5839-0e3a-0dbf-9c676adb0dec@xenosoft.de>
 <3b210c92-4be6-ce49-7512-bb194475eeab@xenosoft.de>
 <78308692-02e6-9544-4035-3171a8e1e6d4@xenosoft.de>
 <87mtma8udh.wl-maz@kernel.org>
 <c95c9b58-347e-d159-3a82-bf5f9dbf91ac@xenosoft.de>
 <87lf1t8pab.wl-maz@kernel.org>
 <a02c370d-1356-daac-25c4-02d222c91364@xenosoft.de>
 <87ilwx8ma5.wl-maz@kernel.org>
 <d044e62f-c7f8-4ec7-dbc6-ce61767e295f@xenosoft.de>
 <0baf0f26-ab82-ca19-ea9f-7f461ce32aa5@xenosoft.de>
Content-Language: de-DE
To: Bjorn Helgaas <bhelgaas@google.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
In-Reply-To: <0baf0f26-ab82-ca19-ea9f-7f461ce32aa5@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

Our PPC boards [1] have boot problems since the pci-v6.18-changes. [2]

Without the pci-v6.18-changes, the PPC boards boot without any problems.

Boot log with error messages: 
https://github.com/user-attachments/files/22782016/Kernel_6.18_with_PCI_changes.log

Further information: https://github.com/chzigotzky/kernels/issues/17

Please check the pci-v6.18-changes. [2]

Thanks,
Christian


[1]
- https://wiki.amiga.org/index.php/X5000
- https://en.wikipedia.org/wiki/AmigaOne_X1000

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2f2c7254931f41b5736e3ba12aaa9ac1bbeeeb92






