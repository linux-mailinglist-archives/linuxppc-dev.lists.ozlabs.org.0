Return-Path: <linuxppc-dev+bounces-635-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D14A5961F21
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 08:11:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtvDq1Xvqz2yVt;
	Wed, 28 Aug 2024 16:11:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724825483;
	cv=none; b=VOUxcvWQToXQz2qry+bhZNWm8are2arnDZtLVNZo+fixdHuBhuOyXkF+HVcEIaQL48OvIj6iy2GQ0Xz3CZVRaIhbro2um2zwknK9BqDVLsKBleX4/7dHiGveygBJl6rHu39moyvRQxs8dCOsa+VBxNFydOvlCXEuojYCFWEJv7Q3zTJQCe8i7mDPGkDSCnQXlA6HRiaaDpf4HaJbqsNL9/faX8VGmolOWQ4pSac4HantRxmxYZmGeYdqrWZumwG4duyMhOdUYjB9viVVX9brjPMFcJy79nqIhAOBtzrOZ85f0BciO2mbdaHTKhbJfgLnWfcQ4RAiLV9nRDT5Hbr/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724825483; c=relaxed/relaxed;
	bh=3ciW+jDJYrdLJiK7yrXhNzVEL4ig56HUYUk4VOvh/z0=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-SRS-Rewrite; b=m9HUO6irGS00O6XRyvvpcDV4BJ+CO49RFVRYzso1GEFa/TzFmnDnnIbvNK837RDAVY0ji3tdCyCjVwsEJKT18eRTbgEekQg6wuAT8+A11h+nfWChqab2pMiDdfIg/RsWIYkFcoOOX1gBwdpN9Zhwe8ttABL1QIG49joCLAUQIB3hY3QJ4PAXr4dFpzJzDla8IUkz4gb8WJeFkolQI/BHqRK/ux5Cq7xt7E5znRDbZUOXrFcijABblkt9/+N2ec2WSD1PM6MkKB30sl9AyQu8cLUnoJ7g40mr8lQim8kjkznPNJJpqO27JR8tULdhvskLIp9B5DESDaw3IEs+8RDl3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+4c6678e563c2e29e76cf+7675+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+4c6678e563c2e29e76cf+7675+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtvDj3fxWz2xs8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 16:11:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=3ciW+jDJYrdLJiK7yrXhNzVEL4ig56HUYUk4VOvh/z0=; b=DachNt1cx+ujVHKXHJfhguYPcC
	9aAqfBoRuTD2BycDnkoq2+XVJgduR0jUZafb+wHb4B+tRHNCEo+SGOrtcsQvZMydA7tNGInWBQs5w
	69FOaQMwVwWuo6pPJtsi2BcUec+73lr/fSkNmYLKWVNWI7lSQZKrpLFPAp9IcRtasZAYiQf8cOkxO
	tni42Ic2e8NqYRy7ZadXs2xugccm0Zfp5fifHQ9pwwtZOGq968HzDTabeQWV+VtZubJN2NukZ+srM
	m7lxrEC4huwPqB6G7d3uGQA+7nAvrJsZgB3gE8FZFou6JBOpJJHKhnTlWsvD8OBG21HfoKRWJ0AQk
	brwIO41g==;
Received: from [2001:4bb8:2dc:a2cd:2ccf:8fbe:8ab4:c9db] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBtc-0000000E1uI-0svg;
	Wed, 28 Aug 2024 06:11:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin " <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-media@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org
Subject: clearly mark DMA_OPS support as an architecture feature v2
Date: Wed, 28 Aug 2024 09:10:27 +0300
Message-ID: <20240828061104.1925127-1-hch@lst.de>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

we've had a long standing problems where drivers try to hook into the
DMA_OPS mechanisms to override them for something that is not DMA, or
to introduce additional dispatching.

Now that we are not using DMA_OPS support for dma-iommu and can build
kernels without DMA_OPS support on many common setups this becomes even
more problematic.

This series renames the option to ARCH_HAS_DMA_OPS and adds very explicit
comment to not use it in drivers.  The ipu6 and vdpa_sim/user drivers
that abuse the mechanism are made to depend on the option instead of
selecting it with a big comment, but I expect this to be fixed rather
sooner than later (I know the ipu6 maintainers are on it based on a
previous discussion).

Changes since v1:
 - s/ARCH_DMA_OPS/ARCH_HAS_DMA_OPS/g
 - spelling fixes
 - vdpa_sim actually doesn't need dma ops these days, add a prep patch
   to remove the dependency

