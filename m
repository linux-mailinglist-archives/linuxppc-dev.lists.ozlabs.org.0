Return-Path: <linuxppc-dev+bounces-5160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E71EEA0BBEC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 16:29:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWx4n53DQz3cY8;
	Tue, 14 Jan 2025 02:29:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736782153;
	cv=none; b=n9p3J84fbPaYB0PdPMYI6k07YZNcRLhdbHmvWt8qNghGxRUMXaExfQWvupteQR8xtuk6mW8dproJeXim6VyY38xYvirex4n9HfB73qOgxQX6BaYWR7rL0tleLAhftR0owpfHg8aifqyww0T1UV7mVffTcDeChaWC96lbM/iN40dLg4uGy6iLJ5sVJ0+JGot6gieAcpocZKm+IOtPJw2H37aBWvU54xFj0c97n1oTVvopNmC71/y9ZvddiV11n2x+RDAHD3PJIhsXXIq3P/OCLfudoVkf7+s6Y3v7OdvzjRC4swwZCQbkId7h9yxrNXTouk9EMArS82ulfzwPeCWAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736782153; c=relaxed/relaxed;
	bh=sMVLcm+McNkCvt38ShyWYQbBkcfJKl6/aDMhLayQArE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5Mf7R5GDilabq98DoGDlk1U+G5Z0GsVRM2DUDF30o3nPqZ5yfH2x4Ny79UG9snx2spPX15TID23fXGuajcfT9LCxwHKgBk3fzaXxG7VOa5P2liD/NUctMIPt6nSHZe4MENj/V7p+g9pMkd4h+vSR9M4UUl4B4iYddgB2IsMT/KsDwmvBEIV0h09qFOzSnfGEjRxDYqkF4PqYBBIjHnKCiyvw5adGTfyHBYdRp4WARFYnmSI2iPFUnng06BzUiHk5lhHWTR6s1AiphnvPjQ7+sRJdLlzK1CB0KQeL7hWVrlrhIVwE8IKfZeCSrhMoX17+Hk7S/isn4E0Ooo5vFBPgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ThebVNAA; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ThebVNAA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWx4m5pw1z3cWB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 02:29:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 243D9A41044;
	Mon, 13 Jan 2025 15:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A193AC4CEE3;
	Mon, 13 Jan 2025 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736782148;
	bh=Mad1urOLYXF3ULSZA3PhDLGLRiXSoF16DHteM4lHd8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ThebVNAAfg9N90RAsY7ktteyhw5L2dF120/5JUXRlrh3ADokjN/CEPb8vWs7dUPxd
	 /2zBHZmn70JTdMoABKHRABjzGGueRA5++NyGbQjJGiKl6n92ddtgQ+4c6SbidSFIyt
	 MsPmxlTO6f1HN81ICicPTv1IRLB7uc9Foi1myRtUKGi1NlH+1tvpsmfUg8ubsQve7M
	 gVywHQaQcuECjOJvdgOCOEqLZAfATtY8nI8JxTlHNgvo6SDvRFOFsNMdZyYUqnag5l
	 Qi/DExumUk0URN7pLdeARkr2HNVl8lE501vCaX6MHMfYmHYhfJnX3c+1gzCJ7f/IL2
	 YD0ug6z/05tpw==
Date: Mon, 13 Jan 2025 12:29:05 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, jolsa@kernel.org,
	adrian.hunter@intel.com, irogers@google.com, hbathini@linux.ibm.com,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com
Subject: Re: [PATCH] tools/perf: Fix segfault during perf record --off-cpu
 when debuginfo is not enabled
Message-ID: <Z4UxQSAKoLskEILD@x1>
References: <20241223135813.8175-1-atrajeev@linux.vnet.ibm.com>
 <409D0233-93FF-40D6-BC2E-B7625E4E1B97@linux.vnet.ibm.com>
 <Z3xKTKkVSf7tWCtD@google.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z3xKTKkVSf7tWCtD@google.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 06, 2025 at 01:25:32PM -0800, Namhyung Kim wrote:
> On Fri, Dec 27, 2024 at 04:18:32PM +0530, Athira Rajeev wrote:
> > 
> > 
> > > On 23 Dec 2024, at 7:28 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> wrote:
> > > 
> > > When kernel is built without debuginfo, running perf record with
> > > --off-cpu results in segfault as below:
> > > 
> > >   ./perf record --off-cpu -e dummy sleep 1
> > >   libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
> > >   libbpf: failed to find '.BTF' ELF section in /lib/modules/6.13.0-rc3+/build/vmlinux
> > >   libbpf: failed to find valid kernel BTF
> > >   Segmentation fault (core dumped)
> > > 
> > > The backtrace pointed to:
> > > 
> > >   #0  0x00000000100fb17c in btf.type_cnt ()
> > >   #1  0x00000000100fc1a8 in btf_find_by_name_kind ()
> > >   #2  0x00000000100fc38c in btf.find_by_name_kind ()
> > >   #3  0x00000000102ee3ac in off_cpu_prepare ()
> > >   #4  0x000000001002f78c in cmd_record ()
> > >   #5  0x00000000100aee78 in run_builtin ()
> > >   #6  0x00000000100af3e4 in handle_internal_command ()
> > >   #7  0x000000001001004c in main ()
> > > 
> > > Code sequence is:
> > >   static void check_sched_switch_args(void)
> > >   {
> > >        struct btf *btf = btf__load_vmlinux_btf();
> > >        const struct btf_type *t1, *t2, *t3;
> > >        u32 type_id;
> > > 
> > >        type_id = btf__find_by_name_kind(btf, "btf_trace_sched_switch",
> > >                                         BTF_KIND_TYPEDEF);
> > > 
> > > btf__load_vmlinux_btf fails when CONFIG_DEBUG_INFO_BTF is not enabled.
> > > Here bpf__find_by_name_kind calls btf__type_cnt with NULL btf
> > > value and results in segfault. To fix this, add a check to see if
> > > btf is not NULL before invoking bpf__find_by_name_kind
> > > 
> > > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> 
> Reviewed-by: Namhyung Kim <namhyung@kernel.org>

Thanks, applied to perf-tools-next,

- Arnaldo

