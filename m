Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8938715528
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 07:48:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVhJg56l6z3f5P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 15:48:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c83pko6Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+6438538edd150666cef4+7219+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c83pko6Y;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVhHp06gbz3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 15:47:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Vj3P4dh9WYoURI5rGEPJ8G9gG4iFtJpTelQk67+lDWI=; b=c83pko6YfiFpgLUhB/s9eA10Aq
	1G2V1aTpuNQ5Owjnjbrpqca2l/HUFer73qVW+nawtcb0tTKFzHXhAD1iaEE3MWOJzU3uT/f0IWnNz
	4pu+cl2cNMLU/eOp1W9oiubICnryW5OFw2Y2mNLnxacMtJSRLZUKtIXAE2m9fY3Su6vrbY7KJv9g7
	HrIuSFSh2OgSXcjw10mktfT3SDUo5IXgKYpx+hI4ahDGYPK/rnRbLBy7BHz1iw1CqdcImgYiaw4bb
	/bTPT+TPdxV7f67e6Ixa/ypBPGiQtBZl2akIvVo3z+7tEyvVsuNR4xPs1Qk5SEKW/vhoavcSnSG6y
	/jZNX93g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1q3sCc-00CVMI-08;
	Tue, 30 May 2023 05:47:26 +0000
Date: Mon, 29 May 2023 22:47:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: WARNING at fs/btrfs/disk-io.c:275 during xfstests run(4k block)
Message-ID: <ZHWN7lD6QPIoNa6C@infradead.org>
References: <50217126-0798-4ED7-BF46-4DF14C99ED0D@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50217126-0798-4ED7-BF46-4DF14C99ED0D@linux.ibm.com>
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
Cc: riteshh@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This should be fixed by

"btrfs: fix the uptodate assert in btree_csum_one_bio"

on the list.
