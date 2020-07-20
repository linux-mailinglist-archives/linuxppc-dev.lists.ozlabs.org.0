Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E9622618A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 16:04:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9Nkj5tM2zDqYV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 00:04:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9NbT1p0gzDqYp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 23:57:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=CkKu6TCy; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9NbT07rdz9sSJ;
 Mon, 20 Jul 2020 23:57:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595253477;
 bh=oqAcDA3jBvAIOS1+7TV8kow+DYiX75ywt7lOIfOM/sw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=CkKu6TCyjNcJ5db017VcBe/4CD2hT5ZEhLX0YcvZNIy2Scej9W4SRQpvyKRm4JHnr
 NOCPO419nK8cxNnPaJlYsRRXigQl8GBTbXZtt0GGTXPhh9ujU2UjD7XMQ3X0o0Vdhp
 Vz8xmnsn61xRiU1UG7LcHVl4gaMfICuFrjlUSyBJTs8o212754FSdJBh4ieXS/U3mF
 SmZjZMARfXPKBnTnrsOOUGvSa+A2ghY/otIN5wlVi8kg+mBz6q0aApFQJJfm67gxxi
 Nye5y0JlnnnidpsIGNrhpO+y/+3BPDa5HNMWlBbXqj3NExiwQaySr0SThKDpnE86ZR
 7+qdLfEINFuqg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 11/11] powerpc/smp: Provide an ability to disable coregroup
In-Reply-To: <20200714043624.5648-12-srikar@linux.vnet.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-12-srikar@linux.vnet.ibm.com>
Date: Mon, 20 Jul 2020 23:57:56 +1000
Message-ID: <87365mthjv.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Anton Blanchard <anton@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> If user wants to enable coregroup sched_domain then they can boot with
> kernel parameter "coregroup_support=on"

Why would they want to do that?

Adding options like this increases our test matrix by 2x (though in
reality the non-default case will never be tested).

cheers
