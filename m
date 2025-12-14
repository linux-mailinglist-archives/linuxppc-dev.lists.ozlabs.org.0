Return-Path: <linuxppc-dev+bounces-14753-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB852CBBD69
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Dec 2025 17:21:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dTpNs3kTbz2xnl;
	Mon, 15 Dec 2025 03:21:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765729309;
	cv=none; b=EWA0gLrI4kcsbFSLYt3Ei9s4lnpGwcaIt6p9uoWRoyJeD7/P+EnMtreQxhefAlPGQ7yjshgRsvVVVDMfUTNkQlW335i2LYcw32lICoE+czfygSvS6/SzLAfoxmStZYGT3IcLPttcxMOyrBGCbcfXVsutl7VM8f9oSBdZyZ2A/90SOFhSDRI48JW2DhFSRw5xxPvWupC9itFJsOKPQcietOH6cPDDcJv6KnxyicIt8Xb7Hb0MUpwjzE4TpJqG6/Sn57cozzXzRn2gJaEZQt5/fcHMoM6Q/YjM5ShhA7PQuGxO56V5+t6ui8PvyW6XtrIfbML02JqOgDsZLnnRRKXIog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765729309; c=relaxed/relaxed;
	bh=yCYUJ8pl9FRuP9DO5eN8HwTNaZQZHzZq2dQ9SpjXEXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWYPTIgcxxs+y56JaJnqcp4ghGKRzdGFTSSHj1tt/pWHiGMLtqU9iQ7AX9S/5BiybjVRqfU7lK54Iq4TO4T9houNoRNeCT3RmS8biwG6oBLzC/yrCj+9JMcj8JXCtxlwl6CLgqyobrFsykMMY/UFvgcWBTU+hml0DO3eZtQ5+75ukpmWbbStn6hekTjxTN22n4CwOONjWJB5qKays/dHG9pX8zNIV33wnI/PzBFCqwZ4FthoR+4F1PTg4Lc8F64Jcymcv9/IMw5wDA/5LCPn84d8AYW+eSxtuk/3+bgJpYfV9FTzBau8xybTQtpf9GIRm5u5K5OgJ3l8dp63ttDtBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dTpNq3hDlz2xbQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 03:21:46 +1100 (AEDT)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 5BEGKJx1148156;
	Sun, 14 Dec 2025 10:20:19 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 5BEGKCM4148153;
	Sun, 14 Dec 2025 10:20:12 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sun, 14 Dec 2025 10:20:12 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, charlie@rivosinc.com,
        macro@orcam.me.uk, akpm@linux-foundation.org, ldv@strace.io,
        deller@gmx.de, ankur.a.arora@oracle.com, tglx@linutronix.de,
        thomas.weissschuh@linutronix.de, peterz@infradead.org,
        menglong8.dong@gmail.com, bigeasy@linutronix.de, namcao@linutronix.de,
        kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
Message-ID: <aT7jvN1u8P7XxQIW@gate>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-9-mkchauras@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214130245.43664-9-mkchauras@linux.ibm.com>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Sun, Dec 14, 2025 at 06:32:44PM +0530, Mukesh Kumar Chaurasiya wrote:
> 
> | Test            | With Patch | Without Patch | % Change |
> | --------------- | ---------- | ------------- | -------- |
> | fork usec/op    | 833.986    | 814.809       | +2.35%   |

What causes this regression, did you investigate?  Maybe there is
something simple you can do to avoid this degradation :-)  All other
numbers look just fine :-)

> | Test            | With Patch | Without Patch | % Change |
> | --------------- | ---------- | ------------- | -------- |
> | fork ops/sec    | 1,199      | 1,227         | -2.28%   |

(Same thing seen from another side)


Segher

