Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1356C90E372
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 08:32:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OOvQF49J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3v150rmSz3cWg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 16:32:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OOvQF49J;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3v0N08gLz3cR3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 16:31:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1718778692;
	bh=qjyG9jPtAFgV4AUANLc1JylhQQ3I6B14AefyyVdS0kE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OOvQF49JLkPk/HkdhhfpfwAbhCmFRjv4QDDh1Eoj2bWx7tjFiVmjkdY9hsusecYuE
	 OZlkBfSwDFfNWU7d20RR9ANb4nFgj3AwB4m2gc7fqgjxxaxuuxPQCxclTSLNK4z226
	 g7/HrJg6vhclhcBB4Qrd4jf36/IV5SbYnRJV1EFG3P7lM5N4d8Z2kvO0hzkKt7Nvmi
	 26TNXBbUg2Vn0zn0C7I8l9E1LJTirsb1jh9zS0QCZY5nH0RBoz+xvWLpv4kjj996cv
	 uEdJ2WwVLcDnDbCH0UvShf0U35nOVgN2j1PvFZ1hjQ9SjZ5BPVR79MkLKy8LYcMl9l
	 OnwEig59nOQCw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W3v0N4f6Sz4w2R;
	Wed, 19 Jun 2024 16:31:32 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Pavel Machek <pavel@denx.de>, Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH AUTOSEL 6.9 18/23] powerpc: make fadump resilient with
 memory add/remove events
In-Reply-To: <ZnFQQEBeFfO8vOnl@duo.ucw.cz>
References: <20240527155123.3863983-1-sashal@kernel.org>
 <20240527155123.3863983-18-sashal@kernel.org>
 <944f47df-96f0-40e8-a8e2-750fb9fa358e@linux.ibm.com>
 <ZnFQQEBeFfO8vOnl@duo.ucw.cz>
Date: Wed, 19 Jun 2024 16:31:30 +1000
Message-ID: <87a5jhe94t.fsf@mail.lhotse>
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
Cc: Sasha Levin <sashal@kernel.org>, bhe@redhat.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, aneesh.kumar@kernel.org, Naveen N Rao <naveen@kernel.org>, bhelgaas@google.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pavel Machek <pavel@denx.de> writes:
>> Hello Sasha,
>> 
>> Thank you for considering this patch for the stable tree 6.9, 6.8, 6.6, and
>> 6.1.
>> 
>> This patch does two things:
>> 1. Fixes a potential memory corruption issue mentioned as the third point in
>> the commit message
>> 2. Enables the kernel to avoid unnecessary fadump re-registration on memory
>> add/remove events
>
> Actually, I'd suggest dropping this one, as it fixes two things and is
> over 200 lines long, as per stable kernel rules.

Yeah I agree, best to drop this one. It's a bit big and involved, and
has other dependencies.

cheers
