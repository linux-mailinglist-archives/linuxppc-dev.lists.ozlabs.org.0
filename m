Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DDA705915
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 22:48:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLSxl3g68z3fF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 06:48:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N+lgDYg0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=dave.hansen@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N+lgDYg0;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Wed, 17 May 2023 06:47:43 AEST
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLSwv26qSz3bmL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 06:47:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684270063; x=1715806063;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ty6WENYnRqV4osNeJaXPDMsSfcnlueg4+2VirsKRiyc=;
  b=N+lgDYg0VYDU6J8MRi8KzZAvMhEfnMMfXbZ/ieO0gwRLh0V2g108y1vF
   v5z42AP2T5ZrPKqzFGbXdks+OMTdhoxcySPUZWpLqCcs480BVOs94zPV7
   Nx7dHY8DVvIR+LDHtrpCBBLwW9fL/4gAIjfiK/B8EwoNzpL6FpG6bsXxh
   wxMcA2S3TDRNn1+rOFBavfTfI4fqQbTv0xFPWtH/KxIO8i5lSW9pbThRA
   l9Nrmtp3cSL76Gz05zZzAYizbxehs5qgCCU01/nQGHcU1SOxkZaldtiRm
   mVB4ZjNoYvGKN8/Scicd+LfQZSvCsf8NvDM88T9yFZS1iLsR2EBXGmqbL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="336136893"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="336136893"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 13:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="734434783"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="734434783"
Received: from mtpanu-mobl1.amr.corp.intel.com (HELO [10.212.203.6]) ([10.212.203.6])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 13:46:23 -0700
Message-ID: <5c7e7ebc-7898-0b4e-3c59-e9b8d2b2f197@intel.com>
Date: Tue, 16 May 2023 13:46:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] procfs: consolidate arch_report_meminfo declaration
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, viro@zeniv.linux.org.uk,
 brauner@kernel.org
References: <20230516195834.551901-1-arnd@kernel.org>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230516195834.551901-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/16/23 12:57, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The arch_report_meminfo() function is provided by four architectures,
> with a __weak fallback in procfs itself. On architectures that don't
> have a custom version, the __weak version causes a warning because
> of the missing prototype.
> 
> Remove the architecture specific prototypes and instead add one
> in linux/proc_fs.h.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/parisc/include/asm/pgtable.h    | 3 ---
>  arch/powerpc/include/asm/pgtable.h   | 3 ---
>  arch/s390/include/asm/pgtable.h      | 3 ---
>  arch/s390/mm/pageattr.c              | 1 +
>  arch/x86/include/asm/pgtable.h       | 1 +
>  arch/x86/include/asm/pgtable_types.h | 3 ---

Looks sane.  Thanks Arnd!

Acked-by: Dave Hansen <dave.hansen@linux.intel.com> # for arch/x86
