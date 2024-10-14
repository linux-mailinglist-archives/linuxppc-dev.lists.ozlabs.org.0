Return-Path: <linuxppc-dev+bounces-2202-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9BF99C6D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 12:10:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRtKQ2PJSz3bjH;
	Mon, 14 Oct 2024 21:10:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728900650;
	cv=none; b=NisdIPdOKL1B+o/1zOG1WpMdalOmVt4ZIcSwGAj7k8631VjX5NFNjo61+/FIvvuE/BukhVotaPTxZ/11KnAU6liC7zP2qvTqBYMTUXYndm5HEGB0YBcIHCpOABJVEZv8I4UrFKKZlmKAknuIqouVC03LullbVy+m/awRsie8G3RPx1XuCxtbKQQI991HyuMVnrCZMVIknxpeT8IW0vHSkw5VgdCjuWpZsHdp6Z3hR4OXSmmYGBSgext18daonRzF/HEhfCTgCkAgDavM83cT7NSSDYPjqt2miee9SinX7dpqznbmNTOSp3pN8VeCm0ZhToz4tQBD3UmHUGj1lMAGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728900650; c=relaxed/relaxed;
	bh=0o1NINh/+wBe6kYVagKHzevIHa4M2xlTq+vTRXr322E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lJnQFJq/SQrE5QcGSfER2TyX/thpf8YWRE+mcDYzXhhXysGtopH9N8ttDdFawJe0ek8UobHnb/N07Dgneh8pqQ+AbbU3PUDOy5YONUW6IrZRnCXa3BS3yvrdu7r4QIc0kCA6Ntl6gCypPLw26knb5U+U1nQzuqe462KDOBh6wg3kK4X+Gc/FA2rAys2ZZbj6RU/qni2QXEX32uFfpZmFTQrlqsLdPezmtJsUSUQ9kYDuHoKXh1kb0IAC1n+k/BqvmtLhg/RXRF2EIfgRjXaqTTQ1D6NkdD1PbCb7bGvnoz9eRIktJAJ9GDnbsC7y0Yzo4/oPTrkRzxFljAZjpoZnSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lRFtOwLG; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lRFtOwLG;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRtKN2xgDz30MR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 21:10:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728900646;
	bh=0o1NINh/+wBe6kYVagKHzevIHa4M2xlTq+vTRXr322E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lRFtOwLG553+wMwRyTQJRzTX0Sx3Tsd5z7650f6KXw8VrUpiPSKTyE79OaylqfofD
	 YFvVKbAprk5a0txEneOnVuk8DHVlarZ5ap8D74qd4dnsBpfkA8wzVMWon4VHZ7X1Q/
	 XjwRuy57ZdrTaPGACtl2SjSPXRupDRLlPmzOzGrda4DU7IYtvrq0+rKvZKSv2V/A9b
	 unQlIe9G4ozVF54tGHzXmBJ1I1j4WZB13uI/4wB9o3vrbXv02s0F0oGegFPzP8xOl2
	 EErTNd0tG7MZtjQPeVmMqxLe7Px83A4kjYmi426aVPKaFp+tvbRF+fY+SCew6XRKko
	 bs9upbplByYTA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XRtKL2K8cz4wnw;
	Mon, 14 Oct 2024 21:10:46 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.ibm.com>
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Gaurav Batra
 <gbatra@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/iommu: Wait until all TCEs are unmapped
 before deleting DDW
In-Reply-To: <20240916183558.89919-1-gbatra@linux.ibm.com>
References: <20240916183558.89919-1-gbatra@linux.ibm.com>
Date: Mon, 14 Oct 2024 21:10:46 +1100
Message-ID: <87cyk35715.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Gaurav,

Gaurav Batra <gbatra@linux.ibm.com> writes:
> Some of the network drivers, like Mellanox, use core linux page_pool APIs
> to manage DMA buffers. These page_pool APIs cache DMA buffers with
> infrequent map/unmap calls for DMA mappings, thus increasing performance.

