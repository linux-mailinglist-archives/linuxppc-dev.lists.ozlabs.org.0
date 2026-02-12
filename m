Return-Path: <linuxppc-dev+bounces-16846-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIF7KTwEjmlf+gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16846-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 17:47:56 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C85FC12F965
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 17:47:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBh7C01p7z2yQj;
	Fri, 13 Feb 2026 03:47:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770914870;
	cv=none; b=ekQnhK+aXZ1s7qSe66AjqCev7u20vXSI2rcBIrz4zzsOO4Z4y/nwsv6bjh9p2h2GXuo6iUaGJuDjn1TQgvpMV+Yy/dYzww+h/xw7ZV8k+/vhUM625ZfL53ex6PHb5A6Nwxztk7+vcCUvB4OmA4MYDXG/klvALg3iCErEso+YuzEAR0eTQX/WcPg3nthf5a809W5nEXfiXh/+pvWsC7Oi2S8VDvcXC9lGGGvt4KG2lZIkfwLpj1SkJlEq9jgZd9wUuvu0xsw1UZcB6vKH3A/S02XnNTrGAq0p3UJn8uCf8dAbhtnnd20FOr181bAXbcqWZ3/fP20F+Q7EEZEJctkBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770914870; c=relaxed/relaxed;
	bh=Kji4RKvQXQVvuP8k7YkpJrLiCBp/aXH4Dh3ytJmnssc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=al6LCSzgFHupxPazix5DmWq3jnIBaMgyEBiTP4KCeTTl9jR5YJmwCyvRQjQiAEdV2SVZz5E5YIFk+kaQ8gsNWCJLoXbV0z5rKIvu9bgMNUT8hxS9ajr38SyPXV5jra/5XcwT42Uy6ATPLFpuBwIAYaaSQSIUGLKbFfSRm2bbIHXINyO9Kq3KaJBRusrYfXBx3NCxNcR+yf4JnrPXRlhH4xWR+ZiN759iy86f8tUSA4AGM2Led92Meu8nODxXrL0GUfaJaq1tRry79MlISwEdYQlyQis+L7HY/gN94fnTPiDaM5JqWXcjBiUs1cvnA3Eb5DdyfVzD7xa2zoZR46q9pQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SGgW+bwb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SGgW+bwb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBh7868Sjz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Feb 2026 03:47:47 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ab47d8b33cso55335ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770914864; x=1771519664; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kji4RKvQXQVvuP8k7YkpJrLiCBp/aXH4Dh3ytJmnssc=;
        b=SGgW+bwb7MSP2ZChezoX3Edwkyjhxpt2wxjCyUu90Hqo+Yg2W4LAYybB4gINPS6/m3
         qO7gQ3MDaZgEhQaYVPVnHS0JGIYOy66wTBW9ruEHvuJcFNUro5HhOSGU3VBzMYqjOPr9
         ctyiAv+88qhdGHh5RL+WLgNgLfr3+RhDyhIVvhTCexwvUO+7lJNv82HYJKsJqIUkjqVr
         s1yIUgzbj88BaX9+RTuJ73oPz1NkHLNVfCE0f6Pd8or2KenrUdCcWHX6+3XgGCXyKXyP
         J18a+5I7w8yVdScklBLiuSsYxYDH2h4DlUhTH4iyC7RZ93nfeJr+xJdK4pCfA7FNfzJJ
         4n+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770914864; x=1771519664;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kji4RKvQXQVvuP8k7YkpJrLiCBp/aXH4Dh3ytJmnssc=;
        b=eEt2AcXebab0xEXfxDjFeqjEqVcZH1MUBdM8wwlBP2FCqqvRnwnjjr5O4BKaLPH4hC
         WB9PQpp/F0LHbTbcdnoRI11j14KKjE8oNrGdes614F0AsmZXnVGeDdGCfrjhku8AGqTc
         kbNmxEpllFS3J7IfZI7aXt5d7+RHNnR5FqbfFWRoEizspoyh0fVCGj2B7w0jTcXIDwM0
         TMznkyrohCeGOEQ8EdjZQtzseCoZERROp0NazxUgJ0Vn0l+nlJ0I7KmHzkwniTHT8HV/
         hMlwqG2OZVJs7HbZMcDNz6NiLOoNpgTrFPa1cIb/BJG99oREN7M6Kc2PFRZCPMsEzDwG
         YCFA==
