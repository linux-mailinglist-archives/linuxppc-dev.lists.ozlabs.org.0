Return-Path: <linuxppc-dev+bounces-13942-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FF8C40C18
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 17:07:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d33qP59C1z3bt9;
	Sat,  8 Nov 2025 03:07:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762531649;
	cv=none; b=MgQr4DYBK0ZcsxuMwISx1PIPV3Ekfi6nLLuD9f9SOYwQUPMUonbPoLQD2L3wHUO9F0Rc49T1XW22g1ER83XBPEeEgWHUXvSeFc+jQjJvtf9dAphKe2bvcvkmR3zuVJk6+bieiWsetr6YOAmbM03aDx1Te2fOU9wMKUSF1F9v6PAzB5ysv1hqMdAkJZM84vT6+drplVpyim2zcnuIQQgkOxYYDBLCfHrS+CaeowsmNqtpX3o6Dgp0bjAw3S/gtxzGgSJhMtaQl+L1iWjozJcJz15AupmsnxAWf92ffO4cs0mk1hvlsLpppZ5rlr2eJSDxqRWreImoukkShjMmRhhaoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762531649; c=relaxed/relaxed;
	bh=5hxGhzBJs6gJa/ASFK5SjIMdAdt+bdzNzMEFXUGcp8g=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=AUAFdXGFS6kOMr+Xj8JLJTDr0ntBka6fNY+ULW6E0QJSgmtTXW1yRQWiUqFG1px2byZJVh9oQh1a1I7a9LcQHBaBGkDCZ1f4ljqvyLcoTHyV7bQPqXOnovNALWJhpg76887MTx8ZUqY3t0ySzkuZQmOb5vfnULsqxB/9tElaSXi4FfkMCZL0aYr2wxlogcReYVwPX/BPOh9KVHiCk6jyLuKBbcKx16BAlBGBfrTNQ3/l3hANS+7FWyAfmexjF4yhav9tUAwShok8GSvEhx/38ZUT1ouCnkq5ANvJJ1Shqr8lplJws4Pj12UlYuPz9C46/oM5y1cw2OS0WbRYdpRjeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=pb1KkEXj; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=pb1KkEXj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d33qL5l6gz3bsN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 03:07:26 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C283077908A1;
	Fri,  7 Nov 2025 10:07:22 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 21dgOA9Zntfu; Fri,  7 Nov 2025 10:07:20 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id BB3857791950;
	Fri,  7 Nov 2025 10:07:20 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com BB3857791950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1762531640; bh=5hxGhzBJs6gJa/ASFK5SjIMdAdt+bdzNzMEFXUGcp8g=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=pb1KkEXjGw/I4q36LwOmPSLTVqKvP8AyRnqDq7fubf8C4qeiHO0Nr9G7MGGYHpFqN
	 810OC5KBlUEQX0b/KDvOq7EfTnswx9Du5/x25F9dgecOI7H1EMgMp71s0AHb391kpx
	 DaWsfU7flNSmjb3ywxhFjFqWsa/ocOCaQNQfsNVY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Npboz4zOJH1J; Fri,  7 Nov 2025 10:07:20 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 9050377908A1;
	Fri,  7 Nov 2025 10:07:20 -0600 (CST)
Date: Fri, 7 Nov 2025 10:07:20 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <1801829574.18016.1762531640458.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <2d00ed57-3c74-492e-83ae-88ca1ce98311@kernel.org>
References: <1268570622.1359844.1752615109932.JavaMail.zimbra@raptorengineeringinc.com> <2013845045.1359852.1752615367790.JavaMail.zimbra@raptorengineeringinc.com> <bf390f9e-e06f-4743-a9dc-e0b995c2bab2@kernel.org> <304758063.1694752.1757427687463.JavaMail.zimbra@raptorengineeringinc.com> <97746540.1782404.1759973048120.JavaMail.zimbra@raptorengineeringinc.com> <2d00ed57-3c74-492e-83ae-88ca1ce98311@kernel.org>
Subject: Re: [PATCH] PCI: pnv_php: Fix potential NULL dereference in slot
 allocator
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
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: pnv_php: Fix potential NULL dereference in slot allocator
Thread-Index: CtRjw05oWZGOt/qVaF0yP9/m4nCNzA==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Jiri Slaby" <jirislaby@kernel.org>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-pci"
> <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
> "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Bjorn Helgaas"
> <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>
> Sent: Thursday, October 9, 2025 12:54:19 AM
> Subject: Re: [PATCH] PCI: pnv_php: Fix potential NULL dereference in slot allocator

> On 09. 10. 25, 3:24, Timothy Pearson wrote:
>> A highly unlikely NULL dereference in the allocation error handling path was
>> introduced in 466861909255.  Avoid dereferencing php_slot->bus by using
>> dev_warn() instead of SLOT_WARN() in the error path.
>> 
>> Fixes: 466861909255 ("PCI: pnv_php: Clean up allocated IRQs on unplug")
>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> 
> LGTM, perhaps also a lnk to the report:
> Link:
> https://lore.kernel.org/all/304758063.1694752.1757427687463.JavaMail.zimbra@raptorengineeringinc.com/
> 
> 
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
> 
> thanks,
> --
> js
> suse labs

Just a quick follow up on this to see if we could get it merged?  Thanks!

