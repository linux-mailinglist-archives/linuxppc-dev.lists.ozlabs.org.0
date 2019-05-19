Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2520322750
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 May 2019 18:32:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456SH51lSpzDqJC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 02:32:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::242; helo=mail-oi1-x242.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="Luuod+ac"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456SFq0DC7zDqGS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 02:31:03 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id y124so4015848oiy.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 May 2019 09:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ZWjYi0LKYa7s2y9DAZ3jQd7Kh/YEvIwC4LalouLic8=;
 b=Luuod+ac+cqT9612W1nKRVgtB2LCgQKBs4NJlcDhy7HrGiNNQGf06d5rORVlwN3CGB
 TaIc5OzVLB1sEgK0QSO+hZ+ZbfxQnarzygNSBmOeuvHYKmPQKz55rOkdjeeLhAduS0Cl
 Whv/M5f1dYJdSHAL78VZajSJTtn8JmnyMbIkOBTip/JQMIf7Eo+idAAA0WrwM00f2gAs
 EZC/QNGgD+1dWOdVNkCsvgOrImn7T9hBKRkg6QD+Bg1Mn6a2yRnuwls9seQDdaKtCJwr
 Wyehk1PTvrLaRBvI4oZSU81sqAOHaiA8/Kzt/nRBBJ9hthyaBW7x78DGfxHBlEP0Ddg7
 0eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ZWjYi0LKYa7s2y9DAZ3jQd7Kh/YEvIwC4LalouLic8=;
 b=nXcpX5OCC0N5RkWTuAzE/ybfpiiBuF1DrK9udwrT/EVTTGa6919DBnKCOD+tOp9Qmn
 /Gp65zYGLfpJlYzYdlj4eh1icZAvkBEmv/GU/GG5gYel0J69aJR9y8hg/cz6xQYG/CE5
 I/VLxfwGEYnGLfKBF4TVXdZ9irVHVswlqs7Vy2o2qqC5VNCpFACf49Eyix32OZL+TVlW
 UI/95wDfLqcPhxkyEuotZxXqiWYaTZUD/O5GqIxJB7fcGA5nw+RdyxdUwzpx16YobpuA
 tq8nJ0CTWix1wFOZOWIGJxQh61fq3Dptwtukl/qTObCPfnkwzGobi4+VgPr0DpcGsmAt
 LReA==
X-Gm-Message-State: APjAAAW6H/4brMhIjOdGTK1vpe16ABVx7J6sM2XvIHEYuZI1IUatfigl
 O0sSNBk0ZY2Kezng6HE4KPo+AsHW1W4hKMb2W7HZOA==
X-Google-Smtp-Source: APXvYqze7m+x1bk2ET/L1T1uLmwbLuZSspl+N/0zleTMGx5P4BoJcD1BBPDyS5Y4fzLP6m16+hvJ3Kgei0XNRfLkQjU=
X-Received: by 2002:aca:b641:: with SMTP id g62mr18495979oif.149.1558283457874; 
 Sun, 19 May 2019 09:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190514025449.9416-1-aneesh.kumar@linux.ibm.com>
 <875zq9m8zx.fsf@vajain21.in.ibm.com>
 <de5cbe7d-bd47-6793-1f1a-2274c5c59eb5@linux.ibm.com>
 <87sgtaddru.fsf@linux.ibm.com>
In-Reply-To: <87sgtaddru.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sun, 19 May 2019 09:30:47 -0700
Message-ID: <CAPcyv4gi3NR4NFCQYYg2_Mpb7+qWGMsRodpf8sK1Pnz3+dCe3A@mail.gmail.com>
Subject: Re: [PATCH] mm/nvdimm: Pick the right alignment default when creating
 dax devices
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
Cc: Linux MM <linux-mm@kvack.org>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 19, 2019 at 1:55 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
>
> Hi Dan,
>
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>
> > On 5/17/19 8:19 PM, Vaibhav Jain wrote:
> >> Hi Aneesh,
> >>
>
> ....
>
> >>
> >>> +   /*
> >>> +    * Check whether the we support the alignment. For Dax if the
> >>> +    * superblock alignment is not matching, we won't initialize
> >>> +    * the device.
> >>> +    */
> >>> +   if (!nd_supported_alignment(align) &&
> >>> +       memcmp(pfn_sb->signature, DAX_SIG, PFN_SIG_LEN)) {
> >> Suggestion to change this check to:
> >>
> >> if (memcmp(pfn_sb->signature, DAX_SIG, PFN_SIG_LEN) &&
> >>     !nd_supported_alignment(align))
> >>
> >> It would look  a bit more natural i.e. "If the device has dax signature and alignment is
> >> not supported".
> >>
> >
> > I guess that should be !memcmp()? . I will send an updated patch with
> > the hash failure details in the commit message.
> >
>
> We need clarification on what the expected failure behaviour should be.
> The nd_pmem_probe doesn't really have a failure behaviour in this
> regard. For example.
>
> I created a dax device with 16M alignment
>
> {
>   "dev":"namespace0.0",
>   "mode":"devdax",
>   "map":"dev",
>   "size":"9.98 GiB (10.72 GB)",
>   "uuid":"ba62ef22-ebdf-4779-96f5-e6135383ed22",
>   "raw_uuid":"7b2492f9-7160-4ee9-9c3d-2f547d9ef3ee",
>   "daxregion":{
>     "id":0,
>     "size":"9.98 GiB (10.72 GB)",
>     "align":16777216,
>     "devices":[
>       {
>         "chardev":"dax0.0",
>         "size":"9.98 GiB (10.72 GB)"
>       }
>     ]
>   },
>   "align":16777216,
>   "numa_node":0,
>   "supported_alignments":[
>     65536,
>     16777216
>   ]
> }
>
> Now what we want is to fail the initialization of the device when we
> boot a kernel that doesn't support 16M page size. But with the
> nd_pmem_probe failure behaviour we now end up with
>
> [
>   {
>     "dev":"namespace0.0",
>     "mode":"fsdax",
>     "map":"mem",
>     "size":10737418240,
>     "uuid":"7b2492f9-7160-4ee9-9c3d-2f547d9ef3ee",
>     "blockdev":"pmem0"
>   }
> ]
>
> So it did fallthrough the
>
>         /* if we find a valid info-block we'll come back as that personality */
>         if (nd_btt_probe(dev, ndns) == 0 || nd_pfn_probe(dev, ndns) == 0
>                         || nd_dax_probe(dev, ndns) == 0)
>                 return -ENXIO;
>
>         /* ...otherwise we're just a raw pmem device */
>         return pmem_attach_disk(dev, ndns);
>
>
> Is it ok if i update the code such that we don't do that default
> pmem_atach_disk if we have a label area?

Yes. This seems a new case where the driver finds a valid info-block,
but the capability to load that configuration is missing. So perhaps
special case a EOPNOTSUPP return code from those info-block probe
routines as "fail, and don't fallback to a raw device".
