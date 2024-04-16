Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 365878A6AB8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 14:20:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=fRvZ9gzO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJjn173Kgz3vbY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 22:20:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=fRvZ9gzO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJjmK3xw5z2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 22:20:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713270007; x=1713874807; i=markus.elfring@web.de;
	bh=Lv4Wq6qu9p1ZBlPnYwsPtJ9DrW7B8a2DGJ+zDiVy+Vo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fRvZ9gzOHRdLqdNEVYOo79As2p603QvzXpXNI2KKhU69YqvoYfgpnGWd5Pc5eMRf
	 W1nHNpNq8M0SZd1Bdi5B/xdhS+5alUL8HXK/xrZSZ+tRxqMQkFRXNaLkl+wTxR2LI
	 JLPwWduibjydSOc0ffA4DjWsKPnvvhYduJgHyt8ZZhSkint+B3A2jOOLqXFa24c3X
	 LtuUffNVvYxggWOquuXPRFyBYgP+DbA+B0ZLsrsYWtTcSjmqa8yTf+EWNWPCtUHk6
	 cFytoF/OVbjSrJb7sIjc66YHnh6IBawesISn2Adzq5K7KfapmHRsplN430+DW2Po9
	 CGZ50J5Hvf2xOOhdgg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M28WJ-1rullX0mPx-002YIA; Tue, 16
 Apr 2024 14:14:30 +0200
Message-ID: <33a38d7e-26da-46e0-90d4-7137f9ec0c90@web.de>
Date: Tue, 16 Apr 2024 14:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [0/2] powerpc/powernv/vas: Adjustments for two function
 implementations
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
References: <7be66990-de9e-488b-ad6d-fafd1c7bb34c@web.de>
 <ee6022b8-3aeb-4e6e-99f5-2668dd344e0a@web.de> <87plupbm0c.fsf@mail.lhotse>
 <795ca003-4231-45c0-8bb6-178597950fa5@csgroup.eu>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <795ca003-4231-45c0-8bb6-178597950fa5@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hsxChQyFzhPEKKvYCyvy7NgsHW1pjrvs8WruIhj+JKDV7dHWRe0
 I4b/QJ8s8AXfyqEPsqrF3pGy3hn/sZ+YDLWr95BvPAPEz1iabte7Xs9qjteD3zPuY3bU47F
 XW9ujYjwb5Ccas8EWQ2MHwVzl/UnDEYgne3L/Wx1VhSNyLAeOQUpOI803P39hx1YTXPc2OO
 IuN9VbCGqj8aIop4FE3tg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PX+kPsljJ9E=;YfS7WDTWn4HvcO+nKjhTi3VrWyn
 luIB6Y5B+fr1wuUpbMn1q50rBYgZGlzKCg5UAu7EvXhmxeF4ckbRfDg7UMqhwblu9eMNcUD0H
 V223ekPPGWPKuuRFrzbWO0WGjpuHccLkzoztlrzTPX58yRymVyjdPB/L5ftcn9I8ITKZHm+84
 hofmWKBVVRYgQ8z5P39erDEKUYgWvwuqyO8agiU//NvdBy7RYWu2VkD7BZYArKL1dw267Wm9t
 fgnjuAEbbc4qIwWq3l7avzOUwVgShZn3TE/vOvY0PhCxgLMBUfSjqG13snhc9VdLtSlyXm7Jv
 0etOqClhrYbJg5xH7kixyDy9rednovqL242AnyrQXIFfz9qEazQ/eJBJDS8q3jrz7uXqqufuW
 BRZJzd5ocIcEIQov/aI4Ctyl+X3mFrufEhgMT/hTWFXq/PfIBXMDRQEVKCs4DSw+OoSFI6OIs
 0Pktdxqd3XzYoR1B3N15Mz7m1dbj0MbHRGMrqDg0ami2qK14jJCQ/TgbvOq/THd8Yh3zMgG+h
 NoHNZJGJ3/sfBAOvPX/u2vVoS/jgEc2dWekTee8Li6rbhKPraAXliFqiKzKQbfsAonQ+NaQN8
 4PelCoX1phxmt3dAc/scQnW+r+WADIepgR9mNpgFdY7KKnYekR5EYi+Tz0sEshKcLEnFa0qFQ
 FLUU8v9KnxRgE6Z22Wd8ABnIwjPCs9m+6EeDvXlwUtazxHfCb058namcChzTq+51K9LAf6iQ3
 OLusrOMIOk6ULY6u9x8aSqkbXIAZKqyQgfZz5Rk/EO+qF2y3UvOeuNBTX+J2ghE/NGEdfewj1
 g97WwbK0C5J6JUV78R5Yzn3FzRRuyR0vtdCwyWmkpelGk=
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> This is explicit in Kernel documentation:
>
> /**
>   * kfree - free previously allocated memory
>   * @object: pointer returned by kmalloc() or kmem_cache_alloc()
>   *
>   * If @object is NULL, no operation is performed.
>   */
>
> That's exactly the same behaviour as free() in libc.
>
> So Coccinelle should be fixed if it reports an error for that.

Redundant function calls can occasionally be avoided accordingly,
can't they?

Regards,
Markus
