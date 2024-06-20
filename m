Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A720E91049B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 14:52:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4gPx2V98z3fys
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 22:52:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4gMW1ldtz3bZN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 22:50:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W4gMX0f0rz4w2K;
	Thu, 20 Jun 2024 22:50:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com, Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20240517142531.3273464-1-nilay@linux.ibm.com>
References: <20240517142531.3273464-1-nilay@linux.ibm.com>
Subject: Re: [PATCH v2 0/1] powerpc/numa: Make cpu/memory less numa-node online
Message-Id: <171888775101.806750.1610653396234062205.b4-ty@ellerman.id.au>
Date: Thu, 20 Jun 2024 22:49:11 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: gjoyce@linux.ibm.com, srikar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, sshegde@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 May 2024 19:55:21 +0530, Nilay Shroff wrote:
> On NUMA aware system, we make a numa-node online only if that node is
> attached to cpu/memory. However it's possible that we have some PCI/IO
> device affinitized to a numa-node which is not currently online. In such
> case we set the numa-node id of the corresponding PCI device to -1
> (NUMA_NO_NODE). Not assigning the correct numa-node id to PCI device may
> impact the performance of such device. For instance, we have a multi
> controller NVMe disk where each controller of the disk is attached to
> different PHB (PCI host bridge). Each of these PHBs has numa-node id
> assigned during PCI enumeration. During PCI enumeration if we find that
> the numa-node is not online then we set the numa-node id of the PHB to -1.
> If we create shared namespace and attach to multi controller NVMe disk
> then that namespace could be accessed through each controller and as each
> controller is connected to different PHBs, it's possible to access the
> same namespace using multiple PCI channel. While sending IO to a shared
> namespace, NVMe driver would calculate the optimal IO path using numa-node
> distance. However if the numa-node id is not correctly assigned to NVMe
> PCIe controller then it's possible that driver would calculate incorrect
> NUMA distance and hence select the non-optimal path for sending IO. If
> this happens then we could potentially observe the degraded IO performance.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/numa: Online a node if PHB is attached.
      https://git.kernel.org/powerpc/c/11981816e3614156a1fe14a1e8e77094ea46c7d5

cheers
