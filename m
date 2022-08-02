Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E9D587D69
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 15:48:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxxD24R34z3c4j
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 23:48:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=atH8fMSG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+f8594048c7a6c0e4a33e+6918+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=atH8fMSG;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxxCN6Vq6z2xJQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 23:48:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=04o2rImNVbolTLXJKFYFmmfTqVuwY00lF/8/aeJQr3Y=; b=atH8fMSGKhwHi31reNblCnsOj4
	CPRAEnye3aX3IE9izMWeSQ5PsiYPDzTy61k5Pylp6FzzsWr0FB+rFhw5NsQrLSC2DHIbY6aKJcrEV
	6drwB1hcGIADQhQBcVCY5Usyfl84FJk2AkjMDmWTuzy0bXcmPKim2nGzAWfjK/1RLRwfSQ3qxKXv3
	e2VhUSw8QHkXZRC7/3B6Wn5lJNvi1nVUs7/MopFrGwDhqQYbIJ8dPn9Tu0Hz9nQPnSLAbl6xV/B+F
	m2ttNt8K21Q88Epxbhcq+VMlvCJJQEQp8GXXjLQdb3zm7/QDmJKD0SFNK29YnPr+R7XWILPiYdu6C
	+tJZf/6A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsFh-00EcLn-Ob; Tue, 02 Aug 2022 13:48:05 +0000
Date: Tue, 2 Aug 2022 06:48:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v8 00/31] Rust support
Message-ID: <YukrFS9NIMSP/I/Q@infradead.org>
References: <20220802015052.10452-1-ojeda@kernel.org>
 <YukYByl76DKqa+iD@casper.infradead.org>
 <CANiq72k7JKqq5-8Nqf3Q2r2t_sAffC8g86A+v8yBc=W-1--_Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72k7JKqq5-8Nqf3Q2r2t_sAffC8g86A+v8yBc=W-1--_Tg@mail.gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-perf-users@vger.kernel.org, linux-gpio@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, live-patching@vger.kernel.org, linux-riscv@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Miguel,

handwaiving and pointing to git trees is not how Linux development
works.  Please make sure all the patches go to the relevant lists
and maintainers first, and actually do have ACKs.
