Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3CA3F8C39
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 18:32:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwT0c4wTTz3083
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 02:32:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=bykCvx5Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+f446f559853770003669+6577+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=bykCvx5Q; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwSzt6QjMz2yZd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 02:32:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vwCaRlHdeFqTGdftXcHYxGmcrUpfebbr5m9LF/gvgDk=; b=bykCvx5QsfuXXmjZrcaoBhSpUt
 3dJb1z9QCYjDp2rreZvtVBhlWluqU3zc53DGBC6f7D5zMjjZDzjf/tWpFvLXZGIqwaIQizs/AMfFl
 q7t/qq3NMK5DT1OPqWnpFZq6dPvTFVhtwRuE+vyos0mGT3XV5i25QKy1c9w8FeHXnxFnuQaqbmLa/
 ohTjq/ktLWuiGjHz4UGxjDOumjISMERe509C11ppLyNfy2uokv0Fe/GbOyVJQUgjyDGzvclt4Azoy
 AhalNIBiSQfcQytfZP+dQLgnLluue+hr8kkGW9vo/v4jYLhr6cj9G6E38Daj2PK7vy5r/dsX4a9Bq
 /mtQaopw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mJIHK-00DTRX-Vh; Thu, 26 Aug 2021 16:31:17 +0000
Date: Thu, 26 Aug 2021 17:30:58 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [next-20210820][ppc][nvme/raid] pci unbind WARNS at
 fs/kernfs/dir.c:1524 kernfs_remove_by_name_ns+
Message-ID: <YSfBwj1zo/w2GCH4@infradead.org>
References: <063e6cf0-94ab-26f2-4fed-aebf1499127c@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <063e6cf0-94ab-26f2-4fed-aebf1499127c@linux.vnet.ibm.com>
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
Cc: Brian King <brking@linux.vnet.ibm.com>,
 linux-next <linux-next@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Are you sure this is the very latest linux-next?  This should hav been
fixed by:

    "block: add back the bd_holder_dir reference in bd_link_disk_holder"
