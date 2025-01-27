Return-Path: <linuxppc-dev+bounces-5596-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FFAA1D59C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 12:50:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhRYV6GF7z3011;
	Mon, 27 Jan 2025 22:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737978606;
	cv=none; b=SaqRoXHxFlZV7YLL446PkKS0W027Shp+YysuMeGuyJwOHY8M7Z1RiW4cisNARJ7QIHOc8R/iUTBjcDLNGqhqw5ElCUbhnlTW0iz+JUfoqy/B6+tEDkKc4ofObjfTct3p/BmvvWNWJy/Haxy5Dy4AyxbuhkkrJVjLN2AD9tsTyvSaso6XWA0CPCcUrDIZJlojUFDLSrorxu6Oz8ZC390luNx+3G9PmvspOsZ3d7Ph7ZhmWZjFroiQyTberq+lMuFHOumstTouBecr+JrKpMZ1eEF+YvTGE0WSijriCD3Ypv3tYQAr93f/FcztDa3cZflNRJcnFBD/Xmxo07m9piVMDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737978606; c=relaxed/relaxed;
	bh=pBPMUDYelXibXZ1rC16WxKh2Yy0AFjixhAZtHRY9su8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iY/zmnjDb8EXXD8JAwmih1sWj5EE6qQOeEgvGl0gdfEl7Qwq2fFsYhDU7KMPMYl3AqkByWYf9ZD66PLxzeE7tBeUQNwqAvWLqMteXYRpG1RW1GyE8Q2I5wtLOhheyYv8TpDyXseXKy73RMMgvPbgFORFuyev/buFLA2u9JYH/ZOdRczvfOlyyWg6ljhiL0OxBVmgEsqZcys5pdZqlC6T0chZCgooFWF8xYyGy5IKiSkiuVCAalVz4fv6CfqZMBNWCrQFxNm/7LQ4ffUsM7sAgjX2/pdN0QhxjvKikhG2RpcoJrNGtvP3M0pL/elnQgt8vNsH6scoGMWO0UZ6uTHxyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhRYT6JPfz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 22:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YhRGG4Zrfz9sPd;
	Mon, 27 Jan 2025 12:36:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kdqcjB_5NX1X; Mon, 27 Jan 2025 12:36:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YhRGG3lQjz9rvV;
	Mon, 27 Jan 2025 12:36:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E4B28B765;
	Mon, 27 Jan 2025 12:36:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 8Me-iUbo1cR2; Mon, 27 Jan 2025 12:36:54 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C78548B763;
	Mon, 27 Jan 2025 12:36:53 +0100 (CET)
Message-ID: <7e7c7659-5cf7-42e9-81d6-b91963d8c892@csgroup.eu>
Date: Mon, 27 Jan 2025 12:36:53 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Eugene Syromyatnikov <evgsyr@gmail.com>, Mike Frysinger <vapier@gentoo.org>,
 Renzo Davoli <renzo@cs.unibo.it>, Davide Berardi <berardi.dav@gmail.com>,
 strace-devel@lists.strace.io, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250123182815.GA20994@strace.io>
 <86079b5c-e124-489b-8136-05ae5700cb61@csgroup.eu>
 <20250127112023.GB29522@strace.io>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250127112023.GB29522@strace.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 27/01/2025 à 12:20, Dmitry V. Levin a écrit :
> On Thu, Jan 23, 2025 at 11:07:21PM +0100, Christophe Leroy wrote:
> [...]
>> To add a bit more to the confusion,
> 
> Looks like there is no end to it:
> 
> static inline long regs_return_value(struct pt_regs *regs)
> {
>          if (trap_is_scv(regs))
>                  return regs->gpr[3];
> 
>          if (is_syscall_success(regs))
>                  return regs->gpr[3];
>          else
>                  return -regs->gpr[3];
> }
> 
> static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
> {
>          regs->gpr[3] = rc;
> }
> 
> This doesn't look consistent, does it?
> 
> 

That regs_set_return_value() looks pretty similar to 
syscall_get_return_value().

regs_set_return_value() documentation in asm-generic/syscall.h 
explicitely says: This value is meaningless if syscall_get_error() 
returned nonzero

Is it the same with regs_set_return_value(), only meaningfull where 
there is no error ?

By the way, why have two very similar APIs, one in syscall.h one in 
ptrace.h ?

