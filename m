Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 148C622A91B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 08:49:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC2x60j3VzDr2w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 16:48:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC2vT3B7BzDrBr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 16:47:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=F8mQFRtw; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BC2vT2cF6z9sRf; Thu, 23 Jul 2020 16:47:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BC2vR6Pf2z9sRR;
 Thu, 23 Jul 2020 16:47:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595486853;
 bh=iLCp72MN0Bz7Tijm/DlYPrNZEwgqJ+eZi+r993c2Gas=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=F8mQFRtw6PH4Q/+W/cXQHWrXJ7h89YyzJrv4PI1hNeDQOHFhaQ2yxkl5BomVcaRK4
 0LflFjJsREETVY3Js4225bYdLmOxFtAwYx/GJKne4iL7ZD3gs4/AmvIM9ql69XkCcK
 nplSgPBkAnX59xKMdAz0ISW8AfP6PUsESdLp2ydqZ0wyPV1bhKtIWAdUgQOQjHgbSt
 KW8HE9M/c/PHhsIDgI7CS6PfB5zgUqKgDDGL0dPGHK58AdENvdyR8WN72b0WehGnzb
 f/e+MtcfgzM9Zvqg7SEeFJmwpq4ze7DpzJ+cq0WIkY6Q/1R9fEEftb8wN6WDVwVwyP
 WY84EN3OjGuHA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 07/12] ppc64/kexec_file: add support to relocate
 purgatory
In-Reply-To: <2037fa32-28be-5995-1c22-c8b01cafe088@linux.ibm.com>
References: <159524918900.20855.17709718993097359220.stgit@hbathini.in.ibm.com>
 <159524956457.20855.12480643681198700190.stgit@hbathini.in.ibm.com>
 <871rl4rxao.fsf@mpe.ellerman.id.au>
 <2037fa32-28be-5995-1c22-c8b01cafe088@linux.ibm.com>
Date: Thu, 23 Jul 2020 16:47:31 +1000
Message-ID: <87365iram4.fsf@mpe.ellerman.id.au>
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
> On 22/07/20 9:55 am, Michael Ellerman wrote:
>> Hari Bathini <hbathini@linux.ibm.com> writes:
>>> Right now purgatory implementation is only minimal. But if purgatory
>>> code is to be enhanced to copy memory to the backup region and verify
>>> sha256 digest, relocations may have to be applied to the purgatory.
>>> So, add support to relocate purgatory in kexec_file_load system call
>>> by setting up TOC pointer and applying RELA relocations as needed.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> [lkp: In v1, 'struct mem_sym' was declared in parameter list]
>>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>>> ---
>>>
>>> * Michael, can you share your opinion on the below:
>>>     - https://lore.kernel.org/patchwork/patch/1272027/
>>>     - My intention in cover note.
>> 
>> It seems like a lot of complexity for little benefit.
>> 
>> AFAICS your final purgatory_64.c is only 36 lines, and all it does is a
>> single (open coded) memcpy().
>> 
>> It seems like we could write that in not many more lines of assembler
>> and avoid all this code.
>
> Hi Michael,
>
> I am not sure if you would agree with me on this, but I am looking at the
> purgatory code as work in progress. As mentioned in the cover note, I intend
> to add log messaging, sha256 verification into purgatory. And also change it
> to position independent executable after moving common purgatory code (sha256
> verification) to arch-independent code.

I've never understood the desire to put more logic into purgatory. It's
the absolute worst place to detect that something's gone wrong, because
we have no facilities in there to do anything useful. We don't even know
what platform we're on.

> When I initially took this up, I wanted to add all the above changes too, but
> cut down on it, in the interest of time, first to get kdump (kexec -s -p)
> working in v5.9 merge window.
>
> But as the logic in patches 07/12 & 08/12 has been tested in kexec-tools code
> a lot of times and there are unlikely to be any changes to them except for
> __kexec_do_relocs() function (afaics), when -PIE would be used, I submitted them.
> With patch 09/12, I tried for a change that uses relocations while is minimal
> for now.
>
> Would you prefer it to be absolutely minimal by dropping patches 7 & 8 for
> now and writing the backup data copy code in assembler?

Yes please.

cheers
