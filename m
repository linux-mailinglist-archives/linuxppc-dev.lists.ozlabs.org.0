Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB0622A8E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 08:23:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC2MB3QwczDrBk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 16:23:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC2KB5XGBzDr0t
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 16:21:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=mxcHUvB1; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4BC2KB3wqzz9sRf; Thu, 23 Jul 2020 16:21:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1595485278; bh=odF+torp6O5+9CyXhkwTTM6NVHZyqHYWRUU9Y7X2ibs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mxcHUvB17Jv0PuLCtPPCCEstr+aT1ErnByOEHg9mCCOjpZ3XCqDZ2aqHskXu1U17s
 1J/JBy9nM5hKvwlMgGyJM5iD3WOAj3X32zauNKlXC7CPbSf7NsGYwfzeWnl8Ly7fRF
 YgQp4txyASY1BRh0JS4UZ6aaTQkaf7pmJ5LzT1EoD+8qq8CQ0z1oRWuvjVGRQxszpv
 VtexzBIrAFvcptPeV9KF+SlXvpbg8bnc/wrTVoshZn+QB7LyWHwixMRbjmzvvM/N3v
 +AnnvBgBSu2wf9uBliqvVWeLfS++sa/9iEQtGRMtKaD7/AYfmFY+DevDOE+a3++8EG
 3mXxDYfHW/TaQ==
Date: Thu, 23 Jul 2020 16:20:16 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: increase KVMPPC_NR_LPIDS on POWER8
 and POWER9
Message-ID: <20200723062016.GE213782@thinks.paulus.ozlabs.org>
References: <20200608115714.1139735-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200608115714.1139735-1-clg@kaod.org>
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
Cc: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 08, 2020 at 01:57:14PM +0200, Cédric Le Goater wrote:
> POWER8 and POWER9 have 12-bit LPIDs. Change LPID_RSVD to support up to
> (4096 - 2) guests on these processors. POWER7 is kept the same with a
> limitation of (1024 - 2), but it might be time to drop KVM support for
> POWER7.
> 
> Tested with 2048 guests * 4 vCPUs on a witherspoon system with 512G
> RAM and a bit of swap.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Thanks, patch applied to my kvm-ppc-next branch.

Paul.
