Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A452CE7F8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 07:20:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnMxw3gVyzDrQ9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 17:20:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnMw61lWgzDrN1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 17:18:23 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CnMvs0Slnz9tyVK;
 Fri,  4 Dec 2020 07:18:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jxaRUfRitmZY; Fri,  4 Dec 2020 07:18:16 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CnMvr5xslz9tyVJ;
 Fri,  4 Dec 2020 07:18:16 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 398125E8; Fri,  4 Dec 2020 07:21:22 +0100 (CET)
Received: from 192.168.4.90 ([192.168.4.90]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Fri, 04 Dec 2020 07:21:22 +0100
Date: Fri, 04 Dec 2020 07:21:22 +0100
Message-ID: <20201204072122.Horde.MByOum87nJJoC9V6Lu3gzA1@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qian Cai <qcai@redhat.com>
Subject: Re: [PATCH 3/7] powerpc/64s: flush L1D after user accesses
References: <20201119231333.361771-1-dja@axtens.net>
 <20201119231333.361771-4-dja@axtens.net>
 <e82f315e08fe9f13ce4e94259968e0782ebb57a3.camel@redhat.com>
 <da02e10d6b5a63dc10159d4420def15aa0bc4c19.camel@redhat.com>
In-Reply-To: <da02e10d6b5a63dc10159d4420def15aa0bc4c19.camel@redhat.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: cmr@informatik.wtf, spoorts2@in.ibm.com, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Quoting Qian Cai <qcai@redhat.com>:

> On Thu, 2020-12-03 at 12:17 -0500, Qian Cai wrote:
>> []
>> > +static inline bool
>> > +bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool  
>> is_write)
>> > +{
>> > +	return WARN(mmu_has_feature(MMU_FTR_RADIX_KUAP) &&
>> > +		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE :  
>> AMR_KUAP_BLOCK_READ)),
>> > +		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>> > +}
>>
>> A simple "echo t > /proc/sysrq-trigger" will trigger this warning almost
>> endlessly on POWER9 NV.
>
> I have just realized the patch just moved this warning around, so  
> the issue was
> pre-existent. Since I have not tested sysrq-t regularly, I am not  
> sure when it
> started to break. So far, I have reverted some of those for testing which did
> not help, i.e., the sysrq-t issue remains.
>
> 16852975f0f  Revert "powerpc/64s: Use early_mmu_has_feature() in set_kuap()"
> 129e240ead32 Revert "powerpc: Implement user_access_save() and  
> user_access_restore()"
> edb0046c842c Revert "powerpc/64s/kuap: Add missing isync to KUAP  
> restore paths"
> 2d46ee87ce44 Revert "powerpc/64/kuap: Conditionally restore AMR in  
> interrupt exit"
> c1e0e805fc57 Revert "powerpc/64s/kuap: Conditionally restore AMR in  
> kuap_restore_amr asm"
> 7f30b7aaf23a Revert "selftests/powerpc: rfi_flush: disable entry  
> flush if present"
> bc9b9967a100 Revert "powerpc/64s: flush L1D on kernel entry"
> b77e7b54f5eb Revert "powerpc/64s: flush L1D after user accesses"
> 22dddf532c64 Revert "powerpc: Only include kup-radix.h for 64-bit Book3S"
> 2679d155c46a Revert "selftests/powerpc: entry flush test"
> 87954b9b4243 Revert "selftests/powerpc: refactor entry and rfi_flush tests"
> 342d82bd4c5d Revert "powerpc/64s: rename pnv|pseries_setup_rfi_flush  
> to _setup_security_mitigations"

I also hit that WARNING in the same way earlier this week.

I think it has been broken by commit c33165253492 ("powerpc: use  
non-set_fs based maccess routines")

IIUC we should provide copy_from_kernel_nofault_allowed() to avoid that.

Christophe
