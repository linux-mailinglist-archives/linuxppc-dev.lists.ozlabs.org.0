Return-Path: <linuxppc-dev+bounces-9509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91516ADF72E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 21:50:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMvTy0h0Jz30VM;
	Thu, 19 Jun 2025 05:50:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750276214;
	cv=none; b=QNYJiDwM5rnceEyZJCnNiXr9Ydg6subj3Vx/Mv0HkekMFW0OoomV8Ksr/ZT6RZc+7Y+K5QLR5TyK78rcxKSesOzQ/CmhdyoOrp7lgalKJ9szscwzzk+N5loi3VzAPleYUHRRgkZBSYz6Azk7KYbaUJZ5lStSgSXXPunfPHW7LE4WK2YahZW9/JUbCTTuHts80VZ4IJOaB8AHuKIxr6i/todtC82qPGayvFi4hEV68ZX3Vm+CUlMLRCQXdVcso2uQhYd7fImpM0Oy8gNphWcSIFwYXxwUxo9dGdaG6v/GmOaNjp0zY9BbBq+roJLLN1MeWfv8zR1BLuyw1z8tJ43AzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750276214; c=relaxed/relaxed;
	bh=Z2GNqX+0k7pSprsF3zD6eUV76u17QucYwCVB/IypEPg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=b4JB6vOwy4vZRaKeXtmpkYsVyR6fvusxmccnbxirNnvNKCJgwYknclnl7Qv1L/1ZT/Ysc0iEAYq5QNfQeUiRo+0Qx/jmLh913JJsIPy8GAEGek0NX/6aErL2ikSYCkV/Im04Qi/u89wKFxTsPO6nasefEGubHFIGYOT5+KGB/zn/0uzHOHR1JC12NBmStVI5q7xo2fFWIsMYsX0S8Lc+uCUAAfkNjpu2zA0+N/vmrOjQZW/66E7DSbC+EEx9Hvw11J66TS7te6ABF+K9tfnkLQmAcu1BI+GQ8dNQALOCc69JsYreU6utRJq0UdgVO3GerCWYzb4B+ZPZin02087y+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=ukt6ydpv; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=ukt6ydpv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMvTw4H92z2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 05:50:12 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 8755B82885CC;
	Wed, 18 Jun 2025 14:50:10 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Cw-X6kyH1lKl; Wed, 18 Jun 2025 14:50:07 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 8C6468288C8B;
	Wed, 18 Jun 2025 14:50:07 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8C6468288C8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750276207; bh=Z2GNqX+0k7pSprsF3zD6eUV76u17QucYwCVB/IypEPg=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=ukt6ydpvmsUs2h/99SLAygWrJTQV0Ww6DXrosK8GMRLMAerec2PGtn9yFicY4Jg7n
	 aLvcdn0yDsl7P566v8caiKvJlkMp7ugpGCRe0D3vwPChJvq8sseALw4qMB9QMPMIu5
	 vbhjym68Cv4y1g3DhNg2OwHReQLe2nBGDL53GYbQ=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aOfRNJqAxjHk; Wed, 18 Jun 2025 14:50:07 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 11E5E828884B;
	Wed, 18 Jun 2025 14:50:07 -0500 (CDT)
Date: Wed, 18 Jun 2025 14:50:04 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Lukas Wunner <lukas@wunner.de>
Message-ID: <1957898084.1311382.1750276204022.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20250618194400.GA1219576@bhelgaas>
References: <20250618194400.GA1219576@bhelgaas>
Subject: Re: [PATCH v2 2/6] pci/hotplug/pnv_php: Work around switches with
 broken
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC137 (Linux)/8.5.0_GA_3042)
Thread-Topic: pci/hotplug/pnv_php: Work around switches with broken
Thread-Index: ea0P+zxqpWPDRHdRnJt8G7RzFtnFrw==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Bjorn Helgaas" <helgaas@kernel.org>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-pci"
> <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
> "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Bjorn Helgaas"
> <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>, "Lukas Wunner" <lukas@wunner.de>
> Sent: Wednesday, June 18, 2025 2:44:00 PM
> Subject: Re: [PATCH v2 2/6] pci/hotplug/pnv_php: Work around switches with broken

> [+cc Lukas, pciehp expert]
> 
> On Wed, Jun 18, 2025 at 11:56:54AM -0500, Timothy Pearson wrote:
>>  presence detection
> 
> (subject/commit wrapping seems to be on all of these patches)
> 
>> The Microsemi Switchtec PM8533 PFX 48xG3 [11f8:8533] PCIe switch system
>> was observed to incorrectly assert the Presence Detect Set bit in its
>> capabilities when tested on a Raptor Computing Systems Blackbird system,
>> resulting in the hot insert path never attempting a rescan of the bus
>> and any downstream devices not being re-detected.
> 
> Seems like this switch supports standard PCIe hotplug?  Quite a bit of
> this driver looks similar to things in pciehp.  Is there some reason
> we can't use pciehp directly?  Maybe pciehp could work if there were
> hooks for the PPC-specific bits?

While that is a good long term goal that Raptor is willing to work toward, it is non-trivial and will require buy-in from other stakeholders (e.g. IBM).  If practical, I'd like to get this series merged first, to fix the broken hotplug on our hardware that is deployed worldwide, then in parallel see what can be done to merge PowerNV support into pciehp.  Would that work?

