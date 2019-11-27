Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E95F10ABD5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 09:32:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NDYH4P58zDqgs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 19:32:51 +1100 (AEDT)
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
 header.b="pOxZ0vhn"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NDW50ZTkzDqg4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 19:30:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1gFNlgNOSnR66gWzH4fYHdin8kbE1278rKR1emq0gec=; b=pOxZ0vhnMYfvcJg0U+rRkLSbv
 dPZyfScDQa6+d2ziJ8t2tkvq4FMnsQ5d3uMt66JGx/5heOBLRQtjwRAcCdbK4Oj0MbTTLbPLyeZb6
 DxgPK4UPmkR8ibxgRuFMrlh7ot+zriv6NPccM1WEq32JVF0ycGhToJ863ETv9YQaNDJu6aJOjm15R
 z8G5c3UCVgePvhx3Kp8fp2PserqN1lQkhDgiUd+a+VFHBf0gHHtEh2xdQnLIEscBbvN3rGTJJoUA/
 5ABqKrN9EJ4JyT9RCUEP8Bk1A2H5PhfV10bpgooSyATaY7QbR5/OZ/t+r4JxvakV7T3j99ZTYe2Mn
 IScQE1B1w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iZsit-0007D9-HQ; Wed, 27 Nov 2019 08:30:55 +0000
Date: Wed, 27 Nov 2019 00:30:55 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Haren Myneni <haren@linux.vnet.ibm.com>
Subject: Re: [PATCH 03/14] powerpc/vas: Define nx_fault_stamp in
 coprocessor_request_block
Message-ID: <20191127083055.GB17097@infradead.org>
References: <1574816676.13250.8.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574816676.13250.8.camel@hbabu-laptop>
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
Cc: devicetree@vger.kernel.org, mikey@neuling.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +#define crb_csb_addr(c)		__be64_to_cpu(c->csb_addr)
> +#define crb_nx_fault_addr(c)	__be64_to_cpu(c->stamp.nx.fault_storage_addr)
> +#define crb_nx_flags(c)		c->stamp.nx.flags
> +#define crb_nx_fault_status(c)	c->stamp.nx.fault_status

Except for crb_nx_fault_addr all these macros are unused, and
crb_nx_fault_addr probably makes more sense open coded in the only
caller.

Also please don't use the __ prefixed byte swap helpers in any driver
or arch code.

> +
> +static inline uint32_t crb_nx_pswid(struct coprocessor_request_block *crb)
> +{
> +	return __be32_to_cpu(crb->stamp.nx.pswid);
> +}

Same here.  Also not sure what the point of the helper is except for
obsfucating the code.
