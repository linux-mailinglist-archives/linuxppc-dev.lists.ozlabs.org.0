Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79570BDE00
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 14:19:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dcYk0444zDqjV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 22:19:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ziepe.ca
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="UBKXw+KB"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dcRx2d1TzDqlX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 22:14:21 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id n1so1260230qtp.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 05:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OVI5QcSzb1ogi/NUyHxPnF5WpljeLCICuHCH4hdkAkk=;
 b=UBKXw+KB2suz9U44y3DYouGbrl88Nm90V8Wsw6X6eao3v1Q0ZOHIayVjqW+Ac3JAvt
 BY6j3a/CYJYhIbLmMzgIGsa8RV2A3l9vXW8f9p1ttZxvLTVKnQLShFUp6JQlpw2y4Ekf
 bDDPdMuQ5Wr7VcgyCJKxU/EoDJaxxx7EduDRntUPBHNNBjO0ib4vI0mGe0w0vT4jrR6s
 q8B4JocD6DLLs3AjJKgk1eyUF9CgK4k2G0luzKUrOC9gCPk3JjFCP2aRbvrqJ1w0IgG3
 a30U1ABEbjgWv6xsD/m/zZhSphCGVVOqzC/hWn/nfgEoVjLo+hUjSMo4uZJP5XYQ/n5q
 p5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OVI5QcSzb1ogi/NUyHxPnF5WpljeLCICuHCH4hdkAkk=;
 b=RbhWbwLnMw/tHTJl1QiDls7uJzYKQ3K2gaXBnixy1wQlf//HrQoPGkKSI2ZQqWubk2
 me477CzBL+5EYEaX/pKlsQ5/ObYMWHkg026ZiDY/Niqf2/JBN/RT6JXVLrRJGlyFXzbz
 EB64Zdzd5GYa4VCsjdfHIhLfAG4ZxUDrWsgaX7BxF98CZQtcvbH3xfRxU/LxPwZHxuSp
 AzoPFb+KDJPGt/L85jivGqBobVLcFPZDpPEIej5t0vRoltbKzuPZJJJnxd452clck/gs
 Dt5L6f+D99pq9nWDagmMb9EcUOlec6ziPqx/lSQv6Js85NQjQVDgWGBkYSmDM7/0qpPO
 OPlQ==
X-Gm-Message-State: APjAAAWDj75y2CjPtHYsRJknErlAqWNTC5hEtdThPOncBnp3SYGTahb9
 y0+/2WqNatsaXAA63bYxENTAjg==
X-Google-Smtp-Source: APXvYqykvxxYrfpTCuPObZS7Ml2gjLGRZXElIM5Y2CTDjEL5CnkfFtmLsczbvBhS+BMu1uKuOdCYXw==
X-Received: by 2002:a0c:a5a5:: with SMTP id z34mr6930777qvz.110.1569413657491; 
 Wed, 25 Sep 2019 05:14:17 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-223-10.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.223.10])
 by smtp.gmail.com with ESMTPSA id h29sm3163953qtb.46.2019.09.25.05.14.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Sep 2019 05:14:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iD6BU-0006VE-9u; Wed, 25 Sep 2019 09:14:16 -0300
Date: Wed, 25 Sep 2019 09:14:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v9 0/8] KVM: PPC: Driver to manage pages of secure guest
Message-ID: <20190925121416.GB21150@ziepe.ca>
References: <20190925050649.14926-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925050649.14926-1-bharata@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 25, 2019 at 10:36:41AM +0530, Bharata B Rao wrote:
> [The main change in this version is the introduction of new
> locking to prevent concurrent page-in and page-out calls. More
> details about this are present in patch 2/8]
> 
> Hi,
> 
> A pseries guest can be run as a secure guest on Ultravisor-enabled
> POWER platforms. On such platforms, this driver will be used to manage
> the movement of guest pages between the normal memory managed by
> hypervisor(HV) and secure memory managed by Ultravisor(UV).
> 
> Private ZONE_DEVICE memory equal to the amount of secure memory
> available in the platform for running secure guests is created.
> Whenever a page belonging to the guest becomes secure, a page from
> this private device memory is used to represent and track that secure
> page on the HV side. The movement of pages between normal and secure
> memory is done via migrate_vma_pages(). The reverse movement is driven
> via pagemap_ops.migrate_to_ram().
> 
> The page-in or page-out requests from UV will come to HV as hcalls and
> HV will call back into UV via uvcalls to satisfy these page requests.
> 
> These patches are against hmm.git
> (https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/log/?h=hmm)
> 
> plus
> 
> Claudio Carvalho's base ultravisor enablement patches that are present
> in Michael Ellerman's tree
> (https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/ppc-kvm)
> 
> These patches along with Claudio's above patches are required to
> run secure pseries guests on KVM. This patchset is based on hmm.git
> because hmm.git has migrate_vma cleanup and not-device memremap_pages
> patchsets that are required by this patchset.

FWIW this is all merged to Linus now and will be in rc1

Jason
