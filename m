Return-Path: <linuxppc-dev+bounces-4730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C062A03204
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 22:25:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRnKG0lpFz2yFK;
	Tue,  7 Jan 2025 08:25:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736198738;
	cv=none; b=H6Ely7tLJ4FfeevBOMBkxf8L4QPikktGCWt+3DWpxcLMf06TIQHImfrnzHIenPm4AuH1x9ZxE8cgyNhXKfrKk+GP/s/BI4XmD/H5TzGTpBo0QrrEUgmONhp/oaL8JGUNQCfrkPiADFLZieLxKUEpFTfm2jq8re4eVhpTnFwdFU8wU7/SUazLjXxgx4mqpT3RIg734O5TVPxKFRfSiTb5pJvGlyc0tLiWIgScwmye9fkAScNB/2FkzS0fNCtj2PmT9N6HTYcjMhiK3aCXoc9gu0XOLvfFAyfzSgM20kuhznSHpiTGNJJ0YQQ8Wn2c0bMf715j+sadMWyaUXAxNBIf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736198738; c=relaxed/relaxed;
	bh=qFu0B9L0DMFJYDH8yCxprqXxYynQ8MtPqu+wyChHbzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dU3nk/FINfPkkW3tg/JIRhb3M2r4dmKp4vaeTc9xrTB1/QM2otLL7mKcdQ+ZCwFdevH9tHLp8IZ0AhmJelR0lkp2In2Dw20UxutbxbejU6nGDf/ocHduA8cGWczO+aN1uile7KXTXBrpc5wIVNCcNnSbiaocGa9QcK0y91s6w2GfuZ+pLmQJSZGrUtx0mIQCWKkOgAdNX3RJVgy85nTfqu5ZaHwxakuhdg7Os3dN9kto6dqQtFP7blYxDaqzr/yIqOIlNkVtn8CLHF8WAwwT8Jsi4HRBGUqlODSrwrXxUkrSFiSsLPIT65G3ory2jZxKQLOLT2pR1O++Z6ujE2ln8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t2gJQqCa; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t2gJQqCa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRnKF08KLz2y8k
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 08:25:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F1F85C5F18;
	Mon,  6 Jan 2025 21:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09358C4CED2;
	Mon,  6 Jan 2025 21:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736198734;
	bh=hi1GMaWRkgQ+46UxxVoQ3+2NmjCT2Y5rvyleUJPSy0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t2gJQqCaXjOVITG6+z2iI7AUZ1q5sJ+NaMpfM3nks3w42avbACcCaVuKGG3FHpMIh
	 KYlNRBYYYaI/yo6n7bRcgAq6Y3gG5nHBPtYVqos9+Wy9SKm33PIsfSxH+jdR4XRRBr
	 iBGGzgGEHcu/P9d1VClrMQTt7A/pdbnXXtKQgXx4clkCemiw5GTjmslFlnhn8dXa+h
	 fDWN3c/07GcMYEm8e5pVo64g1G1SRNVX6xqmNrNgafudSHv5ZxITmop66fOJj7ANGP
	 8+UsNNDKVsY7jszAY4G96rzt+fMn5XM+jJPhirQHDTQaEwJJgynY1hNkPSUV62OLsI
	 98oAfaD4qAV1A==
Date: Mon, 6 Jan 2025 13:25:32 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
	irogers@google.com, hbathini@linux.ibm.com,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com
Subject: Re: [PATCH] tools/perf: Fix segfault during perf record --off-cpu
 when debuginfo is not enabled
Message-ID: <Z3xKTKkVSf7tWCtD@google.com>
References: <20241223135813.8175-1-atrajeev@linux.vnet.ibm.com>
 <409D0233-93FF-40D6-BC2E-B7625E4E1B97@linux.vnet.ibm.com>
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
In-Reply-To: <409D0233-93FF-40D6-BC2E-B7625E4E1B97@linux.vnet.ibm.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Dec 27, 2024 at 04:18:32PM +0530, Athira Rajeev wrote:
> 
> 
> > On 23 Dec 2024, at 7:28 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> wrote:
> > 
> > When kernel is built without debuginfo, running perf record with
> > --off-cpu results in segfault as below:
> > 
> >   ./perf record --off-cpu -e dummy sleep 1
> >   libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
> >   libbpf: failed to find '.BTF' ELF section in /lib/modules/6.13.0-rc3+/build/vmlinux
> >   libbpf: failed to find valid kernel BTF
> >   Segmentation fault (core dumped)
> > 
> > The backtrace pointed to:
> > 
> >   #0  0x00000000100fb17c in btf.type_cnt ()
> >   #1  0x00000000100fc1a8 in btf_find_by_name_kind ()
> >   #2  0x00000000100fc38c in btf.find_by_name_kind ()
> >   #3  0x00000000102ee3ac in off_cpu_prepare ()
> >   #4  0x000000001002f78c in cmd_record ()
> >   #5  0x00000000100aee78 in run_builtin ()
> >   #6  0x00000000100af3e4 in handle_internal_command ()
> >   #7  0x000000001001004c in main ()
> > 
> > Code sequence is:
> >   static void check_sched_switch_args(void)
> >   {
> >        struct btf *btf = btf__load_vmlinux_btf();
> >        const struct btf_type *t1, *t2, *t3;
> >        u32 type_id;
> > 
> >        type_id = btf__find_by_name_kind(btf, "btf_trace_sched_switch",
> >                                         BTF_KIND_TYPEDEF);
> > 
> > btf__load_vmlinux_btf fails when CONFIG_DEBUG_INFO_BTF is not enabled.
> > Here bpf__find_by_name_kind calls btf__type_cnt with NULL btf
> > value and results in segfault. To fix this, add a check to see if
> > btf is not NULL before invoking bpf__find_by_name_kind
> > 
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Reviewed-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung

> > ---
> > tools/perf/util/bpf_off_cpu.c | 5 +++++
> > 1 file changed, 5 insertions(+)
> > 
> > diff --git a/tools/perf/util/bpf_off_cpu.c b/tools/perf/util/bpf_off_cpu.c
> > index a590a8ac1f9d..4269b41d1771 100644
> > --- a/tools/perf/util/bpf_off_cpu.c
> > +++ b/tools/perf/util/bpf_off_cpu.c
> > @@ -100,6 +100,11 @@ static void check_sched_switch_args(void)
> > const struct btf_type *t1, *t2, *t3;
> > u32 type_id;
> > 
> > + if (!btf) {
> > + pr_debug("Missing btf, check if CONFIG_DEBUG_INFO_BTF is enabled\n");
> > + goto cleanup;
> > + }
> > +
> 
> Hi,
> 
> Looking for review comments on this
> 
> Athira
> > type_id = btf__find_by_name_kind(btf, "btf_trace_sched_switch",
> > BTF_KIND_TYPEDEF);
> > if ((s32)type_id < 0)
> > -- 
> > 2.43.5
> > 
> 

