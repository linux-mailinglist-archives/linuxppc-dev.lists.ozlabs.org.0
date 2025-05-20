Return-Path: <linuxppc-dev+bounces-8764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB16ABE2B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 20:32:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b23725bJ1z3bW7;
	Wed, 21 May 2025 04:31:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747765918;
	cv=none; b=ZNMsw7XbQVhrmrCObFB1vacDKr73Ptee6Y8k1BMjK/fqVRO9qEdAUFVQsCfoTBvnuJLqnkUFxokbOf8MBIdIuaRSmk72mA8NuGkgdjiLVJrN01jORkc/tLwxQo9OVOJIJHwZStoWbEfgaKofbeFdXBw/ovx+QL63iQdUvBJ9xbMYvvdPUmWDmJo0vN37L/Hp8wsIJH0xBH82XpGqp/kWle0rbrNMGZm+HuBF9gQT2HgqUYtAW9T4RyptbejGcp4PUr6U9Y4YwSA+Hdqfbs6L0awZSGdLUzlbF1P7adaVIEH6rb7OR5b0vja4Z0Cs36FDxjiuOGgXTQjjNFFcTyIrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747765918; c=relaxed/relaxed;
	bh=B+C8gJOMI9UdPFQs/RDaOgTyEoHMCEvKIqNexg7CDYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MwKAT8r1mpcGz4/qZHKKlqIkQOT6WsGEehC1Uk8Hzd49afB3WGR8LX49gmb1/1wPSCHjpqLAcsHn6hC0b31tgO0hECVEjDB/2wLpdALU2gbi6+HcqMTBpgiarqE7s0uu91uBhkjLMrQI12eqQIAnhNJsaCafaySs9OfpnzVagFqiCJjzng7ZRnZjaf+jwn4o57aoIFdh4VgdWVp19ZgMHXcjLNV8UnqZFujLdgA6kPOegkeYe7/7DdqXtRuemWwfPvKu8Ol6e8xGO9vyAYe1KS+TKdEntsw7rhdRtc+0/geuyARrxzGI/k0HrEZbPCYlNitDdu/g/vAx2PnuIxsJrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hddkKu0m; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hddkKu0m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b23720rcRz2yr1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 04:31:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E9E75C5422;
	Tue, 20 May 2025 18:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A596FC4CEE9;
	Tue, 20 May 2025 18:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747765914;
	bh=jwee9jRHKC9i3IB6hd0Exj0Pc2dnDouthrKRY1Giwiw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hddkKu0mDChvBNXjmgLXbi56ACoBmD+CiBVK+DuLbZbm0ooahVgLKKbbVFt+bm3Gj
	 ds7VCAhwsNKpDFVHR+pZDqeUeC8pAYjz+A/lZEdzJICnvU9ceiLRIJq96tkIgOp+no
	 Dq7HcJeYijENpOEsRApyEcxf22JVb1NAYoMye7ClehwZ4godbkhHh1r9/gqiKyJ3hi
	 w7BZXh8iCo6QLspaEWrkoPgrsJda8ViQrnv8In0hQEYhN/A+FXEnaXEA3N3yYUpeAI
	 uz28tTNzk1ZrkL9Y1XXeDZaqwuqbPSun21G5eHxCM0i9hu8MVVNKigUMu4GUbz+Xev
	 FK8LNbMGdjb5w==
Date: Tue, 20 May 2025 13:31:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
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
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 14/16] PCI/AER: Introduce ratelimit for error logs
Message-ID: <20250520183153.GA1316070@bhelgaas>
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
In-Reply-To: <e056eb23-e38a-4a0e-83d7-c17c62c0f9f7@linux.intel.com>
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 19, 2025 at 09:59:29PM -0700, Sathyanarayanan Kuppuswamy wrote:
> On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> > From: Jon Pan-Doh <pandoh@google.com>
> > 
> > Spammy devices can flood kernel logs with AER errors and slow/stall
> > execution. Add per-device ratelimits for AER correctable and uncorrectable
> > errors that use the kernel defaults (10 per 5s).
> > 
> > There are two AER logging entry points:
> > 
> >    - aer_print_error() is used by DPC and native AER
> > 
> >    - pci_print_aer() is used by GHES and CXL
> > 
> > The native AER aer_print_error() case includes a loop that may log details
> > from multiple devices.  This is ratelimited by the union of ratelimits for
> > these devices, set by add_error_device(), which collects the devices.  If
> > no such device is found, the Error Source message is ratelimited by the
> > Root Port or RCEC that received the ERR_* message.
> > 
> > The DPC aer_print_error() case is currently not ratelimited.
> 
> Can we also not rate limit fatal errors in AER driver?

In other words, only rate limit AER_CORRECTABLE and AER_NONFATAL for
AER?  Seems plausible to me.

