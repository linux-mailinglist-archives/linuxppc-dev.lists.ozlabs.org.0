Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3ED6BA078
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 21:12:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pbl7k41gdz3cjT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 07:12:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ehpLwOA0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dd0bi3Nz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ehpLwOA0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dd0bi3Nz;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pbl6l2Cbrz3cBL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 07:11:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678824712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9wQYTp3YB8E8Qol6aRWb0q0ebKdxfSZQ88xnQL/Q0do=;
	b=ehpLwOA0sK5BM3k9cGhBwg2tQwKe2cAt98/l3cwWDtgdGsrvsSj9wyeN1/Rcx/DGW+06Si
	uNCqHA+w+b5nsyoBkwmV/CHdPvSatZaPry1r9jrZRkznDU7Z338y+4xqO2/yZ7jKgvVE1D
	mBQvNFlmJs+AzoaZ+DHLWXkBpCjUQ5o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678824713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9wQYTp3YB8E8Qol6aRWb0q0ebKdxfSZQ88xnQL/Q0do=;
	b=dd0bi3Nzj5AmMguwkmUmtIPCnearntMh0qeLapynveh/2YqD/GHT6sWAtD3y6CDjo3oeU5
	eeRPbwaN4egxWHWSvLTjR7nSN0vXO1RqbnlLc2FEZC1Jwuwh9Y1dEUj3IpykTkPIX2WpJN
	ES7FOP/vxU9buwN8d6WrCR+mMj9jWpY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-rsowVX-JOzKa_RygyRfqIQ-1; Tue, 14 Mar 2023 16:11:48 -0400
X-MC-Unique: rsowVX-JOzKa_RygyRfqIQ-1
Received: by mail-il1-f200.google.com with SMTP id p8-20020a92d288000000b0032314990768so2922116ilp.22
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 13:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678824707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wQYTp3YB8E8Qol6aRWb0q0ebKdxfSZQ88xnQL/Q0do=;
        b=I9dqraf/v1lC741tFMggWznd922TtbuTZ49kttJbNEENCghCp0Tvg/9iCrPTauvpOZ
         YNaEhVpFtp3yJ2aEEruGxY39B0M5aDPaOJoN029+OieG13G8sw+sUkM8UNICqpT/d8K6
         9M7pBWvtjAEqrDrEOPOl2LR24HxGI6ztfD9fc+D6WA0yKlTKTwRdIFgiZ2XpV4iOxXes
         16SJRVrEXAHVPX3F74uEa30DOr7ws+5WooyXwOqye1hc87t7kbBhrzIYr2suz3RTe/Ew
         1MWdbOVaSSMBm0HOQd5B6QHFRdxaDyUPciQ+dyJp9osW+da9priNzeK1BfpmEFDRserL
         Z8NQ==
X-Gm-Message-State: AO0yUKVbbqz/IqKeJmxRjrJuiK7hHQqyGdFNRMp0Pwuh1ja4yw3vxJsI
	X5Ulm5gL3VBooLyb89YnzxXgOhrkSupjOIkoGZ2pn1uxCRIc66YC0XFDjwckcgHyUXfmllJn7q8
	aqOe2Q1xYVOPvLR5Zsebkym5N5w==
X-Received: by 2002:a05:6e02:1aa6:b0:317:83ad:a2a2 with SMTP id l6-20020a056e021aa600b0031783ada2a2mr2902947ilv.10.1678824707652;
        Tue, 14 Mar 2023 13:11:47 -0700 (PDT)
X-Google-Smtp-Source: AK7set+WFDrvIixXmlqMGu/bCY3ZmjaTxWtCpgpTEGZODyspTTPhzeQHSA5z9/Or1gn7wARcWXseMA==
X-Received: by 2002:a05:6e02:1aa6:b0:317:83ad:a2a2 with SMTP id l6-20020a056e021aa600b0031783ada2a2mr2902903ilv.10.1678824707351;
        Tue, 14 Mar 2023 13:11:47 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id q1-20020a056e02096100b00314201bcbdfsm1079964ilt.3.2023.03.14.13.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 13:11:46 -0700 (PDT)
Date: Tue, 14 Mar 2023 14:11:44 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 0/7] introduce vm_flags modifier functions
Message-ID: <20230314141144.6a0892e6.alex.williamson@redhat.com>
In-Reply-To: <20230126193752.297968-1-surenb@google.com>
References: <20230126193752.297968-1-surenb@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, Jason Wang <jasowang@redhat.com>, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, dimitri.sivanich@hpe.com, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, k
 ent.overstreet@linux.dev, linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 26 Jan 2023 11:37:45 -0800
Suren Baghdasaryan <surenb@google.com> wrote:

> This patchset was originally published as a part of per-VMA locking [1] and
> was split after suggestion that it's viable on its own and to facilitate
> the review process. It is now a preprequisite for the next version of per-VMA
> lock patchset, which reuses vm_flags modifier functions to lock the VMA when
> vm_flags are being updated.
> 
> VMA vm_flags modifications are usually done under exclusive mmap_lock
> protection because this attrubute affects other decisions like VMA merging
> or splitting and races should be prevented. Introduce vm_flags modifier
> functions to enforce correct locking.
> 
> The patchset applies cleanly over mm-unstable branch of mm tree.

With this series, vfio-pci developed a bunch of warnings around not
holding the mmap_lock write semaphore while calling
io_remap_pfn_range() from our fault handler, vfio_pci_mmap_fault().

I suspect vdpa has the same issue for their use of remap_pfn_range()
from their fault handler, JasonW, MST, FYI.

It also looks like gru_fault() would have the same issue, Dimitri.

In all cases, we're preemptively setting vm_flags to what
remap_pfn_range_notrack() uses, so I thought we were safe here as I
specifically remember trying to avoid changing vm_flags from the
fault handler.  But apparently that doesn't take into account
track_pfn_remap() where VM_PAT comes into play.

The reason for using remap_pfn_range() on fault in vfio-pci is that
we're mapping device MMIO to userspace, where that MMIO can be disabled
and we'd rather zap the mapping when that occurs so that we can sigbus
the user rather than allow the user to trigger potentially fatal bus
errors on the host.

Peter Xu has suggested offline that a non-lazy approach to reinsert the
mappings might be more inline with mm expectations relative to touching
vm_flags during fault.  What's the right solution here?  Can the fault
handling be salvaged, is proactive remapping the right approach, or is
there something better?  Thanks,

Alex

