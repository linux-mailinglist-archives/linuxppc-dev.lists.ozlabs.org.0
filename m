Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6006AF65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 20:57:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45p8mL5jgVzDqZN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 04:57:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="fLx81Axc"; 
 dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45p8kB4vllzDqZ9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 04:56:02 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id r1so22075015wrl.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 11:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HII1jGmOqJ+ZHDKFI1WGLRVkv6rLuJXcbXOQGuTO2qs=;
 b=fLx81Axc7fZXcKYyn4FdWmT0VEDGlHROQXan6kCDS1lBwXYOSOZICuwNpupEPxZ1KA
 wYSXFaoVOjGfUCkS+d8cHlAhu3M2pxovWkqnQFOwALA9QBVmnRkxZxo8H9luuiBMYElW
 teY5CswjSiHPAphop6UNge3b8FVvFOdl6ZPhV/lGeX4EdVgwNRrnGQgmpMB8qwN4h6Vz
 CUQTMLSjShRSEkdrxPF+i2v0KnEMWmD2NuZDGJaVq93w9O/93sXEJ13J+BUqFv+mqIR0
 a2nSPFa0W7ZgTdiFK5BAgfXI4EwftEfi8ScyprvmIm71SEiMx2Gq30N3zYyTNzblFVBj
 IDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HII1jGmOqJ+ZHDKFI1WGLRVkv6rLuJXcbXOQGuTO2qs=;
 b=o76sJrDxWZMpvikLEVGCfPFcEy1Dhl5EHPnJ25r3vRYA8rJgGikalv8PbOJELsi1QZ
 Vwucr/thuybjh3dFM1W4owEZHrWeFZ4SL8KQX8NMnsk1XilMYkWYCkadDWfGMQ9H/N/B
 FzneBp3E1hcujX4E6Vsc022ZUClQIluQuwGkSChEMmFYmKi5WrcHYqLwt5S2m8S4uM+n
 TaZj21azbc/6nXfdh1uWMrOpjpLjagzdwhSSpqhzUffGofE2XjqFNcJ/J2u1mmnzjsqn
 BCt5HtgiBHtoAhpbB1v3X3jDwgJiurax3KUOHoVd0HU2Ef4/OUDC1AZHejiQAq7WrQeD
 6xWg==
X-Gm-Message-State: APjAAAWChLpbzUZm9U91L3n0Tmpz2Z6eMeDhj7dVXJevmxehZFVCZQFW
 OYbvE88v1HWtSLGG7BQRXvo=
X-Google-Smtp-Source: APXvYqxjOiZ+/ZmqnAl0iYfzzo4MAVdDizISydYdFT08PVtYYgV0sowV+fqLU0s1PX6fcTCrkIj0Fw==
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr36779432wrq.333.1563303357931; 
 Tue, 16 Jul 2019 11:55:57 -0700 (PDT)
Received: from brauner.io ([213.220.153.21])
 by smtp.gmail.com with ESMTPSA id j33sm48044545wre.42.2019.07.16.11.55.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 11:55:57 -0700 (PDT)
Date: Tue, 16 Jul 2019 20:55:55 +0200
From: Christian Brauner <christian@brauner.io>
To: Sven Schnelle <svens@stackframe.org>
Subject: Re: [PATCH 1/2] arch: mark syscall number 435 reserved for clone3
Message-ID: <20190716185554.gwpppirvmxgvnkgb@brauner.io>
References: <20190714192205.27190-1-christian@brauner.io>
 <20190714192205.27190-2-christian@brauner.io>
 <e14eb2f9-43cb-0b9d-dec4-b7e7dcd62091@de.ibm.com>
 <20190716130631.tohj4ub54md25dys@brauner.io>
 <20190716185310.GA12537@t470p.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190716185310.GA12537@t470p.stackframe.org>
User-Agent: NeoMutt/20180716
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de,
 linux-sh@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Vasily Gorbik <gor@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 16, 2019 at 08:53:10PM +0200, Sven Schnelle wrote:
> Hi,
> 
> [Adding Helge to CC list]
> 
> On Tue, Jul 16, 2019 at 03:06:33PM +0200, Christian Brauner wrote:
> > On Mon, Jul 15, 2019 at 03:56:04PM +0200, Christian Borntraeger wrote:
> > > I think Vasily already has a clone3 patch for s390x with 435. 
> > 
> > A quick follow-up on this. Helge and Michael have asked whether there
> > are any tests for clone3. Yes, there will be and I try to have them
> > ready by the end of the this or next week for review. In the meantime I
> > hope the following minimalistic test program that just verifies very
> > very basic functionality (It's not pretty.) will help you test:
> > [..]
> 
> On PA-RISC this seems to work fine with Helge's patch to wire up the
> clone3 syscall.

I think I already responded to Helge before and yes, I think that parisc
doesn't do anything special for fork, vfork, clone, and by extension
also probably doesn't need to for clone3.
It should only be a problem for arches that require mucking explicitly
with arguments of clone-like syscalls.
In any case, I saw Helge's patch and I think I might've missed to add an
Acked-by but feel free to add it.

Thanks for testing it and sorry that I couldn't test!
Christian
