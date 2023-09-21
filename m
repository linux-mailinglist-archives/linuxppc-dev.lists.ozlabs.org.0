Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D607AA392
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 23:53:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tSv58fX4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs8Kq5tV6z3cfh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 07:53:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tSv58fX4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs8Jy2pDYz3cFt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 07:52:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F40B1B821F4;
	Thu, 21 Sep 2023 21:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F141C433C7;
	Thu, 21 Sep 2023 21:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695333163;
	bh=NTAFR578UzDwqvs2i4ooBKtvlj/FAAfa/TDohcND/ps=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tSv58fX4rgoT5MYYQHvquhnl4/cItfTC3vQVAoiE1T5bpAWTEyRuvbOL2+SfjX1To
	 ym7q3ByyPsVAzzX3Jw1JOr42zULob1th/6f5I8bvMb0d8/MxiaGUGMyjH5KDt/wza2
	 Y17f+v22fwxB/qdzyqkg027OFSixhJuTZQgFNOGK3j9kc396bMtRILz291YtClj+RZ
	 TFhyHC84ztlKulj3Gw8GFhX/x8XmAtvf/ItwSLYDK2evIVNr4w10qV4aQb3ZIknvNo
	 XXeoh1ZwMnf3jc2N2HkjkFUvQGSRE4kJs8QLvA5n/Oj3vjpEfN9lNE9eHd8M/GL2nZ
	 FfHdGGCbxWnuQ==
Date: Thu, 21 Sep 2023 16:52:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Subject: Re: Questions: Should kernel panic when PCIe fatal error occurs?
Message-ID: <20230921215241.GA337765@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d84b6d17-7fe9-222a-c874-798af4d9faea@linux.alibaba.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, gregkh@linuxfoundation.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, mahesh@linux.ibm.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "bp@alien8.de" <bp@alien8.de>, Baolin Wang <baolin.wang@linux.alibaba.com>, Linux PCI <linux-pci@vger.kernel.org>, bhelgaas@google.com, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lenb@kernel.org" <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023 at 08:10:19PM +0800, Shuai Xue wrote:
> On 2023/9/21 07:02, Bjorn Helgaas wrote:
> > On Mon, Sep 18, 2023 at 05:39:58PM +0800, Shuai Xue wrote:
> ...

> > I guess your point is that for CPER_SEV_FATAL errors, the APEI/GHES
> > path always panics but the native path never does, and that maybe both
> > paths should work the same way?
> 
> Yes, exactly. Both OS native and APEI/GHES firmware first are notifications
> used to handles PCIe AER errors, and IMHO, they should ideally work in the
> same way.

I agree, that would be nice, but the whole point of the APEI/GHES
functionality is vendor value-add, so I'm not sure we can achieve that
ideal.

> ...
> As a result, AER driver only does recovery for non-fatal PCIe error.

This is only true for the APEI/GHES path, right?  For *native* AER
handling, we attempt recovery for both fatal and non-fatal errors.

> > It doesn't seem like the native path should always panic.  If we can
> > tell that data was corrupted, we may want to panic, but otherwise I
> > don't think we should crash the entire system even if some device is
> > permanently broken.
> 
> Got it. But how can we tell if the data is corrupted with OS native?

I naively expect that by PCIe protocol, corrupted DLLPs or TLPs
detected by CRC, sequence number errors, etc, would be discarded
before corrupting memory, so I doubt we'd get an uncorrectable error
that means "sorry, I just corrupted your data."

But DPC is advertised as "avoiding the potential spread of any data
corruption," so there must be some mechanisms of corruption, and since
DPC is triggered by either ERR_FATAL or ERR_NONFATAL, I guess maybe
the errors could tell us something.  I'm going to quit speculating
because I obviously don't know enough about this area.

> >> However, I have changed my mind on this issue as I encounter a case where
> >> a error propagation is detected due to fatal DLLP (Data Link Protocol
> >> Error) error. A DLLP error occurred in the Compute node, causing the
> >> node to panic because `struct acpi_hest_generic_status::error_severity` was
> >> set as CPER_SEV_FATAL. However, data corruption was still detected in the
> >> storage node by CRC.
> > 
> > The only mention of Data Link Protocol Error that looks relevant is
> > PCIe r6.0, sec 3.6.2.2, which basically says a DLLP with an unexpected
> > Sequence Number should be discarded:
> > 
> >   For Ack and Nak DLLPs, the following steps are followed (see Figure
> >   3-21):
> > 
> >     - If the Sequence Number specified by the AckNak_Seq_Num does not
> >       correspond to an unacknowledged TLP, or to the value in
> >       ACKD_SEQ, the DLLP is discarded
> > 
> >       - This is a Data Link Protocol Error, which is a reported error
> > 	associated with the Port (see Section 6.2).
> > 
> > So data from that DLLP should not have made it to memory, although of
> > course the DMA may not have been completed.  But it sounds like you
> > did see corrupted data written to memory?
> 
> The storage node use RDMA to directly access remote compute node.
> And a error detected by CRC in the storage node. So I suspect yes.

When doing the CRC, can you distinguish between corrupted data and
data that was not written because a DMA was only partially completed?

> ...
> I tried to inject Data Link Protocol Error on some platform. The mechanism
> behind is that rootport controls the sequence number of the specific TLPs
> and ACK/NAK DLLPs. Data Link Protocol Error will be detected at the Rx side
> of ACK/NAK DLLPs.
> 
> In such case, NIC and NVMe recovered on fatal and non-fatal DLLP
> errors.

I'm guessing this error injection directly writes the AER status bit,
which would probably only test the reporting (sending an ERR_FATAL
message), AER interrupt generation, firmware or OS interrupt handling,
etc.

It probably would not actually generate a DLLP with a bad sequence
number, so it probably does not test the hardware behavior of
discarding the DLLP if the sequence number is bad.  Just my guess
though.

> ...
> My point is that how kernel could recover from non-fatal and fatal
> errors in firmware first without DPC? If CPER_SEV_FATAL is used to
> report fatal PCIe error, kernel will panic in APEI/GHES driver.

The platform decides whether to use CPER_SEV_FATAL, so we can't change
that.  We *could* change whether Linux panics when the platform says
an error is CPER_SEV_FATAL.  That happens in drivers/acpi, so it's
really up to Rafael.

Personally I would want to hear from vendors who use the APEI/GHES
path.  Poking around the web for logs that mention HEST and related
things, it looks like at least Dell, HP, and Lenovo use it.  And there
are drivers/acpi/apei commits from nxp.com, alibaba.com, amd.com,
arm.com huawei.com, etc., so some of them probably care, too.

Bjorn
