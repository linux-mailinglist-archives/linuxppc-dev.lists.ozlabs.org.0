Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7966D6A51A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:11:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQj7S2tsSz3cbV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 14:11:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i99vprYr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i99vprYr;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQj6V4nYkz3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 14:10:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D115C60F21;
	Tue, 28 Feb 2023 03:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E99C4339B;
	Tue, 28 Feb 2023 03:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677553822;
	bh=j2xdflKv8i4Zuj0XM0kKC4gbLoS7YwCsyp4qjAzR95o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i99vprYrvUQnMIH+t26KyWjrpfvL/xX9eXYqtyO3MavxZCwNh6M71p4FB7qEdQzyg
	 PHQrUBbLKcv9mEdBIDbp4UXeTbpRykM53equnX/GhcCTw19amy1YXYkTVvj7T3Pazr
	 O4dRGl5pDzqK7sGxrnBwWSdgx6vT+8xhOVC5CmaL2SoBKTXCdduUVZiRN6hcJOizTV
	 PsAUEtBEJm3OLVAJ9Z+BDC6UQlJrVN82UEfiilAOyH0aDruo65cPp5bfkA5GXyAGvk
	 DlV4DXP01ByQWOsSVFr/G/9LJrhv/iTO/00a/wSWV8BWn0ok+0ImC3UzpRErEVm5FK
	 e3TE5C0mxHyFg==
Date: Tue, 28 Feb 2023 05:10:19 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/tpm: Create linux,sml-base/size as big endian
Message-ID: <Y/1wm3kmsto5tzeB@kernel.org>
References: <20230224032508.3331281-1-mpe@ellerman.id.au>
 <c2afd163-5f23-acab-fd39-3a5593ed6257@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2afd163-5f23-acab-fd39-3a5593ed6257@linux.ibm.com>
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
Cc: eajames@linux.ibm.com, jgg@ziepe.ca, yangyingliang@huawei.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 27, 2023 at 06:08:31PM -0500, Stefan Berger wrote:
> 
> 
> On 2/23/23 22:25, Michael Ellerman wrote:
> > There's code in prom_instantiate_sml() to do a "SML handover" (Stored
> > Measurement Log) from OF to Linux, before Linux shuts down Open
> > Firmware.
> > 
> > This involves creating a buffer to hold the SML, and creating two device
> > tree properties to record its base address and size. The kernel then
> > later reads those properties from the device tree to find the SML.
> > 
> > When the code was initially added in commit 4a727429abec ("PPC64: Add
> > support for instantiating SML from Open Firmware") the powerpc kernel
> > was always built big endian, so the properties were created big endian
> > by default.
> > 
> > However since then little endian support was added to powerpc, and now
> > the code lacks conversions to big endian when creating the properties.
> > 
> > This means on little endian kernels the device tree properties are
> > little endian, which is contrary to the device tree spec, and in
> > contrast to all other device tree properties.
> > 
> > To cope with that a workaround was added in tpm_read_log_of() to skip
> > the endian conversion if the properties were created via the SML
> > handover.
> > 
> > A better solution is to encode the properties as big endian as they
> > should be, and remove the workaround.
> > 
> > Typically changing the encoding of a property like this would present
> > problems for kexec. However the SML is not propagated across kexec, so
> > changing the encoding of the properties is a non-issue.
> > 
> > Fixes: e46e22f12b19 ("tpm: enhance read_log_of() to support Physical TPM event log")
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

2/2 does not have a fixes tag.

BR, Jarkko
