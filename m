Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A93AE657
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 11:10:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SK4y14hlzDr76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 19:10:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="QYcl9tvm"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SK3G1PvXzDr0R
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 19:09:08 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id g16so2205006otp.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 02:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gzySq2KgU23Lz62leK1/JYGc7N1eDn8ko0/2bOX2/jA=;
 b=QYcl9tvm/E8Bmj+3/7A3sDwjTV1JrxFts8PHtnSfl9Bfcoq69qypc9U89qKqe0f2EQ
 uuEh2GnVcws7kS/Fagzex3PDMNhSLBJJCrY3T2z0ANeyE9jsY53teLqUKwYt/vtafWQS
 ysom1jPbg2ko8BjpXumMqfTLNJTH0iIqMIwLTQwxodyLaz6ozOgvmz7k5fQWUl4L1Uwa
 E27aXddAqDmNOG76TH4rj5U6zOgHz1WW1SaIE8IBJmKVYCoxKXGd42J82Q8Mf9ArWfjr
 CwkuOzAYgnlLdBClYwWOtChPPBl0xkoXSCdbGM6HGLduIhfJo7j1t4egYJ+EuC0QN7yn
 n19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gzySq2KgU23Lz62leK1/JYGc7N1eDn8ko0/2bOX2/jA=;
 b=ntvNdhWc+17kPVqCGQ+MjinrdULxj7DA2Mo9665yUKoPbtuOJiyU4ERaocnEERxLz8
 F4B2cf7iwVjPjTPmoRCm+CiXVi25BhITzd/Fyyx0utg+20NghNrpFTXIrAUiicEhe9BV
 628Y09+ZbWg2uUuHROniL4NCpkocdt/a9cnDdLF+PNi6hmdwuqBdhReL4j4v2XknYPb3
 P+xfZGlHGGX4CqbhA4mtusUR2LBjtuwRzUxxEGrK+4vT7wbnTnWRjTBqNz4wCeDar3Ox
 RRgoeWACEi3z7pEyuBLrv61BQlG7uPxmznuj24DTR8/OTIW10BmY5vUGhsJgo4PNGemo
 USNg==
X-Gm-Message-State: APjAAAWhPV6DaXyP8EwqwiOQbC3TOCuMwTJ/ilQP2uQjmY8MnUz2TYee
 GOzADtvllR8hLrb4gDBMXzIcPdl3oF3brDbT4QYG/Q==
X-Google-Smtp-Source: APXvYqxwLshjInXu0oU2m4xsjP474lcUaazRBBAqlBtfF7xR3iJNA8yJ0eNDpzK0DGmThD+e5HZt29ol1d8Q4WS4GVY=
X-Received: by 2002:a9d:6d15:: with SMTP id o21mr25318322otp.363.1568106545407; 
 Tue, 10 Sep 2019 02:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190910062826.10041-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4jmO381oLTHBM80jNy6uNNkXvsOyGTjqSY4zzaS6-4_nQ@mail.gmail.com>
 <14129b58-37a5-56f5-9e90-8740400d07f6@linux.ibm.com>
In-Reply-To: <14129b58-37a5-56f5-9e90-8740400d07f6@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 10 Sep 2019 02:08:53 -0700
Message-ID: <CAPcyv4iYjz-v23eHkhnJqE4wnvoE2uvJ5HE9xrwPCnOCVZ3G2Q@mail.gmail.com>
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

On Tue, Sep 10, 2019 at 1:31 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 9/10/19 1:40 PM, Dan Williams wrote:
> > On Mon, Sep 9, 2019 at 11:29 PM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> With PFN_MODE_PMEM namespace, the memmap area is allocated from the device
> >> area. Some architectures map the memmap area with large page size. On
> >> architectures like ppc64, 16MB page for memap mapping can map 262144 pfns.
> >> This maps a namespace size of 16G.
> >>
> >> When populating memmap region with 16MB page from the device area,
> >> make sure the allocated space is not used to map resources outside this
> >> namespace. Such usage of device area will prevent a namespace destroy.
> >>
> >> Add resource end pnf in altmap and use that to check if the memmap area
> >> allocation can map pfn outside the namespace. On ppc64 in such case we fallback
> >> to allocation from memory.
> >
> > Shouldn't this instead be comprehended by nd_pfn_init() to increase
> > the reservation size so that it fits in the alignment? It may not
> > always be possible to fall back to allocation from memory for
> > extremely large pmem devices. I.e. at 64GB of memmap per 1TB of pmem
> > there may not be enough DRAM to store the memmap.
> >
>
> We do switch between DRAM and device for memmap allocation. ppc64
> vmemmap_populate  does
>
> if (altmap && !altmap_cross_boundary(altmap, start, page_size)) {
>         p = altmap_alloc_block_buf(page_size, altmap);
>         if (!p)
>                 pr_debug("altmap block allocation failed, falling back to system memory");
>         }
>         if (!p)
>                 p = vmemmap_alloc_block_buf(page_size, node);
>
>
> With that we should be using DRAM for the first and the last mapping,
> rest of the memmap should be backed by device.

Ah, ok, makes sense.
