Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2097E442D1B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:48:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7TJ6z1wz3g67
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:48:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7Fz3fkNz3bP7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7Fz2mcmz4xdY;
 Tue,  2 Nov 2021 22:38:47 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211027061646.540708-1-mpe@ellerman.id.au>
References: <20211027061646.540708-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] MAINTAINERS: Update powerpc KVM entry
Message-Id: <163584792793.1845480.13540784301137496504.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:12:07 +1100
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
Cc: kvm-ppc@vger.kernel.org, pbonzini@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 Oct 2021 17:16:46 +1100, Michael Ellerman wrote:
> Paul is no longer handling patches for kvmppc.
> 
> Instead we'll treat them as regular powerpc patches, taking them via the
> powerpc tree, using the topic/ppc-kvm branch when necessary.
> 
> Also drop the web reference, it doesn't have any information
> specifically relevant to powerpc KVM.
> 
> [...]

Applied to powerpc/next.

[1/1] MAINTAINERS: Update powerpc KVM entry
      https://git.kernel.org/powerpc/c/19b27f37ca97d1e42453b9e48af1cccb296f6965

cheers
