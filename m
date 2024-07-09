Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 154E792B08B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 08:50:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJBSp5qfCz3frL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 16:50:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJBSQ0137z2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 16:49:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJBSJ0k2hz4w2M;
	Tue,  9 Jul 2024 16:49:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, Krishna Kumar <krishnak@linux.ibm.com>
In-Reply-To: <20240701074513.94873-1-krishnak@linux.ibm.com>
References: <20240701074513.94873-1-krishnak@linux.ibm.com>
Subject: Re: [PATCH v4 0/2] PCI hotplug driver fixes
Message-Id: <172050773908.27948.6452109648223872879.b4-ty@ellerman.id.au>
Date: Tue, 09 Jul 2024 16:48:59 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: nathanl@linux.ibm.com, aneesh.kumar@kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, gbatra@linux.ibm.com, tpearson@raptorengineering.com, oohall@gmail.com, bhelgaas@google.com, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 01 Jul 2024 13:15:05 +0530, Krishna Kumar wrote:
> The fix of Powerpc hotplug driver (drivers/pci/hotplug/pnv_php.c)
> addresses below two issues.
> 
> 1. Kernel Crash during hot unplug of bridge/switch slot.
> 
> 2. Bridge Support Enablement - Previously, when we do a hot-unplug
> operation on a bridge slot, all the ports and devices behind the
> bridge-ports would be hot-unplugged/offline, but when we do a hot-plug
> operation on the same bridge slot, all the ports and devices behind the
> bridge would not get hot-plugged/online. In this case, Only the first
> port of the bridge gets enabled and the remaining port/devices remain
> unplugged/offline.  After the fix, The hot-unplug and hot-plug
> operations on the slot associated with the bridge started behaving
> correctly and became in sync. Now, after the hot plug operation on the
> same slot, all the bridge ports and devices behind the bridge become
> hot-plugged/online/restored in the same manner as it was before the
> hot-unplug operation.
> 
> [...]

Applied to powerpc/next.

[1/2] pci/hotplug/pnv_php: Fix hotplug driver crash on Powernv
      https://git.kernel.org/powerpc/c/335e35b748527f0c06ded9eebb65387f60647fda
[2/2] powerpc: hotplug driver bridge support
      https://git.kernel.org/powerpc/c/20ce0c247b2500cb7060cb115274ba71abda2626

cheers
