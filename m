Return-Path: <linuxppc-dev+bounces-14025-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F15C4B860
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 06:16:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5F9q1pcjz2yvM;
	Tue, 11 Nov 2025 16:15:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.84 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762838159;
	cv=pass; b=gFpk3YKJJc44Qh+Z5QkMAPLUHcNWVq+gzjAWn28sb77dHJd6brzvODnHF39xcDYEZMnXusjwtQwRaBaNMEIcxycrqmmscJbPvm9qY6w+mi0NfiTiAvcyaIns1OUEP+53BWBeXgJ209JdDBPTHsv9TvKNk6IghDiYHPk1iNKJ8HwNly6ar/7z1d9LTpDn7DDHTYcG9xm4D+e5cqRFb8NE9xjdtr8FSEgPDx8kC5eyHpcIisAojyc1mg/rFtMohh6EVkYB69DLDkXeF1Yt7sOcq/t6BpEm1iEfnKG9uGkdkzQG6ThmbaiQKDt7U1qGDa/V5s4UssijcE5ZV8u3kp5/yw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762838159; c=relaxed/relaxed;
	bh=jKBUuUa4oR7Nvr5P+NYccWwL8x0fRGPM+IBOcI+Nhd4=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=GOfoLeHyBUFoMShjceTCoC2orRcsZdZqFFSOKsbF7YCAKLYdIglwuXSZX1rCg1ZMdfUc5sJqFHvP2Up6juxCXmXA3O+S7YhTHncGth/xJacvzEcZ4PSj3U6GD3GSIWcJWJ+Al+R+IhrxPrOsroMZK7K1RM28YrC/YWVRTL3h1zjcweek02EeBvClxhdZsp4EQzkA6SC2WELw4/4socvkSBwwl3lqghDazss5hTR/y6T/V6oAuu72jo7yGxmEt/ToNC2yB4qQsfIaTkuyD2CrcKATlzvqokkhZ5SjYBKHlJE6s7dlvzTIZs2M86mK3srPYxe2BqGIz2SpNJCmz807lA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=f8k+f7Ie; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=rDunH+4s; dkim-atps=neutral; spf=pass (client-ip=85.215.255.84; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=f8k+f7Ie;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=rDunH+4s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.84; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5F9l660jz2yvK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 16:15:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1762838122; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LfLIjviE1tbZSSPoCIlJKbBFhJ1YofGAtO2bpz8rGBzrhlzsRS+/I9kCe0XiUk0dzu
    c+Uh9pZTpCFX24Z64FzLKERaFohCIJK6jd3dHUuYVV4ZMyAWtKYWoluwFUxhQ8AVRgp3
    XRK+FbXPdj8OebACmpj7MOA7rWq1p8marOsDFn319O7h6bzvIfBXhr6R9fO+Ht6s9qEg
    75vTRGO8vXnNubQFFQ8eaIhxxWn0sw3atZ12hcq2+SIkZ+WznfOcgkJroldWJ5Z2HRLn
    TmBlBVS5Ao0EFhibxcVdV9Hom9tMCxIi0ltori5l1E2mk/u3OfMHPWpA5K4FkEenvUgv
    0StA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1762838122;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=jKBUuUa4oR7Nvr5P+NYccWwL8x0fRGPM+IBOcI+Nhd4=;
    b=kofvY7jgAIQZLhmSdoSYcxWwMFO0CRpYRXBrb8zR3BnAS1RpIkjgw2+6TL1x/L9aF8
    ajj7Bg9pvqR6t2bFNFoBjfoSKA+qamLAfrQvLOYHcC04TBlYk/cHQF/1e/UnXaCytCiF
    A8K81XIEBJc/fgwOul2wo8BrMXA2QduumtPUly8JbIZdFK2LBD+aqUFpEH30A+qz+q0u
    iFQzY3KuweWY60KQZ6Lj4LV/ae5a5hSk2MfWq7ufT8CXx/rz0a7qTUXCIy5YEjkkChU+
    c3mMmxxudNCewKvDbvSYwKR6U1wlJ86U7eFM4U1vAC/nI7vNJXxzX5FE7YRDSsvBdbwT
    1KHw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1762838122;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=jKBUuUa4oR7Nvr5P+NYccWwL8x0fRGPM+IBOcI+Nhd4=;
    b=f8k+f7IezPmXZR+XJb6PDZnJPMgGoU+MybdSqIyBGfWYfS6ap6Fsb/SJNsTiFxmcvI
    oVKYrGBHsTYlIXSRTHN3j1zio1TESF45LNqj4BZRpr5LcRO59bc1rlcb1/Hvzt8Imw8a
    1UcxAybR99eR4IU+8+T7eAmwpL+FC98ybV/WqyRwfL5Alcx/PimiExW8ewmrck4+Sm7D
    j8kaZcglFRlI7OKCxjiFIURvhYk2NAHURx/h4wV6XVdZaV2/KVeswOSlhFsIdaVIbJYD
    t/QsCkuqjp1Vaay8okDAKa5q5vaLua0IDRCdTQHffJ1EdAlVUf4S6XLc0xRwdVv7LmoN
    dFpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1762838122;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=jKBUuUa4oR7Nvr5P+NYccWwL8x0fRGPM+IBOcI+Nhd4=;
    b=rDunH+4se3mh0PITDkhoPuUC4sZRtr2Gx3SewEDZaSZ3fstrtYXaWfQQnwVW6dD5J4
    kp0Pj6bKkeHBMRDrFLDA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIS+m7xLg"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 54.0.0 DYNA|AUTH)
    with ESMTPSA id ed69d81AB5FLE2r
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 11 Nov 2025 06:15:21 +0100 (CET)
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
From: Christian Zigotzky <chzigotzky@xenosoft.de>
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
References: <20251105220925.GA1926619@bhelgaas>
 <3a384a25-0256-e827-2d66-9efc5723965d@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <a41d2ca1-fcd9-c416-b111-a958e92e94bf@xenosoft.de>
Date: Tue, 11 Nov 2025 06:15:20 +0100
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
In-Reply-To: <3a384a25-0256-e827-2d66-9efc5723965d@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/07/2025 06:06 AM, Christian Zigotzky wrote:
> On 11/05/2025 11:09 PM, Bjorn Helgaas wrote:
> >> I tested your patch with the RC4 of kernel 6.18 today. 
> Unfortunately it
> >> doesn't solve the boot issue.
> >
> > Thanks for testing that.  I see now why that approach doesn't work:
> > quirk_disable_aspm_l0s_l1() calls pci_disable_link_state(), which
> > updates the permissible ASPM link states, but pci_disable_link_state()
> > only works for devices at the downstream end of a link.  It doesn't
> > work at all for Root Ports, which are at the upstream end of a link.
> >
> > Christian, you originally reported that both X5000 and X1000 were
> > broken.  I suspect X1000 may have been fixed in v6.18-rc3 by
> > df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree
> > platforms"), but I would love to have confirmation of that.
>
> Hello Bjorn,
>
> I will enable CONFIG_PCIEASPM and CONFIG_PCIEASPM_DEFAULT for the RC5 
> of kernel 6.18 and test it with the X1000.
>
> Thanks,
> christian
>

Hello Bjorn,

I tested the RC5 of kernel 6.18 with CONFIG_PCIEASPM and 
CONFIG_PCIEASPM_DEFAULT enabled on my X1000 today. Unfortunately the 
boot problems are still present.

Cheers,
Christian

-- 
Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)


