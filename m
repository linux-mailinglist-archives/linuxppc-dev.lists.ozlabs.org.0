Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B1B53FEDA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 14:34:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHVD95w0zz3bk5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 22:34:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CyKzGazU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHVCX6fjbz3bfc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 22:34:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CyKzGazU;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LHVCQ55dqz4xD5;
	Tue,  7 Jun 2022 22:33:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1654605238;
	bh=xsqLotJgLRyhHSsJOogHV2acGAb2fC5jAOSFmHOIGA8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CyKzGazU3+2K8KiXkFolMw7JQl3fOZLWg6z5Qa5Pu4HecLtJDYCw5wZXMKOpJGtNH
	 ls59IpcNb+xkojsRvHCc4fWQ+jCa6EIATKhLPnYyeuNIQ3bM/kCbodmjHfgOjgkZkS
	 4h1lW8cbZe+o+0DbG3jBJCA91u30ggP5RKfw27leNpg5nQnN6glbcE5esgg3QrVgMC
	 F6vtgSRCeacrQYA+phjt3HatLp44B4mYcMY4ThklAxFfrqM77MDq/rb5P0zDTt02T0
	 PGQo6ASa5inpNApELNIR+n6jSj0aWCgLFiNBXcmQyCK7Xw/Luq/s+wYpHBJDE3Ehpr
	 xujYS3Qf+FLTQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 6/6] arch/*/: remove CONFIG_VIRT_TO_BUS
In-Reply-To: <20220606084109.4108188-7-arnd@kernel.org>
References: <20220606084109.4108188-1-arnd@kernel.org>
 <20220606084109.4108188-7-arnd@kernel.org>
Date: Tue, 07 Jun 2022 22:33:49 +1000
Message-ID: <87y1y8tzyq.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>, linuxppc-dev@lists.ozlabs.org, Denis Efremov <efremov@linux.com>, Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd Bergmann <arnd@kernel.org> writes:
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index be68c1f02b79..48e1aa0536b6 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -277,7 +277,6 @@ config PPC
>  	select SYSCTL_EXCEPTION_TRACE
>  	select THREAD_INFO_IN_TASK
>  	select TRACE_IRQFLAGS_SUPPORT
> -	select VIRT_TO_BUS			if !PPC64
>  	#
>  	# Please keep this list sorted alphabetically.
>  	#

> diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
> index c5a5f7c9b231..73fcd5cdb662 100644
> --- a/arch/powerpc/include/asm/io.h
> +++ b/arch/powerpc/include/asm/io.h
> @@ -985,8 +985,6 @@ static inline void * bus_to_virt(unsigned long address)
>  }
>  #define bus_to_virt bus_to_virt
>  
> -#define page_to_bus(page)	(page_to_phys(page) + PCI_DRAM_OFFSET)
> -
>  #endif /* CONFIG_PPC32 */
  
Seems that's not used by any drivers, so fine to remove.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
