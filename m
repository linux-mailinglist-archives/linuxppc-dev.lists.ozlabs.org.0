Return-Path: <linuxppc-dev+bounces-3074-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4C19C303B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2024 02:19:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmFFW2w0bz2yNJ;
	Sun, 10 Nov 2024 12:19:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731201551;
	cv=none; b=kf3vAYoTDV4an7v6Uen7iqKI0mkhzP1xcgog4SlVPs636Cr0sB73KNDJiHnPXNErWhptfwSpQ0wDQtMHEwv/B/c1L6+Qlux6wBAkzhkudKzxoY+6osqnIjJwfIhH7ETWaz/sfNM2uGdoyO3pBRRCMrIVxOvIlDoRRY1GfFeLsHPaFDtFe1sVihLlMNTwZytsD5qYzamI3tmyWCYB02Gw03naw1RxvpzgTmnmlcA9OjT5z7BOD1O2fsxqXRDUZWXlCoDnon/SrX+37M4uEs8BqFCUWsF3+Wm6ZxgDxSblhkp+/uI3Qml/uVomcDVR3sqXd699P9JpUnlelPWaUZeJNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731201551; c=relaxed/relaxed;
	bh=f3svKQpsO2Ae6fHwdoFwbyqzKUkHVYU0iPtw3sIlW54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXWEORjLho4B7i6mAIj0fBwFnAJyxsITHZgx07nq+DCuyD+j5NvUBRsfxhLaSpvfKUVSDv1xUV6y9B4rVNErrv7Z2y9xiiM+2Em6Xllhbf67F9kb4KGrWK5dj6Tn/fTun3y8odSiYGUOJEGTZAiYWOTCICSR4jMD1MPBNQmddl+e2xl1rNX/KFlD7Xr6aV68283QMFVX5nDM+bQhGXaKsi3qm2AHrIoqq2nNnHO53KjCShdvW/DAq5xLP1KOr2hFTxa1BIyaFpYl7FOouf5QyNTGVj9Y8j8pi+LFQMhhLGEbOD5QvwP78JqDghmwE6sJkY6jriu9KoGpmSGBCWuyhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=KEwDTFNv; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=KEwDTFNv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XmFFN48J9z2yDT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2024 12:19:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=f3svKQpsO2Ae6fHwdoFwbyqzKUkHVYU0iPtw3sIlW54=; b=KEwDTFNvWF9+/evQ81lSag2qFZ
	+v4wYmtvf/+JT3MqOB/zpZhbNxJ3lZ2Hj1CNXMMqwowqOL3BRPodwcdG+W4VHz7Gs34dxz7J6H0YH
	pCgnGqZuCxUWJFX4cuoBf7AapbePuynJg34Z0HvOSg6ZSyC+sIjd9XIReZOcGcosWqvTlC1E67K4Q
	ISHiz9htAxPnyEIPvj53XEbn4HeuKysVWVaBEzPSGLqzlvqeqU33T2kxbpscJitSeicoJWWrGws4P
	8HocCbld4QeuD8hhZ0pqLvmtlrhpW//agmCaedamY5g/UrGkA98d/7+oY7VLfqOOJ2gQRKo69uitz
	WRl1UiYA==;
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t9wbD-0000000Ao5s-0sU4;
	Sun, 10 Nov 2024 01:18:45 +0000
Message-ID: <8ec8cefe-cdde-4336-9274-01057e31945d@infradead.org>
Date: Sun, 10 Nov 2024 10:18:35 +0900
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/ps3: Mark ps3_setup_uhc_device() __init
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <31fe9435056fcfbf82c3a01693be278d5ce4ad0f.1730899557.git.geert+renesas@glider.be>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <31fe9435056fcfbf82c3a01693be278d5ce4ad0f.1730899557.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Geert,

On 11/6/24 22:26, Geert Uytterhoeven wrote:
> ps3_setup_uhc_device() is only called from ps3_setup_ehci_device() and
> ps3_setup_ohci_device(), which are both marked __init.  Hence replace
> the former's __ref marker by __init.
> 
> Note that before commit bd721ea73e1f9655 ("treewide: replace obsolete
> _refok by __ref"), the function was marked __init_refok, which probably
> should have been __init in the first place.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/powerpc/platforms/ps3/device-init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
> index b18e1c92e554ce87..61722133eb2d3f99 100644
> --- a/arch/powerpc/platforms/ps3/device-init.c
> +++ b/arch/powerpc/platforms/ps3/device-init.c
> @@ -178,7 +178,7 @@ static int __init ps3_setup_gelic_device(
>  	return result;
>  }
>  
> -static int __ref ps3_setup_uhc_device(
> +static int __init ps3_setup_uhc_device(
>  	const struct ps3_repository_device *repo, enum ps3_match_id match_id,
>  	enum ps3_interrupt_type interrupt_type, enum ps3_reg_type reg_type)
>  {

I tested this on PS3 and it seems to work OK.
Acked-by: Geoff Levand <geoff@infradead.org>



