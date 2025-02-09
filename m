Return-Path: <linuxppc-dev+bounces-6000-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA1EA2DBF0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 11:01:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrNXV4VcMz2yk7;
	Sun,  9 Feb 2025 21:01:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.186
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739095306;
	cv=none; b=KMCv28VUK7Hp0U5BYnIrfR4YnQaXcrptgJEFzswVdWCAuOcJFQuvqJ97Mi8uZQbgAjYAJEkeITq31aWPXyVyZuW3qoc8AEy0txVvq3iDUZLN3cNxzs+az9eknp18I751bC3+/FC58gCbgjeTj52GdFnIT3KLAkDYfDplyTT3lqfxw1Bp6ERFWogD6yItiDWZl/xYCy6nWpbYrCf5VaibSAnJYBESZR555MK8XDhvXa4Lr0szD5NIzptrjmxZ2duSrVqLhlGIms+NmZYi4D3H2QD3VKM6cKsV8/R/ousKf1Oai21OW/53MLAQdDao6yeut4lnBCWPRbwj9zpD7Oqqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739095306; c=relaxed/relaxed;
	bh=9cSbhneX97WdYtqTFiUpL4Xz+wowhgsJfRXIyo0XD/Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=N7l1QIvN/GXg74KPPe54E8I1CDUyKGughuQz+8viyU5Ksk9K20JjPi7rjIrjVh4p1m8FFEXMt3k0wxaa/kWnUftyFk1rKPBvwD4wYYf0f19Dp3+yPyQ7lxI+z/ajxoYXneBW6ubqnkkNrddEUjo7yiNxKjTdWbgoxegU0m1yCk3r0BFcfynI0bkyyrvYSJjOMDt1VQZOJXJNf+6BF2nY7ujxPXIulRUi3b4zW0HJMkhdSaQUlK0xc8j0qg808BXPx+YpyJLbv1uYsnuXdnvZhi2Nh3a2Eo33bOgMWNuWV3xd8/islvKHdoVXopNw2wJNOJZAKFIFeZ9XWu9HibtULA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=95.215.58.186; helo=out-186.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.186; helo=out-186.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 6227 seconds by postgrey-1.37 at boromir; Sun, 09 Feb 2025 21:01:40 AEDT
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YrNXN5KC4z2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 21:01:39 +1100 (AEDT)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739095279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9cSbhneX97WdYtqTFiUpL4Xz+wowhgsJfRXIyo0XD/Q=;
	b=sE9os2oCjn5wm8jnTVvYcVtsREUjUYFxqpeprhiDim4rUG/+AqdL+oucY7wOl6roCTG3KQ
	vbQFdqiU1SgzVUSSV8hHxiKNbVnT0cEfKjMaB7UXMbQLmd/KSeTBzTVeUBBBTzk03hWMlY
	puW18AQ0rIHwYhVZpFVgDNNdVqPd0qI=
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
Subject: Re: [RESEND PATCH] fadump: Use str_yes_no() helper in
 fadump_show_config()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <505dcbf1-c185-4bc3-9615-041dfd6344e5@csgroup.eu>
Date: Sun, 9 Feb 2025 11:01:06 +0100
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Baoquan He <bhe@redhat.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B65D3E24-E34B-47DA-902F-8DD338CCFE09@linux.dev>
References: <20250209081704.2758-2-thorsten.blum@linux.dev>
 <505dcbf1-c185-4bc3-9615-041dfd6344e5@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 9. Feb 2025, at 10:16, Christophe Leroy wrote:
> Le 09/02/2025 =C3=A0 09:17, Thorsten Blum a =C3=A9crit :
>> Remove hard-coded strings by using the str_yes_no() helper function.
>> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>=20
> Any reason for resending ? Your patch is not lost, see =
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?submitter=3D89400

Ah sorry, I missed this. It's sometimes hard to know the status of a
patch when it's not in next yet.

Thanks,
Thorsten=

