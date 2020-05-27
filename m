Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9768A1E36BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 05:54:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Wxll1ZdlzDqDW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 13:54:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Wxcf1LyjzDqJs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 13:48:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oI5FyY7R; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Wxcb6J2Dz9sSW;
 Wed, 27 May 2020 13:47:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590551281;
 bh=kI4fWu01aAN5kkMbR2omD94nPbM41iSYIq/ZpnS4LRk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oI5FyY7RWtkPZVcglYtyJNoptpcFbPkUcK/mFv5enSpYaU31ydlO8aaEp5dhJcFIY
 S2pDEG3XQ9M3tpJrSdT5CgIX/9Z/qsjGk3rYH8D05UNK+at8GBFgd0kC4biPCVXCy4
 0qIPceh8PPZIpN6st/yPJk+x29Cvo9Cog9UZXHFh/ZS3gpOMp0UGPjaObU8QS3vaXu
 bvQr/lKlrQ0z4SGb8ule2ebBmq+uOvhV9CpjXWufVopv2wiDX83DtP/D1uxbEb24dB
 CSPG+zFEAzeV5ZMdnA5+dFzJVHsBFjpV2+pC7rc4lzzMIMrLz1pU2iARxOc4M2pIOu
 dIF/mkwXX21yg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ram Pai <linuxram@us.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3] powerpc/XIVE: SVM: share the event-queue page with the
 Hypervisor.
In-Reply-To: <20200426072724.GB5865@oc0525413822.ibm.com>
References: <1585211927-784-1-git-send-email-linuxram@us.ibm.com>
 <20200426020518.GC5853@oc0525413822.ibm.com>
 <20200426072724.GB5865@oc0525413822.ibm.com>
Date: Wed, 27 May 2020 13:48:23 +1000
Message-ID: <87r1v6domw.fsf@mpe.ellerman.id.au>
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
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, groug@kaod.org, clg@kaod.org,
 sukadev@linux.vnet.ibm.com, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ram Pai <linuxram@us.ibm.com> writes:
> XIVE interrupt controller uses an Event Queue (EQ) to enqueue event
> notifications when an exception occurs. The EQ is a single memory page
> provided by the O/S defining a circular buffer, one per server and
> priority couple.
>
> On baremetal, the EQ page is configured with an OPAL call. On pseries,
> an extra hop is necessary and the guest OS uses the hcall
> H_INT_SET_QUEUE_CONFIG to configure the XIVE interrupt controller.
>
> The XIVE controller being Hypervisor privileged, it will not be allowed
> to enqueue event notifications for a Secure VM unless the EQ pages are
> shared by the Secure VM.
>
> Hypervisor/Ultravisor still requires support for the TIMA and ESB page
> fault handlers. Until this is complete, QEMU can use the emulated XIVE
> device for Secure VMs, option "kernel_irqchip=off" on the QEMU pseries
> machine.
>
> Cc: kvm-ppc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Cc: Michael Anderson <andmike@linux.ibm.com>
> Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Cedric Le Goater <clg@kaod.org>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
>
> v3: fix a minor semantics in description.
>     and added reviewed-by from Cedric and Greg.
> v2: better description of the patch from Cedric.
> ---

Please put the change history after the '---' break in future please, I
had to fix this up manually.

cheers
