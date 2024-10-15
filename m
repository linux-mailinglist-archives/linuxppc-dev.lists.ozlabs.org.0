Return-Path: <linuxppc-dev+bounces-2301-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C8D99FC84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 01:36:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSr8K4NZZz2ysb;
	Wed, 16 Oct 2024 10:36:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729035377;
	cv=none; b=e8NulLTwGzpt5qJDOSyqGtPP0rCDj8jLc/1bZ73QbQ6ohLBYT4kHzkv82yk1XN4rJpuzOsAWr1wwBawp4yHSokXeGazpeKA8466F0Forz/FT+ADQz3P8UJYuDI60hw/Fs8XrVDk1ldhFfQzIPtxGKnflLX09TeH78EQWFewfLQjQhsE+CwjegapXG6S1XFsHce4Q1vpV7Vwga35c+ZraeEp0fKd54cOWOCHEkASiS5DONV6oobtYukXl7fj3859WwtVNH3PELoki8fLerQYknITND9NE2g9sW8gWxNwyKgSrsCnTHqsTs2KgGNarEaB0PJb2s5cDQQG3/kwppedAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729035377; c=relaxed/relaxed;
	bh=y8JBzTUQ2PNFr0hTYT1Pi6MtMBjSnIDl/kCCddB1ycU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hw0PKsSoQ0loSoZaD2DCNDO8joGxfcBocQzatoufooesu/u4oud8l5zd9plWS1VP8Y0Nsr+ksdfKNcEx0/VBzPLZxdBzUDICckcl92kINxBGMc65sUn3zXhCTh7r20K/XgXJy+Nt14ngmrEZgfgZXZan/f4heGTYfxPGRpp1dYK2WWG6EizZ4TZ/qIqFvu2/3LKfzROOgyolGp7f9XYGHbDJRKl/shv6H7Kzxh78rrqScYyP489YC+X9JIuhs6WftGt4KzR+PgnDYeBu+H5StLoW2ziQdpUNa7mkYOy0B7BdbgVxPsdyrrdeEK+tJKDYk4JmTl2f7gR6x7/bUYk0wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g56BOkyL; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g56BOkyL;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSr8H1fnWz2yYk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 10:36:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1729035373;
	bh=y8JBzTUQ2PNFr0hTYT1Pi6MtMBjSnIDl/kCCddB1ycU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g56BOkyLhact54vh+u915qEjLQKMxwTn7KNscVIYoE26bdnoLUeQTfDlxO87ArgXS
	 yVhG+wqPglztDR/i6goFl4VeaayUGOK3fghy1EbwPX/GIblJM4t2XHpiIWho3fUjBS
	 zc5oIOagvoHUAC5H8UOm8WZs3DDc9qAOJ95nP38pBRWMB/n30uFyhI805V7JyJlSvs
	 2FLoF0AtpCdZX4k4Nwhbi+n2q4VT+xNN1dD3WeUJRRkgVmQzcflrvxUaUZ+L6aFKi7
	 yERvmKOZ+YGMdw4PTeUxFgn7xYOyE1GKjeLxAyAJPdfZGUW0UWAwXeJ0efQm89GvBH
	 kg4Sg8A6UjxJg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSr8F439tz4wcy;
	Wed, 16 Oct 2024 10:36:13 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bart Van Assche <bvanassche@acm.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King
 <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Bart Van Assche
 <bvanassche@acm.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 04/22] powerpc/cell: Switch to irq_get_nr_irqs()
In-Reply-To: <20241015190953.1266194-5-bvanassche@acm.org>
References: <20241015190953.1266194-1-bvanassche@acm.org>
 <20241015190953.1266194-5-bvanassche@acm.org>
Date: Wed, 16 Oct 2024 10:36:14 +1100
Message-ID: <87y12pndld.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Bart Van Assche <bvanassche@acm.org> writes:
> Use the irq_get_nr_irqs() function instead of the global variable
> 'nr_irqs'. Prepare for changing 'nr_irqs' from an exported global
> variable into a variable with file scope.
>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  arch/powerpc/platforms/cell/axon_msi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/platforms/cell/axon_msi.c b/arch/powerpc/platforms/cell/axon_msi.c
> index 28dc86744cac..d243f7fd8982 100644
> --- a/arch/powerpc/platforms/cell/axon_msi.c
> +++ b/arch/powerpc/platforms/cell/axon_msi.c
> @@ -112,7 +112,7 @@ static void axon_msi_cascade(struct irq_desc *desc)
>  		pr_devel("axon_msi: woff %x roff %x msi %x\n",
>  			  write_offset, msic->read_offset, msi);
>  
> -		if (msi < nr_irqs && irq_get_chip_data(msi) == msic) {
> +		if (msi < irq_get_nr_irqs() && irq_get_chip_data(msi) == msic) {
>  			generic_handle_irq(msi);
>  			msic->fifo_virt[idx] = cpu_to_le32(0xffffffff);
>  		} else {

