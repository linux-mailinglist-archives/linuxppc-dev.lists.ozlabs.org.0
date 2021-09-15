Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 597F540CB8E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 19:19:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8n4s1rW9z305v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 03:19:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8n4K4hkcz2yJP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 03:18:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H8n4F0x0Hz9sV4;
 Wed, 15 Sep 2021 19:18:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PKzNyxImFUbI; Wed, 15 Sep 2021 19:18:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H8n4D73HWz9sV3;
 Wed, 15 Sep 2021 19:18:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D8C808B77C;
 Wed, 15 Sep 2021 19:18:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QXqNkIx7zBCr; Wed, 15 Sep 2021 19:18:36 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.250])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 11BA38B763;
 Wed, 15 Sep 2021 19:18:34 +0200 (CEST)
Subject: Re: [PATCH v3 4/8] powerpc/pseries/svm: Add a powerpc version of
 cc_platform_has()
To: Borislav Petkov <bp@alien8.de>, Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1631141919.git.thomas.lendacky@amd.com>
 <9d4fc3f8ea7b325aaa1879beab1286876f45d450.1631141919.git.thomas.lendacky@amd.com>
 <YUCOTIPPsJJpLO/d@zn.tnic> <87lf3yk7g4.fsf@mpe.ellerman.id.au>
 <YUHGDbtiGrDz5+NS@zn.tnic>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f8388f18-5e90-5d0f-d681-0b17f8307dd4@csgroup.eu>
Date: Wed, 15 Sep 2021 19:18:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUHGDbtiGrDz5+NS@zn.tnic>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
Content-Transfer-Encoding: 8bit
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
Cc: linux-s390@vger.kernel.org,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Tom Lendacky <thomas.lendacky@amd.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Andi Kleen <ak@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 amd-gfx@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/09/2021 à 12:08, Borislav Petkov a écrit :
> On Wed, Sep 15, 2021 at 10:28:59AM +1000, Michael Ellerman wrote:
>> I don't love it, a new C file and an out-of-line call to then call back
>> to a static inline that for most configuration will return false ... but
>> whatever :)
> 
> Yeah, hch thinks it'll cause a big mess otherwise:
> 
> https://lore.kernel.org/lkml/YSScWvpXeVXw%2Fed5@infradead.org/

Could you please provide more explicit explanation why inlining such an 
helper is considered as bad practice and messy ?

Because as demonstrated in my previous response some days ago, taking 
that outline ends up with an unneccessary ugly generated code and we 
don't benefit front GCC's capability to fold in and opt out unreachable 
code.

As pointed by Michael in most cases the function will just return false 
so behind the performance concern, there is also the code size and code 
coverage topic that is to be taken into account. And even when the 
function doesn't return false, the only thing it does folds into a 
single powerpc instruction so there is really no point in making a 
dedicated out-of-line fonction for that and suffer the cost and the size 
of a function call and to justify the addition of a dedicated C file.


> 
> I guess less ifdeffery is nice too.

I can't see your point here. Inlining the function wouldn't add any 
ifdeffery as far as I can see.

So, would you mind reconsidering your approach and allow architectures 
to provide inline implementation by just not enforcing a generic 
prototype ? Or otherwise provide more details and exemple of why the 
cons are more important versus the pros ?

Thanks
Christophe
