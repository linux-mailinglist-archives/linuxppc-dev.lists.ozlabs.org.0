Return-Path: <linuxppc-dev+bounces-17641-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDHuKUldp2lFhAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17641-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 23:14:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F451F7E39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 23:14:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQVTK51fbz3bfG;
	Wed, 04 Mar 2026 09:14:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772554719;
	cv=none; b=Bgj/wSZ5dLpYdlAF9exa/M+FHTrD/OK8MenxCh92LKvtZYYlv+0W0HXTFWj6GvAVcmqPYvM6oEFaMCbZ/+WoWJsbbWt3p1edo5AgdZvieoPI+xlLbQsYYC4t7zAyK6NON81a5ocFfkRBJIpqU+jMwkW1p5o7C4dDOTkpFen/lW2Xr4UBspk0NF/9l/6z5TVvFJo6Y1WzQdrfCiflWd3jmHROCvP6kc7gEqnnQDUb6sXvdDHOfsNnyQNbVoCG9/EJPyRZskZnnnD1nBSTh1n0KtEs3jbcCibSH7V7pYbBQIjD7Y5E2O/LrDZgwr12QBQ76wB1J1GBy5LzBiFcNZrWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772554719; c=relaxed/relaxed;
	bh=VxhQZwlQtVVJ3Lq0vxI3rNO5MwTyhZCb2R/bxcRNxHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGxPgitPIJ53M+WLc8GSKERs/U91LOvL8J9neLxMop1o5GxAW65ibMw8WfS+3EN7xi/R+0uNDqP+20BzJ3WIGtBmLjmK+bqoOk7bTOaoqYNik7b4hp8EsxkltLnmVZ4hCPXhDn5C7KGref6i45ZFwLgIXjtf1yn9Y9zYEzCSdwRnRwI53jUgVNGxpgoQoqmz2KfxSw2EI9j/BOkj6FmWRWxyvulGz4vO7sK4BOUdtLgp6ob8nU+83ZeKosYm/C32GghNzbH/2+/RiK+rHjLIfDzLXtuFnODLklkEt+OVEMIrLscD227240ZTNlwrcp8YsyJw3fBnoq8CdqWgHHZoxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; dkim=pass (2048-bit key; unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=L1h+yNm/; dkim-atps=neutral; spf=pass (client-ip=178.251.229.89; helo=mx.nabladev.com; envelope-from=hs@nabladev.com; receiver=lists.ozlabs.org) smtp.mailfrom=nabladev.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=L1h+yNm/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nabladev.com (client-ip=178.251.229.89; helo=mx.nabladev.com; envelope-from=hs@nabladev.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 547 seconds by postgrey-1.37 at boromir; Wed, 04 Mar 2026 03:18:37 AEDT
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQLZj3RxYz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 03:18:37 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CDC910E2DF;
	Tue,  3 Mar 2026 17:09:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1772554166;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=VxhQZwlQtVVJ3Lq0vxI3rNO5MwTyhZCb2R/bxcRNxHg=;
	b=L1h+yNm/+l5KOsJkNM1WpjLK72qncYgzQ2105hTFLtxP1pCb7RZI5YO2ld6N34QenhRNqQ
	cIcYcxYuqQPx804M+hhlx0ADVXnnNFfqnXt9UPUTSV9IxolN+J0yyvqu3VDmADo3rLjBOZ
	9Sntk66x3lm28oRP5Vcg4lhOMTRIRDQUVbTZ9/R7Ik2BI16At7Ut09fuIXdtXdAApgidR1
	2xWW8XcDjW4PbJ1xNeM5N3LMi0jSz8d8VpF4N/Q0w0XS0TTEagNcaLwLTpkQ+Qb6c3gYom
	ptpSq0wFgRhAkJwITra5cOrxOuH8yqs3cGna2AzpuYEn6U9eURGaG21Hfu4nrw==
Message-ID: <1549d9c4-1ac3-49cb-8d24-4fd01456f540@nabladev.com>
Date: Tue, 3 Mar 2026 17:09:22 +0100
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
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] powerpc: 83xx: km83xx: Fix keymile vendor prefix
Content-Language: en-US
To: j.ne@posteo.net, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Holger Brunck <holger.brunck@keymile.com>, Heiko Schocher <hs@denx.de>,
 Kumar Gala <galak@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260303-keymile-v1-1-463a11e71702@posteo.net>
From: Heiko Schocher <hs@nabladev.com>
In-Reply-To: <20260303-keymile-v1-1-463a11e71702@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: A6F451F7E39
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nabladev.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[nabladev.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:j.ne@posteo.net,m:chleroy@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:holger.brunck@keymile.com,m:hs@denx.de,m:galak@kernel.crashing.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[posteo.net,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,keymile.com,denx.de,kernel.crashing.org];
	FORGED_SENDER(0.00)[hs@nabladev.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-17641-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hs@nabladev.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[nabladev.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,posteo.net:email]
X-Rspamd-Action: no action

Hello!

On 03.03.26 16:31, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> When kmeter.c was refactored into km83xx.c in 2011, the "keymile" vendor
> prefix was changed to upper-case "Keymile". The devicetree at
> arch/powerpc/boot/dts/kmeter1.dts never underwent the same change,
> suggesting that this was simply a mistake.
> 
> Fixes: 93e2b95c81042d ("powerpc/83xx: rename and update kmeter1")
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>   arch/powerpc/platforms/83xx/km83xx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Good catch! Thanks!

Reviewed-by: Heiko Schocher <hs@nabladev.com>

bye,
Heiko
-- 
Nabla Software Engineering
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Geschäftsführer : Stefano Babic

