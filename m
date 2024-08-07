Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974A094AF70
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 20:13:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NDkeZhMv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfJFk6kL1z3dKH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 04:13:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NDkeZhMv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfJF06DDJz3d2S
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 04:12:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CFA8BCE116E;
	Wed,  7 Aug 2024 18:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EB6C32781;
	Wed,  7 Aug 2024 18:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723054367;
	bh=ISPP/Y0DYUabn/g+gm+IohCoQEotWJ5A5dTGdvhtvq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NDkeZhMv+5Y731BeDVZK+3kSkdceaAQQrABiNMuSDB66BV//Tu/PyPXIvABMEopRg
	 Km8QsvqIvMXW7+CxiJ0BaCoZJQm+LZguhuXnn6D6jov2XTl5R6MZGgewoI0LBfAD11
	 PsyLl5/hHvoIN/LBQtukUUE6PJn85TLRAukcDy9rH4XoHcQkqQ+KVzPuHAUJqOOjMR
	 XNUkBK8IDAk5Ba5hW6WwaI8S3RrwGAQ0EOCeA7i8XCHaaV2gRNXd5afSll7ARSTw7H
	 kl3dC35FojRLr4ZeezVZc1iXtoaJeCGmL3ADxwag4IpUTDjpwLG4MgxIoQm2pXCDzG
	 eC+6EjBpsCUuQ==
Date: Wed, 7 Aug 2024 11:12:45 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Leo Yan <leo.yan@arm.com>,
	James Clark <james.clark@linaro.org>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Kajol Jain <kjain@linux.ibm.com>,
	Thomas Richter <tmricht@linux.ibm.com>
Subject: Re: [PATCHSET 00/10] perf tools: Sync tools and kernel headers for
 v6.11
Message-ID: <ZrO5HR9x2xyPKttx@google.com>
References: <20240806225013.126130-1-namhyung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240806225013.126130-1-namhyung@kernel.org>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Ian Rogers <irogers@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello folks,

On Tue, Aug 06, 2024 at 03:50:03PM -0700, Namhyung Kim wrote:
> Hello,
> 
> This is the usual sync up in header files we keep in tools directory.
> I put a file to give the reason of this work and not to repeat it in
> every commit message.  The changes will be carried in the perf-tools
> tree.
 
Could you please double check what's in the tmp.perf-tools branch at the
perf-tools tree so I don't break build and perf trace for arm64, powerpc
and s390?  It has this patchset + arm64 unistd header revert (according
to the discussion on patch 6/10) on top of v6.11-rc2.

Thanks,
Namhyung

> 
> Namhyung Kim (10):
>   perf tools: Add tools/include/uapi/README
>   tools/include: Sync uapi/drm/i915_drm.h with the kernel sources
>   tools/include: Sync uapi/linux/kvm.h with the kernel sources
>   tools/include: Sync uapi/linux/perf.h with the kernel sources
>   tools/include: Sync uapi/sound/asound.h with the kernel sources
>   tools/include: Sync uapi/asm-generic/unistd.h with the kernel sources
>   tools/include: Sync network socket headers with the kernel sources
>   tools/include: Sync filesystem headers with the kernel sources
>   tools/include: Sync x86 headers with the kernel sources
>   tools/include: Sync arm64 headers with the kernel sources
> 
>  tools/arch/arm64/include/asm/cputype.h        |  10 +
>  tools/arch/arm64/include/uapi/asm/unistd.h    |  24 +-
>  tools/arch/powerpc/include/uapi/asm/kvm.h     |   3 +
>  tools/arch/x86/include/asm/cpufeatures.h      | 803 +++++++++---------
>  tools/arch/x86/include/asm/msr-index.h        |  11 +
>  tools/arch/x86/include/uapi/asm/kvm.h         |  49 ++
>  tools/arch/x86/include/uapi/asm/svm.h         |   1 +
>  tools/include/uapi/README                     |  73 ++
>  tools/include/uapi/asm-generic/unistd.h       |   2 +-
>  tools/include/uapi/drm/i915_drm.h             |  27 +
>  tools/include/uapi/linux/in.h                 |   2 +
>  tools/include/uapi/linux/kvm.h                |  17 +-
>  tools/include/uapi/linux/perf_event.h         |   6 +-
>  tools/include/uapi/linux/stat.h               |  12 +-
>  .../arch/powerpc/entry/syscalls/syscall.tbl   |   6 +-
>  .../perf/arch/s390/entry/syscalls/syscall.tbl |   2 +-
>  .../arch/x86/entry/syscalls/syscall_64.tbl    |   8 +-
>  .../perf/trace/beauty/include/linux/socket.h  |   5 +-
>  .../perf/trace/beauty/include/uapi/linux/fs.h | 163 +++-
>  .../trace/beauty/include/uapi/linux/mount.h   |  10 +-
>  .../trace/beauty/include/uapi/linux/stat.h    |  12 +-
>  .../trace/beauty/include/uapi/sound/asound.h  |   9 +-
>  22 files changed, 810 insertions(+), 445 deletions(-)
>  create mode 100644 tools/include/uapi/README
> 
> -- 
> 2.46.0.rc2.264.g509ed76dc8-goog
> 
