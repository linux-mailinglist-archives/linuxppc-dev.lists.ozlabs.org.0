Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D03B57AE6D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 09:28:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GgDOX9CW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvrvV5MBKz3cm9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 17:28:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GgDOX9CW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+2a2c9b7848046cbd39dd+7338+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvrtW2HYVz3c2V
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 17:27:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C1EY996H2+nH9kVv7VeJU7gdej000u01sa7M392CTh8=; b=GgDOX9CWEbDc4YMM/aQ26SsUk2
	b9PNZ3qRQ6wNjEp8D24yZ6pSz/DQ5m1/YwEnvv/vklPcFF5gm0sMGut4fYDXCa853VmHgFPt2DDsI
	Gyc7MZtPtTnNdZYMJoJ/J0l4z9YT8UojXVzWfacia1N+QBRRUcrzKF/d9LD+Kl0yiAQoSgXgVqWU1
	Xvocw4+WXqLTIH8G9ThPqN+WWHPYGyfTe0RRIAp7d6WbjXXqN9BISlhYc5K3Yt00i0/yOOkaj06ii
	YkyyObq/BrQCFSHSN4HbNzEfnoXd8Xaza4pACStfXRAxPAEcvrAWy95GTZ3Gw7wo9RsnXSw7DKlY0
	8woO0Dcg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1ql2Tk-00FnKk-0i;
	Tue, 26 Sep 2023 07:27:32 +0000
Date: Tue, 26 Sep 2023 00:27:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Message-ID: <ZRKH5CTucrT5BFwC@infradead.org>
References: <20230922042836.3311689-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922042836.3311689-1-Frank.Li@nxp.com>
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
Cc: kw@linux.com, imx@lists.linux.dev, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, hch@infradead.org, minghuan.Lian@nxp.com, christophe.jaillet@wanadoo.fr, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +	/* set 64-bit DMA mask and coherent DMA mask */
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));

The comment is a bit silly :)

> +	if (ret)
> +		return ret;

Also no need to check the return value when setting a 64-bit mask,
but I guess it desn't hurt here.

