Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7353A776B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 08:54:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3zZK21K8z3c0d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 16:54:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=M25VAanL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+01b1093948f83d17b939+6505+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=M25VAanL; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3zYv6y2dz303P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 16:53:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6LV9BM3Pp04bKu2UoJ3ix0LclPXqE12gKen1uMnIsOs=; b=M25VAanLtpaXgntkN8Qf+Wt8ZI
 dktarA5AKe+TZ3bnF1bMS18t4h0YDZgtYjpV49hYatGmyAW1TuO31f5dM3blXZ9+I8qplH81hwJHg
 hxDRsnRM8GBHA8ZjuMqH+/pzOquOfj0Nv9GqDHPLAv4kfDubE/mlYKQP1dJ7Mqn7AZw5NP7e45rMr
 JFnOj+0j35MeAzCxCHEsryXkUyY6ajxlYZ73OTArbbbLSMmwe9gHPieS3frliTgL8vIeYtc/99fZi
 B/9I8AFjZ3iloa8gnLwZjHb8iwAyPOQvAUcVL1I/JbB+l+MVlCY+qAm1N6XQuFpxBrUE/Rxt/ig67
 aYZrJp+g==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lt2wq-006BNx-Ar; Tue, 15 Jun 2021 06:53:23 +0000
Date: Tue, 15 Jun 2021 07:53:20 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 6/7] powerpc/uaccess: Add unsafe_clear_user()
Message-ID: <YMhOYKM5+s0wUoeP@infradead.org>
References: <b813c1f4d3dab2f51300eac44d99029aa8e57830.1623739212.git.christophe.leroy@csgroup.eu>
 <67eedb69ca81e5a4b16459a4c61f99e64cb42675.1623739212.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67eedb69ca81e5a4b16459a4c61f99e64cb42675.1623739212.git.christophe.leroy@csgroup.eu>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 15, 2021 at 06:41:02AM +0000, Christophe Leroy wrote:
> Implement unsafe_clear_user() for powerpc.
> It's a copy/paste of unsafe_copy_to_user() with value 0 as source.
> 
> It may be improved in a later patch by using 'dcbz' instruction
> to zeroize full cache lines at once.

Please add this to common code insted of making it powerpc specific.

