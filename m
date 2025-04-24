Return-Path: <linuxppc-dev+bounces-7969-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79307A9B96F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 22:54:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zk7Wv5B3Jz3bqQ;
	Fri, 25 Apr 2025 06:54:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745528091;
	cv=none; b=LPImB1oVySj7DRS4BPTJ9U4gDCj30bNDvVR7IGobayKWMJ8TlTEJjLkyuM/1U+GOwnSi8l8r8joqELasbaa6L1ugulfowm5P1Jkc0YogfBAjR9gbJhhdKlisN45nKviKQSOWQ0A0O4wBdceNzcLwaVBR+B9I+ht0k4t9dPU2YJXnkq1yD4QJeZZ/LhZQidaiMyeeUi5X+XI9Wv3J5H3F8GR7UNPt4BRw6H4tv/s8rwdM4k9F6lHaMxJb7w86mTmKSjHxL+xfRK2edBHvd+0acnePmjOGmt3vgvFULVhJzi986eIDTqth9lL+szkig8MPGyn5VN3niFB1Ltqe+H/mAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745528091; c=relaxed/relaxed;
	bh=/9//E4/U5CNkj07nyOw/qDc3mEGClqEbfgOsbFlKOIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkWSRgQ2O1KZayAoyDoFDM2cEqgRg8DmcIhP8az5mVwlGZXoYLRIzSV6c6W/bBWxHf8Dym1nYoqytdrW93CIup0zUV3zDf0Xhh+VdZ4cu4wpzDeiKjRcBHLWtNuGVtDYYzz00X6hMOyp6bPKpt6hPPaOgr6oqBkpw+f0ccYcaydyk4d6J6GMYruF8nxcXMGZovZWXjk3deCt9CnIRrOVyRPtv/9enR2zt3FgY7DSIiwyr8RvYISAPxSdfIgYTgTWnjOanVJbBqKvkyzgJQA8Uuu5uPEMvWii5BOechqK6Avy0USBEH66GsO+jPb/Q65LlSQpV+ENRRLFNhfH16kGiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KAXBLzck; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KAXBLzck;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zk7Wt5PYxz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 06:54:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0A1EA476A1;
	Thu, 24 Apr 2025 20:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8422C4CEE3;
	Thu, 24 Apr 2025 20:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745528086;
	bh=mVOfzXORKBDjoat8v4wa6t+Bp56lm/uF2PtECtlz2aI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KAXBLzck3/aY5i5WpDgpNe0S9MVRUvjwzdE5yg8eNsLLNEK9tVLDif8ovhlckrhRu
	 I6hmjTI983hXSAjzp56+fJPfV7sKApqcjVianVGbQflRikuhyPzh6hfEGQUQ/QL1/m
	 1jqNgRIlqnE25Vz4LRIyLPw6K7W2vjuRrKhJ6hYdOsVGf2i4rc89kCxSW4vXndPHcI
	 CEy8vJG1mq2aqaww20AkWpaUBG7LKORGO03u5i4atVHr5DqEydxxT7iFF2/BGOHnCg
	 E4NuOs0FXHsZS68l+Mmp2qEt2iejnyPVg+tXiFhLkXiTrggF9G4lZaLgV7C6GN7fdA
	 xc9E8UJP1Op7A==
Date: Thu, 24 Apr 2025 13:54:44 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
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
Message-ID: <aAqlFA4qIVh9SQke@google.com>
References: <20250424163033.6601-1-atrajeev@linux.ibm.com>
 <16bee348-2b41-4337-85c8-8a6d2719e99b@linux.ibm.com>
 <aAqB6kI5mDp4bxY9@x1>
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
In-Reply-To: <aAqB6kI5mDp4bxY9@x1>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

On Thu, Apr 24, 2025 at 03:24:42PM -0300, Arnaldo Carvalho de Melo wrote:
> On Thu, Apr 24, 2025 at 10:39:56PM +0530, Venkat Rao Bagalkote wrote:
> > On 24/04/25 10:00 pm, Athira Rajeev wrote:
> > Tested this patch by applying on tip HEAD:
> > 7ab869c799fc0fb22f9b4c2f36aaa603d9c7cc9d and it fixes the reported issue.
> 
> This is just a long list of characters, can you please next time provide
> something like, humm, tip/head, not really:
> 
> ⬢ [acme@toolbx perf-tools-next]$ git remote -v | grep tip
> tip	https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git (fetch)
> tip	https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git (push)
> ⬢ [acme@toolbx perf-tools-next]$ git remote update tip 
> Fetching tip
> ⬢ [acme@toolbx perf-tools-next]$ git show 7ab869c799fc0fb22f9b4c2f36aaa603d9c7cc9d
> fatal: bad object 7ab869c799fc0fb22f9b4c2f36aaa603d9c7cc9d
> ⬢ [acme@toolbx perf-tools-next]$
> 
> So please add the summary, that way we can try to figure out if this is
> a rebase and they look for the description instead of this sha1 that I'm
> not finding even after doing a 'git remore update tip'.

Does this mean the kernel change broke the tool build but we don't have
it in the perf-tools-next yet?  Then probably we need to wait for the
next merge window to fix it in the tool side, no?

Thanks,
Namhyung


