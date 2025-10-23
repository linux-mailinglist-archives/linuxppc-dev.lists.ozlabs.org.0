Return-Path: <linuxppc-dev+bounces-13180-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C59BFF2BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 06:50:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csYWg64PTz30RJ;
	Thu, 23 Oct 2025 15:50:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761177941;
	cv=none; b=E+CLsaG+edU2yYwg+7vbGmnJnAERql/tlaZxcIthesBf4r1zorDe/2jeL9xdQ7mL35XwoGYrmChc9glS5VwpUI3NvWYZG5EcjJ0UWN2rqj7ZRW3yUWEfqBmr8Q4Ch2ELgBmB0gRSl0gBPM0cCPh+if1IdVrdO0KtZskNumDq+gZWxQN703BEZ6/Of5eOt1Ux6Qw2Njq2I9J8QaeELfortbUkttIxiccraD/fBGaycIiMvIAawpmgdY5qJyaecBzq9r/FHgjO2diTJJFdqZ1lpe6VwVh9NGXlGcP4LV842x618928o9EjYUqT8qmQe11Ky2Ly+lN/N+NgCHIqJE3juw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761177941; c=relaxed/relaxed;
	bh=YMUWYl+RTsVCov/vsPtkBuHUA9Ssu9g/aMZ+rIBItRU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EdBSuO4lHuLN48LSD4McOLIbag+BSyG1L9ZcMchsVnFTzxnwKE9gMsaTks7sWBcaho0TbIp/6UPQWOlirqZ2SVle1ZLuVJvKRIY/YE89mDu94uOfL3dYEYH+zVA1N0xp8wPijJBSEPl/FT46/S/FViYEwc5acrfA2LY/Q2qKprNEULEzNuO30UAHUoaEIvBzXbFf5fPkVqLMSR0gQ2dShZazy00cPcL2OToGtSZmF3wT2cQ3Q9QYipWY7wP1whxvsX58+JU3ctEFxRQEphHyWQ2jx0BRuHouGQ3Rmse9ZWLYZSnvdT8CJWSCYo2CN8hqZvZQ8ShfyhlcrjVkTbi3eQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dvWGjnx3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3uxh5aaykdggqatoeamuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--kuniyu.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dvWGjnx3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kuniyu.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3uxh5aaykdggqatoeamuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--kuniyu.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csRBX61dfz301N
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 11:05:40 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33d75897745so531774a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 17:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761177938; x=1761782738; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YMUWYl+RTsVCov/vsPtkBuHUA9Ssu9g/aMZ+rIBItRU=;
        b=dvWGjnx39sMq/CZGPcPvhRQpdnr6ZElPzjjWPud2gKFC7r7MpOuO3a3kZhN5lMGkPV
         3GVNXrTmFRMM4sL92U0DqxuUSW/3ZfLqUzMh4gXn6Rr2MwGbNq4QaYOfxD52gDsPHaR/
         nYdOd/O0fYer8lyDXRl0r/LdyO5h4sbMNXKqLIDRNh4TMrAt35Q98OEuL0gBxGmjSEZy
         +vG9wt9eelYo6mXoIzvD5yw8TFyE/4TDqhmL+3bmjsQbXv2meiIWpADFTbO84tsCDnKV
         oFvdecL2Rqh5uIW3g5aEvYcDXmOGiYQtKfadFVPQTdBVoaJpMNl8QrK1NAgyphC+Kmmi
         kV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761177938; x=1761782738;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMUWYl+RTsVCov/vsPtkBuHUA9Ssu9g/aMZ+rIBItRU=;
        b=eGwNZDzLd2qwLVWivDEn2Pft7GbORyFrohKgHJG8bdft/IcVrJAIQPDqNnnAcJvFAL
         eJUPPZ2F0+37FoOU3D+eUy1K0wmqqiZZOYhmlC7jYn4he5RzjVb+mUIzM8/iRHC9Vcom
         1E0Oy+U9JK706KouUWkVDkJFkIuUsNY2k8us2bObn4ijs8t6Xv5s2132LSmnTXDChfB2
         WvHSJa9jA84UASwF56330tgTG8O+8fHjfUn8L8lHEUwBtfqYN3Ae/UIkrGmcVFNWP9Tn
         JsEhrYAP/UIXyJ/fe08f9B8bYVxYFpi/AqgV7c+66UkM3O9/7UgHHhotRIuoM+LSyY3m
         fbTA==
