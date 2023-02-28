Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE4E6A57AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 12:22:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQw2D5MFHz3cLW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 22:22:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ozDOMArD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQw1J3hbVz3bbS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 22:21:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ozDOMArD;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PQw1G094mz4wgv;
	Tue, 28 Feb 2023 22:21:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677583298;
	bh=Qzkz7xSQK7QaLBmpwVbsSJkFMksdw/3aVgUvFCHphao=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ozDOMArDd9j0aGeIoLYJS/iqqbCyf2pKW2MPxKN3Me0bGwHibbwNUCV4FAJBfPS3S
	 2V690d/yqr0a0WEg5qsu54QCt+N8FO1tr5CcjFfxkkEh58bSS8+D4O9wlgjkt5GWln
	 SGZd56AXrl1q4TcgKDL6AHCGVs5XpvzXlFErvn/fzMYPDhYMSHkAj1AAGWSGFJPVAB
	 DUkvRfa6kpdqAAN/qM8+cWm2RmfRWa9BuVWd39fU0g4LClLDVkfoz3MW2dz19A0PgI
	 KvLnwWXPconXnRgXfmqEPZMVsZlYD626dKQRgo2jG8LDZKk+t+/954iqX9rbGfoxgB
	 DqQP4ttPSCInA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jarkko Sakkinen <jarkko@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/tpm: Create linux,sml-base/size as big endian
In-Reply-To: <Y/1wm3kmsto5tzeB@kernel.org>
References: <20230224032508.3331281-1-mpe@ellerman.id.au>
 <c2afd163-5f23-acab-fd39-3a5593ed6257@linux.ibm.com>
 <Y/1wm3kmsto5tzeB@kernel.org>
Date: Tue, 28 Feb 2023 22:21:36 +1100
Message-ID: <87r0uaujb3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Jarkko Sakkinen <jarkko@kernel.org> writes:
> On Mon, Feb 27, 2023 at 06:08:31PM -0500, Stefan Berger wrote:
>> On 2/23/23 22:25, Michael Ellerman wrote:
>> > There's code in prom_instantiate_sml() to do a "SML handover" (Stored
>> > Measurement Log) from OF to Linux, before Linux shuts down Open
>> > Firmware.
>> > 
>> > This involves creating a buffer to hold the SML, and creating two device
>> > tree properties to record its base address and size. The kernel then
>> > later reads those properties from the device tree to find the SML.
>> > 
>> > When the code was initially added in commit 4a727429abec ("PPC64: Add
>> > support for instantiating SML from Open Firmware") the powerpc kernel
>> > was always built big endian, so the properties were created big endian
>> > by default.
>> > 
>> > However since then little endian support was added to powerpc, and now
>> > the code lacks conversions to big endian when creating the properties.
>> > 
>> > This means on little endian kernels the device tree properties are
>> > little endian, which is contrary to the device tree spec, and in
>> > contrast to all other device tree properties.
>> > 
>> > To cope with that a workaround was added in tpm_read_log_of() to skip
>> > the endian conversion if the properties were created via the SML
>> > handover.
>> > 
>> > A better solution is to encode the properties as big endian as they
>> > should be, and remove the workaround.
>> > 
>> > Typically changing the encoding of a property like this would present
>> > problems for kexec. However the SML is not propagated across kexec, so
>> > changing the encoding of the properties is a non-issue.
>> > 
>> > Fixes: e46e22f12b19 ("tpm: enhance read_log_of() to support Physical TPM event log")
>> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> 
>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>
> 2/2 does not have a fixes tag.

True. Arguably the bug goes back to the introduction of
kexec_file_load() support, although the patch won't backport that far
due to code refactoring. So that would be:

Fixes: a0458284f062 ("powerpc: Add support code for kexec_file_load()")

cheers
