Return-Path: <linuxppc-dev+bounces-3387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C079D03BB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:28:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqjH5wGCz3bsJ;
	Sun, 17 Nov 2024 23:25:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846339;
	cv=none; b=KZW1hncZuac7OP+cFTa9o0Ig3eseJlr8VpLmxA1JO0rvDgREVdiRTxSqch6B0jPgD0TVNERrfjiKU9LREM+ZFNsTlVfZ8OLi4T24uWWCbv/PJ7I8SHJFQ7F6rTGk4UAQmCQwrVgXJLJciThEod8Z05XXZzyVfZ6AXuqvvv0KzgbwFODq2v6DhXQHUT5JMQ/4RsGooj1rwEmks4RIY4HYP7PZl4KCOU9sY5BT519H799DAqCR9e6sGE2xYhPrMFp6gbtbJ9u0Pk5eR7dfqw6OAQeR0cMEWxybtfbOK01y9nrRDpe+z627a1xg7fr9oOFNOkTAa08ZyZU/1Lx8olNJyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846339; c=relaxed/relaxed;
	bh=i6DhGeGkGvC4VAr1zXIDNglBtiqEoiBLTPJdD8L8FBg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WkshEyrJfjSBYvNVtfqZZPTMWwFODZuTsWy6Vi5AkDKsxcWuluHTyTQMM41u2J2o+tzfpQdSzgj/RKQ7twpg8c0HPTxDt2coIzkM0yha/FtVF/l2VVBgxMuKS+FOJWP+GnkpTWnwLCZJi6AoAc/pd7Awt7UnLTEv16/TeRU54LppuocikB6fJ8wBNZucFzT2TSAhI95Fx5WoVB/MuFiaOFHPybqTVP0u9Ojop/M5uB3J008vJgqko90TupMyEaf8J7v09CzAye+QOl8ZsnSRr6I4CWrhmX7aJ8d46+BonwUgHtBKYwXsHW8Qt2eIOaK4bXObBg4rS6XITer0ST5fiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iCfv/red; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iCfv/red;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqjF1q4Jz3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846334;
	bh=i6DhGeGkGvC4VAr1zXIDNglBtiqEoiBLTPJdD8L8FBg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iCfv/redZINruq1CGLGirFkbQWXrREfAsn4I8yoa0MxIXuvbtDivFD5beaBn4TZiT
	 I8K6U9jexYhifBLeh2vM4y6unv9s2wewHgrdb/jdqjEEQgJWJGnEmLg9PF1uqfdEiM
	 ddEXjTmaxipXSvgo+ke+aism7VQCMSHIXysAJ8JIoi3b4oERD9xGReOusUIbKScQsr
	 /Mk9bhB9e/tgC2t0tbn0IhCEFDlSqSERbErko/bj26fwGPhn1Gkb+U3hACRID6uyN7
	 1KhS8RQAUXtacacNynSQus0i5IHipD0XifhTBfkT5rs8TrngGeK6ukyJ/PdPDws2qQ
	 hMW/fzDgRr5og==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqj96v2mz4xf9;
	Sun, 17 Nov 2024 23:25:33 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: geoff@infradead.org, mpe@ellerman.id.au, Shen Lichuan <shenlichuan@vivo.com>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
In-Reply-To: <20240930023234.7457-1-shenlichuan@vivo.com>
References: <20240930023234.7457-1-shenlichuan@vivo.com>
Subject: Re: [PATCH v1] ps3: Correct some typos in comments
Message-Id: <173184539768.890800.1864207122324653089.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 30 Sep 2024 10:32:34 +0800, Shen Lichuan wrote:
> Fixed some confusing typos that were currently identified with codespell,
> the details are as follows:
> 
> -in the code comments:
> drivers/ps3/ps3-lpm.c:94: rigths ==> rights
> drivers/ps3/ps3-sys-manager.c:365: acnowledge ==> acknowledge
> drivers/ps3/ps3-vuart.c:470: remaning ==> remaining
> drivers/ps3/ps3-vuart.c:471: transmision ==> transmission
> drivers/ps3/sys-manager-core.c:15: Staticly ==> Statically
> 
> [...]

Applied to powerpc/next.

[1/1] ps3: Correct some typos in comments
      https://git.kernel.org/powerpc/c/e9d3270007b13acd34de4256970ffe457efc6c65

cheers

