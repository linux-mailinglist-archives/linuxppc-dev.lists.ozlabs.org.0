Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9334939761
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 02:16:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=FU5sqAql;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSd3m5zqKz3cXt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 10:16:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=FU5sqAql;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stgolabs.net (client-ip=23.83.223.168; helo=slateblue.cherry.relay.mailchannels.net; envelope-from=dave@stgolabs.net; receiver=lists.ozlabs.org)
Received: from slateblue.cherry.relay.mailchannels.net (slateblue.cherry.relay.mailchannels.net [23.83.223.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSd3406Nyz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 10:15:42 +1000 (AEST)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1E086805A36;
	Tue, 23 Jul 2024 00:15:39 +0000 (UTC)
Received: from pdx1-sub0-mail-a214.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4A384806031;
	Tue, 23 Jul 2024 00:15:38 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1721693738; a=rsa-sha256;
	cv=none;
	b=NT/VuLPGSsXIS+33VS9VsqvYIMvRYDDuKR7jGAo1uczzflAGxyy0dq8IzLuBXAUoCF/A5o
	r0dUQSRQwV0cGgh5kT4NsYiRkj7qRJ3SUqjV+hVTET1wLEVqagAZ6BMufpiCU60vxhTIHG
	UiwgbCQaussisE3yLEVZeHmpAtoBjdg07DpL8KGqH+amyJLjzn4SNXrWInTsHOVKK6O13a
	qxlp8722ii2v/+YIvG9YRD1PYeR6ohGVzZyRhEjiUMQMePf7apiR9KsZSQf3oxZ8HamAIl
	yqzyfnZ5cru80vvBbNejM9uPRTG9x53YJP47GMbYztpBrW0c20m4P3OkS6sdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1721693738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=BfrsTF3PjDyketH5sAvV75FgyXiYN8/JjDAq8vHafIY=;
	b=E2ZM2eRjdopLhRqJ0qkfxrHZlZAsVY66TXjoXe6dr3bDm3AABn4cDR12NX7RXY0R1JoBVM
	bCSZqgizyBERW3jZ/jul91PwZ5i20Q78rmORhjyNFw0OwG/VEQHwqYaMRLqg3pGqqDNWVk
	NbiQv6TvMfq1yYQAmrCxYS8G09Tt7xc+74qJ6IArlOoMy/MD6C/lJGZLMEIgSj4PjS2uOy
	1d1WKJzIHp9QF/4p/tI+9TqjK1jYZXXeDWqukjxduieiW7xDncLGKeQtO1tfLCd93aveOD
	Cfg0m8teciQcZOjYG5n7Uhlgs1/fgszgOFydcfaGWi4oJJNm4ZsEh89c7a9j4g==
ARC-Authentication-Results: i=1;
	rspamd-587dc898b6-9fwgf;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Fearful-Macabre: 125d6dc84c6e5729_1721693738922_585174325
X-MC-Loop-Signature: 1721693738922:3890902801
X-MC-Ingress-Time: 1721693738922
Received: from pdx1-sub0-mail-a214.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.121.241.7 (trex/7.0.2);
	Tue, 23 Jul 2024 00:15:38 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a214.dreamhost.com (Postfix) with ESMTPSA id 4WSd2v6Krhz2K;
	Mon, 22 Jul 2024 17:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1721693738;
	bh=BfrsTF3PjDyketH5sAvV75FgyXiYN8/JjDAq8vHafIY=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=FU5sqAqlnBAYPEJ1amDjGSFoog2KTuxMpl2bRre6zYepul8zS777HtjxiV/Ti470X
	 7tTal7LNWT5qzdwm/Kgi3LJXNinfroiFwVnE6WJGEz2W/hH5jx9Nn61DcPRQ7jOeGJ
	 QG2H/imfq2kX6wbJ1Wx+WC82p9fLQZ3CQU7UUqDOyiXQ8yVnFmdTaulAI/+6MeA0Ly
	 TdXIhGuabrciys+H/4aPga+ApM7IEMPP6W7QeZajTtwkoraSNUOE2DuNdBwtLT8juH
	 ND031tUJHkyvIA/KoaxhVv/myZsSqprEhkI80zrbBDsKfaVGCL4giJ+3VB8gTxKhgo
	 bf18mBD7JAeog==
Date: Mon, 22 Jul 2024 17:15:32 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 04/17] arch, mm: move definition of node_data to generic
 code
Message-ID: <vwofm2kcltxn4ysrf4lefe2zdqvo2upxdyntatmnh3sywcnjlq@4c6wlllurfn5>
Mail-Followup-To: Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dan Williams <dan.j.williams@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-5-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240716111346.3676969-5-rppt@kernel.org>
User-Agent: NeoMutt/20240425
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Jul 2024, Mike Rapoport wrote:\n
>From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
>Every architecture that supports NUMA defines node_data in the same way:
>
>	struct pglist_data *node_data[MAX_NUMNODES];
>
>No reason to keep multiple copies of this definition and its forward
>declarations, especially when such forward declaration is the only thing
>in include/asm/mmzone.h for many architectures.
>
>Add definition and declaration of node_data to generic code and drop
>architecture-specific versions.
>
>Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Nice cleanup.

Acked-by: Davidlohr Bueso <dave@stgolabs.net>