X-Forwarded-Encrypted: i=1; AJvYcCXjy3W0srWJdcsZx+iwG8oooxAtmLJ/FeRCvpTPBngDjWacktW4at74g9KPklvODTe+Wlxp6+Zapl4FGk0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVEXLzb9RInGAkhASO1v6xn7h3gnBydwlxxB0z0SLfBQsonLhG
	KPuaGHG+MHO2PjYffgcnJ+eSv65mocUpn/EwjSjW1GpdT27mu1Jw4wJjIAf8YuPUVMlBAS2fu88
	y/iHEkg==
X-Google-Smtp-Source: AGHT+IF6lSdbdtyS+/t/fGvEsbBKEiGOc0L8/NdAr9Cp2dQPW0iljcBuf5Kq/IEP9uj1boUHsE/v/xDHW1g=
X-Received: from pjih1.prod.google.com ([2002:a17:90a:5801:b0:33e:28eb:7df2])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55cb:b0:339:9f7d:92d4
 with SMTP id 98e67ed59e1d1-33bcf87b8a5mr30997233a91.9.1761177937783; Wed, 22
 Oct 2025 17:05:37 -0700 (PDT)
Date: Thu, 23 Oct 2025 00:04:42 +0000
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
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.814.gb8fa24458f-goog
Message-ID: <20251023000535.2897002-1-kuniyu@google.com>
Subject: [PATCH v1 0/2] epoll: Save one stac/clac pair in epoll_put_uevent().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Christian Brauner <brauner@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Kuniyuki Iwashima <kuni1840@gmail.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

epoll_put_uevent() calls __put_user() twice, which are inlined
to two calls of out-of-line functions, __put_user_nocheck_4()
and __put_user_nocheck_8().

Both functions wrap mov with a stac/clac pair, which is expensive
on an AMD EPYC 7B12 64-Core Processor platform.

  __put_user_nocheck_4  /proc/kcore [Percent: local period]
  Percent =E2=94=82
    89.91 =E2=94=82      stac
     0.19 =E2=94=82      mov  %eax,(%rcx)
     0.15 =E2=94=82      xor  %ecx,%ecx
     9.69 =E2=94=82      clac
     0.06 =E2=94=82    =E2=86=90 retq

This was remarkable while testing neper/tcp_rr with 1000 flows per
thread.

  Overhead  Shared O  Symbol
    10.08%  [kernel]  [k] _copy_to_iter
     7.12%  [kernel]  [k] ip6_output
     6.40%  [kernel]  [k] sock_poll
     5.71%  [kernel]  [k] move_addr_to_user
     4.39%  [kernel]  [k] __put_user_nocheck_4
     ...
     1.06%  [kernel]  [k] ep_try_send_events
     ...                  ^- epoll_put_uevent() was inlined
     0.78%  [kernel]  [k] __put_user_nocheck_8

Patch 1 adds a new uaccess helper that is inlined to a bare stac
without address masking or uaccess_ok(), which is already checked
in ep_check_params().

Patch 2 uses the helper and unsafe_put_user() in epoll_put_uevent().


Kuniyuki Iwashima (2):
  uaccess: Add __user_write_access_begin().
  epoll: Use __user_write_access_begin() and unsafe_put_user() in
    epoll_put_uevent().

 arch/arm64/include/asm/uaccess.h   |  1 +
 arch/powerpc/include/asm/uaccess.h | 13 ++++++++++---
 arch/riscv/include/asm/uaccess.h   |  1 +
 arch/x86/include/asm/uaccess.h     |  1 +
 include/linux/eventpoll.h          | 13 ++++++++-----
 include/linux/uaccess.h            |  1 +
 6 files changed, 22 insertions(+), 8 deletions(-)

--=20
2.51.1.814.gb8fa24458f-goog


