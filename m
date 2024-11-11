Return-Path: <linuxppc-dev+bounces-3091-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E53E9C38FC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 08:24:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xn1JX2x0Xz2yVM;
	Mon, 11 Nov 2024 18:24:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731309868;
	cv=none; b=GpjmIg0lsGSg2pNGwLWZz2HzzWRR2ikNu1YFfbIv9PgypcT62YbDhRQzmFg0HpUTTG+uY+DS/S3R7Gg37B1CnrJmcmyI5sdL97n1Me4a9uJtr6HT/K4fQyMP2NQBSnxxsH40Viw459fTGGhJq4biANr2YaePuF7lNHtXdOEYwLYGXKqd241/iYN8yaqjIE1PU1xiGDS1n5bDSmPUvmOndo6PiNCs2qVjU34N6dtYpC/ydyHacFsu4eTsbVc0PDrXzT6SzqhoInAUKT3n6VqF24XFQmovjb/TcOP5JAQaVIgpJerAwvGLlYCoGkzmoJPKjNRfq/fPxro+GOms0xdYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731309868; c=relaxed/relaxed;
	bh=RoTxF+maVAJZkqZIQYQC7KffSClcFIAhswoR2ph/hPY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=S7L3WzKceI2N10U1Tk7IEh87iLBABSmQd4LL17qtPxEvcB7XzQl1+TmhNyZ7qm6A8wj1s9wAXxVPp+5/87263uWXy4mbUz+9rWJ0dty2plcVzZuGgOxQfy+PnWAWaXKxZTn7FnIgVux2fCGZL+SHA9fB9kqjcO+ab9xqc75NgqHzHsgdSheB6uzejZSVGMF/O0OXNdf16MjikowyBR6+vP8Pe3w3Qx+YjHFe+wG4N5SyOlyES6yygm3+28qNGYaxUxgXzyY4KQk+bykSPz7YlUiQEo6BJgzgQ37A/1kVGMeOCl90FVQEcjchoIjdLIhAc9DpArQjCzmMAIlRXoNljQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WEN7gPGB; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b2; helo=out-178.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WEN7gPGB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b2; helo=out-178.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 425 seconds by postgrey-1.37 at boromir; Mon, 11 Nov 2024 18:24:23 AEDT
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xn1JR0YPhz2yGq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 18:24:22 +1100 (AEDT)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731309402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RoTxF+maVAJZkqZIQYQC7KffSClcFIAhswoR2ph/hPY=;
	b=WEN7gPGBUXbNFHqZGYxBQsbIvvWdu/tlUkHuG7+END4f+tKMbhZeeqLtdSef18lt1Iy+re
	JmoSR2kyNiNJ1RCHX70XBHmgW5hofPs7kZ/VujzUOuY9qorEe205fKHPpNxGlNwcgrWzYf
	eqcPhG20exFWFNsCzY4rZmEMp1K0SqA=
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <87v7wuy3p5.fsf@mpe.ellerman.id.au>
Date: Mon, 11 Nov 2024 08:16:29 +0100
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <8A9CA9F3-F780-4F2F-A5CE-8FE43463B84C@linux.dev>
References: <20241110162139.5179-2-thorsten.blum@linux.dev>
 <87v7wuy3p5.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11. Nov 2024, at 02:11, Michael Ellerman <mpe@ellerman.id.au> wrote:
> Thorsten Blum <thorsten.blum@linux.dev> writes:
>> The name is Mimi Phuong-Thao Vo.
> 
> Is that the correct spelling?

According to [1] it's correct.

Thanks,
Thorsten

[1] https://www.linkedin.com/in/mimi-phuong-thao-vo-5768033

