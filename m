Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B92C2210AFF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 14:26:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xgSq44gwzDqd9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 22:26:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.66; helo=mail-ej1-f66.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xgPp4WLlzDqmh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 22:23:58 +1000 (AEST)
Received: by mail-ej1-f66.google.com with SMTP id dp18so24382133ejc.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 05:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EguftjtGqWh5VAdFTqBrZSaGbeDOMAHvC0KwPTJHn/U=;
 b=E8nvUlAiCgIxxOURfX0ToyAcPvtv8fErr2JaXd6AkLzg9v6SN/gk2OcO0XB0e073ln
 /WRqvH/I7IFr0vXwxPtNREBkivPsrrWYXv1/I4YJM8v6IDXmHL9ng5t5iMmL37Jku4FG
 F9C7UT7lDamJD13PTOkxhUjkznTf5v4sgOlW3dX6LjVgA+/I2WdWLdnW2tE2gsQlMKQR
 /Qq5GLyio4H1BhzWnHG+xA6qN+Yb/WSc14TuKYtbSlrwFnzTStGvQP9qcMqmtRsSSLws
 8RbrpgFMmkBGxy3qf/ym3Mx7DADEpDFs/aYuXDEPsisipxiYseh7EgnlVR5LinMT6c2N
 nvkA==
X-Gm-Message-State: AOAM532LICPhQdDXeP/Rvt+R+C4JmSbrKleoMDca50St9kx5loEH5cMc
 VUbvxM1QqfZRsKqS4TXxH9w=
X-Google-Smtp-Source: ABdhPJy/WXxww9ppUfxQzV+W46iCW3wMVCFfGKiry/c38Bk6UeJk9x0MK1Dyt9SBwv8ixfZZXNWBfQ==
X-Received: by 2002:a17:906:284e:: with SMTP id
 s14mr21684652ejc.498.1593606235211; 
 Wed, 01 Jul 2020 05:23:55 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
 by smtp.gmail.com with ESMTPSA id q3sm2881770eds.41.2020.07.01.05.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 05:23:54 -0700 (PDT)
Date: Wed, 1 Jul 2020 14:23:53 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200701122353.GU2369@dhcp22.suse.cz>
References: <20200624092846.9194-1-srikar@linux.vnet.ibm.com>
 <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
 <alpine.DEB.2.22.394.2006291456550.27163@www.lameter.com>
 <20200630040125.GA31617@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630040125.GA31617@linux.vnet.ibm.com>
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Mel Gorman <mgorman@suse.de>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Christopher Lameter <cl@linux.com>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 30-06-20 09:31:25, Srikar Dronamraju wrote:
> * Christopher Lameter <cl@linux.com> [2020-06-29 14:58:40]:
> 
> > On Wed, 24 Jun 2020, Srikar Dronamraju wrote:
> > 
> > > Currently Linux kernel with CONFIG_NUMA on a system with multiple
> > > possible nodes, marks node 0 as online at boot.  However in practice,
> > > there are systems which have node 0 as memoryless and cpuless.
> > 
> > Maybe add something to explain why you are not simply mapping the
> > existing memory to NUMA node 0 which is after all just a numbering scheme
> > used by the kernel and can be used arbitrarily?
> > 
> 
> I thought Michal Hocko already gave a clear picture on why mapping is a bad
> idea. https://lore.kernel.org/lkml/20200316085425.GB11482@dhcp22.suse.cz/t/#u
> Are you suggesting that we add that as part of the changelog?

Well, I was not aware x86 already does renumber. So there is a certain
precendence. As I've said I do not really like that but this is what
already is happening. If renumbering is not an option then just handle
that in the ppc code explicitly. Generic solution would be preferable of
course but as I've said it is really hard to check for correctness and
potential subtle issues.

-- 
Michal Hocko
SUSE Labs
