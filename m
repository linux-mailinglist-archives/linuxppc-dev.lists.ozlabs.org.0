Return-Path: <linuxppc-dev+bounces-5065-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E615A0A016
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 02:30:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVLZS1Z1sz3d3W;
	Sat, 11 Jan 2025 12:30:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736559056;
	cv=none; b=CqSkrv/y7NmLQJAn0EzDDrckLkpS+MW/fRFVbV9lLaCs6zH1QhOHd2kZc2wl0Y2zeZEcmVCreR0Y8YbjLttPe8d275YENXP9N0SKCifNzed0snDPZP3J65PTg29N+h9JEl3/cJ7pTGk8wTmLxjiOW9dxgSB51FYrLZG1FXTAAb4+m57HGHISRzMRscN37mhP0q6QC4anJ8AEReB1FnNExNjE2ityFyzWfR53AkbV2Cw/ylBf4mLllT45+A0mBYFVBOvUl6+6gAU/KtQrs9nXjXgZSRRVbWtjYDKlOPmEpdDGiVs6MaGggLrucO12Gk0yG9/fjEarf0OEnKaWzZKIKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736559056; c=relaxed/relaxed;
	bh=JSJ2//G/dyGy/Z/QtKtRmb1VcieLheCT8CgoEclYxvU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=cf09QYo0L72tKWBogJUWLGOFWNSa+9hGQs1vo3GmX8v0KnuAliZgQ0JGRmnbr981j6qQ4rqkYT4mY9Qgml39sSEJykIfB45a5MEFfbGKHogfFP3jQldSvnhM9wdJRAIlK3dQX71j4Tfw8/KgazInMt44igfVXrF2RzfWpC+1Qa9Uny6+KeyT+nVSp6ostSKFIWcsHSLy4RfN3vTpHDoxreEc/sRC0SLUnY6SOY/wBIowCAmD618NZgKSfuR6+YpHLjlfEKlyUjzsUkG/clbUTNJ3vaCj538I2c4Jk/A+s5vBfpT20j9pxz/n2Xp28GcPFjcsuJ5dBnxC42jegXVH0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=wCdNg1TF; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=wCdNg1TF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVLZQ6KPxz3d32
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 12:30:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C3F25C3674;
	Sat, 11 Jan 2025 01:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC51C4CED6;
	Sat, 11 Jan 2025 01:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1736559049;
	bh=7I1OBfWbo908Mx7qvQkrDHGouLRf+dWAo5fEwim6p1w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=wCdNg1TFG2mQ2V7JLabBLagQ3iPh1FJkujMfPxuiGPq8mHSUiRbicfuDz2i9VqjFf
	 EAUFhX6Dmh7OxXqZl8IYRBtst8NCQct6t/dFbEismIfwpRA3Qoo2LI1c6LPpWu8fRG
	 2Kmoai3+QNA8Ga1fKjMEVJkS7d/Z4QkUiwdQ67Rg=
Date: Fri, 10 Jan 2025 17:30:48 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <alison.schofield@intel.com>, <lina@asahilina.net>, <zhang.lyra@gmail.com>,
 <gerald.schaefer@linux.ibm.com>, <vishal.l.verma@intel.com>,
 <dave.jiang@intel.com>, <logang@deltatee.com>, <bhelgaas@google.com>,
 <jack@suse.cz>, <jgg@ziepe.ca>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
 <dave.hansen@linux.intel.com>, <ira.weiny@intel.com>,
 <willy@infradead.org>, <djwong@kernel.org>, <tytso@mit.edu>,
 <linmiaohe@huawei.com>, <david@redhat.com>, <peterx@redhat.com>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
 <nvdimm@lists.linux.dev>, <linux-cxl@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <jhubbard@nvidia.com>, <hch@lst.de>,
 <david@fromorbit.com>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
 <loongarch@lists.linux.dev>
Subject: Re: [PATCH v6 00/26] fs/dax: Fix ZONE_DEVICE page reference counts
Message-Id: <20250110173048.5565901e0fec24556325bd18@linux-foundation.org>
In-Reply-To: <6780c6d43d73e_2aff42943b@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
	<6780c6d43d73e_2aff42943b@dwillia2-xfh.jf.intel.com.notmuch>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 9 Jan 2025 23:05:56 -0800 Dan Williams <dan.j.williams@intel.com> wrote:

> >  - Remove PTE_DEVMAP definitions from Loongarch which were added since
> >    this series was initially written.
> [..]
> > 
> > base-commit: e25c8d66f6786300b680866c0e0139981273feba
> 
> If this is going to go through nvdimm.git I will need it against a
> mainline tag baseline. Linus will want to see the merge conflicts.
> 
> Otherwise if that merge commit is too messy, or you would rather not
> rebase, then it either needs to go one of two options:
> 
> - Andrew's tree which is the only tree I know of that can carry
>   patches relative to linux-next.

I used to be able to do that but haven't got around to setting up such
a thing with mm.git.  This is the first time the need has arisen,
really.

> - Wait for v6.14-rc1 

I'm thinking so.  Darrick's review comments indicate that we'll be seeing a v7.

> and get this into nvdimm.git early in the cycle
>   when the conflict storm will be low.

erk.  This patchset hits mm/ a lot, and nvdimm hardly at all.  Is it
not practical to carry this in mm.git?


