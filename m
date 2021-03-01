Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CFB32789D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 08:54:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DpswR4Ngpz30QZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 18:54:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dpsw62YGdz30LR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 18:53:57 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1CE7E68BEB; Mon,  1 Mar 2021 08:53:53 +0100 (CET)
Date: Mon, 1 Mar 2021 08:53:52 +0100
From: Christoph Hellwig <hch@lst.de>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH] mm: Generalize HUGETLB_PAGE_SIZE_VARIABLE
Message-ID: <20210301075352.GA27659@lst.de>
References: <1614577853-7452-1-git-send-email-anshuman.khandual@arm.com>
 <20210301062358.GA25761@lst.de>
 <89f2d77c-f4bc-8f7b-a6b0-1c04e422fb77@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89f2d77c-f4bc-8f7b-a6b0-1c04e422fb77@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 01, 2021 at 01:13:41PM +0530, Anshuman Khandual wrote:
> > doesn't this need a 'if HUGETLB_PAGE'
> 
> While making HUGETLB_PAGE_SIZE_VARIABLE a generic option, also made it
> dependent on HUGETLB_PAGE. Should not that gate HUGETLB_PAGE_SIZE_VARIABLE
> when HUGETLB_PAGE is not available irrespective of the select statement on
> the platforms ?

depends doesn't properly work for variables that are selected.
