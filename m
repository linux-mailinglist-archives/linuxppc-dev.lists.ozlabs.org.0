Return-Path: <linuxppc-dev+bounces-8409-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8248AAAE6EB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 18:39:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt1FF02sgz30FR;
	Thu,  8 May 2025 02:39:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.186
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746635968;
	cv=none; b=O/AWQTOUJi/u8mOm5rMuTjzSpiDHCPwGgAzdq/vMpNifEB/8AEZOai2MLynz7GqgIzMl8JpmLlvNSeJ5RQ8bej4xyQbokncY/IyMiVAGtqHKBVygxcHIAB0ZJryoQNcZb1+fd22Q/ADwk2GbYlYl7VE7GOaMZ9wK9EHQgCcWRHprAjmXB0LLu5o/JxNEbpnbfHjcqOGylZPgGjx5vQGWd86puegsD1KbRf4P136cd4gZuLEuUNmqWIb15yolEF9PYhILXrZ5UitIEhxNMv7ZcBtjphm/AB0LWm7G2BNS9w1r1hL1nbhfhH5XBGO7wgPr0oLWiEuUO5+l1Fze30eeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746635968; c=relaxed/relaxed;
	bh=Zb+SGIpxZ2i/VssN+N0+bs8AQInuxHpANS0MYc/FZCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaqSb5yIggpg85tyd7Gxo9lKnbRiqhkw4XwhXa35kozWSOSRzolfSv5eU7ff6qRLBKP2sphuRfZy4OH9RMvIhb3yxpqT5kX991JvZqHkMtvJcuS9j4R+R8uwyrp2IeBRgZ7J49miNYzoJXl7wLSbVPCbZ1MKAptifrpMi5VZAqd66J3OuYUKqhMVmAM3V6Zvx07x286nTsBfMbwYRn6XdHVS9tP8GdYzKUYSOWsU1BPLVMsNdKoMcgN/iyEcDVe8CvlxNSwcvKvsxPTzm4+CDB0wlloY6uWzphv/kNeL9MHT5JMfBJulfFW3Hod2X2XaxAM8DfzmL+w5yxvQONxUiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cdBlN5Np; dkim-atps=neutral; spf=pass (client-ip=95.215.58.186; helo=out-186.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cdBlN5Np;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.186; helo=out-186.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt1FB5Y5jz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 02:39:25 +1000 (AEST)
Date: Wed, 7 May 2025 18:38:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746635944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zb+SGIpxZ2i/VssN+N0+bs8AQInuxHpANS0MYc/FZCk=;
	b=cdBlN5NpDyu9tl5cWVL01+s2VGA+1OQ7iBEbZ7+NGpnZ851sLcUJEIJEr/JygOrY/DGMOg
	XVO1IYz/BjosJ/kMeaxP/bNUnJ0M3hTMmaSmiKFly7cBhdI605DJRSgKSfkFASXTyaiOfC
	cwYcs8jC2rtNYuJBumRvrP30TLLBATc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v3 09/16] scripts: Add support for kvmtool
Message-ID: <20250507-17ee3d8f1b384ab89848e63c@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-10-alexandru.elisei@arm.com>
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
In-Reply-To: <20250507151256.167769-10-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 04:12:49PM +0100, Alexandru Elisei wrote:
> Teach the arm runner to use kvmtool when kvm-unit-tests has been configured
> appropriately.
> 
> The test is ran using run_test_status(), and a 0 return code (which means
> success) is converted to 1, because kvmtool does not have a testdev device
> to return the test exit code, so kvm-unit-tests must always parse the
> "EXIT: STATUS" line for the exit code.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/run               | 161 ++++++++++++++++++++++++++----------------
>  powerpc/run           |   4 +-
>  riscv/run             |   4 +-
>  s390x/run             |   2 +-
>  scripts/arch-run.bash | 112 +++++++++++------------------
>  scripts/vmm.bash      |  89 +++++++++++++++++++++++
>  x86/run               |   4 +-
>  7 files changed, 236 insertions(+), 140 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

