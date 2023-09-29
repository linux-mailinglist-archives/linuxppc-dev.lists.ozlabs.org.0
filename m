Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EFD7B337B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 15:22:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dim-sum.org header.i=@dim-sum.org header.a=rsa-sha256 header.s=chowmein header.b=mgl1IifJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rxrcs1MkWz3cgv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 23:22:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dim-sum.org header.i=@dim-sum.org header.a=rsa-sha256 header.s=chowmein header.b=mgl1IifJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dim-sum.org (client-ip=81.187.240.206; helo=chowmein.spicy.dim-sum.org; envelope-from=drw@dim-sum.org; receiver=lists.ozlabs.org)
Received: from chowmein.spicy.dim-sum.org (chowmein.spicy.dim-sum.org [81.187.240.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rxrbx0v3wz3cF2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 23:22:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dim-sum.org;
	s=chowmein; t=1695993716;
	bh=oy6AVVpEg7iwd+GF9uQtYCLqub7+UeyQbHra/88RnWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgl1IifJj7nphiHkxJfhbIMXjAGwoTJheZ9p95YanB7nBEhXJDmk4c/2JjWTxsFab
	 uKrntZhpHQwupVZ32vuEoKrMrl2RcBpU3oi77J4dAuOFQJWCou0w6r2lNTbfM+lGev
	 j9/y86+2oNbwtotu1TFgZ16Xx5aO7EQnN22YDoN7T2uwtgFZF7LCL6bfmh+zYIz5tj
	 qDNGEvzAyWLva4fXEs9LH+/S/XMj5v/LPCybJHIRDN2SU0K0DPvLzsW195898bhgna
	 5dkJjW+DQG60EDsHAppMeIHMzgQ5GZEDBkaRJpSrgxo6cgIvKzK2IjCCahqcYTx2ib
	 XOnrg+rv8evTA==
Received: from dim-sum.org (b.8.4.f.1.4.e.f.f.f.1.5.6.4.c.e.4.1.0.0.9.9.f.f.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:ff99:14:ec46:51ff:fe41:f48b])
	by chowmein.spicy.dim-sum.org (Postfix) with ESMTPS id 9708BE00036;
	Fri, 29 Sep 2023 14:21:56 +0100 (BST)
Date: Fri, 29 Sep 2023 14:21:55 +0100
From: Dan Whitehouse <drw@dim-sum.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Kernel Panic 6.5.0-1 PPC
Message-ID: <ZRbPc7w9DU3dG1jb@dim-sum.org>
References: <ZRV3Y3g2fTvE91Zs@dim-sum.org>
 <2d5d9c82-427e-9384-3ffe-fddf6e1d4d8a@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d5d9c82-427e-9384-3ffe-fddf6e1d4d8a@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Christophe, I'll give that a try over the weekend if I get a
chance, and I'll also let the Debian devs know if they've not spotted
this yet.

-- 
Dan Whitehouse

GPG: 3AA4 369C 86E1 4939 D420  AB25 D0DC 7BDD CA92 AD2E
Telephone: +44(0)203 0955088
