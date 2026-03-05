Return-Path: <linuxppc-dev+bounces-17785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPKtD/TLqWl+FQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 19:31:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F57216F9A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 19:31:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRdQj57G1z3c8s;
	Fri, 06 Mar 2026 05:31:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::112e" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772735469;
	cv=pass; b=lVqDqNpGQKDkmbahbWRQYPvAUHpoiaa5LAqqCWVKInb9ImoCAEcUYm/mqd6dE3AU82dcWqo4LkaBtoLwGSibkOJ75IY7Z8+3JYKdD4ZRGeGDEtjDsZzr9RPipq1XmElgqdR8bjNbd/9aAzCyiK4pYFOY+MYz6pv2FkKUqUldPsW62NRCZkxr+YqoMqqeWrcanCOMHXCcDzlaWpFLqk+VLeu/VgcXwIE8oNlRlBDzzLh94bFWKD+LFyKDyEtyaDrV+xDpZBD8G44oDn121Eo0zPpvLLTYla9vC6FwUWCc7Da68O5sk/Z8+Qd0yhz09PqxqpJzzUUkjnXgwvLIgx34nw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772735469; c=relaxed/relaxed;
	bh=louF0VYT3jVATcdfkHl6P9eqPKqMc0Xl0Ev8Gw/VyXM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RGNhVxUPCsVgthwO9tv042VkENKw/z/AdbaKLPCbOr5N+XETbtKZ2Vp/z+Nmp5BqLZe2hDV1zvDucZdH/2AZPhk8gN++5vxYbnJMGDpcNp5Fs0H0lfByt+jEuQ7f1vM0fONvZ54pCQC+nDphb8M8vplytdCI/5d9PaRejCyUte3Db0R0fP9rFzWYY1zITjAvhVNdJhbTgt9cOOUxfAulXOss94SbhoO479VYafHNh6TKrAUqEcPMPHzeRnXf11iAaJkSNEVXzdG3v7jlWKmQUk2pAh8aiaXQx2TQAIMxd4l/MWUELFheN49oQCzb5MwEu2mMCbAmvloUnDQF1HBxSA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W2WkNmw5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W2WkNmw5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRdQg4crmz3bhG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 05:31:06 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-79652789a0cso5038987b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 10:31:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772735465; cv=none;
        d=google.com; s=arc-20240605;
        b=iUg7T+33ri/JUiSGaLBN1lVSsEd4Wual73Ghhbt7KYpPgL3jiEO6How9IFZgfcv6Oh
         zfzPOLeQlB+sZUsJcKOyygDm1VzUE2jmkPhQdGwKS3bG6o4Rjgxs+KNroJtKsz0nFdWQ
         5jSEenLepq7yfHglw5+XGwzHUnxxA+uI+i70DtovIQ8ItaRbQO3fcahZz1fUztVIW7Q4
         TqAZS0fAwRvkY5dCl1uTOXICSlnUaiafmJdvn+CzONDXTq6zAR2ODHqUA6eksI4mJVFU
         +9u0ifosMZEMgYkWA55YXqsN3I2cxPJqFrXM52yX81l29vYnvQIsfz2Zzvk9GftW5Lje
         fj2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=louF0VYT3jVATcdfkHl6P9eqPKqMc0Xl0Ev8Gw/VyXM=;
        fh=TszvtxQROQFh9suYZZOWpyJq1J/aaiizdMUeouUMvxs=;
        b=YseDrE8EqpySgCOOiXrks9J+PGexUi8DKZRO1Q8S4UJgRkvCDs018DFQG3oQz4GkQW
         jJe0VM1lYF9b0E/jC+3NbkpAQbYnvcWliO9mc9eetQBV4B7LqUlaRBbXgzBZ1XJ4woyJ
         w4xVoI0rij520jIjZ0QnD4BViwnMcv1eOengbRKFMz+Y93C5LzOQdDL2pZL29rCQX/dB
         PgkaCDXXVTBRZdAv1kNGFY72m7xIU1uvhl/b9vpZ+1cyn4lYmfC7jhgWAOYJaVOcNSPL
         mispsGDuyxs127TYQUr3N4tbXWni46fzsWqDX3hlYeMRx/aXqllE8OOsoGd4d1Yw6vPR
         Z6lA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772735465; x=1773340265; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=louF0VYT3jVATcdfkHl6P9eqPKqMc0Xl0Ev8Gw/VyXM=;
        b=W2WkNmw5ng5usTygfq+TvkNX5XbMTq3fAzPYAEcX546TwkyXrqbMexCwVZrejKUixa
         hJBXqnlNXPhaAHiqFqEgjpg8bYvZSntQgGTL75KQNQaZcJaaIFFEiuO5Bxh4UtP3itEz
         V2CAnitDTuMaLCpw+/qep9SBg5gsFB0AKn0GJrG4zjAesw8oJKN8TEmFmctb81G4WcyP
         xq8EcepilbgkNLTxfOaZjDGmzXcqkQyaKIvmeNdE35WlPmqh+wlA4ZhnrmdHpJ8JmaPt
         T60dKjIPVLQ6XKOpeyGNGQS4vS29qnh5lYES7CNugHTc+77H5OqXZnU7mDYgqh0Cky1Q
         Sxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772735465; x=1773340265;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=louF0VYT3jVATcdfkHl6P9eqPKqMc0Xl0Ev8Gw/VyXM=;
        b=r7/e1d1+RwiM4D8lJhhrrP5f2El4dTAGFSbEydNEOsHdHw/0w0+1L+rtg8XLiZfWAD
         XZ0LjJzI1YnRSr0Dd0d+IxPebapliWWr3e3Gnc3fwQ/xO7tkDNMvV2o6obghOksM+IzA
         9wrQ+CSCJvJU40KFC6jzL1xyPLRnU7hNbtFDacRFw44x0YfJWNaWBwKExtP1WpH+pymJ
         lx1yYJZgNYBjqYEunDoVNMDy2/twpks9CuFLvHadWdOmSKlKvq7dlvdYLGO4qmr2XM4O
         PZnGdcbQ5HJpjWPcaXWeRNxPKDrmifJdanwTDpxWyGZ+Ue6oRMxPXwnkoPULjYn3tOM1
         F//w==
