Return-Path: <linuxppc-dev+bounces-8757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3697ABDDA5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 16:46:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1y6s2mvsz3bcJ;
	Wed, 21 May 2025 00:46:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747752389;
	cv=none; b=Q3WTF2DfhaCPSXK2UdqpPff+3ODo5sB55SvN/5CX518hdp/ohSMWu/VU4l71h0aDO1XjGCExc9rxBywhzKg5xzbHoFm4d9eYBXoTvh8jS1jbBvweqbepvtvITWvT18h0IS55Q9+nw7Gt22+Hy3IFGq9ImikB5cq1HoElRuqNGwnJ0ASGhJ3dTprhurS/DYm7/Bj+yBdrduwa12PYefcalVkirVBVqS/kg4BOSUScCzDsMbZ5Qgj5NFVZu8WynQqfUCnB5Q49k6dkMXhtFXSq4wuxH0fkDkWSqrTe5x8B4QiKrSy+RQo1F5ckOLeBrRxyjC0IQ00p7vt2+I63gRqQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747752389; c=relaxed/relaxed;
	bh=074SctUB702Xq85hl5exWc16Vk0mt1heCsV/xQmK9bY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=T1nFOvpz2GxhVaR7jqv4/2rzxMh1TfG7BlF73V7lHEnMwCWAQwiTDT+/5vTNaRW5IpNhP89iFPsIJo5Rnua8jeQfSCXytGSFLuiDY5hc2vjk6na498OHe13PUNgSstP1RztZanzCjTaVHkn/uLfe94stUHULnOC62FOMlo10I0MfjDo9YCsDEy9RvQme6T5bfNnyqqE22zbYGrdjfy6INiKb6dyWYOoJzFfM/huSZ7Thv4LuOYwHz2Vc5WbenPZ0NE6GHCqehDbZraUFDHIDRt2ivZQOjjas8aBTptp5sBQ1M5m3t9GuFY4j4rdBZut+Uy/zofu31C3Ew7IywxJyeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RbAGlZCM; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RbAGlZCM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1y6r5Nm5z3bcB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 00:46:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A907B62A07;
	Tue, 20 May 2025 14:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240EAC4CEE9;
	Tue, 20 May 2025 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747752386;
	bh=D3BgGUTiNzhwhjt2hSgNLPPTF85OQ9P1ypBTejbHZko=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=RbAGlZCMWMkCSMaJRdAvBd/1tz6DyKGqPI+HR8PNwAlqGvYbYQUv4xtNLM53Uk1xV
	 6CFYXFEI30lzpJjTqi5EW6IIopse+lmMWkypA3qypP8BuLqIPGEoOEhFuZqWrHAFh9
	 oqMWHpk5DD+G8V8UdvGIZan8eC32I9aOf6S3V3x7LeqzMZfUXbrUwi2Bx9g5VYPy2o
	 VsSHa65ox0b0gp8WJW7DjQ34g1VYwCWAijh0Jh7DDd6CRcXujCCiqSCulJGGWHN2K9
	 FpTOprqOcX5KAfT9OCrGkFDkci3Wpwp8J7nVUOVMz/vIsE8LuS+wbbQpymEByNIY4X
	 kw9XV4zsJwcUQ==
Date: Tue, 20 May 2025 09:46:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Weinan Liu <wnliu@google.com>
Cc: Jonathan.Cameron@huawei.com, anilagrawal@meta.com,
	ben.fuller@oracle.com, bhelgaas@google.com, dave.jiang@intel.com,
	drewwalton@microsoft.com, ilpo.jarvinen@linux.intel.com,
	kaihengf@nvidia.com, karolina.stolarek@oracle.com,
	kbusch@kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	lukas@wunner.de, mahesh@linux.ibm.com, martin.petersen@oracle.com,
	oohall@gmail.com, pandoh@google.com, paulmck@kernel.org,
	rrichter@amd.com, sargun@meta.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, shiju.jose@huawei.com,
	terry.bowman@amd.com, tony.luck@intel.com
Subject: Re: [PATCH v6 11/16] PCI/AER: Check log level once and remember it
Message-ID: <20250520144624.GA1299876@bhelgaas>
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
In-Reply-To: <20250519231728.2550572-1-wnliu@google.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 19, 2025 at 11:17:28PM +0000, Weinan Liu wrote:
> > diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> > index 315bf2bfd570..34af0ea45c0d 100644
> > --- a/drivers/pci/pcie/dpc.c
> > +++ b/drivers/pci/pcie/dpc.c
> > @@ -252,6 +252,7 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
> >   else
> >   info->severity = AER_NONFATAL;
> >
> > + info->level = KERN_WARNING;
> >  return 1;
> > }
> 
> I think the print level should be KERN_ERR for uncorrectable errors.

Yes, thank you, fixed!  dpc_get_aer_uncorrect_severity() always sets
info->severity to AER_FATAL or AER_NONFATAL, and aer_print_error()
only uses KERN_WARNING for AER_CORRECTABLE.

