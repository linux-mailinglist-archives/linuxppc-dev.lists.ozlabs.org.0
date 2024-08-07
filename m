Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947E94B011
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 20:54:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=M+AgFKcn;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Cbd0u4JX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfK8g02KNz3dKH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 04:54:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=M+AgFKcn;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Cbd0u4JX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.142; helo=flow7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow7-smtp.messagingengine.com (flow7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfK7t64X7z3ck2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 04:53:30 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailflow.nyi.internal (Postfix) with ESMTP id B9FE8200F9C;
	Wed,  7 Aug 2024 14:53:26 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Wed, 07 Aug 2024 14:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1723056806;
	 x=1723064006; bh=dN92Yy3XFjXTxBQ/NKAZMCYVQAegkihc+8DVkcaUGXw=; b=
	M+AgFKcnD/Nuugw9QWMdK0TNIorx7c9kz4u4kWeEtoBkeDVxq1i8AfEINi28F8pD
	mqxXrgNc0hd7DLIVn8ZdgKKw1WixvvvthvoPlB32dikpdRyZeayfzxol4TWH5zV/
	sctoPTqK+Gpjs6mQSC5g5LuM5+hqde8Awr3BiE9VBetstqH9G+Y73dGI251beJG0
	KD/S9aRYjMWru5ducc9JFCJqHqrV4tG/Fb2biX0pP/55/wPz4yqBj2Cwo3Jic+yq
	Ts4ZD1s3I/J9I7pooC8Z3JaExlDJaha/uLa/IoywBt1Fj2dxnikSyGwL/537oKvz
	3Ga11kSBaDC1us7TovA9WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723056806; x=
	1723064006; bh=dN92Yy3XFjXTxBQ/NKAZMCYVQAegkihc+8DVkcaUGXw=; b=C
	bd0u4JXHiwM85jQmCceR5thBnLlVROGCSHq6uqUQH7EES4yd9w+rGDAsQiWGz/KE
	Tx9ieCb+syV32NMwTs+deNuAAbSSJe2g2WC6Q1eWWQa6JXLDL+jX7+woQX4AVmls
	7LKrhVy6yJsezqFhMNl/XzM0DJIJdjB2cO6q+5fT/oDBlh0O4crlMEUa9nDaj5+w
	8Li1kDK8ZNJzdI09O84Vv3hC186LsTWkCUiEZ2/yFGg3ilPlXUGqR2TZ+rh7pN7b
	zrQN9qvczGLLR6LFQdfP+t0gWYdb1IFiN8QXdil4RtN7+rEubC/YANNF+1Cs12kw
	Bcw5FrUO4Qwt7abMjpS7w==
X-ME-Sender: <xms:pcKzZnopk042s10_adxzzpGQqjjj1zN1aqGfzwY9vdXxA-HcaMU7yw>
    <xme:pcKzZhphWvwWMwSmYbDYPH1KAUK7_qukQL58dPLkKZwJ6qZO-PD0mTILf37wC-VkJ
    yuGeXAZyjmZouRsKac>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrledtgddufedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefh
    vdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:pcKzZkMMEa1QCyx9DYya--xGnOf_SSr3_VdEDtu9hV8xSe9yXZqVCw>
    <xmx:pcKzZq7W7a2W3QiuibYT4n87PxFgIhVytpph5nF0kYnO4gUYERaGxQ>
    <xmx:pcKzZm6A0MWzdmDLhHIywLO77HSPGI_SIwlTXUWpWoknLUo6ctrjwg>
    <xmx:pcKzZigfeNcP1X2tQ3rm8J0r0mNkRKSh21gYx64IauzFFFTIOJUQRw>
    <xmx:psKzZuEqNacnXDRDYO1s0FZVTS1ct0wiplIuRye5vQU_o20dyn1ygN6I>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id ED628B6008D; Wed,  7 Aug 2024 14:53:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 07 Aug 2024 20:53:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mike Rapoport" <rppt@kernel.org>
Message-Id: <19f7ccec-db2a-4176-b6d9-12abe0586d07@app.fastmail.com>
In-Reply-To: <ZrO6cExVz1He_yPn@kernel.org>
References: <20240807064110.1003856-1-rppt@kernel.org>
 <20240807064110.1003856-25-rppt@kernel.org>
 <1befc540-8904-4c23-b0e6-e2c556fe22b9@app.fastmail.com>
 <ZrO6cExVz1He_yPn@kernel.org>
Subject: Re: [PATCH v4 24/26] arch_numa: switch over to numa_memblks
Content-Type: text/plain
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Linux-Arch <linux-arch@vger.kernel.org>, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 7, 2024, at 20:18, Mike Rapoport wrote:
> On Wed, Aug 07, 2024 at 08:58:37AM +0200, Arnd Bergmann wrote:
>> On Wed, Aug 7, 2024, at 08:41, Mike Rapoport wrote:
>> > 
>> >  void __init arch_numa_init(void);
>> >  int __init numa_add_memblk(int nodeid, u64 start, u64 end);
>> > -void __init numa_set_distance(int from, int to, int distance);
>> > -void __init numa_free_distance(void);
>> >  void __init early_map_cpu_to_node(unsigned int cpu, int nid);
>> >  int __init early_cpu_to_node(int cpu);
>> >  void numa_store_cpu_info(unsigned int cpu);
>> 
>> but is still declared as __init in the header, so it is
>> still put in that section and discarded after boot.
>
> I believe this should fix it

Yes, sorry I should have posted the patch as well, this is
what I tested with locally.

     Arnd
