Return-Path: <linuxppc-dev+bounces-8755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE68ABDCBA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 16:27:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1xhb3cV4z3bfR;
	Wed, 21 May 2025 00:27:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747751231;
	cv=none; b=eF7+WnSYHhEMDcnDaXPvk9c+FN2+h7TFsik/iTsFGE495BvaL/pCciIGO1cfblfFZAg/hEU1/j28dU7A9/TTph2PQIAG6/HsPGWwy4uf98iaeu9Ec4Yx4z3Ccl4suG83Xq1fbDFl0o1NxXbo/mC+pMD/vagnSe8vP4HO6KkPcWeDTUXFLUsRJlkI1CwF5OWeg9LeXh8pE5fN38SstzKTdjmsUarTGey580NzAspJxc5ih50OPIJzDqus1rLEcBDnsdn149WMjTypAwKhShn1xsMsZ6xx9KpOXyhgLoKEAzNzPB0+15kQX2HluGRbLzu3EvUQo0usSpy7mBPSG7y2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747751231; c=relaxed/relaxed;
	bh=0mj9Wkj0uufvJrsbQ9t+aAPCbH7zPacQwdZCk57M6dE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LKiIEUZwb+vqwsepg64zY304FZj0TtVbR+Y3w7pdH1WsdTnF/jPZbzviX1WlExWdMRmwV103PP489HED9wS9P28gMNkT+SLDNxsDKzSw5o3B51lFe1BPAKmC8v9QdX0cYND6cJef+l8sOlJdnv0wJYeiqi+LHvRL0BK0/uoiBiM4+/QFWJSd87aqfwBSvdmrb6B9r541ULq8B2JOs5QY3nlR3RR4q5hKqKIX5DoiAoNFRqGAKvmiRPvKCfZjtfuJCPzT8UDD/t6Y+eibc22vyJu8WYPIzH07aVDSTWYCAnBydy8iz7weYQF++DCyI7bVes7y2fJzE0+/193PZJx1jA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KRrcIo3O; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KRrcIo3O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1xhZ6Cwkz3055
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 00:27:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BC484A66A;
	Tue, 20 May 2025 14:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7789C4CEE9;
	Tue, 20 May 2025 14:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747751229;
	bh=oCLBYeP1sLVu5Ws29+9UfDbRGJI3ciUnpG/nTA1olYM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=KRrcIo3ONGaX7Pi2FUjzUMa9ejaXw+b9Vm9fA9E3drThkSwBDBErRwftIqGCKAhYl
	 bgvtywYaGpxfZmkvw1WGrNyTx5+9cqmvDol7+KmjgP6gYZ5Y0jtXzaDt+lj0PjVRLq
	 EhGYy0wxjqBs2GooRe6qM+uu2Y0X+5SJGczXyS0LIOv6RpJ1MOJE0XmDdR0XDCrx6T
	 gmlU+1+zpu6h4u32w077LBi3dm342l6zDXzZQC9Zkr0gnH5zeDii9wXcwdbBZ/cB/p
	 JGV7/hDyqx5nG9Yg+Os07MjY52JZ6Hk85v7bL3fQXtVc5++fHv7e9lly/iSdoAgJK4
	 YkIlmYSK7kkHg==
Date: Tue, 20 May 2025 09:27:07 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 07/16] PCI/AER: Initialize aer_err_info before using it
Message-ID: <20250520142707.GA1297901@bhelgaas>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d429918-b42c-5714-ef40-ce2a9e129a6b@linux.intel.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 20, 2025 at 01:39:06PM +0300, Ilpo Järvinen wrote:
> On Mon, 19 May 2025, Bjorn Helgaas wrote:
> 
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Previously the struct aer_err_info "e_info" was allocated on the stack
> > without being initialized, so it contained junk except for the fields we
> > explicitly set later.
> > 
> > Initialize "e_info" at declaration with a designated initializer list,
> > which initializes the other members to zero.
> > 
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> >  drivers/pci/pcie/aer.c | 37 ++++++++++++++++---------------------
> >  1 file changed, 16 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 95a4cab1d517..40f003eca1c5 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -1281,7 +1281,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
> >  		struct aer_err_source *e_src)
> 
> Unrelated to this change, these would fit on a single line.

Thanks, fixed!

