Return-Path: <linuxppc-dev+bounces-4902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EBDA06FDE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 09:23:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTHq62DKtz2yN3;
	Thu,  9 Jan 2025 19:23:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736410994;
	cv=none; b=BgI2e+DM7TFOx6kVNyRSEPOBCemO/dSDEWgy+zljUx1akwi4oAF3CPsrtUTi2QzVoJYD+QvOvyemOZXFJj45AeGQC+g52OJhsBjxFSlXYXZQSZplPC95BCWXocGXoyu9ubVAsTWfaoJ3r5dA5rCzFYG3z7OG5FYEjErgdYydvQtMeqaWRBB5wVknzaSSIpBhPqefSezEnU4ZtkgQmdpQ3OpIU22MsTnVyfMmJhYsLe3V+viVG1n/l70sNyZ5rBmVZenVL1efWRIzILkkEKumO2WbfQQmSMdPjdnQjyVxmWK6aRg5acWvrqHwu3ZSJYd+BnN3aSXkdGi9JLdP5wk41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736410994; c=relaxed/relaxed;
	bh=Y+Vh7rfq/7OoaD/IsISKN4B/bJgLMs6nBckWnFw2QEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ux65EV/a/Y1WwzLjN6aDKtaBYPRxSXqzKMDrXAkdMrt1v7zAt0EHLmRavg/k0SMUw9Cq1BbGNqHmIhYEI7y615VLW29tm4mBcUbtmzSYYUu2Gta3huyJRsfMGQXHW2+M4zeRZ7HQslAnaZh6vIOtPFhQwWQMK5ICSYeR+VoijECkyGnfiNIV+CDN+zz2EMn1SpuzoUC4EUB5v3VP2VVkO9sX3G2yG8CPTds3pSCgG8pRCuQkw/712kHq3xNfSsXuamGrsq7DPc3OyJmXwO7tshNa+ykG7Dt/duMGr/RRBe4KFRSCQoYXSpgWvFstJJ/ibzPc/ugSzT98rVY0VZh20g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wwTNL5o2; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+2e5c2b0d924108c2b4cb+7809+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wwTNL5o2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+2e5c2b0d924108c2b4cb+7809+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTHq41hmVz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 19:23:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Y+Vh7rfq/7OoaD/IsISKN4B/bJgLMs6nBckWnFw2QEY=; b=wwTNL5o2PrJNFVNsz/xKhWJmSM
	ZDxd+ffCCbK0fUJEEGHCLabsv2VV0dOLB+IdTzr4+LJfTi5QvYgwKcWlAz/keEGERfaPYuLzj3dyO
	a5/N5TPgpmRAAF2CutF/IpXUqTXHjmRnEH6w7jM+XHG6yQpHaAG/KaOde8ZCUDAI5BjqwYpdBA/Vu
	ZMXdBowhIu4gc2MuBwS165ER8BGQX19a3bh8g4TK9TfvOHbNmwNK4s6KcW9zI5/2mu/jfiP7CXg05
	VfF02b1KVHBIqL9w5SY1spNsk2dXG+BY5EOKGjqVGjUIR5rXkFZuwP4YZlD0HEhGzWAfc1eeHQrt4
	vdo0i/iw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tVnoj-0000000BAUc-1uqF;
	Thu, 09 Jan 2025 08:23:01 +0000
Date: Thu, 9 Jan 2025 00:23:01 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	ppc-dev <linuxppc-dev@lists.ozlabs.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-modules@vger.kernel.org,
	bpf <bpf@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] sysfs: constify bin_attribute argument of
 sysfs_bin_attr_simple_read()
Message-ID: <Z3-HZT5kwt18QSQn@infradead.org>
References: <20241228-sysfs-const-bin_attr-simple-v2-0-7c6f3f1767a3@weissschuh.net>
 <CAADnVQ+E0z8mY4BF9qamPh1XV9qs2jZ03bfYz2tVw8E4nFVWBw@mail.gmail.com>
 <0cbfd352-ee3b-4670-afae-8e56d888e8c3@t-8ch.de>
 <CAADnVQJMV-zRcDKftZ-MbKEJQ7XGmPteMYCS0Bm5siBEXUK=Fw@mail.gmail.com>
 <2025010914-gangly-trodden-aa96@gregkh>
 <Z3-DcbY60SxoM0dN@infradead.org>
 <2025010930-resurrect-attest-94c9@gregkh>
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
In-Reply-To: <2025010930-resurrect-attest-94c9@gregkh>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 09, 2025 at 09:12:03AM +0100, Greg Kroah-Hartman wrote:
> > Hey, when I duplicated the method to convert sysfs over to a proper
> > seq_file based approach that avoids buffer overflows you basically
> > came up with the same line that Alexei had here.
> 
> I did?  Sorry about that, I don't remember that.

It's been a while..

> As for seq_file for sysfs, is that for binary attributes only, or for
> all?  I can't recall that at all.

Non-binary ones.


