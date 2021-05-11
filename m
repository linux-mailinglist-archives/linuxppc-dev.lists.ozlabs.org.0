Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D9037B18E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 00:20:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ffsn26LRjz308p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 08:20:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=QMpcQYIa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=QMpcQYIa; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfsmV5M6Zz2xvT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 08:19:53 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E09EE6191C;
 Tue, 11 May 2021 22:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1620771590;
 bh=gUkAmwj67gu1MoY25mVV7c00HYZC1NsG64HkCPKMRjo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QMpcQYIa7jhYD11gnxYHT8+usShMP4wUKWzUC30NTAoG2IFH+31urgKSWas62Nh+S
 IyrIbCG+G6iizwaxetSWRSPThfSA2bK8dK8z/b9666rUK7NvK54X5lF6tXpzBildoq
 1O6gHu/YRI6rj90h2BX/IvxBt+EFN8XoX2mA5bOw=
Date: Tue, 11 May 2021 15:19:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 9/9] powerpc/mm: Enable move pmd/pud
Message-Id: <20210511151949.fa1973124f3aba1ea7abceb9@linux-foundation.org>
In-Reply-To: <20210422054323.150993-10-aneesh.kumar@linux.ibm.com>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-10-aneesh.kumar@linux.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: npiggin@gmail.com, linux-mm@kvack.org, kaleshsingh@google.com,
 joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 22 Apr 2021 11:13:23 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> mremap HAVE_MOVE_PMD/PUD optimization time comparison for 1GB region:
> 1GB mremap - Source PTE-aligned, Destination PTE-aligned
>   mremap time:      1127034ns
> 1GB mremap - Source PMD-aligned, Destination PMD-aligned
>   mremap time:       508817ns
> 1GB mremap - Source PUD-aligned, Destination PUD-aligned
>   mremap time:        23046ns

Well that's nice.

How significant is this in practice?  How common is it for applications
to successfully align the region?  Do real-world applications actually
benefit from this?

Are there userspace libraries (malloc() etc) which should be reworked
to fully exploit this?
