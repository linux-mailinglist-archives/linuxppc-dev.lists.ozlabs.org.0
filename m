Return-Path: <linuxppc-dev+bounces-4214-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE689F413A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 04:31:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC2QX3fnTz2yVt;
	Tue, 17 Dec 2024 14:31:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734405972;
	cv=none; b=YcU1GRnKnYHD+DrzPDBs4SF9IItsL0Di5DMWRrKCvKr1IdgOS/9cnMD58kwKAtwizIs0Izl8T1C8nXlLCXP8eaiev5BuUnRV6vocr4VM1GD8LWjXpmntdP5BfxFpng/gcT/1kTZLA52mnQwOPl+eoamBiYkIBCEj6Zl2YYhu8/oZV/wra7KSvxR79B45+klPFgKa1/rb9Jl58MrdnUrebRfzqmkKwk1oFeyeGpiAMQWYS4HFsjYVQuwO5n4BLSSv97+Hgj9RYXWKI/YHPSedar6LKA6dDC4rveVEi0G47S8HOzyCI6RowVx1/Wn/WLuwjKdwLmH2oiADKRNKWT/zuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734405972; c=relaxed/relaxed;
	bh=JlcQZlpEq87WaYonljOQJTcis2Rm4csqH0xDxg7Rw6U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Iut0/CEIkLc6x7v6LuByKwqXDiVXJhFsq235rgXY6nl4kHcjmptH4fYA+8IFI/XscgEqpk8dA+0Z9QYkq/ZtlH+iJcj8tr2+Y19kWgSR5BMNmPSo5PYItZqOAchOWGOPz+C98sQl41r5gB4Oh5FOu8PctyUiJzl56RKXSaI0QBzcGh87JLmKoWk1gc6D8A4+8Qw/ScISZNdH+cYzI3vFDe98rAzWYav+TvVqvoUyhvoFQb/9+QtFErh4d+zd5mESz1Vqxv+ob0/dJmqNNGZVMJNwJsD8boR50mQp1UkzpFzbdxLZgJhNWqCYFwJ+jdzfF+ij3ZcPYx8cVTizGrDN7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n+wQKkJG; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mpe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n+wQKkJG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=mpe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC2K01FpJz2xtp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 14:26:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 941D3A41BA8;
	Tue, 17 Dec 2024 03:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1812C4CED3;
	Tue, 17 Dec 2024 03:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734405968;
	bh=JlcQZlpEq87WaYonljOQJTcis2Rm4csqH0xDxg7Rw6U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n+wQKkJGSneOniU6dmPRnpTp6ZH0m7z+9AfPZtTgG7u59zo3MSnLnATocr/Ra902Z
	 KB6QjK+ZTU8QoXTuf/C1fBQppIr17VtOZBBKWv+612jcR3eEqfErnQCabjXn3koyD+
	 Azbf5HxWiMNCUV8Lex/3FAVltxbTLEstz68dNpUP5t9MDPHGD99lQeBe39oelRLgES
	 PRVHDxbWDTXaIS6bYaubRMlvs35J3WszV2sosGZFwU9VwvLGQTud31a6ncxJNa2kK2
	 hCJB9fu5fKLEdNZ6tNGmUmK2hrUWVcC9A0fWhZztSygPbzxn8W5gVg0STF3mckYfaO
	 JgjKvR1u90EIw==
From: Michael Ellerman <mpe@kernel.org>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com,
 ukrishn@linux.ibm.com, manoj@linux.ibm.com, clombard@linux.ibm.com,
 vaibhav@linux.ibm.com
Subject: Re: [PATCH 0/2] Remove cxl and cxlflash drivers
In-Reply-To: <20241210072721.157323-1-ajd@linux.ibm.com>
References: <20241210072721.157323-1-ajd@linux.ibm.com>
Date: Tue, 17 Dec 2024 14:26:04 +1100
Message-ID: <87y10f2do3.fsf@mpe.ellerman.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Andrew Donnellan <ajd@linux.ibm.com> writes:
> This series removes the cxl and cxlflash drivers for IBM CAPI devices.
>
> CAPI devices have been out of production for some time, and we're not
> aware of any remaining users who are likely to want a modern kernel.
> There's almost certainly some remaining driver bugs and we don't have much
> hardware available to properly test the drivers any more. Removing these
> drivers will also mean we can get rid of a non-trivial amount of support
> code in arch/powerpc.
>
> Thanks to everyone who's worked on these drivers over the last decade.

It would be good to explain that this only removes support for the
original CAPI interface - not the Power9 "OpenCAPI", which is still
supported by drivers/misc/ocxl.

cheers

