Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD799228DDB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 04:07:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBJky14tkzDqnB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 12:07:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBJjG0hnRzDqf4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 12:06:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SSNY26po; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBJjF53Wfz9sPB;
 Wed, 22 Jul 2020 12:06:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595383569;
 bh=wqEt1+5/uXnORnuuS8zLv9jBm83d6ZbQUZER04RErfY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SSNY26poqYoLtT/r6QhXifDRj0sDPXzHqgJDJG3jSR0fO6CznoOfccDnD9VpYmSUR
 bBcd+IExksIk+zAa9VEljba4kNlu5O5NTF+fFc5oTXiIpHVQjjg3yrWhWvg1R6/5JH
 4EjFbiNvNXUyd0OtxeyZHRAiyMb6SP7vy9zVI28XR8ff6ouSsqeUoTbXsdE78YPn04
 VjHBHRsy+WXkvV+PEleDjSccf6lgukPjYbyX9Rlw6ppyTECe6ViHOSbmb1ZoMQ94vH
 VwRlMIytDaqsD5ZKpuRDDT/yZ+0XpSg2ob4EMy5gSrsS3ETfnSWmuybe3477C27SuJ
 iPDsKbn8bxk8A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ram Pai <linuxram@us.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH] powerpc/pseries/svm: capture instruction faulting on
 MMIO access, in sprg0 register
In-Reply-To: <1594888333-9370-1-git-send-email-linuxram@us.ibm.com>
References: <1594888333-9370-1-git-send-email-linuxram@us.ibm.com>
Date: Wed, 22 Jul 2020 12:06:06 +1000
Message-ID: <875zags3qp.fsf@mpe.ellerman.id.au>
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
Cc: sukadev@linux.vnet.ibm.com, aik@ozlabs.ru, linuxram@us.ibm.com,
 bharata@linux.ibm.com, sathnaga@linux.vnet.ibm.com, ldufour@linux.ibm.com,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ram Pai <linuxram@us.ibm.com> writes:
> An instruction accessing a mmio address, generates a HDSI fault.  This fault is
> appropriately handled by the Hypervisor.  However in the case of secureVMs, the
> fault is delivered to the ultravisor.
>
> Unfortunately the Ultravisor has no correct-way to fetch the faulting
> instruction. The PEF architecture does not allow Ultravisor to enable MMU
> translation. Walking the two level page table to read the instruction can race
> with other vcpus modifying the SVM's process scoped page table.

You're trying to read the guest's kernel text IIUC, that mapping should
be stable. Possibly permissions on it could change over time, but the
virtual -> real mapping should not.

> This problem can be correctly solved with some help from the kernel.
>
> Capture the faulting instruction in SPRG0 register, before executing the
> faulting instruction. This enables the ultravisor to easily procure the
> faulting instruction and emulate it.

This is not something I'm going to merge. Sorry.

cheers
