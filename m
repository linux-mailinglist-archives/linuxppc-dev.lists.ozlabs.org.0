Return-Path: <linuxppc-dev+bounces-1106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DA896F3B5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:55:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRm2Ngrz30BW;
	Fri,  6 Sep 2024 21:55:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623732;
	cv=none; b=nLf68e94jI8Sc/xgzzfoXI7TpAuwnrEw3Wki2Q8zqAHEQ14UmiA5f1CtVfsQjXTZw8eRolL+yI0u4irnjPugdQosVq4li0Mzt1VKew1GoCUqqK9sYMpQjWPzV+rwmhfceVNS2ZCl6qdZjhR7YH2sbOZ1Weh+BdtoxUUKNEGM5TjniN2X5rW8tryZGskJY9SNcPjZi88t5DbCy/JfqgxaZGEtdkLqPY6aDqU/YQiVcFjFsLUL+ZrY583eOmp7zZrWxfqDu9iUGZgS9VPYDtGIl5dB9kdHXpCevUOXB9QFXgztIc+2iV1mxSA+pgKLwvEFxT8Mo57cK14Xvanb8Rfasw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623732; c=relaxed/relaxed;
	bh=D4Tr3xq01QTABI4MGDDJgIWKSI4WtSOuzrdByLrAR/o=;
	h=DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type; b=VR1GTWuKEWTu7H0zgGBSQtkByL81V/TdxmnBHt1Rty1oGlgJAfeZe3oXCEO3bW3VrP9hwauhy2QR+H19G2s/aU0w6jN5x5m/mSj7ilxdHPlI8ag0lMa/0oYKQ1A6rzMGWW0O0WCJ+Hw75ev8k5kwi1RC9DQyOcg/I7UJ2h2Q+uAjhjjRuV+BWCP6Wlv3ecIMi2yptrk6plpegwpFSa7VVGZ9L1lOk6jMKvJG0eXm8oxzDeoE0QK3txRGwmqWDbrN5elV5NsxpaFMQJWQexiLmSJvlz9rvXkWfvdWuiL5SU0okKO+crztvGrR1M/V72JPXH7Cx9xZipSttn/09mN4tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MnZBcpCk; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MnZBcpCk;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRm27GWz304N
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623730;
	bh=D4Tr3xq01QTABI4MGDDJgIWKSI4WtSOuzrdByLrAR/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MnZBcpCko69YZN85FnTOGIbw5GEuf6Qco7BMs7ynvKVa2dOPSQuCl+uCN4rO5XwcP
	 rlV37HMCXYfMYMIrB0fQa+25ienTlCphVdiyiFymWa3x40EPqK2ElAgVFpOYhXaH80
	 /JB6jtLO3TgzrupFrSxQhwGBRUsnTwwLqBHdSv1CWLL6huCR0IRBisTA8KWidfOFoS
	 BnQ9xsytS2Vb/ihFAhkIsmkVv9X+pM93ayOH+n8P+KR1xe+rG9HxZ93t0hxkTVN58P
	 nV+ZYfUVVlIkHVpGir8Lz84/osUjNKAX5JfPLH5uJbXj/UA5lKFd/x9Gj+B/aoXWO5
	 LDa2sptqW/hEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRk3C0Jz4wy9;
	Fri,  6 Sep 2024 21:55:30 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <0fa863f2f69b2ca4094ae066fcf1430fb31110c9.1724313540.git.christophe.leroy@csgroup.eu>
References: <0fa863f2f69b2ca4094ae066fcf1430fb31110c9.1724313540.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/vdso: Inconditionally use CFUNC macro
Message-Id: <172562357203.467568.1789157792030341503.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:52 +1000
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

On Thu, 22 Aug 2024 10:00:29 +0200, Christophe Leroy wrote:
> During merge of commit 4e991e3c16a3 ("powerpc: add CFUNC assembly
> label annotation") a fallback version of CFUNC macro was added at
> the last minute, so it can be used inconditionally.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/vdso: Inconditionally use CFUNC macro
      https://git.kernel.org/powerpc/c/65948b0e716a47382731889ee6bbb18642b8b003

cheers

