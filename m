Return-Path: <linuxppc-dev+bounces-13248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D2CC0456E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 06:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ct8zs3kLcz30RJ;
	Fri, 24 Oct 2025 15:28:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.164 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761280137;
	cv=pass; b=FWWlWnwJ+sy17S7MnY+lx1IT8Fv4ATLeoJbP7LgMQMV3AGkqc6VUHGtIeaUqphiuJa9jhieTUKBixcDirnMaffGuhv1Xg9aeMQaZRBy8r6ENaJ8Ta7sToMQdDaD93pAj1bjHb7jcjymP9LFN0U3is+ydebrYWpV/GKiM3wl4IbU4MBLnmMCjfdDvsIAvZBJokMQdAfCetrW13f0zDIQvEPrdFjnddRNVSklWAQQXBZ+wsorTDLOQ9p36yTjIs9+Zb5fjV57g9u+LcqNGqcdRNLQBa+1UAfzx1q0RsNkrPgRTtMYGRJ3+tqok0cw6WvGBb/Y1o8CRxRaCKk+/8Ac7Tg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761280137; c=relaxed/relaxed;
	bh=oK2G3VTMLLo2HkG9J5SCJGjImSRIoXFlhPE5LjCqFBc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=metKHrLMwBVpKHDn3I57Ie8dMKCKjeNtmfMbde5x/rlALlHTm2FM2+DhlLvlTITbldrMbtip/xWbwyHW67119Mj5zQlM55KsIfPhofHGeOipf/48zYtc5oI0FwB2EUz679CRLqyJM57km5x1d2LvALtyCPkoo2oabx7l8dIp9KGH02XmXR2CivyUfwUYuxQhe2+6MwkaF3rj0Pz4Bx3dUVGsV7Bplz5zR4nVIl+uFgUwGswW8LSmBZ9YW17UDkLvNqFsF88SalRCeHmRcRixlC3eS6HdVpEcmlane5dZjcpyOvSvxH/t0YF/aOLDxrsVj+vj5b6LBTJcWV9+yQwcrg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=tTUfW6pz; dkim-atps=neutral; spf=pass (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=tTUfW6pz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ct8zp742zz2yx8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 15:28:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1761280092; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pmeDQOkGAYfpG9ulR3RtsQiQ+CTCWFh30kP2trRjiD4fNmtSYF8WkejbFsD2+r5fyg
    97kIYrNXxDTlgkr6WS7IqUQ/tqjtSe2r/HtWR2IhR5NyQP/lgJHanl0SnwnWiE6lxQWl
    EyRb/ct3HAS80szrCsyiCrwNudvrTjoWZ/N//CbOIpihNX6jrQl6cr1CoiPkFNO4GOdO
    lcFcM8uDn4e/p3vZ39SbNQ2wXAeiVNCPATf/YcIgOI0TwwH7SJUeKj4ig/ue/l040k/0
    FvTvgQCpAffw792RNhbRXv8sy49XgbiGgaEpcGKTBtz5hf9y+PJkvCt5zILPDbk2hvUe
    PnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1761280092;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=oK2G3VTMLLo2HkG9J5SCJGjImSRIoXFlhPE5LjCqFBc=;
    b=ZMPYvrGnFNf5W0TBJPG+0ko4+FUMruGHCeNB58f51anumH1AZAuoQfgrXfqf8K8W3i
    ZkMrRa5xP3Ik3UpCrtPQqvyBVmRn0a1eVyMbC493k8oMysAzQBKEZBfvZqbIW99/EkAL
    YlorDZKrYo91z7E3+a7ZMFznonFj6e3vfSuDiwp2NXZJEO8J5MFK+sn7OZtsXdMLsjfn
    zfw78WtzB7kd53iF2GwnBQ5Mh6+L9FSD0HqVWjAVpswyi0jCQQNEjvSPcui+C2DyBp9Y
    0+NBL8QWrzGrVqdh1Ebp38ek92XjXgoqKrnvmphx81GKxTHFfZZ/84RbQxMWfw66n/QO
    nx/g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1761280092;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=oK2G3VTMLLo2HkG9J5SCJGjImSRIoXFlhPE5LjCqFBc=;
    b=tTUfW6pzZ4tvboyY5Cnxn65DZ1wIeYbY1MWSfZRblGiIC9H/bFZR82VMDdexAsG6/t
    S68MGFE+knoO9gupyypUYaxeC991Ta8uBHkQ+j5/CmIB0JTFlMIZT5xDk/qDEr/tfzKi
    6j6KRwVEBQmq79u2DPBA3mX5ikQRGMwp3rIanqdz4SvHnmrNMJWcW/fUxuTYCapfuYTb
    M5vL1H1r2jR+DMGOYzal7+BXu8eIp97V3PZtVS8HD+FapCsfMTjQ4i1eux+WNzKOCuPu
    4Kr5fWWvfQ9qoAkB7Q5EhZhn2kkMKBsIYE3iQH5CfpeLATfLAy9cVmdHNELAOgk2tnCs
    IjHg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIi+l6Rvg"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 53.4.2 DYNA|AUTH)
    with ESMTPSA id e2886619O4SB2Ej
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 24 Oct 2025 06:28:11 +0200 (CEST)
Subject: Re: [PATCH] PCI/ASPM: Enable only L0s and L1 for devicetree platforms
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 FUKAUMI Naoki <naoki@radxa.com>, Herve Codina <herve.codina@bootlin.com>,
 Diederik de Haas <diederik@cknow-tech.com>, Dragan Simic
 <dsimic@manjaro.org>, linuxppc-dev@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, mad skateman <madskateman@gmail.com>,
 hypexed@yahoo.com.au, "R.T.Dickinson" <rtd2@xtra.co.nz>
References: <20251023182525.GA1306699@bhelgaas>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <b48b7ec8-09dd-fce4-c957-5fbbf66acd4e@xenosoft.de>
Date: Fri, 24 Oct 2025 06:28:11 +0200
X-Mailer: BrassMonkey/33.8.2
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
In-Reply-To: <20251023182525.GA1306699@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 23/10/25 20:25, Bjorn Helgaas wrote:
 >> ---
 >> I intend this for v6.18-rc3.
 >>
 >> I think it will fix the issues reported by Diederik and FUKAUMI 
Naoki (both
 >> on Rockchip).  I hope it will fix Christian's report on powerpc, but 
don't
 >> have confirmation.
 >>

Hello Bjorn,

Thanks a lot for fixing the issue. :-)

I will test the RC3 of kernel 6.18 with activated CONFIG_PCIEASPM and 
CONFIG_PCIEASPM_DEFAULT next week.

Have a nice weekend,

Christian

-- 
Sent with BrassMonkey 33.8.2 
(https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.8.2)

