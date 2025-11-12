Return-Path: <linuxppc-dev+bounces-14113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6308C506CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 04:41:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5q1z2LPjz2yvR;
	Wed, 12 Nov 2025 14:41:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.167 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762918871;
	cv=pass; b=dp6K38TBqay2x4F2/W6i5A+f4pBmcLuVSWfmZW3CymNu8IRw3CitpGBF4VZ76sDtsEpRmMfnBviZvQxAjzY/Bu3brq6z0kNVmj8Cp/xsXy/RdSA1nal5IKAQzYOjadW5OD2XSIZ1zmj8XdTvSy9Y74ht2cd8b9bOr2SFRPnlj8kzNiB34XFB52rQfkjriEcZ4VYgVK9CUnHduq3ZhDuYrWY/6GqYtNz2d7UphfrwHCN1gIe1u4qubJo6j1NzzWwYHn+Zym24hI7eqvF1eWz1SgZp71ob3Bg+Vcn1tx+k1/CvKZ3Zc/9+90Ag7+Syxrs4Rgwl70iO99AsT+9HwM+ZWw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762918871; c=relaxed/relaxed;
	bh=ZQePqx4mWAl3Z1zpzCfWWnyfUVkvM3CdO85q2oQ087c=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=NsEfQmpkoK6ThciffDiJdwhNVX1Jno5D01MpnhISvfAazDQs1Vvsv0ZTynbj6cBMoJY6mDo6bihK78FCl8LGpZcMSc89Ml/AF7x1yavW1GTfh2PAmaNYSLFV2ZV8v3u+KYL3GVXH7LtAc5RCrhW/iCbmCBic2Um1eZL+OvLrRwEj3c0fn0b9LDM1JWYJdFc9XlSHqyuplm++0YiI9SRhvm/RmJliirDzRYQ55VG3sfMgwsLVgVHou/bgHeQ2d3PNCHIlwpMB9ruQ0DdkDQZCARn2ELKlntn9PWP+9/U+ae4pNnsS1PWzD0zk7iQMpWnbLufYiXhClnGrusosJ1tS5A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=D+OuScvD; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=UbEXx0xc; dkim-atps=neutral; spf=pass (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=D+OuScvD;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=UbEXx0xc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5q1v5rLqz2yvP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 14:41:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1762918834; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=eS5Lzl9fspGwjk/nXmyeVtzr8EGd3IJdwfIH14lyxKNUWt0q9JbIj+5oaCm7pZ+oV+
    ppxOuWEVhJnhAHeAgQrI4l0tz7k1T4bLDChBfvCkppDE7kD7/VMl+t63xPNFtfDNWeUq
    VFFfxFX9TLU72ZgfJzO9p81jQbptAhFDa41vgJNX25nxkLQsRnyuIBFReF+D0tE/iIqx
    BFpiHTCHsphnI1pSYFkpvLFFMA+zPWCkO2V2p4sSZxmpnh3rZwvvz81KgI8wi+Ev5k4V
    va60Ckw9rIKP9z8oHnRmXYfB669W9mswdhSSCRIbf7XBXn0fjr3KB2b3das8tt8IZrZW
    eayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1762918834;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=ZQePqx4mWAl3Z1zpzCfWWnyfUVkvM3CdO85q2oQ087c=;
    b=FHz9IYLYjHziMZYne7lCvYR02d5a9Snf3G4JVh5F/udneWSwq5icFZUkKy3SJK4Zrl
    T6gmZK7S28w2Qm53UOIiZvK/VlClSmudqLM7vcOxhJxz+SFBwHzW0+zow0TG5K57LHxx
    b8KVrALQBMEyw444ZFhDYTiVGRAtjyz8v9VuTAunNfXWsmBxlqYy+ojAXe0KftxpyjWr
    6nJAL538MSdTFv1OzYzOiAMMooye12E5nMZmiV/mVXFJCyxJ+jw7qU54L9jF/wy6oQSS
    44vpOUOI1r9sKVfUzq1m9Ef63YOqSgFbj1MF60ZRc2Gbo7VUJxxgCkVtpR+hiilnhgpd
    RLqQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1762918834;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=ZQePqx4mWAl3Z1zpzCfWWnyfUVkvM3CdO85q2oQ087c=;
    b=D+OuScvDFbJDSsvrcE9IcF1gPA2DwMTGaFWZMvwTCDXdagWHuQTc5wv2o5NjZMp/8l
    PFyzQk2ED4GlmJ2/HC1JfArXbUnhCJ+ugAOnhpsfMu3LtSPUj034oIBs4SmdjCkGtJ7Z
    jdZzbOVju5Uc0WYOzTJdJaSMMoFj4iQUn73ggTmcN7J0z+YXn5cUcdF5b0v8Xbo9CFqn
    yFglpCvCiZlcoCI4nxcONGcwOkdgDHwwIKgJNIQqG8RTInwmUvxzj+V8/CLvWBivFeBP
    OJo7U6wU3Ae6CoK2jro6uJWDybTYkmBkxiZIqLoLDr+nTQUWhkOJRJeXeBZ0NouZjFsG
    Of7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1762918834;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=ZQePqx4mWAl3Z1zpzCfWWnyfUVkvM3CdO85q2oQ087c=;
    b=UbEXx0xcmZ8s9zBKzkeis4LCG0d1siHusvvL9P+inPfwxXx/AYjaBSb0noTC4VUqc7
    YzFs+jEn7qPx1dz/K/BQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIC+l6x7g"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 54.0.0 DYNA|AUTH)
    with ESMTPSA id ed69d81AC3eWIrv
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 12 Nov 2025 04:40:32 +0100 (CET)
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lukas Wunner <lukas@wunner.de>, regressions@lists.linux.dev,
 luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>
References: <20251111122001.GA2168158@bhelgaas>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <f4331d1c-8695-19c3-608b-210b3242aaf0@xenosoft.de>
Date: Wed, 12 Nov 2025 04:40:18 +0100
X-Mailer: BrassMonkey/33.9.1
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
In-Reply-To: <20251111122001.GA2168158@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 11/11/2025 01:20 PM, Bjorn Helgaas wrote:
 > On Tue, Nov 11, 2025 at 06:15:20AM +0100, Christian Zigotzky wrote:
 >> On 11/07/2025 06:06 AM, Christian Zigotzky wrote:
 >>> On 11/05/2025 11:09 PM, Bjorn Helgaas wrote:
 >>>>> I tested your patch with the RC4 of kernel 6.18 today. Unfortunately
 >>> it
 >>>>> doesn't solve the boot issue.
 >>>>
 >>>> Thanks for testing that.  I see now why that approach doesn't work:
 >>>> quirk_disable_aspm_l0s_l1() calls pci_disable_link_state(), which
 >>>> updates the permissible ASPM link states, but pci_disable_link_state()
 >>>> only works for devices at the downstream end of a link.  It doesn't
 >>>> work at all for Root Ports, which are at the upstream end of a link.
 >>>>
 >>>> Christian, you originally reported that both X5000 and X1000 were
 >>>> broken.  I suspect X1000 may have been fixed in v6.18-rc3 by
 >>>> df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree
 >>>> platforms"), but I would love to have confirmation of that.
 >>>
 >>> Hello Bjorn,
 >>>
 >>> I will enable CONFIG_PCIEASPM and CONFIG_PCIEASPM_DEFAULT for the 
RC5 of
 >>> kernel 6.18 and test it with the X1000.
 >>
 >> I tested the RC5 of kernel 6.18 with CONFIG_PCIEASPM and
 >> CONFIG_PCIEASPM_DEFAULT enabled on my X1000 today. Unfortunately the 
boot
 >> problems are still present.
 >
 > Thanks.  Can you post a dmesg somewhere so I can see what the relevant
 > device IDs are?  Can be with any kernel, doesn't have to be v6.18.  We
 > need the Vendor and Device IDs to add a quirk.
 >

X1000 kernel 6.18.0-rc5 dmesg: 
https://github.com/user-attachments/files/23491291/dmesg_x1000.txt

-- 
Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)


