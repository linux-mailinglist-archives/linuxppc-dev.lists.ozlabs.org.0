Return-Path: <linuxppc-dev+bounces-8132-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A6DA9FD39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 00:45:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmdnX5JrLz2yZZ;
	Tue, 29 Apr 2025 08:45:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745880320;
	cv=none; b=F3DxH5DjYKHU1Fh0ZPbALa5UEMih4v/FGbiJ7r+ud+cPF2hiI2Jqi7LAtQ7n3cXK6CgOQ+x9Ax+4Uu5ncBlWRlI3U5s4wjFYyB2JypukbPSHfDkubIZqKEJdtSKv8NGHtxP1/gwVcMFtkX4aKRmkccEP2/XWO+R+deaivu4Q2dZffQEcyk/zZjLEjlNS7uIvKsb1HNPQ6IolzIKMxnuVEu3l2QT3NjNNv93kLaO1hDYZ2w4sr7q8I/FeudTjKXOi4yxRy7sF8vM+PcnsCjSjpvsbYpgFWLilt9AMS9LIfw55J80rxiYFy0hV0YXwupYQhXIt/Q50Kmq33iBx4TeJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745880320; c=relaxed/relaxed;
	bh=qqZsxRe5YN9EuISiamPnjxKWy6QshrLL8TJ8PdqwMXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWo0jhHn9+RnOY8+uVrp/ifmfmNtxOtA4+UYTPWU1Xg+//6RSGlNvphPyAKtogyrHTGI3u4ePvf4h67bU9msGRIKHX/7T8ranTBCps6DG9q+SkCD4hojqPTBU/bWKATBmkgxirii/R8chG5l2RXR0tO4PFDPZRykSPW76CL+JxHxF0H9oPM96nbjn/mOKV18/nU9kendscRdnzKdXjI9dn5Orco6CRr1V93off1xdi6BDIReweAa+7AImmpIJKgctm4euCwND0h/t1td8KJRJhNzMWcAv289+lYpWMzMwi9JX7fOrzk+6kgxKqkmAR2r8543MH5Ls4Zb5xdmm89dMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qKGA7d4I; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qKGA7d4I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmdnW65clz2ySg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 08:45:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBA035C5ECA;
	Mon, 28 Apr 2025 22:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986C3C4CEE4;
	Mon, 28 Apr 2025 22:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745880316;
	bh=iEgcLTkDkFJOT7HlI3aSWIUb6zLNar111Rw+B+KVd0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKGA7d4I1Xv4lnO2QEvAFptiF/Bk8yCyZlzREFkxc8/ZbydV/Io4cKBOfsFiepgbx
	 faoR2VNi7zkUBoJk10MO/Cy+DPlgiJf7FQnBHCd9GwRokCO6HNBXQbFFhr65FUiFmc
	 Ipt4egabLR2vqhIJpvijiGY3y+5zCOUMlvVDnL2w8K1EyM6OSneipar6rwIBIpfLoh
	 35ITA8fTL4cG8OcFr5r1VIiZArG0GO2mf8LM1FVUQBBaql/FwO029E5PPjrIARsiUD
	 Rz990rOVpRtTaZxytBdzAqS8q3wpYYuBhgM+LS8juAwbkU0X1hvbS00qrq3xI/G00c
	 BPha6HbRhfIKg==
Date: Tue, 29 Apr 2025 00:45:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Apple/PASemi i2c error recovery fixes
Message-ID: <enap4curtpjaiazxpcsw3sk64aq2i7wqi3iwm6l2pfph5qduwj@gkagpeazcumg>
References: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
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
In-Reply-To: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Sven,

> Hector Martin (3):
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Log bus reset causes
> 
> Sven Peter (1):
>       i2c: pasemi: Improve timeout handling

merged to i2c/i2c-host.

Thanks,
Andi

