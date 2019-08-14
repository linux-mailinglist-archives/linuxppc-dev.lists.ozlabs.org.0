Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE38CAB2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 07:41:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467dk036k3zDqQb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 15:41:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+147547a3be601d556dd4+5834+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="PakH2jaX"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467dg326JtzDqk5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 15:38:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SlVqJKDhHhOV65ho42xhKFAezVWVkPicox2Ec3tGxgk=; b=PakH2jaXbBToCfuos4t+CAubT
 lwx/wRgTpVs9alNcOCtl8VsIzzS5fl6E+TxQWxiS+iNy2NehAm1OUonV55GXj4rxxGY3Q3YpZcw48
 qiEr3JyqLHobUgzDpC0ed+RLOkOUf/Njyg8q7o1fixpxsAAK/kDkij4TVOL7Mh9F4JEOHws06O99F
 nSNgA1gaW0bE04qxe7mj+XreHnHfGTqBJgH1LtISXjFlGVsENnC9n/8IR5YO1g3DbuE0O2Z0W7xlu
 5BekPF04RbiJY2dlIvnotC7vUgpmOuhtWaLRixG/ov1LsbQpe4ec4Fj08zrXQN9ygD/jKrd6MBo5h
 MitR12Z7Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hxlzf-0007CA-DV; Wed, 14 Aug 2019 05:38:43 +0000
Date: Tue, 13 Aug 2019 22:38:43 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v1 02/10] powerpc/mm: rework io-workaround invocation.
Message-ID: <20190814053843.GB27497@infradead.org>
References: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
 <d6049aee232029c01c7569975d49455058c945fe.1565726867.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6049aee232029c01c7569975d49455058c945fe.1565726867.git.christophe.leroy@c-s.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 13, 2019 at 08:11:34PM +0000, Christophe Leroy wrote:
> ppc_md.ioremap() is only used for I/O workaround on CELL platform,
> so indirect function call can be avoided.
> 
> This patch reworks the io-workaround and ioremap() functions to
> use static keys for the activation of io-workaround.
> 
> When CONFIG_PPC_IO_WORKAROUNDS or CONFIG_PPC_INDIRECT_MMIO are not
> selected, the I/O workaround ioremap() voids and the static key is
> not used at all.

Why bother with the complex static key?  ioremap isn't exactly a fast
path.  Just make it a normal branch if enabled, with the option to
compile it out entirely as in your patch.
