Return-Path: <linuxppc-dev+bounces-1487-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E54E997D37D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 11:16:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X96Fy41Klz2yGY;
	Fri, 20 Sep 2024 19:16:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726823798;
	cv=none; b=fMpBfeOy9XSs611RPUwNscS2IKPhhdVTUMwobM6qocRI90po/+na204JT3fnhoA5U36QVRlx6g71X7UpFbb+mFBEDD9j12H6+sIH4fVKazpst1VdVjrTS8E73Xgma60+vC8A8tZyD7hX6jmHmMmizH9kVBU+Iw2rfApfDcyBgtC8bGhH3a+paVHBZXZ9Z7Mp5piXmuNqdmrDmmUM/HtyRsFac7YROC1cD7L7Zk5q8cMAYfcvYxbVLTOo75VnqDRPqZ2AkKQy1oX3u8ZxZ7VqyGYDdeikAjXaQKMAyBxbFq6VARj1F4PbcJhE6y3akFu2b87QogkHj+QGa6I3xkn6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726823798; c=relaxed/relaxed;
	bh=K8jwiabrK5D6Hs2uR3+hfrDgJNW3a1V7tWBTVvI9Zbk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PyW5eNvQRqKVnmMeHH3Ive6zmkxYhvDYiHMzyArmbF6jHjYQj63pbeUAz97CgSuqiIGLLygc85oEiM/3WC+hG1wbZBpLin2GygfcZsJgYJXDpG7U/Q0w34MmFicn1QNZg4MOLjjus20IpVgf/hBkTqcQZTnveiIQKXPNEi8juihbcZrY/TUh5A0qjFZC0ScwOaH4aCX9rbCnMp2N/MRst2T4e+PM1Op3IFAoF35dlYKK6jroQicgIEqV7U0RlNUfnhQqcjNKJH6Eo1xyJx4KugCl59ZP/W4F+B/QlJPSw3FW5WioW4TUtU81eDTGf4T18g8AIj7nJ7E2+W1yyg2CHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Kq1TVKFE; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Kq1TVKFE;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X96Fx6zTGz2xpp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 19:16:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726823795;
	bh=K8jwiabrK5D6Hs2uR3+hfrDgJNW3a1V7tWBTVvI9Zbk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Kq1TVKFEXns6vVegA3r5F46NFcgALudM+YJWUOFehfYvdBIFVnscKuaQl/LbziWEM
	 wYtE+xBrdMDZdw6/PJHFOktD15LB5sEGEJoGzLFOvXX3kD/lp5KT6kelcM0eT2e7Zx
	 gprbw50+S6tIZth+ThcMVVI0qBP03MbpJ5ypmVbp6ASjAyoxnfaUDTO7S5wTJ2GPUe
	 6azJC28M167vKNxGW9HJHfGQ5y+2j9kU+GFaJbB1aOEY/p1Ba5hLh0PdaxUZgfvwHl
	 IuZJMbpl0EhbXoPuIOd4iZTv54Wd8MMlkxGpCwjt2s8QSkH5xPm03VhqvR8qJEHaP8
	 A8SpmVHn1P1VQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X96Fv4gW5z4x9D;
	Fri, 20 Sep 2024 19:16:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-kernel@vger.kernel.org, Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, vaibhav@linux.ibm.com, ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
In-Reply-To: <20240917132445.3868016-1-nnmlinux@linux.ibm.com>
References: <20240917132445.3868016-1-nnmlinux@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/eeh: move pseries_eeh_err_inject() outside CONFIG_DEBUG_FS block
Message-Id: <172682376261.64942.12479934341616104313.b4-ty@ellerman.id.au>
Date: Fri, 20 Sep 2024 19:16:02 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tue, 17 Sep 2024 09:24:45 -0400, Narayana Murty N wrote:
> Makes pseries_eeh_err_inject() available even when debugfs
> is disabled (CONFIG_DEBUG_FS=n). It moves eeh_debugfs_break_device()
> and eeh_pe_inject_mmio_error() out of the CONFIG_DEBUG_FS block
> and renames it as eeh_break_device().
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/pseries/eeh: move pseries_eeh_err_inject() outside CONFIG_DEBUG_FS block
      https://git.kernel.org/powerpc/c/3af2e2f68cc6baf0a11f662d30b0bf981f77bfea

cheers

