Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D69921F33F7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:11:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h0BB2pcDzDqjL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:11:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzFL2NRxzDqRh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFH0mcQz9sTG; Tue,  9 Jun 2020 15:29:06 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org
In-Reply-To: <20200426020518.GC5853@oc0525413822.ibm.com>
References: <1585211927-784-1-git-send-email-linuxram@us.ibm.com>
 <20200426020518.GC5853@oc0525413822.ibm.com>
Subject: Re: [PATCH v3] powerpc/XIVE: SVM: share the event-queue page with the
 Hypervisor.
Message-Id: <159168034199.1381411.13122286705469530819.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:06 +1000 (AEST)
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
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, groug@kaod.org, clg@fr.ibm.com,
 sukadev@linux.vnet.ibm.com, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 25 Apr 2020 19:05:18 -0700, Ram Pai wrote:
> >From 10ea2eaf492ca3f22f67a5a63a2b7865e45299ad Mon Sep 17 00:00:00 2001
> From: Ram Pai <linuxram@us.ibm.com>
> Date: Mon, 24 Feb 2020 01:09:48 -0500
> Subject: [PATCH v3] powerpc/XIVE: SVM: share the event-queue page with the
>  Hypervisor.
> 
> XIVE interrupt controller uses an Event Queue (EQ) to enqueue event
> notifications when an exception occurs. The EQ is a single memory page
> provided by the O/S defining a circular buffer, one per server and
> priority couple.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/xive: Share the event-queue page with the Hypervisor.
      https://git.kernel.org/powerpc/c/094235222d41d68d35de18170058d94a96a82628

cheers
