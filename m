Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C7710ACA1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 10:33:24 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NFv53ygvzDqdb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 20:33:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+230b1395c146a7dc824f+5939+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="f0sHLJDF"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NFrq1VdwzDqdb;
 Wed, 27 Nov 2019 20:31:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cArTQIBcelCpnlJ0+Dvnp+KYI2DLSwY3hnmMKGiD2ZA=; b=f0sHLJDFVuqrXrSn60GR/TykB
 g0oJhOhjarhTssfVFdTxH9z+5dsOnSpvuYnj4P5U+RDEVy+ezBhb5JBnzurAiIuQCIAqlCUFt0Zrp
 NZ3I73IclRB+MkDRImn4TsK9sgHy6NElSANsfLdNh1K6wRQKWbNretq9jIMGnangWxCasTpgfmoZ3
 3+7IsRHJEEb7m/qqJwXghCaLQFIgyldmSDGBFGGI+2Uv1cVUsTk9IkIewstA8c0JXOiiJPb1Oamey
 AptQz0HuwD8ESvXAPB/JJ5zzqOhYmfzBP8CTNB20BgFR+14S4eEM55MtwhgS+UoTrSw0eb8058y9T
 qyKTZpNjg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iZtfE-0001CA-KX; Wed, 27 Nov 2019 09:31:12 +0000
Date: Wed, 27 Nov 2019 01:31:12 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Haren Myneni <hbabu@us.ibm.com>
Subject: Re: [PATCH 02/14] Revert "powerpc/powernv: remove the unused
 vas_win_paste_addr and vas_win_id functions"
Message-ID: <20191127093112.GA4485@infradead.org>
References: <1574816607.13250.6.camel@hbabu-laptop>
 <20191127082810.GA17097@infradead.org>
 <OF14D260BC.48F4C927-ON002584BF.00332A80-882584BF.00335313@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OF14D260BC.48F4C927-ON002584BF.00332A80-882584BF.00335313@notes.na.collabserv.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: devicetree@vger.kernel.org, mikey@neuling.org,
 Linuxppc-dev <linuxppc-dev-bounces+hbabu=us.ibm.com@lists.ozlabs.org>,
 herbert@gondor.apana.org.au, npiggin@gmail.com,
 Christoph Hellwig <hch@infradead.org>, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 27, 2019 at 01:20:36AM -0800, Haren Myneni wrote:
> Thanks for the review.
> vas_win_paste_addr() will be used in NX compression driver and planning to
> post this series soon. Can I add this change later as part of this series?

Please only add core functionality and exports with the actual users.
