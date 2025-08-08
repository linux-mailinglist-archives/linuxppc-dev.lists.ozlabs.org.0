Return-Path: <linuxppc-dev+bounces-10769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D9B1ED9E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 19:04:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bz9Nn03MTz30Wn;
	Sat,  9 Aug 2025 03:04:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754672648;
	cv=none; b=Kb/YWRu2NwUqU37vo4peowkeXlrr3rbbO2bqkpB5ruqay3a0yNfnYNPqUM4TlJ+6cT3glhTMyd751d9DUGqxGA7bwmUOVtvsfH7hS6zxHW/7gDJNVgiDHX8xm1J95pXC/8k+ueT/YE+t3DlFWA2BPRZea42IHIQGR9XgHM0uCiLjR3ENd/tuEXgEz61ftK1YOvBd2OkN/CNL7b/uWEQGl9Sb6YERfq/CgT3DMhEsdhowGHT4ORJzz0OLEJp8sI2XRmeLQ72Kplto2j9lPh64ar05ZP3iIv690xNbSR4k4T488o2qn82PwF8v4PAuch2iJr1sHVPHFrnRr3jDBva+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754672648; c=relaxed/relaxed;
	bh=jcXe+DepAsVRyeS9ZMZs9hUSlZtMli7xwsMPgZxiVYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/J4mg0r7xI4Et0T/tz5LqtIt1P2JOiOX4adfKQQ9VI789e6Bn2x9dvs8ckZmBl7mu7hpvEQVUibNS9VOK16UWhjCdKq6ObMknZpZDFCSf5ew94kXTgMhrG8tIdgm7aj5M7qult3Wm3N3B5qZbBNDVtP8SQ+B1AL6K1d2XbJoUoboKISccCY98jxpMugH8KqmcUoUujNMJIpKyFh6rhfa+b08AeKIZMJuLTTqQzoPDiZRVZEm5R452bdmYfgpAbYHQIZ2n6s9c29N7TH9MRf3zqmdg17yB+HPPoXrgfi4rDijRX999PBcoIf0yuA0GZX9MAQpdSbJR9ucWI8Yepdfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VsKW5hA8; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VsKW5hA8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bz9Nm1d3yz301K
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Aug 2025 03:04:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 089454187B;
	Fri,  8 Aug 2025 17:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8392FC4CEED;
	Fri,  8 Aug 2025 17:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754672645;
	bh=1x1qHlFBl7yOrv3dMBvgEuOQ3c4yYXP9OfIu5ljyKq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VsKW5hA8wPmgp8sy7LkNtPiwfpcKqVsfIawuPDnGBM8zhJivEtTWBPKQ3Vl/ql4S1
	 eH1ySNTFEueCtU/Rj62cy7ETAcreEwhqktphO4asIbYH59DwUzlwQakxNN6daHQ+TB
	 fDlwYaqACF1QvoCTlUUR9luecJHrADGYNzldSbzSlA2vLKTHrmDjyqDPiEWa2M2dly
	 knr9f1m6fDbb0gRsZeDZmAx7Zbu5esVDFQE/mX+kNs1kBj5EBrJhEluB6dOGJ9F2Zs
	 fa43D9b7G04BBCEdmwAvzLLakuDyKD4sCrgtTg/FkIHGh/KEr0QYFIYWzO8cmDzTVr
	 G5EKGmcpdvQNA==
Date: Fri, 8 Aug 2025 13:04:02 -0400
From: Sasha Levin <sashal@kernel.org>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH AUTOSEL 6.16-5.10] PCI: pnv_php: Clean up allocated IRQs
 on unplug
Message-ID: <aJYuAoqFT206dYwI@lappy>
References: <20250808153054.1250675-1-sashal@kernel.org>
 <20250808153054.1250675-14-sashal@kernel.org>
 <1852420641.1614920.1754668740466.JavaMail.zimbra@raptorengineeringinc.com>
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
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1852420641.1614920.1754668740466.JavaMail.zimbra@raptorengineeringinc.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 08, 2025 at 10:59:00AM -0500, Timothy Pearson wrote:
>While the autoselector has the right idea, in that this is critical functionality that currently induces panics on older stable kernels, this entire patch series should be backported, not just these two isolated patches.
>
>The correct series for backport would be:
>
> PCI: pnv_php: Fix surprise plug detection and recovery
> powerpc/eeh: Make EEH driver device hotplug safe
> powerpc/eeh: Export eeh_unfreeze_pe()
> PCI: pnv_php: Work around switches with broken presence detection
> PCI: pnv_php: Clean up allocated IRQs on unplug
>
>Backport is especially critical for Debian, so that we don't ship a broken kernel with the soon to be released Trixie version.

Okay, I'll just queue these up directly. Thanks!

-- 
Thanks,
Sasha

