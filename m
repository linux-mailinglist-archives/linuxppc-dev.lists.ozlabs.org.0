Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2E7267FB4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Sep 2020 15:46:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bq9lH4KbDzDqc2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Sep 2020 23:46:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=MfV1m7bi; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bq9g91vdbzDqXw
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Sep 2020 23:43:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=e2PBpz+jKh/itO4y1j8TEtx5W0qaBo51qiNXuB/YB/U=; b=MfV1m7bi4eEu+a1EyKDYeJn3Vq
 QTtxZf1OE5l0IdcXMiNlxT+uMJfQfJNIccQfV2KbpuSoNvFs1RXgoM4vgdfkwFLxy6jN3YpbQRhNs
 MdCB51v27BlY6owa/xrSf5jG1nNkIu3O0osnFTTLn4XbrN7UrhFzL283dV1xuAxcEKBSR99nEe1jI
 Xt5UIHpFgLupASpTPOl5dUSNRnR7R/Hxk6CtkdoGCkLEffwVjHVF2xU2SVd2RHlZcItk5rJwoR3Rk
 6hwz42T21SUQU69SKYSVjTO5sjipUwiS0bE1mMd73YJEU1RaJXOnKM5qojoF4RFZXhX1WLIvATNHF
 YALUgcfw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kHSHI-0001Rl-Na; Sun, 13 Sep 2020 13:42:48 +0000
Date: Sun, 13 Sep 2020 14:42:48 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] mm/debug_vm_pgtable: Avoid doing memory allocation with
 pgtable_t mapped.
Message-ID: <20200913134248.GG6583@casper.infradead.org>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200913110327.645310-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200913110327.645310-1-aneesh.kumar@linux.ibm.com>
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
Cc: kernel test robot <lkp@intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 13, 2020 at 04:33:27PM +0530, Aneesh Kumar K.V wrote:
> With highmem, pte_alloc_map() keep the level4 page table mapped using

.noitcerid etisoppo eht ni selbat egap eht srebmun ygolonimret xuniL

