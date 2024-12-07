Return-Path: <linuxppc-dev+bounces-3848-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EF39E7DDD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2024 02:58:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y4rr34ndTz2xl5;
	Sat,  7 Dec 2024 12:58:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733536691;
	cv=none; b=mHOvFy1r9iGEO/5GF12MV08+FZ2x7wZE0hHl391IMsNOq9GCacSJZef043i+G4EoyXUR5rY+F93QPOvGN4jOJ50uOeBbBAfZKc34YH2JQnpmj+2Zg31jaVs2dPsv84V4e66uxzeXODjOkX2BoUcLzZej2q4U5J1lx90olDUtHOJTKbB95f5jHeaF3M7iQtRbf3Ei95pmIszgZ3Yovm50rHW+xVoNOOhWpOEJea4A0aKCjjSE80FvcBSMdbtQTQE+gRv94oVnUzV96pCF3V0g+YB5y3bnkp5mnQCbUyQ997u+Ux/PvnwPUr/uCM3ylmckmyfhdGGcIZ0NxBXYsge6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733536691; c=relaxed/relaxed;
	bh=p1eNG/xpa51nZjmSN+gRlYo7HJmXnyymXzX8PBTf02k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D85gHzrFTdC9VVucTlzvOlwVIMGlIyVbs0MFuSZjcHr27AVaLcowXzwd4UTJ5uO3IhEsZYq0Xc7iO14NmjbxlNtRJVITq+quP3/+ubIHomjN0b/J8NKiRWGHf+JPIE0Vlh77eRAZd/ILiYQORO6mTZmVag4FZ9sdbErAHWa6m/rM0boa6QbvTkZnSsBf7UNvGxNJ1/f8FPuqvOiExSn0qxkQE7Tu4QFs1eA2Jvv4RQ1OaUbePnIaPiPehjnHyf60jMtOWuO+X9Xlzzn6f3ri4PqCSrW6rKzdFb5yXymJzFaApxEGiykh4j9omTpQAYj9dE3M015QkST/V3C/PfolQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dYDmt/t7; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dYDmt/t7;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y4rr10kYfz2xbQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2024 12:58:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1733536683;
	bh=p1eNG/xpa51nZjmSN+gRlYo7HJmXnyymXzX8PBTf02k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dYDmt/t7TqfzspS1P/2KYLIi5Lp6All4oWl3qkpgyMZ8YszX4xqefgJ2LwBgGIfYf
	 6ilaHmjKS3PM+dZs3wQq6j7BqxCIu2jRIOJTIDN3YZlhqR2ltyB9fiq8uXUx1DR/R1
	 vkkwEHWO6wbPENd6ZsxTodYoghI5izhG6JT5f3PJ6vzyg4xuGoZmiQbMJ4fJZOyx4p
	 GOlp1o0eIheb2YxVPIrBPL8WmG5R5qvgC00xstoxQEpQwAT4K2iaxI1tlA0xKeljmz
	 5Y05rTclOGNXhfRQDfRown3VboOgc5J7M7eDIdNXdlo9uBK7Oxy+9XCU6lmG7x6dPg
	 cFKC6C4h3ZkbQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y4rqv3Dyfz4wcy;
	Sat,  7 Dec 2024 12:58:03 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Avnish Chouhan <avnish@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: brking@linux.ibm.com, meghanaprakash@in.ibm.com,
 sourabhjain@linux.ibm.com, maddy@linux.ibm.com, Avnish Chouhan
 <avnish@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc: increase MIN RMA size for CAS negotiation
In-Reply-To: <20241206065545.14815-1-avnish@linux.ibm.com>
References: <20241206065545.14815-1-avnish@linux.ibm.com>
Date: Sat, 07 Dec 2024 12:58:00 +1100
Message-ID: <87ser05k5z.fsf@mpe.ellerman.id.au>
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
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Avnish Chouhan <avnish@linux.ibm.com> writes:
> Change RMA size from 512 MB to 768 MB which will result 
> in more RMA at boot time for PowerPC.

Did you consider just increasing it to 1GB?

It's possible there's some folks running LPARs with less than 1GB, but
they are unlikely to continue doing so by the time this change trickles
into distros. To be supported modern RHEL requires 2GB minimum RAM
anyway.

Can you also describe the behaviour users will see when they configure
an LPAR with less than 768MB of RAM.

cheers

