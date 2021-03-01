Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 833C7327870
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 08:46:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dpsl13YDJz3d4P
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 18:46:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rO8ALAJQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+bce9324c41c3486454c7+6399+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=rO8ALAJQ; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dpsk373FCz30MT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 18:45:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=oZQdON2UeZGDjeY8BOuus4h51xz4D0PS1kfJ4kEC/6s=; b=rO8ALAJQqrZEeZ4iEOjPwi1WE+
 6R34dC8dSkDj+qIvIr6UcSiPxULXK+/lCvDQd59+1pjrXB8xmT7INZhQqgIGvc15iyacmBouUpYHq
 Do7OPE+zdqCAtk9VUQgSfWkGNCcxTuVUCNnmCtbqSRZctaKJeHAXhPDtIpyY5e7l26gK4ai4ARYuQ
 OrjO3c1J2ThGSimBb9YbvGnJZi0U/G5QKDNtYkU1CeadFjBoTIqGdPxrVjI5KeB/y+kcasXY76qMt
 ipKwlZlorTKY6C1UI0lpRn30rJKpqd3RD55IINoQG4ssYdZ6Z3/RZxvk8rBrRkpkhd5xp+qwszJTN
 W0EYGG9g==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdEK-00FR4S-Vc; Mon, 01 Mar 2021 07:44:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: swiotlb cleanups v2
Date: Mon,  1 Mar 2021 08:44:22 +0100
Message-Id: <20210301074436.919889-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Claire Chang <tientzu@chromium.org>, linuxppc-dev@lists.ozlabs.org,
 Dongli Zhang <dongli.zhang@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Konrad,

this series contains a bunch of swiotlb cleanups, mostly to reduce the
amount of internals exposed to code outside of swiotlb.c, which should
helper to prepare for supporting multiple different bounce buffer pools.

Changes since v1:
 - rebased to v5.12-rc1
 - a few more cleanups
 - merge and forward port the patch from Claire to move all the global
   variables into a struct to prepare for multiple instances
