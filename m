Return-Path: <linuxppc-dev+bounces-9071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE86ACA8B3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 07:00:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9hVX5H67z2yN1;
	Mon,  2 Jun 2025 15:00:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748840420;
	cv=none; b=gqBPazSlLrydH8tlOvarc1mMhN8VakX1OaH4XRkkH89r2A319xLN9PWYB0bJr9xZQC4s+HP99b/6WFbNEnEszBdD6d+A50e5ZtiUFXHdL0VxjgECuYRFKATFKfUhmunaD87vpVpx9CQip92fCm4MaGrXBmOy7iVzVMSiOCYN7EaOtkQr8R+BXKU/qp4GKUcJyM2r0alVaCI8fTAeZwh+LjNQBO+2tnXZMXECGSSBCAhdftj929XfV89kF60GhwUuFKmDUCZWnQIeiGLxBMYNepCNNXbly8n5db6ruxTYhJbkOjlb3HnE16HsqMsivgHTxv7BCEH0YkunE4qUko7FBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748840420; c=relaxed/relaxed;
	bh=tJRsdC5/V3JGpK9+XYdwEbTmP/0NPI/kTODco6DLKUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cr0Ner8UBCJtwU3KyM1bz+NK0CPIqHRCqqt0ezFvR4ydxNoSuUeTduhcsVhpSIc1WhIml6w7HO+F8zbBNDT1+R7ywoZXKQkLeO2t32iVLBFaEob2phjTdrmAz12f/tXFQ7VnQpr+VzokCY8DPsvrOh9Ah3DRRHUQq8VUnIcqoUaJMaE+TVXhmKmO/DoZMecOPTJGuYeY0qIZw7jHB9e4FUH52FGd0v46NPaBNxcAp1BJcrchvtHxJoFH3+JHHy97ghcDMdsy1IrG7ncqWwaoV23CLQVkfFLKkIScKpL3WWtS/hDRBAoLrrChiOTD3OrVPCvUS+1g9V/G9QN/bLUr8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org) smtp.mailfrom=lst.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 343 seconds by postgrey-1.37 at boromir; Mon, 02 Jun 2025 15:00:19 AEST
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9hVW4bTbz2yMw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 15:00:19 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E076968C7B; Mon,  2 Jun 2025 06:54:27 +0200 (CEST)
Date: Mon, 2 Jun 2025 06:54:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org,
	david@redhat.com, linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com, hch@lst.de, zhang.lyra@gmail.com,
	debug@rivosinc.com, bjorn@kernel.org, balbirs@nvidia.com,
	lorenzo.stoakes@oracle.com, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org,
	dri-devel@lists.freedesktop.org, John@Groves.net
Subject: Re: [PATCH 01/12] mm: Remove PFN_MAP, PFN_SG_CHAIN and PFN_SG_LAST
Message-ID: <20250602045427.GA21646@lst.de>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com> <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 04:32:02PM +1000, Alistair Popple wrote:
> The PFN_MAP flag is no longer used for anything, so remove it. The
> PFN_SG_CHAIN and PFN_SG_LAST flags never appear to have been used so
> also remove them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

FYI, unlike the rest of the series that has some non-trivial work
this feels like a 6.16-rc candidate as it just removes dead code
and we'd better get that in before a new user or even just a conflict
sneaks in.