Can you please resend this and Cc the netdev list, lkml, maybe the IOMMU
list (iommu@lists.linux.dev) and the page_pool maintainers:

PAGE POOL
M:	Jesper Dangaard Brouer <hawk@kernel.org>
M:	Ilias Apalodimas <ilias.apalodimas@linaro.org>

Perhaps they'll have some ideas on how to solve the issue. And at least
we don't want to add a workaround for their APIs without informing the
maintainers that we're doing so.

> When a device is initialized, the drivers makes a call to the page_pool API
> to create a DMA buffer pool. Hence forth DMA buffers are allocated and
> freed from this pool by the driver. The DMA map/unmap is done by the core
> page_pool infrastructure.
>
> These DMA buffers could be allocated for RX/TX buffer rings for the device
> or could be in-process by the network stack.
>
> When a network device is closed, driver will release all DMA mapped
> buffers. All the DMA buffers allocated to the RX/TX rings are released back
> to the page_pool by the driver. Some of the DMA mapped buffers could still
> be allocated and in-process by the network stack.
>
> DMA buffers that are relased by the Network driver are synchronously
> unmapped by the page_pool APIs. But, DMA buffers that are passed to the
> network stack and still in-process are unmapped later asynchronously by the
> page_pool infrastructure.
>
> This asynchronous unmapping of the DMA buffers, by the page_pool, can lead
> to issues when a network device is dynamically removed in PowerPC
> architecture.  When a network device is DLPAR removed, the driver releases
> all the mapped DMA buffers and stops using the device. Driver returns
> successfully. But, at this stage there still could be mapped DMA buffers
> which are in-process by the network stack.
>
> DLPAR code proceeds to remove the device from the device tree, deletes
> Dynamic DMA Window (DDW) and associated IOMMU tables. DLPAR of the device
> succeeds.

Are we missing a call to synchronize_net() somewhere in the DLPAR code?

Though I would have thought the network core would do that somewhere.

The ideal solution would be that we don't have to do any wait loop, and
instead explicitly wait for the network stack to finish any outstanding
packets.

> Later, when network stack release some of the DMA buffers, page_pool
> proceeds to unmap them. The page_pool relase path calls into PowerPC TCE
> management to release the TCE. This is where the LPAR OOPses since the DDW
> and associated resources for the device are already free'ed.

Can you post the oops for reference please.

> This issue was exposed during LPM from a Power9 to Power10 machine with HNV
 
Please expand what LPM means for non-IBM folks - Live Partition Migration.

> configuration. The bonding device is Virtual Ethernet with SR-IOV. During
> LPM, I/O is switched from SR-IOV to passive Virtual Ethernet and DLPAR
> remove of SR-IOV is initiated. This lead to the above mentioned scenario.
>
> It is possible to hit this issue by just Dynamically removing SR-IOV device
> which is under heavy I/O load, a scenario where some of the mapped DMA
> buffers are in-process somewhere in the network stack and not mapped to the
> RX/TX ring of the device.
>
> The issue is only encountered when TCEs are dynamically managed. In this
> scenario map/unmap of TCEs goes into the PowerPC TCE management path as and
> when DMA bufffers are mapped/unmaped and accesses DDW resources. When RAM
> is directly mapped during device initialization, this dynamic TCE
> management is by-passed and LPAR doesn't OOPses.
>
> Solution:
>
> During DLPAR remove of the device, before deleting the DDW and associated
> resources, check to see if there are any outstanding TCEs. If there are
> outstanding TCEs, sleep for 50ms and check again, until all the TCEs are
> unmapped.
>
> Once all the TCEs are unmapped, DDW is removed and DLPAR succeeds. This
> ensures there will be no reference to the DDW after it is deleted.

That description doesn't quite match the code, which has a 120 second
timeout after which it just continues along in hope :)

It's good that the code doesn't block forever, but it's bad that it
leaves open the possibility that it will still oops.

Is it possible to detect the double-free and prevent the oops there?

cheers

