Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EC62D39AB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 05:38:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrPSC41yKzDqlL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 15:38:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrPQZ0MNLzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 15:36:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=saNnipqa; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4CrPQY6Dvbz9sWL; Wed,  9 Dec 2020 15:36:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1607488613; bh=4qK0Qeph9aujlXGIFVNGaEAyJsEJ75znCDH6aXQBnaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=saNnipqailTWZYEW7o1ETFKqbdiCFVgtlrhAlbhLtiElZxzzwFEmnfrXPdhBgys+a
 d0gWxSbTajAn5DXmA7bQthrlka5qpKKBNb0qzC5wHWZfEKW9R5UbkP/aeUOBiWnzOp
 mvs92dvWGLufV0p3b/bsxctGKwxuID2zW33fh1P0aOnWWlSCPtJfzelfqljdkxhv5u
 scToA9zMk+qWYvWTpaZH0dZi6DIN4IX7CmFf+0qa945U/7r7vAlCj75hxjI8ngjxPb
 4UU3yHvWOQitK25dHPKpKMuTBleyugeZWWYLEbhnxOX1u40KESNUmiwjJsCS6u+f7/
 6cz08KAshW+3Q==
Date: Wed, 9 Dec 2020 15:36:48 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v2 4/4] KVM: PPC: Introduce new capability for 2nd DAWR
Message-ID: <20201209043648.GB29825@thinks.paulus.ozlabs.org>
References: <20201124105953.39325-1-ravi.bangoria@linux.ibm.com>
 <20201124105953.39325-5-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124105953.39325-5-ravi.bangoria@linux.ibm.com>
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
Cc: christophe.leroy@c-s.fr, leobras.c@gmail.com, mikey@neuling.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 kvm-ppc@vger.kernel.org, jniethe5@gmail.com, pbonzini@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 24, 2020 at 04:29:53PM +0530, Ravi Bangoria wrote:
> Introduce KVM_CAP_PPC_DAWR1 which can be used by Qemu to query whether
> kvm supports 2nd DAWR or not.

This should be described in Documentation/virt/kvm/api.rst.

Strictly speaking, it should be a capability which is disabled by
default, so the guest can only do the H_SET_MODE to set DAWR[X]1 if it
has been explicitly permitted to do so by userspace (QEMU).  This is
because we want as little as possible of the VM configuration to come
from the host capabilities rather than from what userspace configures.

So what we really need here is for this to be a capability which can
be queried by userspace to find out if it is possible, and then
enabled by userspace if it wants.  See how KVM_CAP_PPC_NESTED_HV is
handled for example.

Paul.
