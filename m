Return-Path: <linuxppc-dev+bounces-6425-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AD4A42275
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 15:10:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1jKz3kr0z305P;
	Tue, 25 Feb 2025 01:09:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::bb"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740406199;
	cv=none; b=lQiTF8Ut8ggFZ3ya281RlHU+W5dFIqzv0zDdRNJI/PPjUwXVHqQUQYN4aUQJJceR474WFpGJT8qtbHvpuf/PjfzdSeDY8kwitMIsPquMm2ZPkKgYj9yhDZj6rN+xwKjYXrn2hUla3STDWUpl9NmNAtSAZUtHHMiixQnDcPy9HQ1OJcI5+ZfrxJtbmDLhqI7ZFe/IefCQ99fmGyWHsrTbQWx75edhGBFj44NmZTrW0lQ09AGxySd/rLwyCJH5egdSxZgWY86kg4AmmgE4yR9yANGARHvIGveA75Weld2LGwkEMCh0Qjiw2FIayy5MNCJVsM8GMjgAkM+AzaqbGy5MhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740406199; c=relaxed/relaxed;
	bh=iR+ZRm8Rf4CcWzzHJUgQJE++fFjiHr0jVOTIRynNSds=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Yb5heR+E2v05FCGzsORk9OBLwADE16iOr2Bl4LpGH/1Jl+DpufIh7seaNDmKzev1vT3IrKmVxBgoU7JB72p0bD7xruBQpPkZuglqH2SIrc/71L7Msp7jqCz7/Kr+yHVULadUtjlF1hTABC3W+aPBKVQPF6BjjoZGDkNcxGjj5Dq9ux+9bWcatAW8gaH7z9jlssykPCfpDWSHlLTyHLDu6PyzxnJcOPfmH6ugOGmmzhVzKBjWVlWQZUtTJiV/c7WEPwnUwv1CXkrYE0G18mIhzeTDj2+eiAt+RsTQF5zNj2hqg1wEn3vlUu/NoE5e+RO2bVd6DcHfiNejVqki9w9LHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Xjys1v/w; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::bb; helo=out-187.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Xjys1v/w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::bb; helo=out-187.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [IPv6:2001:41d0:1004:224b::bb])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1jKw6bD3z305G
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 01:09:55 +1100 (AEDT)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740406172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iR+ZRm8Rf4CcWzzHJUgQJE++fFjiHr0jVOTIRynNSds=;
	b=Xjys1v/w08YouEoOoiycof9pS9nLTNmUMcP5eJjFxL1liBMyt860Zi2OQMxCbmDidA7+cc
	rHTN/4sRVP03ZxzzAZ+hBeydNhtZ00yawJRwzzftT8mx7zue0sNEqwnyNCZeAiu0yyrsap
	fIt4CwSxAYrHoFGewHHUvQS+3diFLK8=
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
Subject: Re: [RESEND PATCH] powerpc: mpic: Use str_enabled_disabled() helper
 function
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <f872c2ef-4adc-4daa-aa12-769e3108abc8@csgroup.eu>
Date: Mon, 24 Feb 2025 15:09:19 +0100
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 =?utf-8?Q?=22Ricardo_B=2E_Marli=C3=A8re=22?= <ricardo@marliere.net>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AE3E083C-D554-449B-9C67-81556D06FD35@linux.dev>
References: <20250219112053.3352-2-thorsten.blum@linux.dev>
 <f872c2ef-4adc-4daa-aa12-769e3108abc8@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Christophe,

> On 24. Feb 2025, at 13:56, Christophe Leroy wrote:
> Le 19/02/2025 =C3=A0 12:20, Thorsten Blum a =C3=A9crit :
>> Remove hard-coded strings by using the str_enabled_disabled() helper
>> function.
>> Use pr_debug() instead of printk(KERN_DEBUG) to silence a checkpatch
>> warning.
>> Reviewed-by: Ricardo B. Marli=C3=A8re <ricardo@marliere.net>
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
>=20
> When you resend a patch, please tell why here (below the ---) so that =
we know the reason.

A "resend" is meant as a "ping" and the patch is always unmodified.

=46rom [1]: "Don=E2=80=99t add =E2=80=9CRESEND=E2=80=9D when you are =
submitting a modified version
of your patch or patch series - =E2=80=9CRESEND=E2=80=9D only applies to =
resubmission of
a patch or patch series which have not been modified in any way from the
previous submission."

When a patch is not in -next yet or when it's been a week or longer and
I haven't received any feedback, I eventually follow up on it by
resending the same patch.

You're the first one to ask for a reason for resending.

> At the time being I have several duplicated patches from you and I =
don't know what to do with them which one to keep and which one to drop.

They're the same - feel free to pick the original patch or the resend.

Thanks,
Thorsten

[1] =
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#don=
-t-get-discouraged-or-impatient


