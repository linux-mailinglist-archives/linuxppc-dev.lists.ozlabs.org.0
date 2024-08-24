Return-Path: <linuxppc-dev+bounces-474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BC195DB64
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2024 05:58:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WrNTV6GBJz2ykf;
	Sat, 24 Aug 2024 13:58:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724471918;
	cv=none; b=lHkVRVJCc7U98ckVCQleN7zdZdAzz7p012pNCv/r0dl4XSpi0TrwoiukLuQ8WdIFe1/ddgjcILuhlKRDzPnoFD0liLvtI6FOuH0lve9kgtEVp3YRZBmD52V/4I7mKJNdLTLksBzEh21XHR4eruuZyKX93Xf3zFHYQZEiU0+W9/tICl2jgq9IrJfVaMgjmyr9JWE0j6L1IxqIgHFxcC/YpqCOVVV/DFz4953nKIZP08yYLczSBiONnynFiUxz2myNw9OAP6Pen8LB7OGAfq8JsEtyr9bg4gfwWfFcAQW8W1y+jcrV4JhFh7MlHqW+EuEwe9mlyosbDzdeblP47vLOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724471918; c=relaxed/relaxed;
	bh=Q2nYRi9U4a8itDtDq9LNnEMZ/Twd4vEjX9CTeiWFtZk=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-SRS-Rewrite; b=k6b2he0mtevVd1UfpEGa6tBYGzQ6gvyGWztu+N2j/NGxl7W4XItiRMoOIM6RfucZDYl1yo5h4NVAgNCf3dFr8xS5CKgKjYISZrLNPwrP68zO5NLHGEJZm+RjEXzczNFMrFScBMfKZK7J3591hZvUr+bmsJgemzXdMtuhH5T7wDFB0ugnQpfSW0PI3FuVPBums3F5bd7h1yYteilsdQnHZVK/97q5Z33XeR+zMCB0mywZHxW4HvyCezseFflJKGYXxc7v9ng7BanWLudCdHHmxn0KYxUm3HQLjrBJmlU8f7PWhGQ62aNz7SFzZe5W+SMrpN5Ef88bhRjwvxY/OnU/Mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ibODa9lL; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+57a39d84037f3fd726e9+7671+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ibODa9lL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+57a39d84037f3fd726e9+7671+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WrNTS0lFSz2yPM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 13:58:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Q2nYRi9U4a8itDtDq9LNnEMZ/Twd4vEjX9CTeiWFtZk=; b=ibODa9lL5q7uggEbw2OOQZkuOl
	gdhQY0r9D/9beDb+Bd4qmVTCvwI+QiMjo95/+tPj+4V9U7F5hRFToRdX4k4DvPYHu1OLEHcIx+etT
	KIlSwzlSzvMKbYOerqEj9me07yLSDIeP/0/bbrlY9qqah4ekXhqi/eYjBvvldU6VljO5zLO6djC2Z
	2yksa1axP4sCcbZUGAWwKgEmbBGoAFPkoBoCxdpgqo5+6g1QWpb94Ilm4RmYcg8FZcggX2U6K6Sfe
	cGdem+9zPaemNy7/Cr0ZBWXuCzcsmrGl8tEN+ptWMeKG1q46THZ+VeovOI19ardMWa1DQRk/ZtOsI
	ioZS20vQ==;
Received: from 2a02-8389-2341-5b80-7457-864c-9b77-b751.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:7457:864c:9b77:b751] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shhut-00000001ON7-0bmD;
	Sat, 24 Aug 2024 03:58:20 +0000
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
Subject: clearly mark DMA_OPS support as an architecture feasture
Date: Sat, 24 Aug 2024 05:57:57 +0200
Message-ID: <20240824035817.1163502-1-hch@lst.de>
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

This series renames the option to ARCH_DMA_OPS and adds very explicit
comment to not use it in drivers.  The ipu6 and vdpa_sim/user drivers
that abuse the mechanism are made to depend on the option instead of
selecting it with a big comment, but I expect this to be fixed rather
sooner than later (I know the ipu6 maintainers are on it based on a
previous discussion).

