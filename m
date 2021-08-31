Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1283FCE46
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 22:18:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gzdmt3kqWz2ymf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 06:18:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dMPYkL5G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dMPYkL5G; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gzdm81QKZz2yHR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Sep 2021 06:17:59 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id s15so642499qta.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=FWX7QDqAeTGxpfWQKLDU6dVUG/9zC9QbXzwdV9LlpIQ=;
 b=dMPYkL5GPKD28AeQdN53eGawFt/7ebRPpsxkOHxlNNFsIl68Xmq20eJjqxScyCQ7M3
 uAFtJOAh4sPISmKcYykXy7YZKyaNdcsO+nbB9oArAPhFDelR7TpxPAt4TXA/2n9+p2dK
 QtasMPC5zbdzyYea7u6Gv1lTWH6z+k9By6AqlVzRjJ0xHsBJXzf6ADo7E0dBvubphtgt
 0tM+oo/wTRAIi2IMSmcyQCVV44AGlNwGQpJt0Qv5qwqClTX+2eP39lLnjZiHlwmznTme
 HJsmsST2gYCTKxpUYdycuoNQVF7fBMwXlDxch7RAfGjPRmfgo1k55SHBYS0IQFE6TLq7
 8kCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=FWX7QDqAeTGxpfWQKLDU6dVUG/9zC9QbXzwdV9LlpIQ=;
 b=BHRNLOJuZ/OMX0N2XqSF99DIDW5Y6BZrxKJn6bPuNma8At9Hrkq4IyWpXxR3tg93yU
 aOD0DDI7MEbiIYA3wCGgv1U6Wz7/mfALpPmhpKJ5DXPdTR1toBlgFdsURyQ35TDoa0C3
 FEpGdqAgHAZgl91lNd+J0GsRVZN+4uo/571u+rAT0aFzm2ugOYcMoi5+9xL3CPUqFVys
 GRSYQyI8wHOL3GAbn9ar62VFo6/HE3qs7oBaqrRfA2UO1qmK44fnanfGhU062WOyERQp
 Q1njTh46z33/QJs1PWp9fuev/e+l4tTghzybHAlGMchtJMGYVFHMnSOmqmzsdx16Y1c0
 Yz+g==
X-Gm-Message-State: AOAM530yV2SZTokXU3cQ2Ke5AGLh9r1ZZXd1Bp22Ct2ooeALbqKLMUeI
 D7geXTWniuSoACPEVtP2maQ=
X-Google-Smtp-Source: ABdhPJzD+olKgBw7MHX1YGOOMEPpF6x4Jd7u9DqbrWJvNqYyImvjggUg3ntyPM7R+qxyHusSQEKmgg==
X-Received: by 2002:ac8:7c44:: with SMTP id o4mr4547116qtv.82.1630441074411;
 Tue, 31 Aug 2021 13:17:54 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f1:e948:8e69:9cd6:5512:12f4?
 ([2804:431:c7f1:e948:8e69:9cd6:5512:12f4])
 by smtp.gmail.com with ESMTPSA id f28sm14501184qkk.10.2021.08.31.13.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 13:17:54 -0700 (PDT)
Message-ID: <e867b4ddce01adf318bc8837c997ceb64e44c1c5.camel@gmail.com>
Subject: Re: [PATCH v6 00/11] DDW + Indirect Mapping
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: David Christensen <drc@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,  David Gibson
 <david@gibson.dropbear.id.au>, kernel test robot <lkp@intel.com>, Nicolin
 Chen <nicoleotsuka@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>
Date: Tue, 31 Aug 2021 17:18:11 -0300
In-Reply-To: <82ca56ab-6a0a-7cbb-a5e7-facc40f35c3c@linux.vnet.ibm.com>
References: <20210817063929.38701-1-leobras.c@gmail.com>
 <82ca56ab-6a0a-7cbb-a5e7-facc40f35c3c@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello David,

Sorry for the delay, I did not get your mail because I was not CC'd
in your reply (you sent the mail just to the mailing list).

Replies bellow:

On Mon, 2021-08-30 at 10:48 -0700, David Christensen wrote:
> On 8/16/21 11:39 PM, Leonardo Bras wrote:
> > So far it's assumed possible to map the guest RAM 1:1 to the bus,
> > which
> > works with a small number of devices. SRIOV changes it as the user
> > can
> > configure hundreds VFs and since phyp preallocates TCEs and does not
> > allow IOMMU pages bigger than 64K, it has to limit the number of TCEs
> > per a PE to limit waste of physical pages.
> > 
> > As of today, if the assumed direct mapping is not possible, DDW
> > creation
> > is skipped and the default DMA window "ibm,dma-window" is used
> > instead.
> > 
> > Using the DDW instead of the default DMA window may allow to expand
> > the
> > amount of memory that can be DMA-mapped, given the number of pages
> > (TCEs)
> > may stay the same (or increase) and the default DMA window offers
> > only
> > 4k-pages while DDW may offer larger pages (4k, 64k, 16M ...).
> 
> So if I'm reading this correctly, VFIO applications requiring hugepage 
> DMA mappings (e.g. 16M or 2GB) can be supported on an LPAR or DLPAR 
> after this change, is that correct?  

Different DDW IOMMU page sizes were already supported in Linux (4k,
64k, 16M) for a while now, and the remaining page sizes in LoPAR were
enabled in the following patch:
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210408201915.174217-1-leobras.c@gmail.com/
(commit 472724111f0f72042deb6a9dcee9578e5398a1a1)

The thing is there are two ways of using DMA:
- Direct DMA, mapping the whole memory space of the host, which
requires a lot of DMA space if the guest memory is huge. This already
supports DDW and allows using the bigger pagesizes.
This happens on device/bus probe.

- Indirect DMA with IOMMU, mapping memory regions on demand, and un-
mapping after use. This requires much less DMA space, but causes an
overhead because an hcall is necessary for mapping and un-mapping.
Before this series, Indirect DMA was only possible with the 'default
DMA window' which allows using only 4k pages. 

This series allow Indirect DMA using DDW when available, which usually
means bigger pagesizes and more TCEs, and so more DMA space.


tl;dr this patchset means you can have more DMA space in Indirect DMA,
because you are using DDW instead of the Default DMA window.

> Any limitations based on processor 
> or pHyp revision levels?

The IOMMU page size will be limited by the sizes offered by processor
and hypervisor. They are announced at  "IO Page Sizes" output of
ibm,query-pe-dma-window, but now the biggest pagesize automatically
selected with commit 472724111f0f72042deb6a9dcee9578e5398a1a1 above
mentioned. 

Hope this helps, please let me know if there is any remaining question.

Best regards,
Leonardo

