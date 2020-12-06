Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 260662D0859
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 00:58:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cq3L23mPNzDqZP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 10:58:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cq3HP3BZrzDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 10:56:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=popple.id.au header.i=@popple.id.au header.a=rsa-sha256
 header.s=202006 header.b=OqofDlcK; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cq3HN0ZWfz9sW0;
 Mon,  7 Dec 2020 10:56:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=popple.id.au;
 s=202006; t=1607298960;
 bh=uJnLjHG8XDQtNpSijOLX+nT8QW710mtLpPMcymdw4cA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OqofDlcKqQ8/oAweiV+TNp+OBs0evCq0vtXx239/UpcuY0qv2hKDa7AwTRg2jXqss
 kofK+Qqk2T0NiuPf7H0yx2Uk3vJ3JiR8YLvBZtxl+ts6QrVOwVz1gUV8mb7Jz/JgJM
 rFr25vYotbHdDFLAIy4mNmn/ufZj8qNXBQFZNWE12DmwUJAfIcTY3EZZfmsio6sm8P
 1jZhDoaTUAavMWb0AlINyvLNDLikny7CH1IG1ODMz/2mA+/8oo1z4k4tQHESzIfNf5
 8OOFp0IAOzmbZ8auHWCsIRgqRnEEEx7b9yuJQEX705mcN5KE6YGzXc6cP2/8+k/amR
 P0z4qzAYjAleA==
From: Alistair Popple <alistair@popple.id.au>
To: bharata@linux.ibm.com
Subject: Re: [PATCH] powerpc/book3s_hv_uvmem: Check for failed page migration
Date: Mon, 07 Dec 2020 10:55:49 +1100
Message-ID: <7619698.bcDb2GHn21@cleo>
In-Reply-To: <20201204101841.GA621541@in.ibm.com>
References: <20201203050812.5234-1-alistair@popple.id.au>
 <20201204101841.GA621541@in.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linuxppc-dev@lists.ozlabs.org, Ram Pai <linuxram@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday, 4 December 2020 9:18:41 PM AEDT Bharata B Rao wrote:
> 
> Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>
> 
> Did you actually hit this scenario with secure VMs where a UV-paged-in
> page was later found to be not migratable?

No, this was found by inspection. I have no way of testing this but we had a 
similar issue in Nouveau and I think you would have a similar issue here 
although it might be hard to hit.

migrate_vma_pages() will fail a page migration if a CPU thread has raced and 
established a non-zero page PTE for the address. See migrate_vma_insert_page() 
for the implementation. It will also fail if something else has taken a 
reference on the page after calling migrate_vma_setup(), but that is less 
likely as any existing pages will have been isolated.

 - Alistair

> Regards,
> Bharata.
> 




