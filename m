Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9BB74E641
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 07:13:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zsYBwGu2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0TYB00hpz30fR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 15:13:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zsYBwGu2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+77046741297d6883d172+7261+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0TWN656Rz2ynt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 15:12:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=zsYBwGu2f/Iib7AX0FTXomrMvP
	e2btr86zCRmEdGGfoJ4gahcVlYQATiE7DlZQQt2hi43xQJoS4kwoqsPSUr25E0FQbZjGnvU5ICcyV
	zov1SGLyE2avvmK8EnWYzKbAF97JZBh3S3Prt5OGbO4/MYqIXZiNVlV0/Zi3KRlZsqHpNgCvnbAC8
	6q1gw7O7ZzEsDJOp/jy9VHXgVX3nPYITDFK42Y5heFy0sBfrbkBBlkeaOkmewdWupXileiAhpZ/ni
	Z5Xsij60T1AVSRakkPRmvoqmtzBHTQaEU3Wauec1D9/Q23UZZoQN8PHdUwXQxX/J7bLHdzl+1plI+
	K5k5uwyw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ5fI-00DivK-32;
	Tue, 11 Jul 2023 05:11:56 +0000
Date: Mon, 10 Jul 2023 22:11:56 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 2/2] PCI/AER: Unexport pci_enable_pcie_error_reporting()
Message-ID: <ZKzknJc3jMunm/w1@infradead.org>
References: <20230710232136.233034-1-helgaas@kernel.org>
 <20230710232136.233034-3-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710232136.233034-3-helgaas@kernel.org>
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
Cc: linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
