Return-Path: <linuxppc-dev+bounces-7970-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8697A9BA20
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 23:47:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zk8hx3Qb2z3c00;
	Fri, 25 Apr 2025 07:47:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745531265;
	cv=none; b=KLztnt4oTulXR7fra5TWdyEVPFI6rJsGG3WxXtnyCdTjXZKM1yUhe/lrrOWfP+JuYMU47ot20Yha+f/kzv0hkZIbLGX/m3pNBJR03X+AfQ9K/mp1ptPXpdOVspOq9pljB/u4cMSkLPQ87GR38l7bM7H72Q2xSpy8r0ZZ9Fu8VWdpGnqzlo7K2g/sUD8PEMZKAzBUs3tAg4hVNwMLR16BGpvKe9NYL4eTr+kY7MAvcSotWqCerZ07EFwWrSCRVbBiEpgqDJe1wZXOQ6gC4hbT13uBr3VtMoO8yICxmrdaebgfayCn3+fSL6zkx2oFCYgvZAm1rHxznXiKfAan6sOqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745531265; c=relaxed/relaxed;
	bh=fJCPx0/rIhFmrQwzN44F5PDL8xcgkFoG6Ia5QBql6Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNMD7Ex4FUIzdm5ZQCL4abWefix9IvRG0/gkpO1OJ2CYn8AFLKN54u/IsAiOKZZ3z+++u26xggbnZnJz2HINmiIn+5za3m+GDGL9Vkygia4XQXqIY0LfHBFt2NlNk52yJ0DTIKQvm48o2xFfFzm/TXHVpK+m1dvl2pTV4NkVmF/WIoXe9jNAvygoclRzHhP5etrG4ptVg4nIGiwNAo1H+xsU3mVxEi1E/MmI75m6Cpa1kPY8ZG6AuYeKyLrDHdxQ/dpIBOcq8Kcwb22DBxrWEsxLh46D3jQCai2tNVIedJPZHJHJ1dQDSaeL0wFSWL1CSFU1FmmtB/isQHMn5QKrbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fPjpiAWL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fPjpiAWL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zk8hw2gSSz3byP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 07:47:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0287A4B520;
	Thu, 24 Apr 2025 21:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3F3C4CEE3;
	Thu, 24 Apr 2025 21:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745531261;
	bh=/OtnegXrAUInM02RmbInPRK5cQX2lIlEaqMGbFsc8QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fPjpiAWLJmklUim0524Dr+JbFiUZKVwGNoM5kezTioyx52Vghb/vbv+KGIHIPzEkG
	 u/it2sj5HQROCzqtKddufFAgZSvSFG9wSZsduDTUZ4flK/bU0a7St+TqmkUcie+hha
	 a6lgHMMewgovod6o1l4SJlzPJBZ26MIkug21EtvrO0v9r4tW88HRD0VfsYIREPppsd
	 WwYReglf3megpF/2IH7eSGSE0jFDUdL8yQxNgZWHuakH53/dMcYMo9hTXH2q5i6PGm
	 sZy5DTDGYDwJMh4+jAv67EV5uaQ53eC28p2DyfXyrPsdGxpaki7xAhnddctiPzN+wJ
	 LxjujzSFVvjew==
Date: Thu, 24 Apr 2025 18:47:38 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.ibm.com>, jolsa@kernel.org,
	adrian.hunter@intel.com, irogers@google.com,
	linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com,
	hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
	jiang.peng9@zte.com.cn, Tejas.Manhas1@ibm.com,
	sshegde@linux.ibm.com, sfr@canb.auug.org.au,
	linux-kernel@vger.kernel.org, mingo@redhat.com,
	ravi.bangoria@amd.com, bp@alien8.de
Subject: Re: [PATCH] perf build: Add tools/arch/x86/include/asm/amd/ibs.h to
 sync the headers
Message-ID: <aAqxei2pAfDbmiTy@x1>
References: <20250424163033.6601-1-atrajeev@linux.ibm.com>
 <16bee348-2b41-4337-85c8-8a6d2719e99b@linux.ibm.com>
 <aAqB6kI5mDp4bxY9@x1>
 <aAqlFA4qIVh9SQke@google.com>
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
In-Reply-To: <aAqlFA4qIVh9SQke@google.com>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 24, 2025 at 01:54:44PM -0700, Namhyung Kim wrote:
> > On Thu, Apr 24, 2025 at 10:39:56PM +0530, Venkat Rao Bagalkote wrote:
> > > On 24/04/25 10:00 pm, Athira Rajeev wrote:
> > > Tested this patch by applying on tip HEAD:
> > > 7ab869c799fc0fb22f9b4c2f36aaa603d9c7cc9d and it fixes the reported issue.

> > This is just a long list of characters, can you please next time provide
> > something like, humm, tip/head, not really:
> 
> > ⬢ [acme@toolbx perf-tools-next]$ git remote -v | grep tip
> > tip	https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git (fetch)
> > tip	https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git (push)
> > ⬢ [acme@toolbx perf-tools-next]$ git remote update tip 
> > Fetching tip
> > ⬢ [acme@toolbx perf-tools-next]$ git show 7ab869c799fc0fb22f9b4c2f36aaa603d9c7cc9d
> > fatal: bad object 7ab869c799fc0fb22f9b4c2f36aaa603d9c7cc9d
> > ⬢ [acme@toolbx perf-tools-next]$

> > So please add the summary, that way we can try to figure out if this is
> > a rebase and they look for the description instead of this sha1 that I'm
> > not finding even after doing a 'git remore update tip'.

> Does this mean the kernel change broke the tool build but we don't have
> it in the perf-tools-next yet?  Then probably we need to wait for the
> next merge window to fix it in the tool side, no?

I'm not noticing this with perf-tools-next on a 9950x3d fedora:42 and
the referenced commit is not present in it nor in upstream nor in tip
master, so I need the reporter to check his environment and report back.

- Arnaldo

