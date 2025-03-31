Return-Path: <linuxppc-dev+bounces-7397-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB188A766B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Mar 2025 15:19:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRBZ23lNMz2yf9;
	Tue,  1 Apr 2025 00:19:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::444"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743427194;
	cv=none; b=FPq2qE9mztXVespjMlaE35dmMFyGfiogKamxzhwlCPhZESam1bNOVqqgUTW6WLJH6txQXaCeZwO59mkSJggGhe6ANBtieXhqajQefcUXins4T/TcnMesTUIo/AVzOS7BwW4k97DuuFpcqsBqBx/9PN+gUsOdm/OPLKTBBSVPLjjIR/QzbhR7whk4LWbevM9W3yLPk8H0GPH4pUFnQZsnshnNpvTNe379MoyBhimYchxj+ySFbO5E3EBRC0Qnp6I6V336j1UDRG7qeb5ul4ApvEA6LGpBLtwaAcOH3xwb5vSPrCLHeZp4dxjhE61k/7xUvmR1KozDgsasInGFATRzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743427194; c=relaxed/relaxed;
	bh=YcmYk5PTzxCtOJOaVVP5nkeOuljxOTS0F0qSnk/8Fxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kZ5Slt9g4tx9q7xeZyxorXUHnirmfZhehFSNFmAkaVs4IJgb/mrSXWLj/iIkYMV1aExGZ/qMjATtQlprZLoy33/TD+peTIRQgWAEsSVqOX6gFwXw8ERaQuZQSZ4DatbqhErhkmADjj40fib0Dw8E7jpPSdn3fYEaCHxr2gBKQK6ROZfiYzD1LFfIwlBZpaF3duDU2BvJ+aSYZtxnGK8FtzIpwYuNoCO1wMTSwrHX3OG+UTzfH/pRNrD/kpgNn+rpBXr/urqTVpKiSfXuA7OeTKjk5zNhWQi2D+B+nAPbutyICoS4eBeHWtL5EeWbzLc0SxqFjX0aIYTWHVd1I4gafA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fNi0kh21; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com; envelope-from=shung-hsi.yu@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fNi0kh21;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com; envelope-from=shung-hsi.yu@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRBZ11Smxz2yf3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 00:19:51 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-399737f4fa4so2183341f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Mar 2025 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743427188; x=1744031988; darn=lists.ozlabs.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcmYk5PTzxCtOJOaVVP5nkeOuljxOTS0F0qSnk/8Fxg=;
        b=fNi0kh21biYGb+jahhPD1Uho/RkdSOX+Y6xRAIXQ/y/1ee+nS5ZOo20H2kdOj+jiUw
         +3rXXnql/Ve3SKbx22n89BXzKdlaqHw5DvlN4hw50PsS/WPJNxkzN9fh96LRfQdqN73M
         TiCswR+u1icm6QPcKrxLHsfM4Cdeytwb7nc3At0AgUVZiOBZZgmam/YzQ06FkOFgz7Wn
         b9H2kO/IXNPrCE8BM8g0xDSR8rGeNukiIoGe9VHZ/RTpZ8ii/ubIecNyPO79/SSD5qBm
         VTFpmq2vzxiTxnx7+US60kUYNP94YfmwUCKXN4tJwHRIsVHF3U7vN5B6wpJ2CJZ7M5yH
         aXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743427188; x=1744031988;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YcmYk5PTzxCtOJOaVVP5nkeOuljxOTS0F0qSnk/8Fxg=;
        b=KCa9NvneeaW+J1hqZVTSJrM7nqn79Q+oIcmOr2dvYHPT87C8SMKfTjChhAEFGyZqww
         PK9QC51J7220dP+3QJkJhxa/JTBfk6Nm+zhYohF+WWBcUuNNGODqMlLwK4e58qQfP9a8
         rHBS3do80vyRy+g8Oen2EkSuS36Z1eYc4VA2gF5zWoPtxzHOwiC2QXllU4HeqtQ2qL6+
         dlfzhJe3O7lWehmzXWDFJvNh4tyNlZ3kLmfdbOHkuyNRU+azKDOvi7LPSXdTiePhyykP
         vRmORukWzar2B7PWqPGogVagA23fWYh2lddg//dgR38imCqMgOz2NUiZvUCY9v1gwJTZ
         iT3w==
