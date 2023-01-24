Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B106790E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 07:30:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1HCS4qjSz3cD8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 17:30:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y1N1Bp85;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+3f260f0a54c0d014680c+7093+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y1N1Bp85;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1HBT6Czwz3bZl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 17:29:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4u7sdeygL2SI0vuOn3AQXqOOeojipj5nJ8JBXiSMSP4=; b=Y1N1Bp85zWT1Yc4mWO5RM/5swn
	z1s/ae7nZBU1XI2LeDBAOv+06U0Bu1PJWHXCDrEjlbbph1xr+oh6cmoXIod4hdcTSIhg05KsUMsH6
	Mt0SAUZbeNMdj95LikeyPio6/J/WyHzPQbupOE2KMJ+OXZv8xSLLdBNtO7Ot/A8dx2JalSA7ubKi2
	aFuBB1XW7qW1wiu2y2b/BJd4x/N6dLqevlGltWAruZGC7j2J5NPe6Xz6f5IgVH1uIF87LFk4mGzQ9
	1iI2DWcT8gQ30YpVU8YQ5BM2WIzRNm5oNr5lR1NU6lLpwGy0B15qzrZcjDOK9MRUi3zNGYFfM5749
	r4m38yZA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKCny-002Vim-8c; Tue, 24 Jan 2023 06:29:14 +0000
Date: Mon, 23 Jan 2023 22:29:14 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [RFC PATCH 01/19] mm: Introduce vm_account
Message-ID: <Y896ugI8HoXDRjp3@infradead.org>
References: <cover.f52b9eb2792bccb8a9ecd6bc95055705cfe2ae03.1674538665.git-series.apopple@nvidia.com>
 <748338ffe4c42d86669923159fe0426808ecb04d.1674538665.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <748338ffe4c42d86669923159fe0426808ecb04d.1674538665.git-series.apopple@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-kselftest@vger.kernel.org, rds-devel@oss.oracle.com, daniel@ffwll.ch, kvm@vger.kernel.org, linux-rdma@vger.kernel.org, jhubbard@nvidia.com, linux-fpga@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, linux-mm@kvack.org, netdev@vger.kernel.org, mkoutny@suse.com, jgg@nvidia.com, hannes@cmpxchg.org, cgroups@vger.kernel.org, bpf@vger.kernel.org, surenb@google.com, tjmercier@google.com, io-uring@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +/**
> + * vm_account_init - Initialise a new struct vm_account.
> + * @vm_account: pointer to uninitialised vm_account.
> + * @task: task to charge against.
> + * @user: user to charge against. Must be non-NULL for VM_ACCOUNT_USER.
> + * @flags: flags to use when charging to vm_account.
> + *
> + * Initialise a new uninitialiused struct vm_account. Takes references
> + * on the task/mm/user/cgroup as required although callers must ensure
> + * any references passed in remain valid for the duration of this
> + * call.
> + */
> +void vm_account_init(struct vm_account *vm_account, struct task_struct *task,
> +		struct user_struct *user, enum vm_account_flags flags);


kerneldoc comments are supposed to be next to the implementation, and
not the declaration in the header.

