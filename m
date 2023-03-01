Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBBF6A7794
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:10:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRqj51hH2z3cd1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:10:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P5D5QOYg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P5D5QOYg;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRqh744klz301F
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:09:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4FDE6131D;
	Wed,  1 Mar 2023 23:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04918C433EF;
	Wed,  1 Mar 2023 23:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677712195;
	bh=6xF2bS9+IFQDCx6Cz15lcI9nmFQE54LHi90Yyw/kHvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5D5QOYgEyKNQZ9f6ppESpNkKgS5MnyG2PjBtyyalUY+ZBeKlty4L6Mzd+TMR+F95
	 t4nvGP5IdizIJhOERO/0RHxbulT3yM+w+JWQF9Y65P7a4N83w6Wp80Ux45qlgS/fCd
	 0XZxCl7Wm9idMSzdwiVBjElevlBebEMNfKO5JmDK2Oe7ppXS7brxo6jSLIZpLZwrDm
	 en8+StcvKLIcX1ze3lzYJsUEe/olilY7rrMXdqqa+kpPzJpTOFhUo7s/1odVnPiupH
	 9hUKym8mFaOgl2TB44HiLLvQ9jWyISJwad3DQpxHAOqrpYfVkheHb6ejgJTcdBdz0l
	 LMScX42SKYdkQ==
Date: Thu, 2 Mar 2023 01:09:53 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/tpm: Create linux,sml-base/size as big endian
Message-ID: <Y//bQe1Zd32bLy+J@kernel.org>
References: <20230224032508.3331281-1-mpe@ellerman.id.au>
 <c2afd163-5f23-acab-fd39-3a5593ed6257@linux.ibm.com>
 <Y/1wm3kmsto5tzeB@kernel.org>
 <87r0uaujb3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0uaujb3.fsf@mpe.ellerman.id.au>
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
Cc: eajames@linux.ibm.com, jgg@ziepe.ca, yangyingliang@huawei.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, peterhuewe@gmx.de, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 28, 2023 at 10:21:36PM +1100, Michael Ellerman wrote:
> Jarkko Sakkinen <jarkko@kernel.org> writes:
> > On Mon, Feb 27, 2023 at 06:08:31PM -0500, Stefan Berger wrote:
> >> On 2/23/23 22:25, Michael Ellerman wrote:
> >> > There's code in prom_instantiate_sml() to do a "SML handover" (Stored
> >> > Measurement Log) from OF to Linux, before Linux shuts down Open
> >> > Firmware.
> >> > 
> >> > This involves creating a buffer to hold the SML, and creating two device
> >> > tree properties to record its base address and size. The kernel then
> >> > later reads those properties from the device tree to find the SML.
> >> > 
> >> > When the code was initially added in commit 4a727429abec ("PPC64: Add
> >> > support for instantiating SML from Open Firmware") the powerpc kernel
> >> > was always built big endian, so the properties were created big endian
> >> > by default.
> >> > 
> >> > However since then little endian support was added to powerpc, and now
> >> > the code lacks conversions to big endian when creating the properties.
> >> > 
> >> > This means on little endian kernels the device tree properties are
> >> > little endian, which is contrary to the device tree spec, and in
> >> > contrast to all other device tree properties.
> >> > 
> >> > To cope with that a workaround was added in tpm_read_log_of() to skip
> >> > the endian conversion if the properties were created via the SML
> >> > handover.
> >> > 
> >> > A better solution is to encode the properties as big endian as they
> >> > should be, and remove the workaround.
> >> > 
> >> > Typically changing the encoding of a property like this would present
> >> > problems for kexec. However the SML is not propagated across kexec, so
> >> > changing the encoding of the properties is a non-issue.
> >> > 
> >> > Fixes: e46e22f12b19 ("tpm: enhance read_log_of() to support Physical TPM event log")
> >> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> >> 
> >> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> >
> > 2/2 does not have a fixes tag.
> 
> True. Arguably the bug goes back to the introduction of
> kexec_file_load() support, although the patch won't backport that far
> due to code refactoring. So that would be:
> 
> Fixes: a0458284f062 ("powerpc: Add support code for kexec_file_load()")

Hmm... IMHO, it would still make sense to document this.

BR, Jarkko
