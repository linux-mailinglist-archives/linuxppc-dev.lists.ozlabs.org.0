Return-Path: <linuxppc-dev+bounces-12927-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BECBDFC7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 18:55:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmxyt5QXxz3dSn;
	Thu, 16 Oct 2025 03:55:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.164 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760547302;
	cv=pass; b=g1V+eW6i7nBuisbUYaoS5cvu1GL+nStj+PfaAvjUvjxttqVtZJKXrZ+1LxpTY7zJ1h3LKFb1za3r+qa2NJyiu7QVMA8iGBFiCsNT6mMfqIu9CaVMwH+C8E7GE7yGYOd1ZZuM1ssWLl4VQAj0bMNU+m3PanAd3wzIbPq6H27EQLeN5+ttTxpTSjmta/wAa6Fs2yNeTz9tY5eowVv2Olz48pNhMVbK3Vun60rZcEtlLmaIfMy9fzusQKkUwYrXoSf5wjmJk96bw8QD6ZBY9mnMZJcDEK6XFfu6fZwILadBDiDProxpcK8LMZWw9HYuf58wK7YDXyIPxz7ueqgzEMOYQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760547302; c=relaxed/relaxed;
	bh=+bCfpk/M9DuRogcKAGcR+trCy+LbbvoWgRr/6nshqp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRr6/h5ndis4sRhFifTSlhzKuUg5ihN1upD6VErnv5sdYOTV/eI+5mQwAYZA9wdwSgsG2rnxX9agwAcDB2uyGPdb0j5tg8y8P+M9xINIqQD2IDeymXvt+CNigk/tGlYv8L71My5C4oDRGKEcuEkkYP81ZCgu+9wHhigjuhNRr2NvaLtPPu19i7zg3URr7uJi7tXi9NaNJJwTPhZ29kbae58Y+kB1SW53HbA7HTtH6mLutCrE9UL8GvM9pNFKiqwL3oLWajmteHP3wmydUdweY7y+PMlgdXNhQeVqZUh81Frv1TrosvaWnozx0oR4yPqxdQqrrCOQaWyGCbxOBn4BbA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=U+1nH5ub; dkim-atps=neutral; spf=pass (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=U+1nH5ub;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmxyq3y8zz3dSj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 03:54:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760547281; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=O1HDLWgWimAUUOa87+KdygXhXCe9LzancvEM7Z6oLv+0F0agA9oVf4hk0+ua1r7vLW
    zguH6ArLsd1xcAxI4iPAhDEjgm7f8SyjIAnWU0tTwvSBBj5f3LZa5vYy00q1tu51Zcwl
    FMh/CsNHkkNoqmndeF2ZHfDJ6HxT4gnYbH+aOBKFkbakjAl/btcs4Zbm4QOguVrhPwBO
    D8PJH1RCzxZzub3HCRy6jB50++EH2216/SHRvNEQxQ7Mv8jeBEUDM8Swk9V/H6qJXSpG
    JzhI6n6bf/RebmBkXc+swM38aHkrB8YSpc3WpmNVVtXGUue/Za0qdLvwhpCXqGFwUPw5
    De9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760547281;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=+bCfpk/M9DuRogcKAGcR+trCy+LbbvoWgRr/6nshqp8=;
    b=hes08i3uFs8cKMMcGwMPGuu9sFq4RbKbqGyNfnis231pcS/vHhbRVJdyi9RkLkASqM
    3xHqWxRPX5In+3RZveNoDcepnDRLiyJcMu9JNCBo4Km/iV4C71z7s+5D1yiH6smbRFzK
    s0QXWKyqc/5TVF9DD8U+bjd7xIHhS0vUWIaSZNU9/jDmxt1b5DMMfKtAcQq11y0WplAU
    xw2HTIltkx78zZWApMKKnl2VrrqugZBjey0im3Rw9DL7RqrsNxtBkiG7t4lUQtWaqM4B
    pOTH/p6s58/Sm3c4qNZPl/1rJ81eabdgwIP6lj3hGxKXnfGGQxHEpjpjBln8jWsgzU5c
    tfDQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760547281;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=+bCfpk/M9DuRogcKAGcR+trCy+LbbvoWgRr/6nshqp8=;
    b=U+1nH5ub2oQPVImfa/fORhv4CnHu/89YgbGEmblG+eg0xOw2cFvx3/dg90/NwHXJHY
    POdDAxX7BwEAkA/KS6W834DJLjwml9CepELQVVDk4n1l7PCKIGvNca88ipnQHUflO2LE
    +qg7C1ZyFhEThwN01v9ICHFFJAwOAMfZkz9C8a2KwIoansvcq91dbHUouY3ddo525JEg
    fCnqK2caqeiM2ynBQ7NS3XQbybgDNArXVE/r+kl6whLUGpDnDRZeVOQ61HF7l4mUCOZR
    3rPJFvxDqWJbp6NcUe5TdlgZW9WGdRtuYIOVjfs5wBNjtbASUlxC9sJ4lFgr9ztTc76B
    KdYQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIy+l73c="
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 53.4.2 DYNA|AUTH)
    with ESMTPSA id e2886619FGseYW1
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 15 Oct 2025 18:54:40 +0200 (CEST)
Message-ID: <523e2581-9c78-4c37-9c97-578df079f008@xenosoft.de>
Date: Wed, 15 Oct 2025 18:54:39 +0200
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
To: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
References: <20251015145901.3ca9d8a0@bootlin.com>
 <76026544-3472-4953-910A-376DD42BC6D0@xenosoft.de>
 <20251015153442.423e2278@bootlin.com>
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <20251015153442.423e2278@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



     Bjorn wrote:

     Sorry for the breakage, and thank you very much for the report. Can
     you please collect the complete dmesg logs before and after the
     pci-v5.16 changes and the "sudo lspci -vv" output from before the
     changes?

     You can attach them at https://bugzilla.kernel.org/ if you don't have
     a better place to put them.

     You could attach the kernel config there, too, since it didn't make it
     to the mailing list (vger may discard them -- see
     http://vger.kernel.org/majordomo-info.html).

     Bjorn



Hello,

sudo lspci -vv -> 
https://github.com/user-attachments/files/22931961/lspci_cyrus_plus.txt

Kernel config -> 
https://github.com/user-attachments/files/22932038/e5500_defconfig.txt

I have already posted some boot logs.

Further information and boot logs: 
https://github.com/chzigotzky/kernels/issues/17

Thanks,
Christian

