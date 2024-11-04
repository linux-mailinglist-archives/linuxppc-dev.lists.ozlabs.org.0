Return-Path: <linuxppc-dev+bounces-2840-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FDA9BBA2F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 17:20:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhxXT07FWz2yK7;
	Tue,  5 Nov 2024 03:20:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730737240;
	cv=none; b=fiK1wzuCDfYmP3remgR4GvfN4BkXBBBRx7XeIlpAarm3yz7a1nDHfI+mWgXQaYZLBRbx1PCpz/CeYfVZofsWjc/jU4cMt1NLRGzVHpkqQKIycomI/HzHG3nMwZzW+4p2DbI7TmQs3UxZzY90DapI3zsCQ12wSKaRm3RO0MN9hBAVwcCE0RtsovP7OLdVjS0rS0smT8cthureDVyCh3yzKLJ9L/gAgPp7HtnRC1mLbSAgYeKy6ImsMA1ov+6ailfA3e/yptS5Ks5mJwH9W671rckTZWpIojNvLCosLffN1HTv9h7FTP23Hf80itDSQoM4LnflYhkTKVcDRnSo7J/zgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730737240; c=relaxed/relaxed;
	bh=HCFNkOXlzIC4nbZOOGVRxV1kaQeAU/pJuUI7IWu3BR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hav2v+sLiV5S1h7nQ1aiAC5kKagtJOSjF2IQ6ovjGa+RP56MJK+f9QgLCuKYU0thlWvmfDUy4fEaoGKAFGd/SqTQOH89Q2fsTQpC6zLYwhHuKz96YqIRUPUcK75NMD2hUNjTQTJohzUwtnop8DGwXvuUx9EEnsCDiEsjbQk5lLFmUXLemIUgc9clwMwZbMMhwTlTq1gjkS6njbabPz+/DScbWAW4p+mEW9OuOeWQn9doKjtEtf88YvABleIzYoehV1XZolX5/43dSL+08SB20GQTJn0qMutl29S/PZxZhw62RTw0vmqyIAig/qXjXpC9O7IM69hmtZpPYx/EFfbl3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mit.edu; dkim=pass (2048-bit key; unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=oVO65S6t; dkim-atps=neutral; spf=pass (client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu; receiver=lists.ozlabs.org) smtp.mailfrom=mit.edu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=oVO65S6t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mit.edu (client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu; receiver=lists.ozlabs.org)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhxXS0PjLz2yQ9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 03:20:39 +1100 (AEDT)
Received: from cwcc.thunk.org (pool-173-48-115-131.bstnma.fios.verizon.net [173.48.115.131])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 4A4GHeVP005285
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 11:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1730737064; bh=HCFNkOXlzIC4nbZOOGVRxV1kaQeAU/pJuUI7IWu3BR4=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=oVO65S6tk8aYtsUJW4abfDTpafWiCHqifmtgz7vEn58onu4uTUTySA+AmGo3UVJT9
	 QQil4qEcdDh06BYYMnHWbMuOcivNKlwrUgqB3NyzeTmJfoUwy4xiEy1BNuCR4Eu++H
	 cIgfVEOfg91zv6X1OPeh48Xjg38/IEAN1zbNQgixYZCOjHc+QpUcsq2Uv1oLfNcmQE
	 Bf/CuM+o0H1XLCvkG4LX/WwoUy7Sg139hmyTTLYtv3UmNW9L59QBTLp6ud/keG4y3P
	 7O1qTZ5ZEGpzgROh+vZIYKFyf+CwYk8FneIPHXrRsfY3x1J+g1SIrG2lehvgiPVbt9
	 ijt7dTTvk4gpQ==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id CA48115C02FA; Mon, 04 Nov 2024 11:17:40 -0500 (EST)
Date: Mon, 4 Nov 2024 11:17:40 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
        linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
        sparclinux@vger.kernel.org, x86@kernel.org,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 16/18] jbd2: switch to using the crc32c library
Message-ID: <20241104161740.GB43869@mit.edu>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-17-ebiggers@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103223154.136127-17-ebiggers@kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Nov 03, 2024 at 02:31:52PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Now that the crc32c() library function directly takes advantage of
> architecture-specific optimizations, it is unnecessary to go through the
> crypto API.  Just use crc32c().  This is much simpler, and it improves
> performance due to eliminating the crypto API overhead.
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Theodore Ts'o <tytso@mit.edu>


