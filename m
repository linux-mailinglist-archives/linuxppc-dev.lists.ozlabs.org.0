Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A0BB5ABB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 07:16:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Y7WC4YLLzF4GZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 15:16:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Y7SS42YFzF1fj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 15:14:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="gGLtIr9n"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Y7SS0Mhrz9sN1;
 Wed, 18 Sep 2019 15:14:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568783656;
 bh=0GX6a3OL2WvaYkMnFPk+VVZdxjAwGOt5xOGNqhn4mlQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=gGLtIr9nMwI9YwoMEUeLtp7f5u71ki3KIy8TL5NYP54WpXnmpJQ5XiaouuzzOXa4t
 y103kXhg1KJCX399Zpi/Vt4JkeEn3Rfh+HMhivk2Ex3wcmFfClJwRdyCys1zUY411N
 wAyzDTMB7P2cX1foXv/a6r/auuiPGVUsMRUzYFfNwml1PaBhg/LUTpBjpy7uyl+atr
 sVvxhaELb5tp4r4hMIk5ci8T9OejZyG2EgtocNbQxlbPQYJhxy9rCA1sgSziBC7bHp
 /ad3ZHvPnv7gnK+lYJ3JJQ5+r/IsbWmY2Uiv6VaYcNR8K56KaqEz4Nc4sNx2ahRMKd
 /M3/ud+sEd4JQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH 0/2] pseries/hotplug: Change the default behaviour of
 cede_offline
In-Reply-To: <1568284541-15169-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1568284541-15169-1-git-send-email-ego@linux.vnet.ibm.com>
Date: Wed, 18 Sep 2019 15:14:15 +1000
Message-ID: <87r24ew5i0.fsf@mpe.ellerman.id.au>
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Kamalesh Babulal <kamaleshb@in.ibm.com>, linux-kernel@vger.kernel.org,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>
> Currently on Pseries Linux Guests, the offlined CPU can be put to one
> of the following two states:
>    - Long term processor cede (also called extended cede)
>    - Returned to the Hypervisor via RTAS "stop-self" call.
>
> This is controlled by the kernel boot parameter "cede_offline=on/off".
>
> By default the offlined CPUs enter extended cede.

Since commit 3aa565f53c39 ("powerpc/pseries: Add hooks to put the CPU into an appropriate offline state") (Nov 2009)

Which you wrote :)

Why was that wrong?

> The PHYP hypervisor considers CPUs in extended cede to be "active"
> since the CPUs are still under the control fo the Linux Guests. Hence, when we change the
> SMT modes by offlining the secondary CPUs, the PURR and the RWMR SPRs
> will continue to count the values for offlined CPUs in extended cede
> as if they are online.
>
> One of the expectations with PURR is that the for an interval of time,
> the sum of the PURR increments across the online CPUs of a core should
> equal the number of timebase ticks for that interval.
>
> This is currently not the case.

But why does that matter? It's just some accounting stuff, does it
actually break something meaningful?

Also what does this do to the latency of CPU online/offline.
And what does this do on KVM?


> In the following data (Generated using
> https://github.com/gautshen/misc/blob/master/purr_tb.py):
>
>
> delta tb = tb ticks elapsed in 1 second.
> delta purr = sum of PURR increments on online CPUs of that core in 1
>        	     second
>       
> SMT=off
> ===========================================
> Core        	delta tb(apprx)  delta purr	
> ===========================================
> core00 [  0]	512000000	69883784	
> core01 [  8]	512000000	88782536	
> core02 [ 16]	512000000	94296824	
> core03 [ 24]	512000000	80951968	

Showing the expected value in another column would make this much
clearer.

cheers


> SMT=2
> ===========================================
> Core            delta tb(apprx)  delta purr	
> ===========================================
> core00 [  0,1]	512000000	136147792	
> core01 [  8,9]	512000000	128636784	
> core02 [ 16,17]	512000000	135426488	
> core03 [ 24,25]	512000000	153027520	
>
> SMT=4
> ===================================================
> Core                   	delta tb(apprx)  delta purr	
> ===================================================
> core00 [  0,1,2,3]	512000000	258331616	
> core01 [  8,9,10,11]	512000000	274220072	
> core02 [ 16,17,18,19]	512000000	260013736	
> core03 [ 24,25,26,27]	512000000	260079672	
>
> SMT=on
> ===================================================================
> Core                                   	delta tb(apprx)  delta purr	
> ===================================================================
> core00 [  0,1,2,3,4,5,6,7]		512000000	512941248	
> core01 [  8,9,10,11,12,13,14,15]	512000000	512936544	
> core02 [ 16,17,18,19,20,21,22,23]	512000000	512931544	
> core03 [ 24,25,26,27,28,29,30,31]	512000000	512923800
>
> This patchset addresses this issue by ensuring that by default, the
> offlined CPUs are returned to the Hypervisor via RTAS "stop-self" call
> by changing the default value of "cede_offline_enabled" to false.
>
> The patchset also defines a new sysfs attribute
> "/sys/device/system/cpu/cede_offline_enabled" on PSeries Linux guests
> to allow userspace programs to change the state into which the
> offlined CPU need to be put to at runtime. This is intended for
> userspace programs that fold CPUs for the purpose of saving energy
> when the utilization is low. Setting the value of this attribute
> ensures that subsequent CPU offline operations will put the offlined
> CPUs to extended cede. However, it will cause inconsistencies in the
> PURR accounting. Clearing the attribute will make the offlined CPUs
> call the RTAS "stop-self" call thereby returning the CPU to the
> hypervisor.
>
> With the patches,
>
> SMT=off
> ===========================================
> Core        	delta tb(apprx)	 delta purr	
> ===========================================
> core00 [  0]	512000000	 512527568	
> core01 [  8]	512000000	 512556128	
> core02 [ 16]	512000000	 512590016	
> core03 [ 24]	512000000	 512589440	
>
> SMT=2
> ===========================================
> Core            delta tb(apprx)	 delta purr	
> ===========================================
> core00 [  0,1]	512000000	512635328
> core01 [  8,9]	512000000	512610416	
> core02 [ 16,17]	512000000	512639360	
> core03 [ 24,25]	512000000	512638720	
>
> SMT=4
> ===================================================
> Core                    delta tb(apprx)  delta purr	
> ===================================================
> core00 [  0,1,2,3]	512000000	512757328	
> core01 [  8,9,10,11]	512000000	512727920	
> core02 [ 16,17,18,19]	512000000	512754712	
> core03 [ 24,25,26,27]	512000000	512739040	
>
> SMT=on
> ==============================================================
> Core                               delta tb(apprx)  delta purr	
> ==============================================================
> core00 [  0,1,2,3,4,5,6,7]	   512000000	   512920936	
> core01 [  8,9,10,11,12,13,14,15]   512000000	   512878728	
> core02 [ 16,17,18,19,20,21,22,23]  512000000	   512921192	
> core03 [ 24,25,26,27,28,29,30,31]  512000000	   512924816	
>
> Gautham R. Shenoy (2):
>   pseries/hotplug-cpu: Change default behaviour of cede_offline to "off"
>   pseries/hotplug-cpu: Add sysfs attribute for cede_offline
>
>  Documentation/ABI/testing/sysfs-devices-system-cpu | 14 ++++
>  Documentation/core-api/cpu_hotplug.rst             |  2 +-
>  arch/powerpc/platforms/pseries/hotplug-cpu.c       | 80 ++++++++++++++++++++--
>  3 files changed, 88 insertions(+), 8 deletions(-)
>
> -- 
> 1.9.4
