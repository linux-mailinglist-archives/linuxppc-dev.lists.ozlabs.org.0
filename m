Return-Path: <linuxppc-dev+bounces-4900-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7954A06FB1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 09:06:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTHRq25crz30jZ;
	Thu,  9 Jan 2025 19:06:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736409991;
	cv=none; b=BX5fbij5qaSESfw45mdIF66O9iOU1HsScHowhWDVaDp5lvb/uE9b4QIAwCGLME5LmkpR32UFq+W4VWiwwxmxZZccIMB12XshXjw2RnXIRAfx+Er5q5IUS3vML9vi74OYO5PJyXOd+sy2uZMDTWI0/ooIM2iWI9WRJXVETDGwnke1WuERWFHwDpALTCkXiiuxrtV+bkCWHtkpaxOc9sbhm8Krh0hSrc0d5LfeCybz9fgLFCE9J+wPOwQC7Q6iwe/hA6CwXyLZ0Ol9XRcHmqNuXi5GzKzZFl7LSE4fAw1L3SyOvB4l67MpWkUf9HuJKU2ScDmkrordGmSSAHhOpIztvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736409991; c=relaxed/relaxed;
	bh=J+7TSGHXFL8/Y9YPMq/aeDzuJIsjLfw7/hMIKRXc/M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcEzsrOgFSBsrF9U1XvPXrF4Mvuk8VGoGtWQu/xtAkyUJN3QbDM1QQ60SyB3felpOfJPX8E8e7XOeHxQ8bIEr3Y9PqqjJX+v4mTu7IQGGFxeS0jdY/QRVodYXIZwMaMMaiRTmgHSgfGgjyhToX+dR6crL9FSam2GkZ97lIcdLVHEL0ruioHhq87o8kvAWz1HgV1pr1ardD97on8KBmlT9aNfNbtOEMpG0s98mt+gvlRzesKWjuWV2pBK+k4EYzRagZ4Eiij4QdosB7kHToTiWQq6XDRIJk0x0pxCikomN57tEvtoMhpOWJsfd5qIhyKxi2QEt5Av/Y+kXbrQa920dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1b2zKe+l; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+2e5c2b0d924108c2b4cb+7809+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1b2zKe+l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+2e5c2b0d924108c2b4cb+7809+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTHRh19mnz30hf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 19:06:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J+7TSGHXFL8/Y9YPMq/aeDzuJIsjLfw7/hMIKRXc/M4=; b=1b2zKe+let/4glvc6CEebbRQN4
	GitgyZO0o5i1jesnNGaKE/FZhb18mmWvEz3QGoScqAD3LL53847hb354Vs//hlMbuZ3MKr6YZ+U2h
	uLJwJT1O3V7M6IPkWkelZ1xJdan92GsNPcmGgDahedD5jwKlwAZRTbEKJNcjXDdj/qdEToXhy9Dji
	oiYU/u8YuyFfDA+6J7CBrMcW3Rhwn4LaiO65Zdn/Qn9zbTXmm9/GZuJjYhBls6xB8CpzKvJEPZQKb
	C09/FQ1MaIAQlDjtnikIb2ghvXS0t4wNVqFAU01PE6MbSa2e3JnlZuv3CbgwKKK9uPykETs9WoIxk
	dImQantQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tVnYP-0000000B8TT-3duK;
	Thu, 09 Jan 2025 08:06:09 +0000
Date: Thu, 9 Jan 2025 00:06:09 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
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
Message-ID: <Z3-DcbY60SxoM0dN@infradead.org>
References: <20241228-sysfs-const-bin_attr-simple-v2-0-7c6f3f1767a3@weissschuh.net>
 <CAADnVQ+E0z8mY4BF9qamPh1XV9qs2jZ03bfYz2tVw8E4nFVWBw@mail.gmail.com>
 <0cbfd352-ee3b-4670-afae-8e56d888e8c3@t-8ch.de>
 <CAADnVQJMV-zRcDKftZ-MbKEJQ7XGmPteMYCS0Bm5siBEXUK=Fw@mail.gmail.com>
 <2025010914-gangly-trodden-aa96@gregkh>
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
In-Reply-To: <2025010914-gangly-trodden-aa96@gregkh>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 09, 2025 at 08:56:37AM +0100, Greg Kroah-Hartman wrote:
> The "pointless" penalty will go away once we convert all instances, and
> really, it's just one pointer check, sysfs files should NOT be a hot
> path for anything real, and one more pointer check should be cached and
> not measurable compared to the real logic behind the binary data coming
> from the hardware/kernel, right?
> 
> sysfs is NOT tuned for speed at all, so adding more checks like this
> should be fine.

Hey, when I duplicated the method to convert sysfs over to a proper
seq_file based approach that avoids buffer overflows you basically
came up with the same line that Alexei had here.  And that is a lot
more useful than constification. Not that I mind the latter, but it
would be better if it could be done without leaving both variants
in for long.


