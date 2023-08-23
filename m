Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52637857C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:15:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4td4gxkz3hTM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:15:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4cy55qHz3c7C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:04:02 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4cy2gyGz4x2R;
	Wed, 23 Aug 2023 22:04:02 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>
In-Reply-To: <20230729073455.7918-1-kjain@linux.ibm.com>
References: <20230729073455.7918-1-kjain@linux.ibm.com>
Subject: Re: [PATCH v4 00/10] Add sysfs interface files to hv_gpci device to expose system information
Message-Id: <169279175562.797584.14623659463630712570.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
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
Cc: atrajeev@linux.vnet.ibm.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 29 Jul 2023 13:04:45 +0530, Kajol Jain wrote:
> The hcall H_GET_PERF_COUNTER_INFO can be used to get data related to
> chips, dimms and system topology, by passing different counter request
> values.
> Patchset adds sysfs files to "/sys/devices/hv_gpci/interface/"
> of hv_gpci pmu driver, which will expose system topology information
> using H_GET_PERF_COUNTER_INFO hcall. The added sysfs files are
> available for power10 and above platforms and needs root access
> to read the data.
> 
> [...]

Applied to powerpc/next.

[01/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show processor bus topology information
        https://git.kernel.org/powerpc/c/71f1c39647d8c9d4d54a861ec81f1ff17544bcb6
[02/10] docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document processor_bus_topology sysfs interface file
        https://git.kernel.org/powerpc/c/9caf9e2b8bae58e39501f6fb1fc9189009538ccc
[03/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show processor config information
        https://git.kernel.org/powerpc/c/1a160c2a13c66c9ad47436e73c821f3d26818733
[04/10] docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document processor_config sysfs interface file
        https://git.kernel.org/powerpc/c/3255171d3e861b14e4248a5c676099819cadfb6d
[05/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity domain via virtual processor information
        https://git.kernel.org/powerpc/c/71a7ccb478fcfe1495bcabf4972d859b24264df7
[06/10] docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document affinity_domain_via_virtual_processor sysfs interface file
        https://git.kernel.org/powerpc/c/cc89ff3491b61cebc90b3394eb6b36635173d0dd
[07/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity domain via domain information
        https://git.kernel.org/powerpc/c/a69a57cac1ec8995bb0b571dfccc3fe2f046719a
[08/10] docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document affinity_domain_via_domain sysfs interface file
        https://git.kernel.org/powerpc/c/ab7e991286e729b0018722591c04eb2fd31771b0
[09/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity domain via partition information
        https://git.kernel.org/powerpc/c/a15e0d6a6929e737f71578ed4b05531fed5a96e8
[10/10] docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document affinity_domain_via_partition sysfs interface file
        https://git.kernel.org/powerpc/c/8df99066940b6c82a0851f13adf653827dc524f7

cheers
