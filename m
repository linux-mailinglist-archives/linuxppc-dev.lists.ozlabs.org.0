Return-Path: <linuxppc-dev+bounces-2970-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678989C004E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 09:45:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkbHW3jLFz3bn0;
	Thu,  7 Nov 2024 19:45:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730969111;
	cv=none; b=MVn4HrvG488VFH6swG29A7TgMqJydLWNfaaGk0pdaVoePMp2NoicEeBerrzPsfPiZYZiW2T/BL1Dk8E52XMlBojnkw1JTn1fZNCvpg3Ptt0HrHXYF4jsXyJl0ptq2Od2ZKkbYyGyKJ85OHEGmjnP0SCgGAEkLzTsmmzWjWWOiaZb8PgXz1cirJknrmsxFIpIeU5e9lXyBIjvCFWXL/pBT98p9QWvsva2vokjE3O5bf95l01ZqJv4CktXjJ+tlUwsUkHAnIlKf24JUEvQtMAxe9juzFHSpfRntQtRWfLVV2HY3F1Q7gMcrcrt5SiVJ/YE25uO0M1rNKQ2gwc/+goq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730969111; c=relaxed/relaxed;
	bh=YcoNI6p0eg9WucO81EJRRVqZRfThSLzqgOfGDYEeHkk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y2z238tcajWv5/8qdMpCdjFydtOoxArE+kuxWDWQ4Exv0nBpGovmWdwNjEZFZUbGea7Q+I9JUV6ugJAESV17LKBfepeRriBX2RPkgTSJm1yJMl8fW6FzN6Hi5ehggrVP6/AtyVWxs4DY8bKBi85DXdERJwxswkOI9vbpC/eAnjbulsisJqVkKumq1msrEHjxCFJ3ymkK7vZjY66iYfZv3aYW/Yx4b9fXG8F7WNcfRQ43y2cIhpMuQbjo5pEogiQAseS79lPc2POeSuAWzpvi5C+GxbzI5hCqtbMNo5Jeq8EJlFnN5UMcxP1++qP7aOciNNhVRt3FeEfCBrJ/ewTRMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PrD0Tist; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PrD0Tist;
	dkim-atps=neutral
Received: from mail.ozlabs.org (unknown [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkbHV3ndZz3bmH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 19:45:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730969098;
	bh=YcoNI6p0eg9WucO81EJRRVqZRfThSLzqgOfGDYEeHkk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PrD0Tistw/F5QPfDUOtoEoTPZ+rLT2wE11fllXX7ekT8N5ob+MUkT0YKkytTpn8Za
	 cj34UXCrBZPPFv1QmqmrNTj0Ab1s4JbFTyqC9gblMF6MdIs/7eezeHlZL9qlm2qybk
	 YkiLp3lKAxkX75wXy+Yba6/jvAUaYYxYh9Vf4mQ1+698KfhjEIq0Ds+WS/z2RE8O5d
	 MhIzWfe8hu4Kd2PmaD3aCwT48m9MUgP5JARWtbsBjjwDypOTnzgz87M1BqcMPSakP5
	 aQXBOwOUcrJy7vELn0s0vMXoU1zujFi5LohYs0/ijXsiFYjCRc2TelAIz4PBfqFo00
	 wGLyFXOFjm+mQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkbHF5RxMz4wxf;
	Thu,  7 Nov 2024 19:44:57 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Jason@zx2c4.com
In-Reply-To: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc/vdso: Add a page for non-time data
Message-Id: <173096894627.18315.733580033753983197.b4-ty@ellerman.id.au>
Date: Thu, 07 Nov 2024 19:42:26 +1100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 02 Oct 2024 10:39:28 +0200, Christophe Leroy wrote:
> The page containing VDSO time data is swapped with the one containing
> TIME namespace data when a process uses a non-root time namespace.
> For other data like powerpc specific data and RNG data, it means
> tracking whether time namespace is the root one or not to know which
> page to use.
> 
> Simplify the logic behind by moving time data out of first data page
> so that the first data page which contains everything else always
> remains the first page. Time data is in the second or third page
> depending on selected time namespace.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/vdso: Add a page for non-time data
      https://git.kernel.org/powerpc/c/c39b1dcf055d420a498d1047c645b776e4d1a7aa
[2/2] powerpc/vdso: Implement __arch_get_vdso_rng_data()
      https://git.kernel.org/powerpc/c/4e3fa1aecb2c1f128f7289272fe2947e4396f1ce

cheers

