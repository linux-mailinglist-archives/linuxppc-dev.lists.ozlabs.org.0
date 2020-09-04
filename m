Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D34E25D116
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 08:07:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjRzJ2F1LzDrJD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 16:07:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tmglZImb; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjRw76WWCzDrM2
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 16:04:39 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id p4so5442350qkf.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Sep 2020 23:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=Y4+nyUm6P1sliqzR8n00yXfDoX7E3MCV3APAcgzk2PM=;
 b=tmglZImbSzoU+BhJ6jX9g28qc3bA3Dg4gsr18kTGq4SIswhoONwdW7lTJ37ErdYH0f
 VKyDWeCmNhGNRuUWPMOfVZvdpsarevt9GZbHmqKNG6BX8v9uCTcz18gw2QfND7xyROPn
 I5onuGEu9zZ8T7eG1A9YU+Qeda0oJGkZQqSPMAracI4OGeh4zjnr3aDbyk18h7+sgx42
 lMlfdjNK7LOhmKh3PC7sGNuJPRJLK1RCRQg7wXFJQcqqokjcOMERWdmR93IHzj/Cc7BO
 YnFOCZH/UTY9v5tuKcTJYdM5R+c1654bmqEBluKZ5d+j+dy7CHCso8Hbs2vdo/ILThNg
 RmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Y4+nyUm6P1sliqzR8n00yXfDoX7E3MCV3APAcgzk2PM=;
 b=q8S55D8NDrLg2Rnx+JYo7GvMYhOwFur8tzlUPKgR86YVikpfwrLYKQqyL1vbbC7WjC
 4s+34ANkjuYsx2QJiTke8kDIjmU0d3YOybCrEztsX5eHLl3fybFXhE+wS30DqBZ3yjpT
 x21jcjuDDPzDPvIP5KdCXek39EUPUMxfrBpF9MMAKRZBD/fyvvtcd1Fm7F696HbcIAP1
 tTnl7xFZvbfWfn4C0O4wmVfzS50THIuJWLopTSaY8w99+Zq6YLEB6z+HRgIRtzYVIQuu
 KRublP6Wlx4JWOknz4tk5Bv7pEDHsFPIPtira2EjvnilG81glgSR5C+BrdBsDFIvYq3L
 kyrA==
X-Gm-Message-State: AOAM530hVpMBy1S/BXND8parsmUTTbxKwTguLyJ5G0RTXS861MJ2EI7R
 St1gaj3TQe92NKy7yMSltbw=
X-Google-Smtp-Source: ABdhPJyMROFWR3SpJFpKskeTIMVkr4OkfgySEus//Cvb5l6RUUinHU1UFOrJ5iRJ1avXPXHMpAtDwA==
X-Received: by 2002:a37:a3cf:: with SMTP id m198mr6676667qke.410.1599199475491; 
 Thu, 03 Sep 2020 23:04:35 -0700 (PDT)
Received: from LeoBras (179-125-130-62.dynamic.desktop.com.br.
 [179.125.130.62])
 by smtp.gmail.com with ESMTPSA id 103sm3808531qta.31.2020.09.03.23.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 23:04:34 -0700 (PDT)
Message-ID: <ef7e80b0a7399bad607324301a604bfb46c2de05.camel@gmail.com>
Subject: Re: [PATCH v1 02/10] powerpc/kernel/iommu: Align size for
 IOMMU_PAGE_SIZE on iommu_*_coherent()
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>,  Joel Stanley <joel@jms.id.au>, Thiago Jung
 Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,  Brian
 King <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini
 <muvic@linux.ibm.com>, David Dai <zdai@linux.vnet.ibm.com>
Date: Fri, 04 Sep 2020 03:04:28 -0300
In-Reply-To: <8f569f68-5145-676e-50a1-b13f3fbd69cc@ozlabs.ru>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-3-leobras.c@gmail.com>
 <7b9640e0-568f-1470-40f4-a3ccec8abcf2@ozlabs.ru>
 <c67c66e466ad27d15aa2b970c48d2336d95b2971.camel@gmail.com>
 <da473389-f921-075a-ec8e-ea516de4f177@ozlabs.ru>
 <2aacd45f047489642da1731c92d3555ad101e3c7.camel@gmail.com>
 <81f106bd-8962-22f2-f14a-378d3486f57e@ozlabs.ru>
 <39ad3a9c103faf9c5fc2fd5700d8606eb4a2b67e.camel@gmail.com>
 <8f569f68-5145-676e-50a1-b13f3fbd69cc@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-09-03 at 14:41 +1000, Alexey Kardashevskiy wrote:
> I am new to this, so I am trying to understand how a memory page mapped
> > as DMA, and used for something else could be a problem.
> 
>  From the device prospective, there is PCI space and everything from 0 
> till 1<<64 is accessible and what is that mapped to - the device does 
> not know. PHB's IOMMU is the thing to notice invalid access and raise 
> EEH but PHB only knows about PCI->physical memory mapping (with IOMMU 
> pages) but nothing about the host kernel pages. Does this help? Thanks,

According to our conversation on Slack:
1- There is a problem if a hypervisor gives to it's VMs contiguous
memory blocks that are not aligned to IOMMU pages, because then an 
iommu_map_page() could map some memory in this VM and some memory in
other VM / process.
2- To guarantee this, we should have system pagesize >= iommu_pagesize 

One way to get (2) is by doing this in enable_ddw():
	if ((query.page_size & 4) && PAGE_SHIFT >= 24) {
		page_shift = 24; /* 16MB */
	} else if ((query.page_size & 2) &&  PAGE_SHIFT >= 16 ) {
		page_shift = 16; /* 64kB */
	} else if (query.page_size & 1 &&  PAGE_SHIFT >= 12) {
		page_shift = 12; /* 4kB */
	[...]

Another way of solving this, would be adding in LoPAR documentation
that the blocksize of contiguous memory the hypervisor gives a VM
should always be aligned to IOMMU pagesize offered.

I think the best approach would be first sending the above patch, which
is faster, and then get working into adding that to documentation, so
hypervisors guarantee this.

If this gets into the docs, we can revert the patch.

What do you think?

Best regards!

