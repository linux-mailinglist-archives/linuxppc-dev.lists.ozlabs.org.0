Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 892F294A148
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 09:01:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=kPhH75tf;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DJX1D3Qs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf1L23Jwkz3d8F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 17:01:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=kPhH75tf;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DJX1D3Qs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.143; helo=flow8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow8-smtp.messagingengine.com (flow8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf1J00gTcz3dC5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 16:59:26 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailflow.nyi.internal (Postfix) with ESMTP id 52279201084;
	Wed,  7 Aug 2024 02:59:23 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Wed, 07 Aug 2024 02:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1723013963;
	 x=1723021163; bh=FeNTTWWA5ehqGUK/ykoVQRn5aOHJYvmKcULV7Bb3w+o=; b=
	kPhH75tfZYNQZZn5b4ZTyTUJkEwDswZvtVxsA4I1kYYHJT9hm6Y1VWq1tWoRdBr2
	5gcBvejk5u6w6xKKbpBKwnhLRlsLhO9eQUqJWCA+btbwX9ngh+x0EMbsvrrTdurE
	xpzX7LS9Lhl1ZeTCcGI88lLtBUG3WdAQOw0MkNqzmyryl38Rfs0Hxm5tgzSKr4jP
	FndM/8x4bIHcTFdnwjdTaScHkNMTMQT6UWqmZgTXDn+FulQ3eTrzHm2J2m2zT0hd
	lWadi0s/oUZYjUbYUYH3dBNHYNH5Hgd9tJnC9YxtPeG49Jb50z1u1bvmjUjO5Rw1
	0pmH62zjtpVTK4nq8eJMFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723013963; x=
	1723021163; bh=FeNTTWWA5ehqGUK/ykoVQRn5aOHJYvmKcULV7Bb3w+o=; b=D
	JX1D3Qss3Ge1TnNidK/zkvKY/8JNrKtEIApToVgGiC42kGtqI8ow6AGVUOAMbazW
	itBUjWk7aqA8yzNfj892AZR3IHGTb9zwLEgUzS+hIBK5Li2OvlE3ONpYl/0zE/5z
	h3soTk1czdmBNxcV5RI4Do6avSG2cQvjSpC45gT6FmO3Qj+xS+dn/cKTfw+I2rct
	z4jv6Eo5QqHEbksHHHuWMRpE/t4bFAn3fb2+Ygv0oUrdld/RpBq9urHfN3Vqc9tJ
	gfZUDZDJt0uvrtjpGSdhW8XAeAu6OeyUi0Jj4EJz55jsk1Of/gddMR0clliKyyiD
	Dz/tJMxY0o+kqe5Jqh2CQ==
X-ME-Sender: <xms:SRuzZpFLEGrL01CvOzZ7NicPwEvIcv3ZOSAEwfT0KIc13xEWibFx_g>
    <xme:SRuzZuWOdnwVN62CY7TMMAVOQnMMo0UnpkJQhkqGvrgUGWhp1vAWaBOYOG7_0rIRv
    GBMBRlfs0GZCyqUvYc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkeelgdduudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefh
    vdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:SRuzZrLtWMsNgz7w87FJP8TbwXCRbvNB3tiVt8c9qWjaR5ujVwWSEg>
    <xmx:SRuzZvGMZjtlTl2iioVuNelCvksPQt_NUQQ8oxahwjUInjv5odRUjA>
    <xmx:SRuzZvVMupVgHTmvlEfTDZFTFuqoKesigKTc9co5c2CZoJ90OcfE1g>
    <xmx:SRuzZqN-OQqNrinlJf78x4O8VL12d16J4HsptuQe5s0rO9OiA3XUXg>
    <xmx:SxuzZpwYl7eOyL1UyDIm9UU-ZJT7YdfL_32mlOGPjpZKCsOuYKvqpDmx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 97D26B6008D; Wed,  7 Aug 2024 02:59:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 07 Aug 2024 08:58:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mike Rapoport" <rppt@kernel.org>, linux-kernel@vger.kernel.org
Message-Id: <1befc540-8904-4c23-b0e6-e2c556fe22b9@app.fastmail.com>
In-Reply-To: <20240807064110.1003856-25-rppt@kernel.org>
References: <20240807064110.1003856-1-rppt@kernel.org>
 <20240807064110.1003856-25-rppt@kernel.org>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Linux-Arch <linux-arch@vger.kernel.org>, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 7, 2024, at 08:41, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Until now arch_numa was directly translating firmware NUMA information
> to memblock.

I get a link time warning from this:

    WARNING: modpost: vmlinux: section mismatch in reference: numa_set_cpumask+0x24 (section: .text.unlikely) -> early_cpu_to_node (section: .init.text)

> @@ -142,7 +144,7 @@ void __init early_map_cpu_to_node(unsigned int cpu, int nid)
>  unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
>  EXPORT_SYMBOL(__per_cpu_offset);
> 
> -int __init early_cpu_to_node(int cpu)
> +int early_cpu_to_node(int cpu)
>  {
>  	return cpu_to_node_map[cpu];
>  }

early_cpu_to_node() can no longer be __init here

> +#endif /* CONFIG_NUMA_EMU */
> diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
> index c32e0cf23c90..c2b046d1fd82 100644
> --- a/include/asm-generic/numa.h
> +++ b/include/asm-generic/numa.h
> @@ -32,8 +32,6 @@ static inline const struct cpumask *cpumask_of_node(int node)
> 
>  void __init arch_numa_init(void);
>  int __init numa_add_memblk(int nodeid, u64 start, u64 end);
> -void __init numa_set_distance(int from, int to, int distance);
> -void __init numa_free_distance(void);
>  void __init early_map_cpu_to_node(unsigned int cpu, int nid);
>  int __init early_cpu_to_node(int cpu);
>  void numa_store_cpu_info(unsigned int cpu);

but is still declared as __init in the header, so it is
still put in that section and discarded after boot.

I was confused by this at first, since the 'early' name
seems to imply that you shouldn't call it once the system
is up, but now you do.

     Arnd
