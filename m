Return-Path: <linuxppc-dev+bounces-5378-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F50A15E70
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2025 18:59:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yb49x3Nd1z2yYy;
	Sun, 19 Jan 2025 04:59:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737223173;
	cv=none; b=fahErRKDh9rVRkRRW/rcHSehTHVNmoNmCt6J+hxWyEZmdWrn8Bjzx8CMWf4TnjvU+adnbr7iGQJbBebINeh6+cV3BIS2h65BQ0W+U0cyLR540b5FZE/Nk2cmpH1Lmi12DUgkWfMu7PEKfZ/ItHWsZFL+zXPFNjtLPBtbb7cQim9HPXcldViPXltH8EdsYkqNQdli2JFeJftdGAmS1xOmNRMtT0ddgPMSEmqVI10RsASZy8BvSmNuGz3TDTuoBSJ8WhpAxaHtbL8Zwz/pQ5wSTV+g1GsNzdf1EajzcBqx6JG+eLi5wd3ViGJPS8yWCb4+AsjMyNy/TVb1xlhnNwHofw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737223173; c=relaxed/relaxed;
	bh=R8CPaWKImj74AF3tLuTcPNVDOThAVEEzMAxFWGeCN5I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CyjwDDXkiGbZM8Pjkf8OZARbwWLRQG3l8LdSS7jqTNUyUgmQd4y3gs++esQ7yrynxY5lZxQvIAN3RYoX8BiUNXvvR+PD+0MUzFBs2HWG9xdP1RxTaK9gnNwzm/bx+d8zUGx4/9SS3Ln9HMr01k7Sm6XC/qjDTKkI1h0G+YtbHhM3HZjfFTWNqb5G4EvrB7lk/9ZiEjyPX7euqJVaqlsrYf2ZpL7yqCdLuWz/IZOl9MmVQta8J9iH83OpJOUrJZR9zvgWqtgxjqbrBaUVI2/grqweJdWTZWl9ArxrQj4ufWfkoSuGtFD+D/yxx6U9pCrQAOVsrGbu584T8WBY+RPgUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g3yW4Pkm; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g3yW4Pkm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yb49w2m3Mz2yXs
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jan 2025 04:59:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93027A412DE;
	Sat, 18 Jan 2025 17:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EA1C4CED1;
	Sat, 18 Jan 2025 17:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737223168;
	bh=V0FY+gqIgfN4D3E7+TqhT8qsOfNMrmhXpFpfH0hX1HY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g3yW4PkmbtYxErVnwIBR78TUPbf9PSOOMLEr6qvGU/71Mzm+e0JlU+xt5f3t/gGin
	 rW3bY2UETp8O/D2DS1AAdmrroG5fL2TCPgagXUo0SmDfAZaVQb77PfXPsy22pY3W2S
	 4/ItnuSCBlynlcvc9ND+Q3caHLzyQis4cRS7Lw7okTzaOONpRHPWrgcDgrG7jCda4g
	 8HagJNonwA+/NZxBarvxXqnVxVORgkBw9PnvhZ5mOI9Bl7cnUYp9yMw6FuPx+IjOkI
	 Dsz5OMaJJM0uF6bEX9x7fm1UlHfYuaLEQgihY4OxTCpkfHf1Lb+1tkKdjQAk6RpINN
	 G8JebkUwXMqCQ==
From: Namhyung Kim <namhyung@kernel.org>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com, 
 irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, 
 hbathini@linux.ibm.com
In-Reply-To: <20250110093730.93610-1-atrajeev@linux.vnet.ibm.com>
References: <20250110093730.93610-1-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] tools/perf/builtin-lock: Fix return code for
 functions in __cmd_contention
Message-Id: <173722316773.2826057.12496163001807331882.b4-ty@kernel.org>
Date: Sat, 18 Jan 2025 09:59:27 -0800
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 10 Jan 2025 15:07:30 +0530, Athira Rajeev wrote:

> perf lock contention returns zero exit value even if the lock contention
> BPF setup failed.
> 
>   # ./perf lock con -b true
>   libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
>   libbpf: failed to find '.BTF' ELF section in /lib/modules/6.13.0-rc3+/build/vmlinux
>   libbpf: failed to find valid kernel BTF
>   libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
>   libbpf: failed to find '.BTF' ELF section in /lib/modules/6.13.0-rc3+/build/vmlinux
>   libbpf: failed to find valid kernel BTF
>   libbpf: Error loading vmlinux BTF: -ESRCH
>   libbpf: failed to load object 'lock_contention_bpf'
>   libbpf: failed to load BPF skeleton 'lock_contention_bpf': -ESRCH
>   Failed to load lock-contention BPF skeleton
>   lock contention BPF setup failed
>   # echo $?
>    0
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


