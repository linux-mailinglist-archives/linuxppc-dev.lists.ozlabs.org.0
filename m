Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 561B9AE52B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 10:12:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SHnk6fSmzDqYb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 18:12:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="rPET32eI"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SHm32f09zDqXQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 18:10:57 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id y39so17129751ota.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 01:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QlB5C2Qiud9g32s9eqdaZLMFUYhvN4j5EbGFXFjXWus=;
 b=rPET32eIDAd4gaZHT61j86Q0xFLVBvLMT0Jg07yNPG899fgP/whW1CQ9S/zsnU8jk9
 LsPPzArWFFwSndP9G0ptTQV35ZfEX9neYY3TizcOxNujCaqDz6jLLQe1GDBiRdRh1P8R
 nVzeaY0UbYMdnWDEvoCED3sc663ICcO0ONtjvfNrN/fjCQ2Z049eL+BgqmvjXBi7bAHu
 P0U06pkgIskTnyPK51MuKONQ3wThYc73PbrsrM7QjJZ8ZnC4BEGxlLw8pA+mXsapkqdp
 o/IiVseI8sL5xRYopXqC7XSCIwNscycDqlNPLaMaIrGp71CBbbtpal419N8nKNLi8v3d
 rXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QlB5C2Qiud9g32s9eqdaZLMFUYhvN4j5EbGFXFjXWus=;
 b=N5P3cqRnEN2duEKjPxHfuwGu3bJJUSu2uEIQYwTbDBevUE/ng9x6i35A/gPMnA88ze
 Q4Ey24pD+BnFwhH7/PDjhqXWsQa6/6Ltk6+xeSEE3GgP/tAWFa2jzqt2hI91umtxBmoj
 FxjKLiexOomgNgVyn9yz8/MP/gkYxcVfXdWQm5vs0r76c0dq53G9oR8GIJpEGb5YPqU/
 THqUhBIcRhBZoIENFmwcmsN74iEcSf566SI4dDiy2i0Whe8WKr4KrQn31bVr7gQagqJO
 QLyyVNC7QGlrq8RzCGfQ8Uza0d6ZZh9+4NuGtKFMELCoR6FBfBHJg3huJYkJRqzJR7+Q
 E0yg==
X-Gm-Message-State: APjAAAXgT6dukw54EsRBvYDXX0E98ehZNQfq8bV/jGyqcDzfD59HeQZg
 e9c3GkYpTk/rrkwQXhIXDhPV+7+s/aFeaj7B8CMsiQ==
X-Google-Smtp-Source: APXvYqy1NXK41V3Ck9QFJaZCAALhijgBMiJveNzCw1I+jdRMd2EPGEWQBUvjsFu6z+kJV2trz1531iJZT3nKGev8p4I=
X-Received: by 2002:a9d:2642:: with SMTP id a60mr23458806otb.247.1568103053962; 
 Tue, 10 Sep 2019 01:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190910062826.10041-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190910062826.10041-1-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 10 Sep 2019 01:10:43 -0700
Message-ID: <CAPcyv4jmO381oLTHBM80jNy6uNNkXvsOyGTjqSY4zzaS6-4_nQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] libnvdimm/altmap: Track namespace boundaries in altmap
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 9, 2019 at 11:29 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> With PFN_MODE_PMEM namespace, the memmap area is allocated from the device
> area. Some architectures map the memmap area with large page size. On
> architectures like ppc64, 16MB page for memap mapping can map 262144 pfns.
> This maps a namespace size of 16G.
>
> When populating memmap region with 16MB page from the device area,
> make sure the allocated space is not used to map resources outside this
> namespace. Such usage of device area will prevent a namespace destroy.
>
> Add resource end pnf in altmap and use that to check if the memmap area
> allocation can map pfn outside the namespace. On ppc64 in such case we fallback
> to allocation from memory.

Shouldn't this instead be comprehended by nd_pfn_init() to increase
the reservation size so that it fits in the alignment? It may not
always be possible to fall back to allocation from memory for
extremely large pmem devices. I.e. at 64GB of memmap per 1TB of pmem
there may not be enough DRAM to store the memmap.
