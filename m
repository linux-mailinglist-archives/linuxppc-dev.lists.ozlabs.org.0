Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E67A8FFA19
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 05:11:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a+lPQnr+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwR6k2bGyz2xdp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 13:11:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a+lPQnr+;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwR5y4HR3z30VY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 13:10:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717729830;
	bh=9lFwEx/JP+T+tWQXbEOOpWSpvQQLktCyT0QZNUBEBwk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a+lPQnr+Hnyw9k4PYjdItxkPOKkzpbq1xDGrmf9objw3RJOsGfDNkk6kSXDnqMZAa
	 JnknCa8WBXOCOPeF6PLMjiqipv2f8aEyttcN+W/h4CKUL6DmOfx/m+uaUzFkhIxrr/
	 Q/2ZJZeD3PTtuw48WIFqfGAv7imifCi9XSNcA1Xaphf3B/szumvFTpkUjZoAeasVju
	 Np++rhcJmzGs6m/QnGKZs9p7yuarwU8jTd2NmBsa0MARAmElxFYUmx0feSgupgFiO7
	 8ArAOcVNEMjnJMXXKdD1ryHmh3JFwOp+KSgzF5E+b0md7so63XmiCVjvXKBFhCqYsE
	 gS6Efuir3IqzA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VwR5w0Q8qz4wc8;
	Fri,  7 Jun 2024 13:10:28 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH] ata: pata_macio: Fix max_segment_size with PAGE_SIZE ==
 64K
In-Reply-To: <ZmG0TUiw0Nagwroj@ryzen.lan>
References: <20240606111445.400001-1-mpe@ellerman.id.au>
 <ZmG0TUiw0Nagwroj@ryzen.lan>
Date: Fri, 07 Jun 2024 13:10:25 +1000
Message-ID: <87ikylphwe.fsf@mail.lhotse>
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
Cc: doru.iorgulescu1@gmail.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, john.g.garry@oracle.com, linux-ide@vger.kernel.org, dlemoal@kernel.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de, regressions@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Niklas Cassel <cassel@kernel.org> writes:
> On Thu, Jun 06, 2024 at 09:14:45PM +1000, Michael Ellerman wrote:
>> The pata_macio driver advertises a max_segment_size of 0xff00, because
>> the hardware doesn't cope with requests >= 64K.
>> 
>> However the SCSI core requires max_segment_size to be at least
>> PAGE_SIZE, which is a problem for pata_macio when the kernel is built
>> with 64K pages.
>> 
>> In older kernels the SCSI core would just increase the segment size to
>> be equal to PAGE_SIZE, however since the commit tagged below it causes a
>> warning and the device fails to probe:
>> 
>>   WARNING: CPU: 0 PID: 26 at block/blk-settings.c:202 .blk_validate_limits+0x2f8/0x35c
>>   CPU: 0 PID: 26 Comm: kworker/u4:1 Not tainted 6.10.0-rc1 #1
>>   Hardware name: PowerMac7,2 PPC970 0x390202 PowerMac
>>   ...
>>   NIP .blk_validate_limits+0x2f8/0x35c
>>   LR  .blk_alloc_queue+0xc0/0x2f8
>>   Call Trace:
>>     .blk_alloc_queue+0xc0/0x2f8
>>     .blk_mq_alloc_queue+0x60/0xf8
>>     .scsi_alloc_sdev+0x208/0x3c0
>>     .scsi_probe_and_add_lun+0x314/0x52c
>>     .__scsi_add_device+0x170/0x1a4
>>     .ata_scsi_scan_host+0x2bc/0x3e4
>>     .async_port_probe+0x6c/0xa0
>>     .async_run_entry_fn+0x60/0x1bc
>>     .process_one_work+0x228/0x510
>>     .worker_thread+0x360/0x530
>>     .kthread+0x134/0x13c
>>     .start_kernel_thread+0x10/0x14
>>   ...
>>   scsi_alloc_sdev: Allocation failure during SCSI scanning, some SCSI devices might not be configured
>> 
>> Although the hardware can't cope with a 64K segment, the driver
>> already deals with that internally by splitting large requests in
>> pata_macio_qc_prep(). That is how the driver has managed to function
>> until now on 64K kernels.
>> 
>> So fix the driver to advertise a max_segment_size of 64K, which avoids
>> the warning and keeps the SCSI core happy.
>> 
>> Fixes: afd53a3d8528 ("scsi: core: Initialize scsi midlayer limits before allocating the queue")
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Closes: https://lore.kernel.org/all/ce2bf6af-4382-4fe1-b392-cc6829f5ceb2@roeck-us.net/
>> Reported-by: Doru Iorgulescu <doru.iorgulescu1@gmail.com>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218858
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> ---
>
> Applied to libata/for-6.10-fixes:
> https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git/log/?h=for-6.10-fixes
>
> With John's Reviewed-by from the other thread:
> https://lore.kernel.org/linux-ide/171362345502.571343.9746199181827642774.b4-ty@oracle.com/T/#t

Thanks.

cheers
