Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5494828DA06
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 08:32:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB2dr1BvlzDqw8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 17:32:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+b5550e02a2edd4696799+6261+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=l+BYk6ta; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB2cV1rLYzDqYt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 17:31:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ivg+4ShKhK9J0GIBMLdbzyswn07sEhcY++hSSvHufe4=; b=l+BYk6ta+igFPgPUIzsT+YDnFG
 gV+mlI8oW2Q/9UQThToJzMKf9c1q/o4ndoivvU1ArJoWHAYvZPR/5fJa3ybE2HKQGfEJ76msTHwvk
 g09NSjnV19vWz1lLbzRplSOEm2kXV3Z243YfEyDDN9/wWCiCE38PBOiVajBkLFuogNSEdlZckPIOY
 9i0Ok9UoVdJ5FE09XNoUUp8EKBaE3vlv6+Tq/WvU9PfjkZyW6UNHAVJhh3zpAYUx1cnDPJxSzYEcj
 d2Kov4NfLRcYhQs8gGnKNYFC1jW9Md6yAEjdMJR5o0kxAWSpn80CaR2QvZK8mi35uyCsEcoULd8sH
 VlHo7jJA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kSaJh-0007fw-4q; Wed, 14 Oct 2020 06:31:17 +0000
Date: Wed, 14 Oct 2020 07:31:17 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [RFC v1 0/2] Plumbing to support multiple secure memory backends.
Message-ID: <20201014063117.GA26161@infradead.org>
References: <1602487663-7321-1-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602487663-7321-1-git-send-email-linuxram@us.ibm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: bharata@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, farosas@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Please don't add an abstraction without a second implementation.
Once we have the implementation we can consider the tradeoffs.  E.g.
if expensive indirect function calls are really needed vs simple
branches.
