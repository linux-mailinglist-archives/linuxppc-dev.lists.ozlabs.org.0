Return-Path: <linuxppc-dev+bounces-13182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA75BFF2C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 06:51:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csYXC3tQLz3bfF;
	Thu, 23 Oct 2025 15:51:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761177944;
	cv=none; b=KsuhkgwGZ5cba7MLpA9CdSX9tSiGkFRjxlyrLaNbQmSo2v1sUzEl+DqirMEVJn9j4EWjsooMBfQS1IJ2aImlIp6KvWWnhFkJjrBHCI+fduSFn908UElamAs5OXD35VrRmRtUrVD6NjlBSypnEJDEV4VpmCDw4iNs3X3gZ61MwQ87883ULBs1Vjh9Kwdg2kBo37y98/t9DDOey1P+v2FGjDiwPGR+Qrpo3/35L5ZnAx7WHX4GTdwmwQS8CSUOXgsbnhdIx9gLgYAqNBhw5xWrgb5yJDgBYMDWL2lhC7zFY3eaiu10mXT/1Cptc4jl5Scmydhue9iSJIjYG/DUM4nS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761177944; c=relaxed/relaxed;
	bh=lzZENSWUwrBhAA1CxL4i/AxbZEWI19mQXc700MJvOfI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NUghYCgrJVasIXvFlBeWKqHYNnCGyWA6FRKDfpmGv7M2or4gFwvKiCmHOMp67oxiV1X0w75fpH7ebwXSfMGOYEfQ10MZBBJts99enwKeaBF4i7v8aqt3Tunp4GtM4K0pZ5+bGIZodkZoV5fsewMatR8Muf38ehTcs/wFNDK02N/xmee3jKeLpwsUyFfQSmWfQgN7m6mx+gKdk3mO4s9db7pHTIg0jQH/0l8jXLNFwvDrBYdcDOCO/aW4svSf359l2cN8goYyzAA2P0QpDCrX9fTxUo4qLtA1TGnQVrk0QCPiMiFPVF27QvgArJ4IEzhix9V37lnDQizE6+NkwdcxTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4TJ/zF61; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3vxh5aaykdgwuexsieqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--kuniyu.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4TJ/zF61;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kuniyu.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3vxh5aaykdgwuexsieqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--kuniyu.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csRBb61gNz306d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 11:05:43 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33be4db19cfso423125a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 17:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761177941; x=1761782741; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzZENSWUwrBhAA1CxL4i/AxbZEWI19mQXc700MJvOfI=;
        b=4TJ/zF61J9dtJhR3my65VdGhqJoolwGz0M4+X+PfyjBn98diFayMMZbX75JOYYM15h
         XQGmsioxjpPDumpMcw7mrwmitJSyj1Zg4M/1CIdJXALcX6BVl4XQbN+K4x/g6CeeIAOC
         LwJ3ha0/PCr5Dg9k2JqgKWegwuLVsQW7x4TkJuTmbTp5Sn4YvWfITHZgoHSENubCtGZk
         gcrWvcnD1F8VJ49UUHJ8PY+3hISiUY4CsSZPMU76D7ZvSdIHvXxpIp9aQFqCmU75qsKZ
         kMGcyHdOj91Yl+oqsf00HVFODAy9/9XfF1odlFwIqPi2rW0jEl8OhScgyzOLeC8L2KWX
         egWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761177941; x=1761782741;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lzZENSWUwrBhAA1CxL4i/AxbZEWI19mQXc700MJvOfI=;
        b=nJIouh0iWYCmo6ykFMCBu/pVKFU8lMjUegoksnsRbhBL/eUC0uD8UV5XOencQQC1Ko
         nbeS1O60QI3nKUI5AMkliLVkzrPzqyFu2cBPKgt6xKwLiAz9D3e08DAyp4BEiUfJRJ30
         uRWWakRIDNku+b7dSB1Os9k98lVtEGkx/FW3gY5nQk3yqUjkaC05EV8G/8lTH1sVRMhe
         gXdo9dWyQc8VzAa/WnTdk0QHn78yQBZvbuU8DCzCgXDR6uzmUQL3vgNQl3NU9RVC/Mme
         PZduds5ygPlarp975MrHW6bqp/yn1wAxR941vR/6iKi4tBoUyWiD1OhaGevztoxmk0g3
         I6yw==
X-Forwarded-Encrypted: i=1; AJvYcCX7/7+zxljY5Rp8+01Kz+bdYBTINWCocI21w6zeFW8KPE8/AWrWDVM4jPp0xWA/Ae+Li4Xo8Q2JH33L0sw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxajowMdZAL7cG55OdXrHYC0V1QZoCin3kAP/gXRlvEIFiXQ4hj
	0QcUuTg2G+yyZZs0/sqgN8H0ndSfrKU7gGtyLKhExxv8QxB1/52ME3Mc62svITwwaKHJov18viR
	HB5nvQg==
X-Google-Smtp-Source: AGHT+IGd6U9IlxxZkQUE9in6Tsw30xR2bnzy7O0+0w49jme5smP7pCaW5imecIRz7OgZNwNV7y77C8X4JZs=
X-Received: from pjbco18.prod.google.com ([2002:a17:90a:fe92:b0:33b:51fe:1a83])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c05:b0:339:ec9c:b275
 with SMTP id 98e67ed59e1d1-33bcf84e181mr33310671a91.6.1761177941265; Wed, 22
 Oct 2025 17:05:41 -0700 (PDT)
Date: Thu, 23 Oct 2025 00:04:44 +0000
In-Reply-To: <20251023000535.2897002-1-kuniyu@google.com>
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
References: <20251023000535.2897002-1-kuniyu@google.com>
X-Mailer: git-send-email 2.51.1.814.gb8fa24458f-goog
Message-ID: <20251023000535.2897002-3-kuniyu@google.com>
Subject: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
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

Use __user_write_access_begin() and unsafe_put_user() in
epoll_put_uevent().

We see 1% improvement on tcp_rr throughput by just saving a single
stac/clac pair.

Another option would be to use can_do_masked_user_access()
and masked_user_access_begin(), but we saw ~5% regression with
unnecessary 3 operations for address masking, which is already
checked by ep_check_params().

Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 include/linux/eventpoll.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/linux/eventpoll.h b/include/linux/eventpoll.h
index ccb478eb174b..efc0aa2d496f 100644
--- a/include/linux/eventpoll.h
+++ b/include/linux/eventpoll.h
@@ -82,11 +82,14 @@ static inline struct epoll_event __user *
 epoll_put_uevent(__poll_t revents, __u64 data,
 		 struct epoll_event __user *uevent)
 {
-	if (__put_user(revents, &uevent->events) ||
-	    __put_user(data, &uevent->data))
-		return NULL;
-
-	return uevent+1;
+	__user_write_access_begin(uevent, sizeof(*uevent));
+	unsafe_put_user(revents, &uevent->events, efault);
+	unsafe_put_user(data, &uevent->data, efault);
+	user_access_end();
+	return uevent + 1;
+efault:
+	user_access_end();
+	return NULL;
 }
 #endif
=20
--=20
2.51.1.814.gb8fa24458f-goog


