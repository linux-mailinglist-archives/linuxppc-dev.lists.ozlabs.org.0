Return-Path: <linuxppc-dev+bounces-16706-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dg3rICmhhmniPQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16706-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Feb 2026 03:19:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C3A1049B0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Feb 2026 03:19:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f7F5J5hyBz2xWJ;
	Sat, 07 Feb 2026 13:19:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770430756;
	cv=none; b=ifZ4N8TyP9chr1jHUQCogZTEbKuEH5hkuX+8y4Om5VqTNOwwsUkC9Awuw3+t5eG3k4BqbW9JoZ5DTRRmLiTWqL2cQO2eFhgNQDPNccx6Y/UH/mz8PRxGQiUH4MY3OywLjjV4NdyVufyAwC7B6Rx0iDfHbeVUeRM1F0tM9xS3P8kVIvb+O3suMZx8NpxTrXjf7OhcTHWDFct/J4g+wstwo8oHYi4KgRrZDzhqQQK6gkG6vwnvZhHjLAAKe6/W8x8JMLcy15an4sFJ4ho2y0i3tT4LaZQMNrwv7SnoMtEnXEb6XEpb+MHCRaa8rFhni3Ss3xWkqYTqMzijYRLP7rjR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770430756; c=relaxed/relaxed;
	bh=EAlJH2wdGLPJvpxRE2kPJnzarDPa5Sy3AlVNuwC9Hl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d13SH0imMXlrFyI+f+ASkkGD11M8jv1bIuyL7Khbx7lPLxcsteZ1XQ7/25UFQdzTEfsSnDQBzdYtSapQndAIf7qEMBvrZYpWKrdXTYSDVUU3AoWrr1y/FzAc6g3wRhOSiSod5vb1Cl4CCt15J/n0TCgBatGEnbvUeTGhHNcRMCZHilLxBfFIYG9WONdbYxOgZyeNN7WmZ8AO67bIJb/ukiVT2dy+Wo1ArA1MzE94fj3HeyHbb6buBQMajSlhSm/0K8ub24lxKlEHABUOtT8uKQV2xBQnnWtuZCkLGVqOi6kfNLo8DHpz+ZipJyOa35iIdaJt15P8IoHrKkpbVsNKMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=G6d7R9BP; dkim-atps=neutral; spf=pass (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=G6d7R9BP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 342 seconds by postgrey-1.37 at boromir; Sat, 07 Feb 2026 13:19:13 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f7F5F4GBWz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 13:19:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770430750; x=1771035550; i=deller@gmx.de;
	bh=EAlJH2wdGLPJvpxRE2kPJnzarDPa5Sy3AlVNuwC9Hl8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=G6d7R9BPsLjCLmrfO+mU8PiYMqURZ/QtmdtQeIYBmwQfLQ51gfBQh2BIJp4kU5mg
	 FfP4vSlwabrDQQ50oukh8cHdXcsmIovgCUWrS/8lKOYPmhF3SviWx0ht+TzYjRxeI
	 gbxn3ik4lcrsyNkNcbSAt05Jwcz283j3BsmmRvLfcQIOxSbeZP48+u6B6TBJ0vhcB
	 uGehUp5Ne9qqUN1ki8GS6B+nzt39i/gO1/JZ8HnmFRWJ5E1iVWn0jy1c1rHYuQjVx
	 r6ChL9Xsqdc0841HYTf8c/k3pXHmyVz/zE0QBFoWAFNo2Jcdy0BuSDHfR3odS+L4i
	 XpuWHbMK9YiOP9KKPA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.105]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MK3W0-1w6kOO0FGo-00SaWY; Sat, 07
 Feb 2026 03:13:18 +0100
Message-ID: <aa9f72af-55b8-471f-afd2-5fc7f2328ba3@gmx.de>
Date: Sat, 7 Feb 2026 03:13:14 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-unstable] arch, mm: consolidate empty_zero_page
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20260124095628.668870-1-rppt@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260124095628.668870-1-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ckJ9uICnC2KzZfMGScbkszoe3tJwid4EQMcHnKznQaIeHVj3lHk
 qEWVv45ooVrZf6199cKjQ2UmjQ1rTQ5GCIFqDFI/cBIKZm80I/jl8rSgthy5cMlQKPshHCe
 wABC6qDRcrsFfS+JPelc82LDtGJ4jgKaL1tZBup+OSqgzB/1iY0VBf2qQwt4HUEq8N1kLRl
 UfiVpP6RtvApG+R5VLKnQ==
UI-OutboundReport: notjunk:1;M01:P0:nogGqJ7olXE=;TQutSSN1ERoGNPcIMic6Zc6xr09
 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
 j0/Cfej3cTvUte8wI=
X-Spam-Status: No, score=1.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:akpm@linux-foundation.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16706-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_FROM(0.00)[gmx.de];
	FORGED_SENDER(0.00)[deller@gmx.de,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,gmx.de:dkim,gmx.de:mid]
X-Rspamd-Queue-Id: 00C3A1049B0
X-Rspamd-Action: no action

On 1/24/26 10:56, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>=20
> Reduce 22 declarations of empty_zero_page to 3 and 23 declarations of
> ZERO_PAGE() to 4.
>=20
...
>=20
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
...

>   arch/parisc/include/asm/pgtable.h         | 11 -----------
>   arch/parisc/mm/init.c                     |  6 ------

I reviewed and tested the patch on parisc, so:

Acked-by: Helge Deller <deller@gmx.de>   # parisc
Tested-by: Helge Deller <deller@gmx.de>  # parisc

Thanks!
Helge

