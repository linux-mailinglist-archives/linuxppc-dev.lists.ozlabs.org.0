Return-Path: <linuxppc-dev+bounces-13913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3134DC3E7C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 06:07:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2n9G02swz3bsC;
	Fri,  7 Nov 2025 16:06:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.50 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762492017;
	cv=pass; b=otA9AQCkiJ7oUu5tQlhKcHYjRbwq+/9B046ifogzsC/1MFYzx5h39ajs9MdYjxSepB9bPNjlxY/0FaYKedTd8V83CWa60c0984jBw3WDPBFWQ56BqNYkAMWYbcYbmhmLQQCAjWjZtJbiB+NHXNfcRLrHgvEkGr3UjtifKub9jyk1oMmLyf0Hsz2NZzXeNaoBx725Hzo6wE8JhtJFos2wZeZ0zuL2yOh30cyt8MQe7gmmOCUpRdqyP1fzojUT+NYmn67pb9cUgDGDQ2In618K6XDpZQGsIYCCQy6JCazA0/0NMe/V7CVhP/PMJvMf6kNXfyYabj8+lHHTGRSwoPSl9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762492017; c=relaxed/relaxed;
	bh=AF11/LwkMwcLn6mwkC0qykIVuDRjIhfU25/98vK8keY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=PddqKvFWPTRrZdgBdGTDWv0nfDnIpF8zPnqRkP3y/nlRB78kPk3+392dSCdkGeTcAh0CKsp84O5xv+xSlRHtSw8g2kU4Ceq/lejC4+Hdjgr0aBDo1oXWS4tKMxyniinUuNsSRp2pB4m4WgHpOf9soKf+eHHhx89hfQlmGuSXHwIVXaTTik5Tzyz3qX5TRye7dvVINfAcC0k+VjCvDwlgUMA0G9TQ6Oz5osYg4/ACHtSe3T8l+OI6IL30dPHT5AIULFX5oft2dzznMYig3NLkXifElfZZtNkinBgxA8ofNQVfMY1NDXDqotXsg28UD3NUFl6Qt9e/Qvvx5kpEpo0sJw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jEiPtVLq; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Pumvlu3R; dkim-atps=neutral; spf=pass (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jEiPtVLq;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Pumvlu3R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2n9B5Jb2z2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 16:06:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1762491975; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lr2Fvd9EGlaeuldpTTFHmLOSIU0QtaFBCZrLEwTS33Egie4G5YZQNXW1Pox45Ua4Lh
    ePACm0cn4sZMDpqs+wzuPMGw7DNP/7wvTShxdDNnT33KBgkiNGt6YXPI3+Zt6eQiRmtP
    HnpoEijBBbw9EfUGNdi2CW7BApfDCedipgufEpKHsx1IMeZObipX2K7ozlvWy1XLOu7o
    YNuy5cdK6KfXHfk2xbhuU9fSb5Ha992Wttm6c3m4qScO2Uh5WAtPMSCuVATY7iLkdRnj
    eFS0gECYeQgKJ9wH9qrfQAhLuNeZhTFM0URO+jX+/D7CqoG3DqY3juaNiDnxryq26CyR
    V8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1762491975;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=AF11/LwkMwcLn6mwkC0qykIVuDRjIhfU25/98vK8keY=;
    b=GbRGcPimjVYqDoLd1zTme/apAG3sx+rHlrimBcyC1NNqO50nM28xqPJ2cLQdJk3sPG
    xaMk2cc7uYmcDbnrXirdG1kH9qqtdH4tNgcvE/pYik5lukF4ALs1Tk4F3Zn+ar1F/ZNx
    Ejv0p3uHWHMQdc5x/ZXDsZUKA1My/aNVNVUq/Gj7RBFdgOYBORwdBi/03iqS5V+mgeob
    dq3ODVxx3EM1OOscdVQ/xrAU8NtIRf1Z64FxXb3CHdLHze8jcsuja7iPq7LXxaowfdE9
    2UkBfcx8Xy4qqLYglTKKVtAfTUn1SUcle2sH+45N4QuPs7VIuxA5M+337JycK1Opu8eN
    8SPQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1762491975;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=AF11/LwkMwcLn6mwkC0qykIVuDRjIhfU25/98vK8keY=;
    b=jEiPtVLq3ixrh2Ixvwitei+s0o2akvpzJZGMsnugXnXNaUfeiN4QM9Lf6bhSrphFaw
    SFRYOBU+jIVdUwAINkqGK27meV2y2sTshNxknH/qPN/D8b+HRXGUta9Ch/iza/bvKT9y
    X/pGc/cjde3n1kDqFTN4ZbMLPdaWb2If7C0u5JuKEdzAtTo24R2fXhJ/jHgYveRTqS83
    wXXTWc27tV7+IaNPkMSA2f3SS6SpyTDE/Nqwn8sm5lnYCijJmbBgVR1uLC3v7igkR4EM
    AT2xXT9Pgdjbm8r6flUHE2+r+ZZlI/CxJo5IPOcuplmlLdnxXQ6rp1EK5obOhgmSDsWa
    CprQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1762491975;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=AF11/LwkMwcLn6mwkC0qykIVuDRjIhfU25/98vK8keY=;
    b=Pumvlu3RJclVgi7MOETj8jXqJpURZWC9b94ueriQ3E79KUgC9qq2ScZuqsnQqGzDOc
    Wl5SeOy8m3jw9QgwkJBw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIy+m7hLg"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 54.0.0 DYNA|AUTH)
    with ESMTPSA id ed69d81A756D1vN
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 7 Nov 2025 06:06:13 +0100 (CET)
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
 luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>,
 Roland <rol7and@gmx.com>
References: <20251105220925.GA1926619@bhelgaas>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <3a384a25-0256-e827-2d66-9efc5723965d@xenosoft.de>
Date: Fri, 7 Nov 2025 06:06:12 +0100
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
In-Reply-To: <20251105220925.GA1926619@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/05/2025 11:09 PM, Bjorn Helgaas wrote:
 >> I tested your patch with the RC4 of kernel 6.18 today. Unfortunately it
 >> doesn't solve the boot issue.
 >
 > Thanks for testing that.  I see now why that approach doesn't work:
 > quirk_disable_aspm_l0s_l1() calls pci_disable_link_state(), which
 > updates the permissible ASPM link states, but pci_disable_link_state()
 > only works for devices at the downstream end of a link.  It doesn't
 > work at all for Root Ports, which are at the upstream end of a link.
 >
 > Christian, you originally reported that both X5000 and X1000 were
 > broken.  I suspect X1000 may have been fixed in v6.18-rc3 by
 > df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree
 > platforms"), but I would love to have confirmation of that.

Hello Bjorn,

I will enable CONFIG_PCIEASPM and CONFIG_PCIEASPM_DEFAULT for the RC5 of 
kernel 6.18 and test it with the X1000.

Thanks,
christian

-- 
Sent with BrassMonkey 33.9.1 
(https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)

