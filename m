Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B57B8549D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 13:59:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jnuZ1LrZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZdYm1JbPz3d26
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 23:59:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jnuZ1LrZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZdXz2hTSz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 23:58:25 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3c02fd8e970so2831717b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 04:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1707915501; x=1708520301; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BshCFmZRTopNtWYiAcH887NjvRSn30bZAm3GwAPRNi4=;
        b=jnuZ1LrZnQjywJwJBghjIIhsu2EuO2MUJOsXW/P49OJcj/cREdwnzzY+Ae+Z7jwLPO
         U1Ek877XQbR0wo2HHNbJPvqu9OmKDJph4U8ou5plb8WH9N5pAVuXNaTgEwfnzJJvyqOK
         nohOfMS8LKaYz3kROIgtWJKOxfr/tobqmzWvQ6eIK6AX5+zdJOh72AwOHJ3cVRQpY3Zk
         EWSrXnvNNyGZ3JM9dyUJuLfCmKFRxyymS1ClteUgCeGQssZX7zVyYhV5JhClFliGgb87
         LBPyjpmsYqvgI84ZGggaVBoArfF0GB4U9z9uNpkVcVq1mPtMSzfc4GvD9HiRz079sg3p
         WOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707915501; x=1708520301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BshCFmZRTopNtWYiAcH887NjvRSn30bZAm3GwAPRNi4=;
        b=TXYiPbytIN9F6XtlE1uEgi4ATN0pRIq28V0a4Eeh9/DGv4kWPE9iaypuh+Nk9IKEz+
         aHfRkftnsizdIYaD0MC+bFDlmGs4SNqKmaaUmtgiObGtCTdsAlDQDYgxHK1nJLh8x4b5
         dJRtwO6P+X5iSZCLOjWqEI0aedwZQ33057xbG3zEF/odEZDkS8iu6iAmjKf1BTELAjnc
         mOqZ1Z2XqXiHsQFOxMSby0EERDCBD3xNFG/i3GOnq16c4pt9Dcg6a9rsyRJliN/jAbrs
         bVpuflBxQFwC3oOdvUjYUVcmrGeBCdlUKCdxQE/J8+voARDZ7yNcIry0sQTw7deAUBiZ
         5kZA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6v5W2xomd5Z38P48NaI6CbVUNBvczpHJ77a6WPv+RhnhXpIizmEYNUrNIBj0I18W5ffL9RsvqaTigTJhzFrhV5BqMd6HNGKOcaYjAA==
X-Gm-Message-State: AOJu0YwK2fdcLa1UPC1Lpk7SGhm+xI0jpJnYqj7HbjR3iVW9YL54H+mV
	OPhwM2S9+y9P0X6Z3ver2FjBI+ob0OOhbr0j8MD+6owkvg8FRX/PA04TI+JM+mA=
X-Google-Smtp-Source: AGHT+IESNQrgHfg5JgyaHpHE+qWwetm/jueQiitOJitnpPoqM/W2YOs3iN/UgpbRKLLVU/CAztYjgw==
X-Received: by 2002:a05:6808:3987:b0:3c0:40f0:7985 with SMTP id gq7-20020a056808398700b003c040f07985mr3316077oib.55.1707915500870;
        Wed, 14 Feb 2024 04:58:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUaM4shHxQPZNY2W7OsOMIR0XxdEA1Z6eic/XG0Pn660Nqds49rj4683zF/wT0Y5mn7KrPql2LcGLFYOhDDnqtnm0Nhdzh846p/obNRHtUueM0j/v8HpRyRL6fVBsYSxC1UDm95m2DC6e1PHgh1FFGvBWk6p69FCTONJbdqHokwgOJcOC0j70P8JtoYqJK7xKP55TZXMEuU+iHSauhgojL/vs1XozbQyCoiPBC2v5Bi79kmSR3k1AR6q7R3xXmDgpceDF1ajy/sK7Xpt98GNpUe0Laar02lZ+UrEbF5eZZibLrleK7ilgX8tuMuSwx5IoRqCio49mnwJGFtErgu478iMwhEJPxtUL33HGVPACVZilMRLBdWElcG5wbZaCtvwgfcEn1ApwKksQGEy8fxHEDVdW3+FLMMo5dV5cZ6ArimIBUpAwM7hQPBmE7ahj86IfajfCZk7VPGD5j3aXhKzSi2IdWR82LcFJwfM3OBD/3y92S3Z2zzN6Go7QpaTDKdHeaZgTxb016H6bwSVerGegkg7Ez2G6wg4NPutwP86Q==
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id ok5-20020a0562143c8500b0068f057ec7b9sm334991qvb.131.2024.02.14.04.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 04:58:20 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1raEqB-00AhZD-Qh;
	Wed, 14 Feb 2024 08:58:19 -0400
Date: Wed, 14 Feb 2024 08:58:19 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/iommu: Fix the missing iommu_group_put() during
 platform domain attach
Message-ID: <20240214125819.GA1299735@ziepe.ca>
References: <170784021983.6249.10039296655906636112.stgit@linux.ibm.com>
 <20240213172128.GM765010@ziepe.ca>
 <4f5e638d-30a2-4207-b515-d07c20b0fb47@linux.vnet.ibm.com>
 <87le7n6wcf.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87le7n6wcf.fsf@mail.lhotse>
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
Cc: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>, jroedel@suse.de, gbatra@linux.vnet.ibm.com, Shivaprasad G Bhat <sbhat@linux.ibm.com>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, aneesh.kumar@kernel.org, tpearson@raptorengineering.com, iommu@lists.linux.dev, bgray@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 14, 2024 at 11:53:20PM +1100, Michael Ellerman wrote:
> Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com> writes:
> > Thanks for the patch. Applied this patch and verified and issue is fixed.
> >
> > This issue way originally reported in the below mail.
> >
> > https://marc.info/?l=linux-kernel&m=170737160630106&w=2
> 
> Please use lore for links, in this case:
> 
> https://lore.kernel.org/all/274e0d2b-b5cc-475e-94e6-8427e88e271d@linux.vnet.ibm.com/

Also if you are respinning you may prefer this

@@ -1285,14 +1285,15 @@ spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
                                    struct device *dev)
 {
        struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-       struct iommu_group *grp = iommu_group_get(dev);
        struct iommu_table_group *table_group;
+       struct iommu_group *grp;
        int ret = -EINVAL;
 
        /* At first attach the ownership is already set */
        if (!domain)
                return 0;
 
+       grp = iommu_group_get(dev);
        if (!grp)
                return -ENODEV;

Which is sort of why this happened in the first place :)

Jason
