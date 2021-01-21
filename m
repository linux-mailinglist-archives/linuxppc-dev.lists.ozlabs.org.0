Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 918382FEF8F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 16:57:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM6TQ4nJ9zDr5R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 02:56:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f35;
 helo=mail-qv1-xf35.google.com; envelope-from=konrad.r.wilk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NsC+3swt; dkim-atps=neutral
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM6R732txzDqSN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 02:54:53 +1100 (AEDT)
Received: by mail-qv1-xf35.google.com with SMTP id 2so1119394qvd.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 07:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F9T5QDxYqfmfnPwZxITw0CZr4ZjJM1vepPOWi52m39U=;
 b=NsC+3swtSkqDnokK/hyMWclsUQ9GXS8r9bavs5m/3LSPYzs/+aMV0LdEOiBh1DVz0a
 WEYgoDDs8Ltk7B4gtTfQmNoWKHoL55gqizW9xXKpftoBVvhpHjuW89CRHoJ7K7U92NrA
 itZA+iTErC5vCFrKYoIG5Z8dtSL+v0xX2DawGsh+qCIgvr53WR6YjovETnBMl5fHJJ1E
 bXpJYRFwideDInvuhh8lbAmMm5pdUmbHhN17/14vULZNENqe78u7mMTJWVuqLaxtTq7g
 i3ASsclaOjM7l22H4t9qbYa6vgl0LzyECK1mJ4MmkVZoT3fWqByDY8Yj3xEaLdbLEwQf
 +dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=F9T5QDxYqfmfnPwZxITw0CZr4ZjJM1vepPOWi52m39U=;
 b=A3nspKObyw9KXdOSMK5pX7GbI2h0n9w/4OarGkeitzu9YfYR/sE28EAZ1Q5+e99A1q
 uyP3NcYd6N/ZJiqPq3UkH7JmR2LfbqcCcRuji75UXjvu0vxv6FdgZYHr2tfZpxp7t5lc
 bCEcUIiAqHAq9q4z1pu0fYwfbds+H4fH1qdryoKxvLk5eeD4uHFAX7696hmbI5Ko2gyS
 Ht9NEj+MR47A8h9CUEq61/SdVGRg3z92CofWFrbowRI+QBtfZ6pk5fRxGpozPAEFpgX6
 lDtgw4VUcduPAg5beuN9GoVYyvL9oUXy3C/DdfN4SL0VIAxvDzzq68xiTdBckMyHG4Au
 GuOA==
X-Gm-Message-State: AOAM530SCGiBQL6DHehvKi0K2tKCfpOhd6v9OyvInFNfuZlXQUuds1hG
 pNRo+QRhDAWKffeQKEEGG1I=
X-Google-Smtp-Source: ABdhPJwNsEnMNHiGxuj0djSejhTBW8B9coHKR/39OcWJ9zxAUPgbRnu8QXGIawtpyB9uEGA/q8haWA==
X-Received: by 2002:ad4:4ae2:: with SMTP id cp2mr239567qvb.50.1611244490644;
 Thu, 21 Jan 2021 07:54:50 -0800 (PST)
Received: from fedora
 (209-6-208-110.s8556.c3-0.smr-cbr2.sbo-smr.ma.cable.rcncustomer.com.
 [209.6.208.110])
 by smtp.gmail.com with ESMTPSA id x21sm3053378qkn.61.2021.01.21.07.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:54:50 -0800 (PST)
Date: Thu, 21 Jan 2021 10:54:48 -0500
From: Konrad Rzeszutek Wilk <konrad@darnok.org>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mm: Limit allocation of SWIOTLB on server machines
Message-ID: <20210121155448.GA97019@fedora>
References: <20201218062103.76102-1-bauerman@linux.ibm.com>
 <20201223205838.GA4102@ram-ibm-com.ibm.com>
 <87o8ikukye.fsf@manicouagan.localdomain>
 <20201224031409.GB4102@ram-ibm-com.ibm.com>
 <87bldzlzu2.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bldzlzu2.fsf@manicouagan.localdomain>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 08, 2021 at 09:27:01PM -0300, Thiago Jung Bauermann wrote:
> 
> Ram Pai <linuxram@us.ibm.com> writes:
> 
> > On Wed, Dec 23, 2020 at 09:06:01PM -0300, Thiago Jung Bauermann wrote:
> >> 
> >> Hi Ram,
> >> 
> >> Thanks for reviewing this patch.
> >> 
> >> Ram Pai <linuxram@us.ibm.com> writes:
> >> 
> >> > On Fri, Dec 18, 2020 at 03:21:03AM -0300, Thiago Jung Bauermann wrote:
> >> >> On server-class POWER machines, we don't need the SWIOTLB unless we're a
> >> >> secure VM. Nevertheless, if CONFIG_SWIOTLB is enabled we unconditionally
> >> >> allocate it.
> >> >> 
> >> >> In most cases this is harmless, but on a few machine configurations (e.g.,
> >> >> POWER9 powernv systems with 4 GB area reserved for crashdump kernel) it can
> >> >> happen that memblock can't find a 64 MB chunk of memory for the SWIOTLB and
> >> >> fails with a scary-looking WARN_ONCE:
> >> >> 
> >> >>  ------------[ cut here ]------------
> >> >>  memblock: bottom-up allocation failed, memory hotremove may be affected
> >> >>  WARNING: CPU: 0 PID: 0 at mm/memblock.c:332 memblock_find_in_range_node+0x328/0x340
> >> >>  Modules linked in:
> >> >>  CPU: 0 PID: 0 Comm: swapper Not tainted 5.10.0-rc2-orig+ #6
> >> >>  NIP:  c000000000442f38 LR: c000000000442f34 CTR: c0000000001e0080
> >> >>  REGS: c000000001def900 TRAP: 0700   Not tainted  (5.10.0-rc2-orig+)
> >> >>  MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28022222  XER: 20040000
> >> >>  CFAR: c00000000014b7b4 IRQMASK: 1
> >> >>  GPR00: c000000000442f34 c000000001defba0 c000000001deff00 0000000000000047
> >> >>  GPR04: 00000000ffff7fff c000000001def828 c000000001def820 0000000000000000
> >> >>  GPR08: 0000001ffc3e0000 c000000001b75478 c000000001b75478 0000000000000001
> >> >>  GPR12: 0000000000002000 c000000002030000 0000000000000000 0000000000000000
> >> >>  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000002030000
> >> >>  GPR20: 0000000000000000 0000000000010000 0000000000010000 c000000001defc10
> >> >>  GPR24: c000000001defc08 c000000001c91868 c000000001defc18 c000000001c91890
> >> >>  GPR28: 0000000000000000 ffffffffffffffff 0000000004000000 00000000ffffffff
> >> >>  NIP [c000000000442f38] memblock_find_in_range_node+0x328/0x340
> >> >>  LR [c000000000442f34] memblock_find_in_range_node+0x324/0x340
> >> >>  Call Trace:
> >> >>  [c000000001defba0] [c000000000442f34] memblock_find_in_range_node+0x324/0x340 (unreliable)
> >> >>  [c000000001defc90] [c0000000015ac088] memblock_alloc_range_nid+0xec/0x1b0
> >> >>  [c000000001defd40] [c0000000015ac1f8] memblock_alloc_internal+0xac/0x110
> >> >>  [c000000001defda0] [c0000000015ac4d0] memblock_alloc_try_nid+0x94/0xcc
> >> >>  [c000000001defe30] [c00000000159c3c8] swiotlb_init+0x78/0x104
> >> >>  [c000000001defea0] [c00000000158378c] mem_init+0x4c/0x98
> >> >>  [c000000001defec0] [c00000000157457c] start_kernel+0x714/0xac8
> >> >>  [c000000001deff90] [c00000000000d244] start_here_common+0x1c/0x58
> >> >>  Instruction dump:
> >> >>  2c230000 4182ffd4 ea610088 ea810090 4bfffe84 39200001 3d42fff4 3c62ff60
> >> >>  3863c560 992a8bfc 4bd0881d 60000000 <0fe00000> ea610088 4bfffd94 60000000
> >> >>  random: get_random_bytes called from __warn+0x128/0x184 with crng_init=0
> >> >>  ---[ end trace 0000000000000000 ]---
> >> >>  software IO TLB: Cannot allocate buffer
> >> >> 
> >> >> Unless this is a secure VM the message can actually be ignored, because the
> >> >> SWIOTLB isn't needed. Therefore, let's avoid the SWIOTLB in those cases.
> >> >
> >> > The above warn_on is conveying a genuine warning. Should it be silenced?
> >> 
> >> Not sure I understand your point. This patch doesn't silence the
> >> warning, it avoids the problem it is warning about.
> >
> > Sorry, I should have explained it better. My point is...  
> >
> > 	If CONFIG_SWIOTLB is enabled, it means that the kernel is
> > 	promising the bounce buffering capability. I know, currently we
> > 	do not have any kernel subsystems that use bounce buffers on
> > 	non-secure-pseries-kernel or powernv-kernel.  But that does not
> > 	mean, there wont be any. In case there is such a third-party
> > 	module needing bounce buffering, it wont be able to operate,
> > 	because of the proposed change in your patch.
> >
> > 	Is that a good thing or a bad thing, I do not know. I will let
> > 	the experts opine.
> 
> Ping? Does anyone else has an opinion on this? The other option I can
> think of is changing the crashkernel code to not reserve so much memory
> below 4 GB. Other people are considering this option, but it's not
> planned for the near future.

That seems a more suitable solution regardless, but there is always
the danger of not being enough or being too big.

There was some autocrashkernel allocation patches going around
for x86 and ARM that perhaps could be re-used?

> 
> Also, there's a patch currently in linux-next which removes the scary
> warning because of unrelated reasons:
> 
> https://lore.kernel.org/lkml/20201217201214.3414100-2-guro@fb.com
> 
> So assuming that the patch above goes in and keeping the assumption that
> the swiotlb won't be needed in the powernv machines where I've seen the
> warning happen, we can just leave things as they are now.

If that solves the problem, then that is OK.


> 
> -- 
> Thiago Jung Bauermann
> IBM Linux Technology Center