X-Forwarded-Encrypted: i=1; AJvYcCXX7Lg3kQmI9gc5m6sDhziVZR6bbiGcEFtsN/uGbeW8RRO1w7z+pIHDk38pxkT9iHWRLslz16VX3svbLIU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBE5e+9E9GkZ29GiTHG3WIhkb3TZV6Mu3OnUfiMrph3sn0HOwT
	mE0DGwQui76j+9gyewumrLHV6xOa1YWjshox9bHJIiT2NMN9lAjVIE03Spc2AEW4
X-Gm-Gg: AZuq6aI141Xaq1AGBfB09eQs2ygpBg18daqBRH3EJGw00r3OIZPKAGZXvauYOg9XkAe
	JvI5a+mt/qIZuEQaVvqDf0ogqzkGMp8UecViUY9BsWqwe1Hk7D2az8MD01KLw2B+38sHiCAi82q
	Acl9U4o/1ZAT3LZC/rwqawWsMAFTVy9+kcKUbN8HoDHobYifDm1DtA83t24CyvCmFwYnt4ZfK8q
	h8ICnw58uMpf6VkPOiPPbkMHJKlA2nmUsXzdi5q28Zlpc7Od0b47Gut5Ja6cgrbnVBw6WJCEfxP
	a2D7ci67m5l0f3JrbhioNlqy1pMvAryqXwvfIi+Mp4d0ufwnYU7cjmTFDcx7d+XUsaBNkZM85Ne
	tbAu5AOxVAQJxs/QPIgdYnyxuDlkyvnwNsIHxf4ntyyJ4PSwXDjagTZjtWU/Frn1sRXUqnzVoQL
	aqA8htB0GOL/x2FWvfQjNIB8Yx838=
X-Received: by 2002:a17:903:3b87:b0:2aa:d611:ac69 with SMTP id d9443c01a7336-2ab39c62378mr32288565ad.52.1770914863950;
        Thu, 12 Feb 2026 08:47:43 -0800 (PST)
Received: from dw-tp ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2986efa0sm54735705ad.32.2026.02.12.08.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 08:47:43 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, Usama Arif <usama.arif@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, lorenzo.stoakes@oracle.com, willy@infradead.org, linux-mm@kvack.org
Cc: fvdl@google.com, hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, kas@kernel.org, baohua@kernel.org, dev.jain@arm.com, baolin.wang@linux.alibaba.com, npache@redhat.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, vbabka@suse.cz, lance.yang@linux.dev, linux-kernel@vger.kernel.org, kernel-team@meta.com, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC 1/2] mm: thp: allocate PTE page tables lazily at split time
In-Reply-To: <22d65938-4569-4e5e-8f30-bfe9b38b6493@kernel.org>
Date: Thu, 12 Feb 2026 22:16:14 +0530
Message-ID: <874inlnc4p.ritesh.list@gmail.com>
References: <20260211125507.4175026-1-usama.arif@linux.dev> <20260211125507.4175026-2-usama.arif@linux.dev> <13ab56cb-7fdb-4ee4-9170-f9f4fa4b6e37@kernel.org> <875x82ma6q.ritesh.list@gmail.com> <22d65938-4569-4e5e-8f30-bfe9b38b6493@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:usama.arif@linux.dev,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@suse.cz,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16846-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C85FC12F965
X-Rspamd-Action: no action

"David Hildenbrand (Arm)" <david@kernel.org> writes:

>
> Thanks! The series will grow quite a bit I think, so retesting new 
> revisions will be very appreciated!
>

Definitely. Thanks!

-ritesh

