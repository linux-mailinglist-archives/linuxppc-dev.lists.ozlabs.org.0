Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A89363A1B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:09:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtcR46sTz3fYl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:09:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVm5sMnz3cTZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:32 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4FNtVc3l2Xz9vGd; Mon, 19 Apr 2021 14:04:24 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVb50Htz9vGW; Mon, 19 Apr 2021 14:04:23 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
In-Reply-To: <161821396263.48361.2796709239866588652.stgit@jupiter>
References: <161821396263.48361.2796709239866588652.stgit@jupiter>
Subject: Re: [PATCH v2] powerpc/eeh: Fix EEH handling for hugepages in ioremap
 space.
Message-Id: <161880479477.1398509.366681090347824239.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 13:59:54 +1000
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 12 Apr 2021 13:22:50 +0530, Mahesh Salgaonkar wrote:
> During the EEH MMIO error checking, the current implementation fails to map
> the (virtual) MMIO address back to the pci device on radix with hugepage
> mappings for I/O. This results into failure to dispatch EEH event with no
> recovery even when EEH capability has been enabled on the device.
> 
> eeh_check_failure(token)		# token = virtual MMIO address
>   addr = eeh_token_to_phys(token);
>   edev = eeh_addr_cache_get_dev(addr);
>   if (!edev)
> 	return 0;
>   eeh_dev_check_failure(edev);	<= Dispatch the EEH event
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/eeh: Fix EEH handling for hugepages in ioremap space.
      https://git.kernel.org/powerpc/c/5ae5bc12d0728db60a0aa9b62160ffc038875f1a

cheers
