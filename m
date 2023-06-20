Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9A2736C08
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 14:36:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PhN/KOw/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlmN014xmz30fl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 22:36:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PhN/KOw/;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlmM655HBz30dm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 22:35:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QlmM525XFz4wgC;
	Tue, 20 Jun 2023 22:35:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1687264546;
	bh=NNZvBmcHsUpW5L4caVDTHkKQNYI3MNK7pK1wIpcUQD8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PhN/KOw/QD+lh29GDqyKOAM6uQItlEwNbcqchju7I269XFcX6DsLcfSypUtdp6D9k
	 cH+ins8KoeU1ZK2FumInHFKl7GPnVCnuBazRJQJ18NLGNQPQL3ocHhtKWZrncr2IXB
	 Jnd0tMJoGNjsbuZJlZMHWQTWR7UxEcBE6QkouWZ1ylER3LHEOn5NVNdg9b83p6gO66
	 cmbPZdEhG5d+YZ+O7DbioftdYhzFMjYNvOEE6FssiC2AsYO4j6B6b99+g+pw3+vwKe
	 SbjCpT7rnfm0gX3vTEciMaZ1JHZDXck4/LWxVp2E+SoR32/GmnrDeoM1WO5fHwzIak
	 2cukMOzuU7dww==
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Hildenbrand <david@redhat.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH v2 2/2] powerpc/mm: Add memory_block_size as a kernel
 parameter
In-Reply-To: <853eae60-b92b-9284-e24d-564429aba8c1@redhat.com>
References: <20230609060851.329406-1-aneesh.kumar@linux.ibm.com>
 <20230609060851.329406-2-aneesh.kumar@linux.ibm.com>
 <853eae60-b92b-9284-e24d-564429aba8c1@redhat.com>
Date: Tue, 20 Jun 2023 22:35:44 +1000
Message-ID: <87mt0upazj.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: foraker1@llnl.gov
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:
> On 09.06.23 08:08, Aneesh Kumar K.V wrote:
>> Certain devices can possess non-standard memory capacities, not constrained
>> to multiples of 1GB. Provide a kernel parameter so that we can map the
>> device memory completely on memory hotplug.
>
> So, the unfortunate thing is that these devices would have worked out of 
> the box before the memory block size was increased from 256 MiB to 1 GiB 
> in these setups. Now, one has to fine-tune the memory block size. The 
> only other arch that I know, which supports setting the memory block 
> size, is x86 for special (large) UV systems -- and at least in the past 
> 128 MiB vs. 2 GiB memory blocks made a performance difference during 
> boot (maybe no longer today, who knows).
>
>
> Obviously, less tunable and getting stuff simply working out of the box 
> is preferable.
>
> Two questions:
>
> 1) Isn't there a way to improve auto-detection to fallback to 256 MiB in 
> these setups, to avoid specifying these parameters?
>
> 2) Is the 256 MiB -> 1 GiB memory block size switch really worth it? On 
> x86-64, experiments (with direct map fragmentation) showed that the 
> effective performance boost is pretty insignificant, so I wonder how big 
> the 1 GiB direct map performance improvement is.

The other issue is simply the number of sysfs entries.

With 64TB of memory and a 256MB block size you end up with ~250,000
directories in /sys/devices/system/memory.

cheers
