Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 434441CC1BF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 15:21:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49K7C36PHbzDr4R
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 23:21:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=elWpvb1r; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49K7841BcgzDr1S
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 23:19:15 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id b1so3128012qtt.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 09 May 2020 06:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=c3S74qnfjRD4b2Wdq7OyXA9G4DMNeJPdnBeSuCdDvso=;
 b=elWpvb1roqtRswDoNOxnBJvGEQy9WooHuez8YPM/O00mnWKJxjqRh6WUqKd1u1CSAv
 3u4xhPNQSBwBA2lAyTNgE7Kn+8Jv+Jap1F1w+55GLKlmBSc+8SnvZ/qe/WGJ2h139z9N
 f6vh7l4bd7YP1mMzTduYLdPo590AajSgnrV/iSMPPWDWShJAUIJHAtIUXg3MiJTEdqSL
 lUpCrdk8Mz/h0sxTbNfO3MJkEYAD5oFCcuUSRQ0VrGKHdGG84cdKPrAhuGRZAMNpkz6H
 ustx4xnoTZK3RDyB3JIHkdm8s1VGMOx/EoT8uSNYih9YVwE/eSyt+v5O7YCERdCyK/DB
 Kuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=c3S74qnfjRD4b2Wdq7OyXA9G4DMNeJPdnBeSuCdDvso=;
 b=kOwpDoER6re8MA4d6Nmj2YeMjHMJESmiKdGzzZ1IVwC66Klg2OkuU7d+hf2O0gEy2r
 IbowF38JX7yMp46FGjmSdHlLYI35cm5HRUklZjhTm+tglNyWPRZBcJ0h3eZBYpkggZDG
 c66JhIgBt2CNAc2BM28TB++QZFXOYnni4ruO4sGZwul0Ym0/cS8D8PMEx0PC+3v0kEPW
 Ud9hzB6NZxompaVTibeWYQmUHHmw2RRxHQ/ElAvpuWSp11z5y9bFmF4gr5QJYZBdlKua
 zT2siVBjYo8UjCjvv9Kh/BArmh+9PeTJ40X8zolIVZynPcMdE78YZRgLQFW+CECJdVju
 R96A==
X-Gm-Message-State: AGi0PuZQpY2BIjThalFQmp4FPLyoIoUaHcs3wdYnRDHo4fImr+BEzRIX
 nAm5ThI33czc5M3KXmuZYnLFaQ==
X-Google-Smtp-Source: APiQypLLtYrBFiPepvraIPHBoc177IPldZwLVLY1Tc4DTogqSShZhaXrdR5qCR+aXYadNZEY2OZPXw==
X-Received: by 2002:ac8:1c3d:: with SMTP id a58mr6763870qtk.52.1589030351100; 
 Sat, 09 May 2020 06:19:11 -0700 (PDT)
Received: from qians-mbp.fios-router.home
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id c11sm3561527qkj.78.2020.05.09.06.19.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 09 May 2020 06:19:10 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3] powerpc/64s/pgtable: fix an undefined behaviour
From: Qian Cai <cai@lca.pw>
In-Reply-To: <952c3921-5aa8-bff5-9a87-baf5f901c535@c-s.fr>
Date: Sat, 9 May 2020 09:19:09 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <AE5E859B-E1B8-4066-8EB2-670F72713EE2@lca.pw>
References: <20200306044852.3236-1-cai@lca.pw>
 <952c3921-5aa8-bff5-9a87-baf5f901c535@c-s.fr>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, rashmicy@gmail.com,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Mar 6, 2020, at 1:56 AM, Christophe Leroy <christophe.leroy@c-s.fr> =
wrote:
>=20
>=20
>=20
> Le 06/03/2020 =C3=A0 05:48, Qian Cai a =C3=A9crit :
>> Booting a power9 server with hash MMU could trigger an undefined
>> behaviour because pud_offset(p4d, 0) will do,
>> 0 >> (PAGE_SHIFT:16 + PTE_INDEX_SIZE:8 + H_PMD_INDEX_SIZE:10)
>> Fix it by converting pud_index() and friends to static inline
>> functions.
>> UBSAN: shift-out-of-bounds in arch/powerpc/mm/ptdump/ptdump.c:282:15
>> shift exponent 34 is too large for 32-bit type 'int'
>> CPU: 6 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc4-next-20200303+ =
#13
>> Call Trace:
>> dump_stack+0xf4/0x164 (unreliable)
>> ubsan_epilogue+0x18/0x78
>> __ubsan_handle_shift_out_of_bounds+0x160/0x21c
>> walk_pagetables+0x2cc/0x700
>> walk_pud at arch/powerpc/mm/ptdump/ptdump.c:282
>> (inlined by) walk_pagetables at arch/powerpc/mm/ptdump/ptdump.c:311
>> ptdump_check_wx+0x8c/0xf0
>> mark_rodata_ro+0x48/0x80
>> kernel_init+0x74/0x194
>> ret_from_kernel_thread+0x5c/0x74
>> Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> Signed-off-by: Qian Cai <cai@lca.pw>
>=20
> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

Michael, can you take a look at this patch when you have a chance? It =
looks falling through the cracks.

>=20
>> ---
>> v3: convert pud_index() etc to static inline functions.
>> v2: convert pud_offset() etc to static inline functions.
>>  arch/powerpc/include/asm/book3s/64/pgtable.h | 23 =
++++++++++++++++----
>>  1 file changed, 19 insertions(+), 4 deletions(-)
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h =
b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index 201a69e6a355..bd432c6706b9 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -998,10 +998,25 @@ extern struct page *pgd_page(pgd_t pgd);
>>  #define pud_page_vaddr(pud)	__va(pud_val(pud) & ~PUD_MASKED_BITS)
>>  #define pgd_page_vaddr(pgd)	__va(pgd_val(pgd) & ~PGD_MASKED_BITS)
>>  -#define pgd_index(address) (((address) >> (PGDIR_SHIFT)) & =
(PTRS_PER_PGD - 1))
>> -#define pud_index(address) (((address) >> (PUD_SHIFT)) & =
(PTRS_PER_PUD - 1))
>> -#define pmd_index(address) (((address) >> (PMD_SHIFT)) & =
(PTRS_PER_PMD - 1))
>> -#define pte_index(address) (((address) >> (PAGE_SHIFT)) & =
(PTRS_PER_PTE - 1))
>> +static inline unsigned long pgd_index(unsigned long address)
>> +{
>> +	return (address >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1);
>> +}
>> +
>> +static inline unsigned long pud_index(unsigned long address)
>> +{
>> +	return (address >> PUD_SHIFT) & (PTRS_PER_PUD - 1);
>> +}
>> +
>> +static inline unsigned long pmd_index(unsigned long address)
>> +{
>> +	return (address >> PMD_SHIFT) & (PTRS_PER_PMD - 1);
>> +}
>> +
>> +static inline unsigned long pte_index(unsigned long address)
>> +{
>> +	return (address >> PAGE_SHIFT) & (PTRS_PER_PTE - 1);
>> +}
>>    /*
>>   * Find an entry in a page-table-directory.  We combine the address =
region

