Return-Path: <linuxppc-dev+bounces-1723-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F88498CF1F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 10:44:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJSyv23nWz2yNf;
	Wed,  2 Oct 2024 18:44:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727858646;
	cv=none; b=Zbuz7MV9nAafUaAMowATMqIW193fz92iHSS3e9AWS9L4ZdfpOoI9+T0R+ZoEmXlwFWAKkXTA1szWIwxp/DpqQXlRC+9jjAo0VlaI5gTZQfobSGYmXcKQ+IiKDituoux/inbM/6AQqDlzYziBTzT5s+/9yETj8Fka3s438so1y1xakxMp/M+5rTXb71Fyj8kHEoKDCsuTizTKfTJ5hmqze8WYE47aB2bJq2+Z01ZfH9wps3O0eyWHnyADS3bMH6WkVFyhEldEWQg+T/W5A/bhkn0ExcdRSDDe8UGbIbpK/giQnccunDn5e4E6nLvkJEJVvttoVeuPyR+Kf3s0v+purA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727858646; c=relaxed/relaxed;
	bh=lhqO2EAoh9srUVDLjcw/2nKmOK9gCG7XO5Nvej37gPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KpPOKfBI3hs4lSlb9SqXpA+yGCbjRwe3Bqg7AZUSwbTJguGXwVQi/eVHoM6wNShP/X8pbVXsU77fbIhYTkN+YM1uVF6xSh6cKPWZ+eJHI/wXyZsjPzVNSmWR3x+zD/jOXKBv1ic6D/VgRS4mPjFYNCsB66hklg3aAnhDEk0vodpQFv1ng0GGZpDk3mN5NfMHYIrHLxc7H6pfyuKZH7twcxsGcsKUPScWvLhfE/rH1KIdeIdAaDyQYOF9dbvTH+GSCgPWXGOG9+/Q9OODHvnDsBpXFCfsoHyZAN2uKaysQXddfvd2lH/40v6IxkP0ZRW2SgtOXHml+hFdId/46MmqqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=f/Zgjf5R; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=f/Zgjf5R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJSyt2pJWz2yNP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 18:44:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lhqO2EAoh9srUVDLjcw/2nKmOK9gCG7XO5Nvej37gPw=; b=f/Zgjf5RnTOySPu5gxxSei8x9b
	xuX7HGMpFydbwLHelO2M/qiYIGMPiWn1f7jdW7axVPcemAN2v9vWFssRMdgqqWT3Rxp6ptm4s22ne
	CHY9HAIy67cFZ4VTwmEJ79yL0ypI2pzjRErLeYNQggIu8YBnGfnUKnxtEJoODdW8wIy7BfOtgiopo
	+CBZWVl1Bla6x4g4jp+MFcaCiCj3TT7TqB/wMEt03Sv6jGmeOwGrnMnmLcIDkQZRwotKGlsJvtB9X
	uV0c6ME/b/75zUpfTnKQdTPwgX1nxKs1R2fpzJifzOzc1z81hzKSYnKypvrAXcR2m5YDkObdxJ2up
	/6cKj0Kg==;
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1svuxj-00000003Rxb-2GVV;
	Wed, 02 Oct 2024 08:44:00 +0000
Message-ID: <691d9583-708e-4c7f-9b6f-664c069f9acb@infradead.org>
Date: Wed, 2 Oct 2024 17:43:53 +0900
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/35] powerpc/ps3: Reorganize kerneldoc parameter names
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
 <20240930112121.95324-12-Julia.Lawall@inria.fr>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20240930112121.95324-12-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 9/30/24 20:20, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> Problems identified using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  arch/powerpc/platforms/ps3/interrupt.c  |    2 +-
>  arch/powerpc/platforms/ps3/repository.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Looks good. Thanks for your fixes.

Acked-by: Geoff Levand <geoff@infradead.org>


