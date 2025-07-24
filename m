Return-Path: <linuxppc-dev+bounces-10393-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46292B107E6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jul 2025 12:39:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnnZB62Zrz30T0;
	Thu, 24 Jul 2025 20:39:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753353586;
	cv=none; b=c7DBsQbhF8zAoGo17oJOKrbNBHjBScEE5eH+7R9AYX2HGP7TsPKFrYham5tCHn4kncGHmN6g9Led/zwiJOTqeeXdKaSW69/5t7LzIWzTpkz87t+MZiF1HxcTiG/40lrYkspR/iqoybQxrTI9GiDEmARJ1xeZeqZdnVlSmIGVjSPoVjJtBzmeQrF2h8vCftMnZPbBqX4PFbq1gnLPOObd+7Nx5YdZ6aHuvhyrUXpfjq6V81jBvUy4Jx7WTdbNSk9IX0Q+B+Xlrev0fwPBFIlhcGRD/gh3oxNYwIUBxHb7Um38jLxTidAxfcjm+YEFER7hWR/wYUhbiMK3FhXT4sos6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753353586; c=relaxed/relaxed;
	bh=wcb11ZiE/NJ9yI4akPa3RVKvFrpJa3QqEYB7O4EtXGE=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZX3LRipC/6EkkUHjUHC0yLANurav0GI8tPGsxfrfZvdoLaURnb3COQ9v3BzRddZIk3yTEjBjbPt6Lmsen+sLTkvjpmc5gKM4G4FLN5aX0YNfGwTurzaBO/8WunhMRLI4jCMWQGgiIj+5WbpYrwh39IpCvtcOZ2Ot3QuID0JEDxE7MJSq64aXS3JQBBR3XxwAOASQJyYoJFD8OWpI6tEoXGhjB+a1t0baiJ53wMkQvmzJT4HlPaTYcOGHM314g4ZebiD+T3LoJY4ibD/D/Npi6JAJ3lysfWgj47cNj4+b/rrhBOYRwmg2u6IWC3HANI13sNbuC8OknUPklg/8uHxn5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c0QhvpiG; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mpe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c0QhvpiG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mpe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnnZB14vvz2xRt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jul 2025 20:39:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BC605C5F4D;
	Thu, 24 Jul 2025 10:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F431C4CEED;
	Thu, 24 Jul 2025 10:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753353582;
	bh=swT+I5pVC2GmckZ0bgwrcHX8Qi+paWJ5n6xyUVa0rjo=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=c0QhvpiGzhmRxmzNfzOMa7GevpnfG2oGuC7wemdUSSLy0kO11bBtcpaEqqO7p7Moi
	 LltFCLiKyygWSSKhIpdKCrjHOq+uVndBeByLEaJfM6WfR7DIdS9D/KC/R9Ib7HA2vV
	 b5dQXIGEKwUxcbyAwqcItSK/k2cqIPB9b5bKV4m6wlPGx45TRrLuWwQKEZvBk02Qq9
	 cTa3f2ndBd1N/xprg6p5uZXX0uPxR6rvE+vbOZwdqwZ7QfHQwt7fwarA4ONwWa7d+o
	 tiqxk766dQhTcNlI/xVfFP/NqkHLUVBd3Hnu7kDEg+L7viClQWnvzOP21SukLL1Haz
	 QsmfB8ql8ujwA==
From: Michael Ellerman <mpe@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: POWER9: duplicate interrupt line in /proc/interrupts, kernel
 problem or userspace problem?
In-Reply-To: <c4e878ae-e97c-4826-9962-fab15d7da632@hogyros.de>
References: <c4e878ae-e97c-4826-9962-fab15d7da632@hogyros.de>
Date: Thu, 24 Jul 2025 20:39:33 +1000
Message-ID: <877bzxdg9m.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Simon Richter <Simon.Richter@hogyros.de> writes:
> Hi,
>
> I have two lines starting with "LOC:" in /proc/interrupts, one with a 
> comment "Local timer interrupts for timer event device", the other 
> "Local timer interrupts for others".
>
> This makes collectd unhappy, because it uses the first column as a 
> unique identifier.
>
> Is this column supposed to be unique? (i.e. is this a kernel bug, or 
> should collectd expect this?)

It probably is supposed to be unique. In the early days it was just the
irq number (which is unique), and then later the named entries were
added. There's no formal spec for the format, and it's really intended
to be human readable, so who can say for sure.

But yeah I think it's reasonable to call it a powerpc kernel bug.

Having said that, it's been like that on powerpc since 2013, so although
we can fix it now, there's 12 years of kernels out there that have the
duplicate entries.

cheers