X-Forwarded-Encrypted: i=1; AJvYcCVSG+v5sHHvimouQ+VxgFaaxbZX4gRK/gxJMjA4RcjALq1pQE+mZKfDKHU7YDrwt4P+eLcEouA7A+s3hxE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyTG7+Xl9fuLwP/cSXe5vGCq2Vr0jdwGe3p2KTp7fo38Q1Kb2RW
	Yk5+KKcCW0GEJpEYzrGvRW05+rUqgJgfE33epegVnZd7UJPQiYgDgyN/cZHmRYk=
X-Gm-Gg: ASbGnctIIqYlWPttotWUjy7USmLoIAH8ismMRjv74EJ4Scnb/NhD38BfC4jCpBAWnsx
	mcRPLkxFP9rLm+JakNbj2Pz7uEnXVoz6wQ/LRCARyQ7sQHmy5LpDTAUKoKO6VH/rEc8HhUEpS7h
	uKn/gVy7LORtha3Wlm+TceoM5IRv0dRzdSOnVOhkThJWlxRkNPDns5di2W1n6HfH4X5E1tQMiAp
	5n01btnEJyz8kdiVAjaUQEIDhVIe3HG1vrd+Q5nKpCuhoDZYskpXXjJQkjeThhQbdJ2T58gfDnH
	Lfctk1hKZjTht6n+J0STerLD8JpDmM8gR1dGwJQy+GxiE+QLQSRnVSy9reaDFYcYpnQpwWNt7hu
	GwmyZsGvda1fjcChX26R8N3tLpL6/LVNyw+PM4g==
X-Google-Smtp-Source: AGHT+IGZqmArJyrihK4euVLU0horXdZgOg53706JbhiZUWs5TDnkpgzuRWwj3lskoRyG6Hkk8G0VLA==
X-Received: by 2002:a05:6000:2b06:b0:399:6d26:7752 with SMTP id ffacd0b85a97d-39c12117ad8mr5124011f8f.38.1743427188556;
        Mon, 31 Mar 2025 06:19:48 -0700 (PDT)
Received: from u94a (2001-b011-fa04-3f62-b2dc-efff-fee8-7e7a.dynamic-ip6.hinet.net. [2001:b011:fa04:3f62:b2dc:efff:fee8:7e7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dedcfsm68393265ad.193.2025.03.31.06.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 06:19:47 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:19:36 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: "Naveen N. Rao" <naveen@kernel.org>, 
	Hari Bathini <hbathini@linux.ibm.com>, bpf@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia <vishalc@linux.ibm.com>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Miroslav Benes <mbenes@suse.cz>, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org
Subject: [BUG?] ppc64le: fentry BPF not triggered after live patch (v6.14)
Message-ID: <rwmwrvvtg3pd7qrnt3of6dideioohwhsplancoc2gdrjran7bg@j5tqng6loymr>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi all,

On ppc64le (v6.14, kernel config attached), I've observed that fentry
BPF programs stop being invoked after the target kernel function is live
patched. This occurs regardless of whether the BPF program was attached
before or after the live patch. I believe fentry/fprobe on ppc64le is
added with [1].

Steps to reproduce on ppc64le:
- Use bpftrace (v0.10.0+) to attach a BPF program to cmdline_proc_show
  with fentry (kfunc is the older name bpftrace used for fentry, used
  here for max compatability)

    bpftrace -e 'kfunc:cmdline_proc_show { printf("%lld: cmdline_proc_show() called by %s\n", nsecs(), comm) }'

- Run `cat /proc/cmdline` and observe bpftrace output

- Load samples/livepatch/livepatch-sample.ko

- Run `cat /proc/cmdline` again. Observe "this has been live patched" in
  output, but no new bpftrace output.

Note: once the live patching module is disabled through the sysfs interface
the BPF program invocation is restored.

Is this the expected interaction between fentry BPF and live patching?
On x86_64 it does _not_ happen, so I'd guess the behavior on ppc64le is
unintended. Any insights appreciated.


Thanks,
Shung-Hsi Yu

1: https://lore.kernel.org/all/20241030070850.1361304-2-hbathini@linux.ibm.com/

