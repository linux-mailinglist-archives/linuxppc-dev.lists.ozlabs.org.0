Return-Path: <linuxppc-dev+bounces-9444-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E265ADE318
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 07:39:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMXbw3qD4z30RN;
	Wed, 18 Jun 2025 15:39:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750225148;
	cv=none; b=Yt5oYWEt5Kbsi7Hx6/uvbzSqYlewOX1lAyyCOIduVLhEGTJmse4CaXex5dWdNOTC9cz6wahYd5XHPqwdKYzIf88YjkIJmMdEdBNbCMd2p3krNHbSvC4xfclNNqMfkNnNN5q0PbCjLX2P+8g8XNSINaMR0CSEFwe4wqiS3ddI535htw3xJ113PDddy1HfyJk9Wloy/aXvNfyz0j17Gzfx8h9nAiViWH5AA+gpWoyrsfqO56EYAiF8pKUmB6b7xLKSVSlmPUy1aP2Twg3LgoKN2k2GnfZATpMkpfNEsrKLzURpzQ6//TsOju3WrQRaI6chwi1iVdrlgZqsBDVciC9BZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750225148; c=relaxed/relaxed;
	bh=0VfDKR79Vtwn5VxJOChmtPjWAJZfi4MTkhv0klH8VUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nww1Ae0xR16gOAiobIso5a/OcVe1nVqwPyNg29Qple88OiCnGBqSYWB+jNNxFUaJPRlIGkw3EAZdGrqBGAcKC1gF7O64/UcYNKb1eVIeHQAaL59UOE2Z67sHZJHnowkg+nnncGhda9rKHXW9WouSgZeoq5j4xbuWJJ3i6uJ23NfE5peHwWu+BTnN9Gc7rpglFT/6o92g4rWAekuKFBVgdsiypP3m72gm4wlIDYA4mqdzv5DBrZvZuqzfh4h1VHPzIiy0IpKFwmSAsxS7QwLXLa02ynh0sys4WTnc+9Y9klvyX09iYgZ725ixaMCL7CgWkhugVmQHoT64OFlyrRKqlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+826cfafe48c3f27d09fc+7969+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+826cfafe48c3f27d09fc+7969+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMXbn4M3Nz2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 15:38:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0VfDKR79Vtwn5VxJOChmtPjWAJZfi4MTkhv0klH8VUU=; b=AhWyVqsA3j3LhyCrTsVnb6uTsn
	9r6eUym64zHlFvMOujpVErXmuxZQzBpGAHf1t8TqLy87/VyIOL9uzm/ZdUVdiz/B19k2KVu7Ye40r
	mbAeh0+vhywNjZniEURh0ncL8SIKwNm3DZU75mlqhPVHVZQY5qONFOShAFrwqXsxxwbGSEp2nsqis
	sqMQZI/VXqT+yY4NrSb1Srah+zvhVs4VmAgrGpwwANoFS+Qy4WjpXkCUfgvPrD2Dcw7GG3iyEJEJY
	l22KO9U5zP3AOTEuow7mmc/cEjcZVJnC4idkyj4mM2zRrVK9hm0cZbS8yFg3Hw7OO91YpFwVHUP90
	HxZfSLCw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRlVg-000000096Bv-3dIB;
	Wed, 18 Jun 2025 05:38:56 +0000
Date: Tue, 17 Jun 2025 22:38:56 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH 3/8] powerpc/pseries/eeh: Export eeh_unfreeze_pe() and
 eeh_ops
Message-ID: <aFJQ8AtYlKx1t_ri@infradead.org>
References: <946966095.1309769.1750220559201.JavaMail.zimbra@raptorengineeringinc.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <946966095.1309769.1750220559201.JavaMail.zimbra@raptorengineeringinc.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 17, 2025 at 11:22:39PM -0500, Timothy Pearson wrote:
>  /* Platform dependent EEH operations */
>  struct eeh_ops *eeh_ops = NULL;
> +EXPORT_SYMBOL(eeh_ops);

Exporting ops vectors is generally a really bad idea.  Please build a
proper abstraction instead.

And use EXPORT_SYMBOL_GPL for any kind of low-level API.


