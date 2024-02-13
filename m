Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7698533B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 15:54:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=unoeuro header.b=fxRUG6+y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ49j5ftcz3dVL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 01:54:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=unoeuro header.b=fxRUG6+y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gaisler.com (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 524 seconds by postgrey-1.37 at boromir; Wed, 14 Feb 2024 01:54:06 AEDT
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZ48t63NRz3cB2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 01:54:06 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4TZ3yd4Dj4z681k;
	Tue, 13 Feb 2024 15:45:13 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4TZ3yH6LD4z67wS;
	Tue, 13 Feb 2024 15:44:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=unoeuro; t=1707835513;
	bh=v6NrxM1eJN7Z7yzkWSBTKUltm5dbJ2HTXi9hG2LMSTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fxRUG6+yBSU+BFXn6+rebuuiiuqqWopqe29Vz2GaIf78w+V69ZIB+Af31iKeLr62p
	 qpQdz7sWHzQ58CP3tqsZon5MfZ78+Sms5m4nebpjjUITGZQ1A2ZnKMsF4BxSh1OMBa
	 S898RixpmWtD3+3XqXRY4JGgZ7I8bBk64Oy1wp1k=
Message-ID: <4582ff28-a443-4b0f-ba92-f48c414e2248@gaisler.com>
Date: Tue, 13 Feb 2024 15:44:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build regressions/improvements in v6.8-rc1
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org
References: <CAHk-=wiB4iHTtfZKiy5pC24uOjun4fbj4kSX0=ZnGsOXadMf6g@mail.gmail.com>
 <20240123111235.3097079-1-geert@linux-m68k.org>
 <d03e90ca-8485-4d1b-5ec1-c3398e0e8da@linux-m68k.org>
 <0229fa60-2d87-4b1c-b9f0-6f04c6e4dbdd@app.fastmail.com>
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <0229fa60-2d87-4b1c-b9f0-6f04c6e4dbdd@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Chris Zankel <chris@zankel.net>, linux-scsi@vger.kernel.org, linux-sh@vger.kernel.org, Netdev <netdev@vger.kernel.org>, mpi3mr-linuxdrv.pdl@broadcom.com, qat-linux@intel.com, dri-devel@lists.freedesktop.org, Max Filippov <jcmvbkbc@gmail.com>, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, sparclinux@vger.kernel.org, "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024-01-23 15:21, Arnd Bergmann wrote:
>>>  + /kisskb/src/arch/sparc/include/asm/floppy_64.h: error: no previous prototype for 'sparc_floppy_irq' [-Werror=missing-prototypes]:  => 200:13
>>>  + /kisskb/src/arch/sparc/include/asm/floppy_64.h: error: no previous prototype for 'sun_pci_fd_dma_callback' [-Werror=missing-prototypes]:  => 437:6
>>
>> sparc64-gcc{5,11,12,13}/sparc64-allmodconfig
> 
> Andrew Morton did a patch for the sparc warnings, and Andreas Larsson
> is joining as a maintainer, so hopefully he can pick that up soon.
Which patch do you refer to here? I can not seem to find a patch fixing
these ones in particular on lore.kernel.org.

Thanks,
Andreas

