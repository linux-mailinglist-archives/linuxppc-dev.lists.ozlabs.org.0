Return-Path: <linuxppc-dev+bounces-9303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCACCAD6E2A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 12:46:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHzjk1vvxz2xQ6;
	Thu, 12 Jun 2025 20:46:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749725210;
	cv=none; b=HBPyqEK3kCGU/npae2l3yy6/wjCYisf4i9oa1Y2c/sf3ZBoJG9E2yO0tWPCYbG+xRg5KZC8kKknjRxHOfE+4hgWv76pDlghQKDQG3OrODM3FrosNnAQum7M1KNUqXVoUU2i3aPlswn6uNe8q0LcrhS04uoFMxQ4H2opgTjRFXzehiyEed3lkXxj1Ga9+emRNMFucVFKtfi/BGJkIGDO9e+ANQ+HfBiwiZXOz/ErdnhU9y0RpyF96wYvBp0EOGWwZ3sjI1Idp+Z7YQHY4mTzaEzxEuf5+avD3TozozFZrEaHxGxIHCgFVyw7AGgChS4oHZn4sOK6GKesKKMe2HUnfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749725210; c=relaxed/relaxed;
	bh=dYQmpaGO9cKmmGA2rcatO+dhLIzvWWOX939GeWSX/FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfeXjNxnaMcciayVtTtoiNhJ9t+W3AqYOsEpRctunvb0rZ1PYUMRcMS41t6JXFJUZxcDc1sKNno8Z71xW34YD2x4i8Tp8VP9V9BE/voufoEV47N79+YLGL8VLpyOy98y9fKzPBNJT3phOT2KkOlLx1t6VEtwJSi5U/kDPJLa48t5DthLxDhdhdboJgX1b/iAWRn3cEOlCkXCuTIlTPxmSCoVTS5W+80Ts4UtyvDk1rKTcss0uu8Q8LFK6Z7rfpHRz41lx9jjylb5ETqL1kqV7YXiEwAbt1EO+PW3D1CZeOrwsJJ+DuirM0PJRF9m6aJUj6vaR608mi277HnsweiWdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sO7KR46D; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sO7KR46D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHzjh5wKVz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 20:46:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DF16446E8;
	Thu, 12 Jun 2025 10:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA91C4CEEA;
	Thu, 12 Jun 2025 10:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749725206;
	bh=6rmmiSB1nU3IQ0qw0+ckwjysahJXSea7GRNyqVg84jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sO7KR46DWS7JVO+IVKFBlPk2axEZHUAA1mPsVrQhyIFlbSyq1ED1OzeAFJDimvO7G
	 G6BEIjTcIlUT/cKH20t6h/YA/87MVWs7mlZvrZzXPVTtscM2rfVY8KWOjeKlFNJRXl
	 DY/qc3yoiKfnWA3qiC8xH7zPh/3mNSCg/lZ+rFlQjJUFaeC0SYxHg8Ch0a2oZ/O3D8
	 pG2+WUdm7yq4u5ebZBMNa8hdL0RT+w5rdds9xDa+jKESw2xx//Z515r+P/b51IwZw0
	 r7X2GYvawtYlzqLha9iCrpyZ+8+cA3vWRmbuePGYiVMCW4UNtAFLg5E/bu1VvUdAY2
	 jMVYXidYHyTEQ==
Date: Thu, 12 Jun 2025 16:16:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org, mahesh@linux.ibm.com, 
	oohall@gmail.com, Jonathan.Cameron@huawei.com, terry.bowman@amd.com, 
	tianruidong@linux.alibaba.com
Subject: Re: [PATCH v4 3/3] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
Message-ID: <54nug57urubw5uhrwrdos3s3kta2r4qovzb6cf2mntc7kiora5@lg3p7vjmrvb3>
References: <20250217024218.1681-1-xueshuai@linux.alibaba.com>
 <20250217024218.1681-4-xueshuai@linux.alibaba.com>
 <8a833aaf-53aa-4e56-a560-2b84a6e9c28c@linux.intel.com>
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
In-Reply-To: <8a833aaf-53aa-4e56-a560-2b84a6e9c28c@linux.intel.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Mar 02, 2025 at 07:43:41PM -0800, Sathyanarayanan Kuppuswamy wrote:
> 
> On 2/16/25 6:42 PM, Shuai Xue wrote:
> > The AER driver has historically avoided reading the configuration space of
> > an endpoint or RCiEP that reported a fatal error, considering the link to
> > that device unreliable. Consequently, when a fatal error occurs, the AER
> > and DPC drivers do not report specific error types, resulting in logs like:
> > 
> >    pcieport 0000:30:03.0: EDR: EDR event received
> >    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
> >    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
> >    pcieport 0000:30:03.0: AER: broadcast error_detected message
> >    nvme nvme0: frozen state error detected, reset controller
> >    nvme 0000:34:00.0: ready 0ms after DPC
> >    pcieport 0000:30:03.0: AER: broadcast slot_reset message
> > 
> > AER status registers are sticky and Write-1-to-clear. If the link recovered
> > after hot reset, we can still safely access AER status of the error device.
> > In such case, report fatal errors which helps to figure out the error root
> > case.
> > 
> > After this patch, the logs like:
> > 
> >    pcieport 0000:30:03.0: EDR: EDR event received
> >    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
> >    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
> >    pcieport 0000:30:03.0: AER: broadcast error_detected message
> >    nvme nvme0: frozen state error detected, reset controller
> >    pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
> >    nvme 0000:34:00.0: ready 0ms after DPC
> >    nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
> >    nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
> >    nvme 0000:34:00.0:    [ 4] DLP                    (First)
> >    pcieport 0000:30:03.0: AER: broadcast slot_reset message
> 
> IMO, above info about device error details is more of a debug info. Since
> the
> main use of this info use to understand more details about the recovered
> DPC error. So I think is better to print with debug tag. Lets see what
> others
> think.
> 

My two cents: All AER logs are mostly error messages, so I don't see why this
one should be a debug message. But having said that, this new error log may
confuse users as if a new AER error is received post recovery. So adding
something that specifies that this belong to the previous AER error would be
good IMO.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

