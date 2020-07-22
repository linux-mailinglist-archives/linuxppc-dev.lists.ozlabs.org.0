Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7E1228F29
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:28:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBMsz58jTzDqW7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:28:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBMny0f6zzDqgC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:25:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ipgyBIiz; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BBMnx3tFlz9sSn; Wed, 22 Jul 2020 14:25:25 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBMnt5ZW1z9sPB;
 Wed, 22 Jul 2020 14:25:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595391924;
 bh=qAm3Ccutxcy1GjzClSJFUEMJeVzNgrnTzX0RTNep1/A=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ipgyBIiz2TASWCM4uo7asEhhIi+fSNmSYJ948zzcfbHg//f6/OvKe3lTWHL4vAqB7
 eU208+WBeoL/Rq6bM3v6p/srh985sEwTM9j+7HTV2BI7a2ZYRgzcYwWPDnFcbrf8yM
 AHbofXD/M16u4tiCm+BMYJ4JGsRHJA2b5HYr54JeoLaucp3063seyP54aHYPLna/rX
 Oi6W24NzBNZJFW9daEF7bJbs3Kpb7gojdK0bfUvEWCqsYsN2AxeEFM9N3g6OYc/tk+
 Cri/cBoXAFMAjyVNIUBmM1SG9T6OTEbAxzlNOXhYNxIGP4rR+XyZJQWduu5U7rs2nw
 8aMRDscSBsngA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 07/12] ppc64/kexec_file: add support to relocate
 purgatory
In-Reply-To: <159524956457.20855.12480643681198700190.stgit@hbathini.in.ibm.com>
References: <159524918900.20855.17709718993097359220.stgit@hbathini.in.ibm.com>
 <159524956457.20855.12480643681198700190.stgit@hbathini.in.ibm.com>
Date: Wed, 22 Jul 2020 14:25:19 +1000
Message-ID: <871rl4rxao.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kernel test robot <lkp@intel.com>, Pingfan Liu <piliu@redhat.com>,
 Kexec-ml <kexec@lists.infradead.org>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Mimi Zohar <zohar@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> Right now purgatory implementation is only minimal. But if purgatory
> code is to be enhanced to copy memory to the backup region and verify
> sha256 digest, relocations may have to be applied to the purgatory.
> So, add support to relocate purgatory in kexec_file_load system call
> by setting up TOC pointer and applying RELA relocations as needed.
>
> Reported-by: kernel test robot <lkp@intel.com>
> [lkp: In v1, 'struct mem_sym' was declared in parameter list]
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>
> * Michael, can you share your opinion on the below:
>     - https://lore.kernel.org/patchwork/patch/1272027/
>     - My intention in cover note.

It seems like a lot of complexity for little benefit.

AFAICS your final purgatory_64.c is only 36 lines, and all it does is a
single (open coded) memcpy().

It seems like we could write that in not many more lines of assembler
and avoid all this code.

What am I missing?

cheers
