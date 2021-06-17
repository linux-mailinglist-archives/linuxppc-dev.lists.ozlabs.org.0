Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B67A13AA858
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 03:00:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G53dC36Dxz3byr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 11:00:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=rhPK/KAF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=rhPK/KAF; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G53cm4MyLz2y0G
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 11:00:07 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85F92613BF;
 Thu, 17 Jun 2021 01:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1623891603;
 bh=NGVGy6SwWlS3Ziv0DbpY7O+czUWd2nNe/IhmZqLmQOE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rhPK/KAFZ04tG2pPuUPGqWX4hc5fh4tjJzmW2wecEhjMIbEQo2AIoWoM/CaH7NSdV
 f8ZeGBTUz6WcHRsxOrzDeQoxn7pM7xUw4jf9pdZy271eZ4vjMsgdHkStKcmfuNaLcm
 ofWqGb/0RYKxAJNcXV3fklZ1kz2Z/w0Tm77SOI8k=
Date: Wed, 16 Jun 2021 18:00:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 0/6] mrermap fixes
Message-Id: <20210616180003.da8705bba63a9898e269e38c@linux-foundation.org>
In-Reply-To: <20210616045239.370802-1-aneesh.kumar@linux.ibm.com>
References: <20210616045239.370802-1-aneesh.kumar@linux.ibm.com>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, npiggin@gmail.com,
 linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 16 Jun 2021 10:22:33 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> This patch series is split out series from [PATCH v7 00/11] Speedup mremap on ppc64
> (https://lore.kernel.org/linux-mm/20210607055131.156184-1-aneesh.kumar@linux.ibm.com)
> dropping ppc64 specific changes.
> 
> This patchset is dependent on
> https://lore.kernel.org/linux-mm/20210615110859.320299-1-aneesh.kumar@linux.ibm.com

Which I just dropped because of all the build breakages :(
