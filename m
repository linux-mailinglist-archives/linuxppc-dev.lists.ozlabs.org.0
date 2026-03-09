Return-Path: <linuxppc-dev+bounces-17896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMv4LkrDrmn2IgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 13:55:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C633223941D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 13:55:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTxnf5v4gz3c9b;
	Mon, 09 Mar 2026 23:55:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773060934;
	cv=none; b=Se0dNfP5KJwgDXV1DxZr4inS1AFnyJg2uF4cPnXohOvmJ0CspBmAaEBkr4apv3PRksjK/j3IGt6EbZ4xYNSsBc3491vegBCxKOrKj5HDG6nKbMxJYrbyl8PjpH8Z9ZrcGrZS3H3xlDUPUJFIg/phn7QNS5iwJCe7xWqJ9q7bgbXFpSw+szYrr3U+2dRGi0/kE8czanrqVjb29Bt56y4LgbcYKsF79ckiaHwQsHI+HYewCvnxXwSA7Gkwq6ImGDvSRHLmiLXlEwyRKb1NRGGRNv0755Q1GxV2tLPP4RNWKDJ/2lyntNaxicgGsv1wJbqQOvtLqx1fN3B948O+hSpc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773060934; c=relaxed/relaxed;
	bh=+RwK8RR51qXeZ71e+SyZvIcyWk9REBek1JHzsr0gp2E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=luVmHNoupbmc04+8sdogdOQscRX2YVmAyRRM+9jl7zbYfygJxPSGRSiI8w1FrU9ufE0iKZulQz+QvluMVkiwGpH7d/hpuvyJHmmA3Ag0iw8wIagKzhWY/qW5pGbzY99vsiNQJffxvPBOM9vh+y1tONTy9VHH7m6EJR3B/sHG4d6EqbKn7psLUB36o+DJcEgsHX74rRzIxUaEffWRNLDRu2LUzjjsacPj/HvmaNDOp7TO/1UuQ1Nn1UBfRTQ6JVZqrlSTYz7aEDrVxe07xYnCcjKrBzbl1zAgyl+HsGsdhVfuR8Tgj4eIkBvtT9yYMENeJQ60nQsF8/O5yzA3SqNJwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p8qmf8wM; dkim-atps=neutral; spf=pass (client-ip=95.215.58.189; helo=out-189.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p8qmf8wM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.189; helo=out-189.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 4293 seconds by postgrey-1.37 at boromir; Mon, 09 Mar 2026 23:55:31 AEDT
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTxnb5kZhz2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 23:55:28 +1100 (AEDT)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773060908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+RwK8RR51qXeZ71e+SyZvIcyWk9REBek1JHzsr0gp2E=;
	b=p8qmf8wMnjquqbtDjCeFlkv0g/rwvbNPeTR18zkEYenETkIXumccUggucGa0zgF6GLFLib
	djNVfvGk4X/ruI12bGeiJmIWq/w/TeASL0uz2CUP4SvuXjw4HSrvbgcBOJSUbD//EuWvQm
	6+dP7/V+lRP4TfPb+t+51d5aiGXV3nY=
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] ALSA: aoa: Handle empty codec list in
 i2sbus_pcm_prepare()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <87zf4hmcw4.wl-tiwai@suse.de>
Date: Mon, 9 Mar 2026 13:55:02 +0100
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kees Cook <kees@kernel.org>,
 stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <CFB7A246-8C9D-4F49-8143-2883030C1135@linux.dev>
References: <20260309114159.765304-3-thorsten.blum@linux.dev>
 <87zf4hmcw4.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: C633223941D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-17896-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:johannes@sipsolutions.net,m:perex@perex.cz,m:tiwai@suse.com,m:kees@kernel.org,m:stable@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tiwai@suse.de,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[thorsten.blum@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.969];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On 9. Mar 2026, at 12:59, Takashi Iwai wrote:
> On Mon, 09 Mar 2026 12:41:59 +0100, Thorsten Blum wrote:
>> Replace two list_for_each_entry() loops with list_first_entry_or_null()
>> in i2sbus_pcm_prepare().
> 
> Hmm, I guess both can be simply list_first_entry(), as the codec list
> in this code path is guaranteed to be non-empty (it's called after
> i2sbus_pcm_open() which has the check of the valid codecs).

That guarantee only holds for open/prepare, not for i2sbus_resume() via
i2sbus_pcm_prepare_both(). It's probably uncommon in practice, but
i2sbus_pcm_prepare() should still handle it safely.

>> Handle an empty codec list explicitly by returning -ENODEV, which avoids
>> using uninitialized 'bi.sysclock_factor' in the 32-bit code path.
> 
> Which 32bit code path are you referring to...?

The SNDRV_PCM_FORMAT_S32_BE/SNDRV_PCM_FORMAT_U32_BE branch.

Thanks,
Thorsten


