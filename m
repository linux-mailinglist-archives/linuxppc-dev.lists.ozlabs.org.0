Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5180C1FCD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 13:11:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hfpb1FTDzDqMB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 21:11:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.b="Ila6+TGD"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hfmw6wHZzDqL0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 21:09:35 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id t3so8206132edw.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 04:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hoPRGHVbwreJaKuJTwMu/7M+v6vkzcXMl4wfx/l4eck=;
 b=Ila6+TGDovETpv53sOvQ2w517iJMEK2OyPuLBJdC84lAOrQaaRg7L2y+3nOZNiBUt3
 mFjXVUTl8C5XPk5VoHn1QgpZAUmS/WKIVsh6QwsC3xmNHmJdSdezRHkm2xpEgJbW+0LV
 4giPfze5ugsDvbN1ctarvpHVdm2s4iYBu8Qdwr9wtnBCy6NrLe3xZjTxT/wbl7Gda1eD
 ohtWPbeEf6oponrlUUny9k6gouA44jM1BA4f+nCvNHPM+jf00DRdA3CwzI8tchv4MyPy
 7wq4d+26j+mErCT44DF39giDowfgNSFIFjRYU7RjaBPvJN81mLFNu8i9ose03vg3fSOl
 044A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hoPRGHVbwreJaKuJTwMu/7M+v6vkzcXMl4wfx/l4eck=;
 b=frS60Zlzxj9/eUf/hnwBVnUGPB134BYMKKIZ0cMqbb6X2PNNFVQ0WY4HldYidxU2It
 swSAgZgKn3SyAoCkUh9NrDGGvRYt0SDCXi6uif1wNrvzKqHnspsAinN01WsNqPnq4I0M
 IoSGjIWZ4K1ZsFmD8ETXIT2B/bNmuIVe1+THs+UDegK5ML9YZqcfCAlXKXGgfaoaHIyY
 WZfVf0C3OmXRUsRLkIApgMKZ2KNKO2/bwSXJWz9B1D9G/dKsKzxWJ8LYWdfhUPXbI3nQ
 Ecc+i1clTvdSAEqi/aAVsFBhVigKC8cHr8c1X24CF6ENmDHyIV4UibrN50JXeggvc259
 aFaw==
X-Gm-Message-State: APjAAAXzp1PVIbdBXRMGVzLqwFq4U0lBc4KUYHuTIo3s3ZdILg/SNB+2
 CQpcxMWMlLYMnxS83sR4HKigmQ==
X-Google-Smtp-Source: APXvYqwJ5k7lQ3pCPgimrWcSKiti3KDcvVnrCKGQE+0+9kADA50ZcFoZz8cFJ7AyLCtn3uHIdpAVOA==
X-Received: by 2002:a17:906:c7d4:: with SMTP id
 dc20mr18745450ejb.235.1569841769833; 
 Mon, 30 Sep 2019 04:09:29 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id f6sm2370369edr.12.2019.09.30.04.09.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Sep 2019 04:09:28 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id D09D41020E6; Mon, 30 Sep 2019 14:09:27 +0300 (+03)
Date: Mon, 30 Sep 2019 14:09:27 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Leonardo Bras <leonardo@linux.ibm.com>
Subject: Re: [PATCH v4 03/11] mm/gup: Applies counting method to monitor
 gup_pgd_range
Message-ID: <20190930110927.nanq2wynvfmq7dhc@box>
References: <20190927234008.11513-1-leonardo@linux.ibm.com>
 <20190927234008.11513-4-leonardo@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190927234008.11513-4-leonardo@linux.ibm.com>
User-Agent: NeoMutt/20180716
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
Cc: Keith Busch <keith.busch@intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arch@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm-ppc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 27, 2019 at 08:40:00PM -0300, Leonardo Bras wrote:
> As decribed, gup_pgd_range is a lockless pagetable walk. So, in order to
     ^ typo

-- 
 Kirill A. Shutemov
