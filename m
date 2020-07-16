Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 060802224D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:07:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6x063YPNzDqV4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:07:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vQB0DRSzDqYX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPw74NVz9sVR; Thu, 16 Jul 2020 22:56:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200612051238.1007764-1-nathanl@linux.ibm.com>
References: <20200612051238.1007764-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH 00/18] remove extended cede offline mode and bogus
 topology update code
Message-Id: <159490401467.3805857.7402698619970310869.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:56:04 +1000 (AEST)
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
Cc: ego@linux.vnet.ibm.com, svaidy@linux.vnet.ibm.com,
 srikar@linux.vnet.ibm.com, npiggin@gmail.com, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Jun 2020 00:12:20 -0500, Nathan Lynch wrote:
> Two major parts to this series:
> 
> 1. Removal of the extended cede offline mode for CPUs as well as the
>    partition suspend code which accommodates it by temporarily
>    onlining all CPUs prior to suspending the LPAR. This solves some
>    accounting problems, simplifies the pseries CPU hotplug code, and
>    greatly uncomplicates the existing partition suspend code, easing
>    a much-needed transition to the Linux suspend framework. The two
>    patches which make up this part have been posted before:
> 
> [...]

Applied to powerpc/next.

[01/18] powerpc/pseries: remove cede offline state for CPUs
        https://git.kernel.org/powerpc/c/48f6e7f6d948b56489da027bc3284c709b939d28
[02/18] powerpc/rtas: don't online CPUs for partition suspend
        https://git.kernel.org/powerpc/c/ec2fc2a9e9bbad9023aab65bc472ce7a3ca8608f
[03/18] powerpc/numa: remove ability to enable topology updates
        https://git.kernel.org/powerpc/c/c30f931e891eb0a32885ecd79984e1e7366fceda
[04/18] powerpc/numa: remove unreachable topology update code
        https://git.kernel.org/powerpc/c/7d35bef96a46f7e9e167bb25258c0bd389aeab1b
[05/18] powerpc/numa: make vphn_enabled, prrn_enabled flags const
        https://git.kernel.org/powerpc/c/e6eacf8eb4dee7bc7021c837666e3ebf1b0ec3b5
[06/18] powerpc/numa: remove unreachable topology timer code
        https://git.kernel.org/powerpc/c/50e0cf3742a01e72f4ea4a8fe9221b152e22871b
[07/18] powerpc/numa: remove unreachable topology workqueue code
        https://git.kernel.org/powerpc/c/6325cb4a4ea8f4af8515b923650dd8f709694b44
[08/18] powerpc/numa: remove vphn_enabled and prrn_enabled internal flags
        https://git.kernel.org/powerpc/c/9fb8b5fd1bf782a8257506ad5198237f4124d556
[09/18] powerpc/numa: stub out numa_update_cpu_topology()
        https://git.kernel.org/powerpc/c/893ec6461f46c91487d914e6d467d2e804b9a883
[10/18] powerpc/numa: remove timed_topology_update()
        https://git.kernel.org/powerpc/c/b1815aeac7fde2dc3412daf2efaededd21cd58e0
[11/18] powerpc/numa: remove start/stop_topology_update()
        https://git.kernel.org/powerpc/c/1835303e5690cbeef2c07a9a5416045475ddaa13
[12/18] powerpc/rtasd: simplify handle_rtas_event(), emit message on events
        https://git.kernel.org/powerpc/c/91713ac377859893a7798999cb2e3a388d8ae710
[13/18] powerpc/numa: remove prrn_is_enabled()
        https://git.kernel.org/powerpc/c/042ef7cc43f4571d8cbe44a7c735ab6622809142
[14/18] powerpc/numa: remove arch_update_cpu_topology
        https://git.kernel.org/powerpc/c/cdf082c4570f186d608aca688f2cc872b014558a
[15/18] powerpc/pseries: remove prrn special case from DT update path
        https://git.kernel.org/powerpc/c/bb7c3d36e3b18aa02d34358ae75e1b91f69a968b
[16/18] powerpc/pseries: remove memory "re-add" implementation
        https://git.kernel.org/powerpc/c/4abe60c6448bf1dba48689450ad1348e5fc6f7b7
[17/18] powerpc/pseries: remove dlpar_cpu_readd()
        https://git.kernel.org/powerpc/c/38c392cef19019457ddcfb197ff3d9c5267698e6
[18/18] powerpc/pseries: remove obsolete memory hotplug DT notifier code
        https://git.kernel.org/powerpc/c/e978a3ccaa714b5ff125857d2cbecbb6fdf6c094

cheers
