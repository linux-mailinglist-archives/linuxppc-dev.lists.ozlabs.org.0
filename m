Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84686199C56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 18:59:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sFtV6V5RzDqyw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 03:59:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+36c3c107044b01db00d3+6064+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=adQNgq7g; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sFlD6B24zDqNP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 03:53:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=M1mhR07HOZla69RsrkO44Gxk+Z9xDcXnvMT8lsqIgFA=; b=adQNgq7gEiRGU9IPa56cqgpMB6
 htVSrYehe9zCxoqLcibx9qSYcQeyX7LGk7oneigtNMVkZRdAEB4JgYFDAHnqysNFblGTPrQQYCf9y
 UYF8C02ttlNL4GRSXpIr5VPThvuvxNXVD350fdIXI/64Vn1igeiyrenN/MRMQrcOPX/88Lrxi8jaG
 QfkVig+Kpriw5UlmZnmaJC39Xos73ELVcNiF3AhmC12UNUUDUcl1kVTLx/jnGuvvhCrWLyRkoLhK9
 KO2w/QwkXXTUzM4E9/O+KO/LHs3SSrnZuCK20PSydgACQ5F9kcN6SRLP+dO0Nav8ZyVQn907k4P4P
 sk1IthpA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jJK8a-0006NO-4E; Tue, 31 Mar 2020 16:53:16 +0000
Date: Tue, 31 Mar 2020 09:53:16 -0700
From: Christoph Hellwig <hch@infradead.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH] powerpc/44x: Make AKEBONO depends on NET
Message-ID: <20200331165316.GA6380@infradead.org>
References: <20200330143153.32800-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330143153.32800-1-yuehaibing@huawei.com>
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
Cc: linux-kernel@vger.kernel.org, paulus@samba.org, alistair@popple.id.au,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Why would a board select a network driver?  That is what defconfig
files are for!  I thin kthe select should just go away.