X-Forwarded-Encrypted: i=1; AJvYcCVJWrRlBmULOeVC01Cces7Qa8iUI+lyc0533V4jIbmxjoertbA3MTSrWIF2oOnmeVU7IFyhK5loqhk/EoU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyUnU3nLzVZVnmdCCHlSnwrr7+E6+Kw4i3MmMRRL1cCu2+tKMzf
	svM5T+NGDjzQivMPARNtyg1GisiXURcIas47LZ9tqcXu63M7zgolrSWOjfaMOaPaeJyQAI2PoFm
	4hiJAh93b5VK+6KNOkGgTX7+PEbyfTbg=
X-Gm-Gg: ATEYQzx8yCBqge+tXQegdysTOHEF1/xePGv+HMV0900qvzi1c7U9gjITbzQJHWQeA24
	FrG60lUNgVSM2pNyUSbXVAMKqg7iGq2tJNkeKqtNeI9Z8i+E887A2mlLnolhTf7llwuX+Jx7vqX
	LOKpXakH7YPi5rbYqDn0Oe2c60uI4NB4/GPplvxqBrU0L7xox0IN7s4EHPXdo27hoPH/n/D6Mjx
	+WAnaVMcJwD18UCqQT8Xm4G8lsQDD0XxSZEw9vhZB38+Yu1ZEVyV6dhpddvwsq+fyBglxZTGoVD
	Q9y93w==
X-Received: by 2002:a05:690c:113:b0:794:ce39:c63a with SMTP id
 00721157ae682-798c6b7f74bmr47076567b3.2.1772735464762; Thu, 05 Mar 2026
 10:31:04 -0800 (PST)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Mar 2026 12:31:04 -0600
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Mar 2026 12:31:03 -0600
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <2f9135c7866c6e0d06e960993b8a5674a9ebc7ec.1771938394.git.ritesh.list@gmail.com>
References: <2f9135c7866c6e0d06e960993b8a5674a9ebc7ec.1771938394.git.ritesh.list@gmail.com>
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
Date: Thu, 5 Mar 2026 12:31:03 -0600
X-Gm-Features: AaiRm52GZ13axMWytXPAWQiFZUnqLmaKbYqKRkeisNV1Nap28ZH-9coEHa7p224
Message-ID: <CAPAsAGxB6RGSYzMq=tjQQmEDu3QP+v_AqmkbWTRyqkk+K35o-w@mail.gmail.com>
Subject: Re: [PATCH v2] mm/kasan: Fix double free for kasan pXds
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org, 
	stable@vger.kernel.org, Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 94F57216F9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17785-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kvack.org,google.com,gmail.com,arm.com,lists.ozlabs.org,vger.kernel.org,linux.ibm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:stable@vger.kernel.org,m:venkat88@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ryabininaa@gmail.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,googlegroups.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ryabininaa@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action

"Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:

> kasan_free_pxd() assumes the page table is always struct page aligned.
> But that's not always the case for all architectures. E.g. In case of
> powerpc with 64K pagesize, PUD table (of size 4096) comes from slab
> cache named pgtable-2^9. Hence instead of page_to_virt(pxd_page()) let's
> just directly pass the start of the pxd table which is passed as the 1st
> argument.
>
> This fixes the below double free kasan issue seen with PMEM:
>
> radix-mmu: Mapped 0x0000047d10000000-0x0000047f90000000 with 2.00 MiB pages
> ==================================================================
> BUG: KASAN: double-free in kasan_remove_zero_shadow+0x9c4/0xa20
...
>
> Fixes: 0207df4fa1a8 ("kernel/memremap, kasan: make ZONE_DEVICE with work with KASAN")
> Cc: stable@vger.kernel.org
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

