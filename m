Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1D53F99D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:28:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0rw1H6pz3fFV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:28:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0kX6nHDz3c5Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0kX2MvGz9t56;
 Fri, 27 Aug 2021 23:22:28 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
In-Reply-To: <20210805212616.2641017-1-farosas@linux.ibm.com>
References: <20210805212616.2641017-1-farosas@linux.ibm.com>
Subject: Re: [PATCH v2 0/3] KVM: PPC: Book3S HV: kvmhv_copy_tofrom_guest_radix
 changes
Message-Id: <163007015492.52768.12349053667840423308.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:15:54 +1000
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
Cc: christophe.leroy@c-s.fr, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 5 Aug 2021 18:26:13 -0300, Fabiano Rosas wrote:
> This series contains the fix for __kvmhv_copy_tofrom_guest_radix plus
> a couple of changes.
> 
> - Patch 1: The fix itself. I thought a smaller fix upfront would be
>            better to facilitate any backports.
> 
> - Patch 2: Adds a sanity check to the low level function. Since the
>            hcall API already enforces that the effective address must
>            be on quadrant 0, moving the checks from the high level
>            function would only add overhead to the hcall path, so I
>            opted for a lightweight check at the low level.
> 
> [...]

Applied to powerpc/next.

[1/3] KVM: PPC: Book3S HV: Fix copy_tofrom_guest routines
      https://git.kernel.org/powerpc/c/5d7d6dac8fe99ed59eee2300e4a03370f94d5222
[2/3] KVM: PPC: Book3S HV: Add sanity check to copy_tofrom_guest
      https://git.kernel.org/powerpc/c/c232461c0c3b0aca637f0d7658a7f5d0bb393a4e
[3/3] KVM: PPC: Book3S HV: Stop exporting symbols from book3s_64_mmu_radix
      https://git.kernel.org/powerpc/c/0eb596f1e6103ebe122792a425b88c5dc21c4087

cheers
