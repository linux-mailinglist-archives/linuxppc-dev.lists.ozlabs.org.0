Return-Path: <linuxppc-dev+bounces-5681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3800A21DCB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 14:22:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjjVg20lLz2yD5;
	Thu, 30 Jan 2025 00:22:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738156923;
	cv=none; b=AxHut4PLmqQtpwnT8aw78bdcxACAmFoZ9pPUD0bpy3gy908jLnTgp8/15Tw+D5BQo4XFAJLWQHnnivR/rLULiue8SF8TEZ/2EH1WChypBRd+EF9KEbOmnbIRk0MSWai2a6PK0/rwcemPxa3WAAksZmEke9dSNhLycykgp77lbYjHQ8KYMUKpQT84HFm0B8LJ7EyeZGzuvQXWItogpf0ERmFBIMwG6UuFTQHN6rJVDOqaVjkhGdDmHQ438J3+3RZvsv0xFm8LZJh19xjnCEMjx0bL7E4eFL+3ApyoeGIJhXAK0vtCL2yKwyT0Hy1JxSdJIRb4gz4S9XWQb3psii4l5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738156923; c=relaxed/relaxed;
	bh=HX1TkHswfT325KOgLa+jpVFqKADYpAnjaP7bwf4ZtvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RdPuJMSVT0Z3Tlx1VZBDD2wt9GckAE4T8HtjNcd0AtSC839o+oBgC7yOz6wnjSOEDnLO/RzU/NXoQku/pb7PqMOxdg148vwk9E8tegNfLVuaM+zyU+6U/AKnzv+FmLYGu0KIRjn+zkzrzk+U5KIhLmxtBXgDJacY4I4cRVbFCksVGpjPXdQcXUwirvXBy45I7BXPnzqyFai3uLlDnYPqZh09V5jNCjmM8Yc0BO171Z73ObiZhIp+Q0HmSf5UdHLyNyC00dLRVZ728HGObjaH0i3+p/xRdcFvL7M8Iv4QihLU9YNNMnmjhDoX3vPZab4Uqj4uTS+SqO9TU7DOem3yvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VsJqzBxz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VsJqzBxz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjjVd6ZfTz2xYg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 00:22:01 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-215770613dbso87232275ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 05:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738156920; x=1738761720; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HX1TkHswfT325KOgLa+jpVFqKADYpAnjaP7bwf4ZtvQ=;
        b=VsJqzBxzN3O1wPkRx7foBiCiUisQZaXvcOIWbYkdKv9/9BrQMNloFtWxI5ciuv8MTm
         n6eHcQPSceKgKQdNQUBg5nfdBUZEW0dcQjXqtXdLW9JZHQCyOz2dCm4nzDJ7EVGxEobJ
         yZQV/Bbm0p5ryDOeJiZWId6agm9/tIC14iJSUKHCA2+Ik58Nbgq08xPjz4w6w8xYCyWe
         LptP49QuHvEgVj6j2hotCYC/vVD/dOTKIN8th6PLPdkHEeH2f19xeISqgVpEoG4v4Cvv
         wUmRl6LBCSSKfbKJxRWVgah/TpVTzxU1ZISjQLvoCFjRprT7ndB15YovGh7NhwqSOlVZ
         VAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738156920; x=1738761720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HX1TkHswfT325KOgLa+jpVFqKADYpAnjaP7bwf4ZtvQ=;
        b=JxXQEmuM3HawsnrysX9WqkbQAu/sL50G9GxSU5JsP23cPcgc/jrGVvOLwNZgPq5NBz
         5iPCqxcq3tQUL173bsSgHBsJfZMkB/d1dEyZ/9bXv+EgO2TnDi23BfudhsfSp/iJ7oba
         ddYRieTGkTIiud9tuMFWuhQAQO5XK3cY1rp7df8kEubmChyGBCTK7mJ7hsmETMuOL1uB
         kPyo0pD+oapn90Hyc4p7/9Y90iLQ7km8jE5KhBGv9+/XqDa/rZrKTSBiK6dCEwJbO9A4
         gyYPjJ99V1EZxhadT8/bDtI/AnPBLTf5ayPHo5dv6eTV1KKWS2N6P5dUCQaTNpPJyYnq
         qJOg==
X-Forwarded-Encrypted: i=1; AJvYcCWb5TSdsvVQAKmqvBD010V9xzAjQBzpG8ebAZ/tdEHu+K6+aCHGj5KlUCtSvsX0qTh1+fHesFECSMR/16s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwChrYe6Pq+Rt6dpJ8rwGdVrvszNZKDY+Lt6uqCd4rN7gEK+uvg
	PEXDGPftwmz/600Zgf2RGdTJAbdzGWHdlNUkLY10XxxmP7p/hDkknI76Hw==
X-Gm-Gg: ASbGncuJpwUBuc2QsXs1Jvx2V/0LjHqQW2rRS5GSifZ3xd+RnXTX4hnfxD2+HPmdz1v
	HjgxsXOOtrZVKohycaCXA4cIGlUMuGnPOD2dQFdOUHnOkmVi1e23+WdvKgq4w+35+6+17anmShl
	N5SyGPoKPs1ZbCRapxWCEOhLnc+LXbqmcI2orWFekrZaqj/yn18hOEDoJzEkfI+IxgYhQFzAVOC
	sFSVsiJ2ToiFoJO278U0GnSuFDap1lzlOatJzLamlEdXUftFMtUMttGlVGkL+ifcEJ+1fM/Uzts
	J0YxzoTBX0qtXy+yxsJ5NcjEI7O9f75rtwxBdaSFLhCLtBys1A==
X-Google-Smtp-Source: AGHT+IGNZ+4sXAE9vj4IFlC2EXBWvLaRHv9Oiar/2blCQ1GBjBPs9Irv6Mh9HPXqMcWBqz4u+zX/7w==
X-Received: by 2002:a17:902:e742:b0:215:a97a:c6bb with SMTP id d9443c01a7336-21dd7c65891mr47442355ad.12.1738156918464;
        Wed, 29 Jan 2025 05:21:58 -0800 (PST)
Received: from wheely.local0.net (124-169-212-233.tpgi.com.au. [124.169.212.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414131esm98984085ad.157.2025.01.29.05.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 05:21:57 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] powerpc: change syscall error return scheme
Date: Wed, 29 Jan 2025 23:21:41 +1000
Message-ID: <20250129132148.301937-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.47.1
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

I've been toying with the seccomp vs syscall return value problems, and
wonder if something like this approach could give us a simpler alternative.
Basically all the core code uses -errno return value, then we convert it
to the powerpc convention at the last minute when returning.

This seems to pass the seccomp_bpf test cases when applied with the set
syscall info ptrace patches

https://lore.kernel.org/lkml/20250113171054.GA589@strace.io/

With patch 1 of that series reverted.

One concern is working out exact details of what tracers can see and
trying to ensure it doesn't break some corner case.

This could possibly be done for the other weird archs too, if it works
out for powerpc

Thanks,
Nick

Nicholas Piggin (2):
  powerpc/signal: Clean up pt_regs access
  powerpc/syscall: rework syscall return value handling

 arch/powerpc/include/asm/ptrace.h             | 13 +---
 arch/powerpc/include/asm/syscall.h            | 31 +--------
 arch/powerpc/kernel/interrupt.c               | 16 +++--
 arch/powerpc/kernel/signal.c                  | 67 ++++++++++---------
 arch/powerpc/kernel/signal_64.c               |  5 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c | 16 +++++
 6 files changed, 69 insertions(+), 79 deletions(-)

-- 
2.47.1


