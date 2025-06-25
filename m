Return-Path: <linuxppc-dev+bounces-9738-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65129AE829F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 14:24:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS1GJ5H9Xz30KY;
	Wed, 25 Jun 2025 22:24:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:242:246e::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750854264;
	cv=none; b=irHeiIAY1UMtYB5IJBp9wepYXa+W1l8takjB6FOcQu3CBdRpIu3ERc+7BOh86e3xMrPh+i4Fth38Wxb+zM1J9w8NCNRDfDcA3i+1XZnVXWPW3rB0YIXLsWwuFngJZ64KLIYiKblUy+gopRHjCN58gWP2rE5+ouXmEY2Vnn0yODNZvR2JopNKBcqoa3siRBccwS8H7bFvwoxDC0ZLshDng5EWx1B/ziMPy1IzNEa2TgpwPoMJyr84e8fqYiZHGKkpl5m4rYk5otvSZTFoYyZPgLJIvb9Sw6XhWfd0voby8s09sKk019crCz1qkEJnlVLNWH8cgCqmbfC/cDGfarLKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750854264; c=relaxed/relaxed;
	bh=SJ5NkjC+cOiMPwKXMdsR+3xgXJFhGnL3/wL1U2zUcWg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SxVBCj878XwddHJ1E+JkWrSHtFyJkXoaFeVhb3CagAKM+Z21Lz1MbkfhaZW/P3MQ7xcf691WN0kQaPpN0WexZh1lbgXPKdZLY9IdM/kVWbUth1HVuJ4iE5E7uNmFUspLlwFz8Ayrw2k6W9cQTwgLf8ue6SMCNCslWQhmuuzr8ognMzU26mN2S7LUaFE2/HXI7JXMtYsDmRYbL/uMTwI9m9mNuHzYd/D36Wye5Bwc/25SzEoaFWkB9MPkwkEApFS1xWcJ8/1Rd9tSAtLyDHOQxgpxnrt0V74oW/UOGWeHwJbMS4sOFCg5ZeK/9TSP6yWQfHcPjLXgwMVCB6exnP2JwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=dE2Ni9JL; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org) smtp.mailfrom=sipsolutions.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=dE2Ni9JL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bS1GJ0J9Rz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 22:24:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=SJ5NkjC+cOiMPwKXMdsR+3xgXJFhGnL3/wL1U2zUcWg=;
	t=1750854264; x=1752063864; b=dE2Ni9JLG7LC5eiiNJ9UsW0bB2fboOyLmXT+KIX+pOz2RrX
	crXxu1jORJMHoXkLXfSPDNlLedbtqAfIYFuY6lYClIOaYqd6AErn3aa1ReN6CgwDiDzChMu6LT68p
	RWYGuKHrGNC/gkXMI8LIPGUqFkfQIxn85kUMA6TbIeJ6WBvc1hjl2JF3lOq068Sm4bLMZcWlTCmx1
	KxXCih3WQ4Kk+yAG2hHawJC3yqyHErnVkMRMIrRM4a3fL18qd4YGZiIc3YW9kXY2lZXXAYCYo/29U
	VWjqGaqChIAZP6cS17Jz2L0r5+VbOamlIK05wF8Vxd7k8i2oPehw/f7+CxHpmpnA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uUPAV-00000009xvR-1M4X;
	Wed, 25 Jun 2025 14:23:59 +0200
Message-ID: <81a8b60be5b99ecd9b322d188738016376aff4aa.camel@sipsolutions.net>
Subject: Re: [PATCH 2/9] kasan: replace kasan_arch_is_ready with
 kasan_enabled
From: Johannes Berg <johannes@sipsolutions.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Sabyrzhan Tasbolatov	
 <snovitoll@gmail.com>, ryabinin.a.a@gmail.com, glider@google.com, 
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, 	maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, hca@linux.ibm.com, 	gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 	svens@linux.ibm.com,
 richard@nod.at, anton.ivanov@cambridgegreys.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, 	chris@zankel.net, jcmvbkbc@gmail.com,
 akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com, geert@linux-m68k.org, rppt@kernel.org, 
	tiwei.btw@antgroup.com, richard.weiyang@gmail.com, benjamin.berg@intel.com,
 	kevin.brodsky@arm.com, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Date: Wed, 25 Jun 2025 14:23:57 +0200
In-Reply-To: <750b6617-7abf-4adc-b3e6-6194ff10c547@csgroup.eu>
References: <20250625095224.118679-1-snovitoll@gmail.com>
	 <20250625095224.118679-3-snovitoll@gmail.com>
	 <750b6617-7abf-4adc-b3e6-6194ff10c547@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
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
X-malware-bazaar: not-scanned
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-06-25 at 12:27 +0200, Christophe Leroy wrote:
>=20
> Le 25/06/2025 =C3=A0 11:52, Sabyrzhan Tasbolatov a =C3=A9crit=C2=A0:
> > Replace the existing kasan_arch_is_ready() calls with kasan_enabled().
> > Drop checks where the caller is already under kasan_enabled() condition=
.
>=20
> If I understand correctly, it means that KASAN won't work anymore=20
> between patch 2 and 9, because until the arch calls kasan_init_generic()=
=20
> kasan_enabled() will return false.
>=20
> The transition should be smooth and your series should remain bisectable.
>=20
> Or am I missing something ?
>=20

Seems right to me, it won't work for architectures that define
kasan_arch_is_ready themselves I think?

But since they have to literally #define it, could #ifdef on that
temporarily?

johannes

