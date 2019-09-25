Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E79ECBDCF9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 13:22:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dbHr44hSzDqbD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 21:22:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dZwT56zhzDqdv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 21:05:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46dZwS46Ztz9sPK; Wed, 25 Sep 2019 21:05:28 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 677733e296b5c7a37c47da391fc70a43dc40bd67
In-Reply-To: <20190924035254.24612-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/4] powerpc/book3s64/mm: Don't do tlbie fixup for some
 hardware revisions
Message-Id: <46dZwS46Ztz9sPK@ozlabs.org>
Date: Wed, 25 Sep 2019 21:05:27 +1000 (AEST)
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-09-24 at 03:52:51 UTC, "Aneesh Kumar K.V" wrote:
> The store ordering vs tlbie issue mentioned in
> commit a5d4b5891c2f ("powerpc/mm: Fixup tlbie vs store ordering issue on
> POWER9") is fixed for Nimbus 2.3 and Cumulus 1.3 revisions. We don't need
> to apply the fixup if we are running on them
> 
> We can only do this on PowerNV. On pseries guest with kvm we still don't
> support redoing the feature fixup after migration. So we should be enabling
> all the workarounds needed, because whe can possibly migrate between
> DD 2.3 and DD 2.2
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Series applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/677733e296b5c7a37c47da391fc70a43dc40bd67

cheers
