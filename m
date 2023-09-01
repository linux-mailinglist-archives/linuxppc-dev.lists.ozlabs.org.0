Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 264E379030F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 23:07:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fX9CmhnZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcrFJ6b6zz3cGW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Sep 2023 07:07:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fX9CmhnZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mgamail.intel.com; envelope-from=kirill.shutemov@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcrDQ6g2yz3bmj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Sep 2023 07:06:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693602375; x=1725138375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XHxocslFLQU8xD6gE26XwrfQlSg9WQxfvtoRwUmoXd4=;
  b=fX9CmhnZC97xkDQD/v16QRtKNKOcb219Y4xL5Q8VXK09tj6KQHjDq/Vv
   rg/jaRvBNecKfOLlnct0pInH8CU+VsqBW1S5mgWgZybGcz6CkAQ6o9YI8
   Rft4E4wBr3wSdwQ3HhZY9qK2dc9hwr96LyuT62XKhPpsFinIzRv0iwCXl
   T84g0TbWlEzv8qd+pFKDkpfk06StXZW5kHVZ57VnlWkh7CHdeRa1NT6PR
   afOSFnpH1m5O3/oTONyaBFgKE79Ess/3hied0BXOnCsdaq7unkd8MVyLY
   kWn+iZFajNjg37vnvG6M/EXaQ2Y8DH8uFzPesx13DoFnRYJsddCR6C6bZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379031027"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="379031027"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 14:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070871974"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="1070871974"
Received: from jroorda-mobl4.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.32.118])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 14:05:58 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 94702104994; Sat,  2 Sep 2023 00:05:55 +0300 (+03)
Date: Sat, 2 Sep 2023 00:05:55 +0300
From: kirill.shutemov@linux.intel.com
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH gmem FIXUP] mm, compaction: make testing
 mapping_unmovable() safe
Message-ID: <20230901210555.j5d5a4azmkxzlnn2@box.shutemov.name>
References: <20230901082025.20548-2-vbabka@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901082025.20548-2-vbabka@suse.cz>
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-mips@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, anup@brainfault.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, michael.roth@amd.com, ackerleytng@google.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, seanjc@google.com, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, maz@kernel.org, linux-fsdevel@vger.kernel.org, liam.merwick@oracle.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 01, 2023 at 10:20:26AM +0200, Vlastimil Babka wrote:
> As Kirill pointed out, mapping can be removed under us due to
> truncation. Test it under folio lock as already done for the async
> compaction / dirty folio case. To prevent locking every folio with
> mapping to do the test, do it only for unevictable folios, as we can
> expect the unmovable mapping folios are also unevictable - it is the
> case for guest memfd folios.
> 
> Also incorporate comment update suggested by Matthew.
> 
> Fixes: 3424873596ce ("mm: Add AS_UNMOVABLE to mark mapping as completely unmovable")
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Superficially looks good to me. But I don't really understand this
code path to Ack.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
