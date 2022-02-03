Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC184A7C48
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 01:06:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpzTs4LW2z3bcp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 11:06:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0tFyjfZi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=0tFyjfZi; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpzTD6Z2Sz3bNC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 11:05:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xQooU1SeAas1UxR3X3UmWtN5zzl8oAjoZoNwYOADmzQ=; b=0tFyjfZigtDVzKO8NKFpEoPnFT
 +BCli90uB8dnN9Zb3T7haQ6WAVu9sc6f+G7578f6V+Ed7sq0Cjjc49k/pzlpBvQ2AIereclmGEPDp
 ON5m/YH0TmOLFNw8nDW0zc0VzUNFsfpDuhwNgjgmnGdkTPKnVx0HsdMG4TpsddoUk6Oc2Rhr8PlgS
 T9Se5iyhiWEbWWL6h4rbGDsFYCfK5t9NDYSf5hnBO2g+lA6lpIcMDGwHHhG2XV6ksmXUVKGwsRsiP
 V02pOQjQdh3QBDPMCF3VRYFQyMJVOfRTh0KfBezd9cKBgnMqC0/KCgCvhcdI2i173NI43neERYj8I
 mdDf5KHg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nFPcx-00H7nP-G0; Thu, 03 Feb 2022 00:05:31 +0000
Date: Wed, 2 Feb 2022 16:05:31 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Aaron Tomlin <atomlin@redhat.com>
Subject: Re: [PATCH v3 0/6] Allocate module text and data separately
Message-ID: <YfscSzltd4UcZSCO@bombadil.infradead.org>
References: <cover.1643475473.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1643475473.git.christophe.leroy@csgroup.eu>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 29, 2022 at 05:02:03PM +0000, Christophe Leroy wrote:
> This series allow architectures to request having modules data in
> vmalloc area instead of module area.
> 
> This is required on powerpc book3s/32 in order to set data non
> executable, because it is not possible to set executability on page
> basis, this is done per 256 Mbytes segments. The module area has exec
> right, vmalloc area has noexec. Without this change module data
> remains executable regardless of CONFIG_STRICT_MODULES_RWX.
> 
> This can also be useful on other powerpc/32 in order to maximize the
> chance of code being close enough to kernel core to avoid branch
> trampolines.
> 

This looks good, however I'd like to see Aaron's changes go in first,
and then yours. Aaron's changes still need to be tested by 0-day and I
need to finish review, but that's the order of how I'd prefer to see
changes merged / tested. I'll try to review his changes, dump them to
modules-next and then I'd like to trouble you to rebase ontop of that.

We should get all this tested early for the next release.

  Luis
