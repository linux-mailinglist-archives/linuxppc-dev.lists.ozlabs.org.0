Return-Path: <linuxppc-dev+bounces-6678-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A7DA4D7CF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 10:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6VWp4hQvz30WQ;
	Tue,  4 Mar 2025 20:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741080006;
	cv=none; b=owKe8VxLv7q/PqVwh7UGmUHBFeIQiiQ3iULitMVVLRNMeooUryAWy/IZO7g+9kzGbDdHMKxIZsg/MD86Wi1Xwc/ZQfw5+ilBQTkD7EJnXz751l3Z1hn5ai52pBqQtpvDi3C4IUxuN66ErIJxfJCpfUXK0absHuoHV9dfUbCWXwldK8OiGKyPC2Zzzx/TLKMne8nHHIpM1w+by8owpFZf86Fu5Y48Vdp4G3fPJoOJJj0EIVvBTYX4Fo7VZhOIOPIIiqVd/Drr6cniPxdRbTSrMfVvwIr3RMt30NSAD08HU+bggVQJB0fSBQ4Iyue/pSLJ9JLbLPvy0eDOlae8MRmhcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741080006; c=relaxed/relaxed;
	bh=VcmPsUhe+f2iH1MDQXv6x6yjCQKo6zZT4QMd7PrWfgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fmmdccWqljpaiSkmqtgTXh2zNafN3uMYMrBNW5MtflzWOEIk42RgNDV+pkp6KnnsEBnRgHQW3mt4awtcgwj0szvn3jKu8eM2+p1G7jkm4WBKcx4ybRDg2+iUWnk4TEa2qetR4zhqkCPSJRV+R7I5s4E1PjfUi8FpGxLDDodLhKOfc4/MrBB74k55KlXflH6j0hLiljdCHmNfEhWPJbmCqvPph2T/rHNmuNlSdff6qfMVH3W6yOm9er8Wq1s0apcatWqRX9GlseG7T1H5uIUfHhgvGcMLFLnodaYZWVHXPcVtvZLe5tXbWaTWbfgVtv1I84ZLEOq5YX77lQCHHD4KmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6VWn5zbpz2xdb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 20:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z6V031gHbz9stG;
	Tue,  4 Mar 2025 09:56:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3I1rDI2lQlkt; Tue,  4 Mar 2025 09:56:03 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z6V030r5lz9st4;
	Tue,  4 Mar 2025 09:56:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0A34E8B770;
	Tue,  4 Mar 2025 09:56:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5F1iC3gbFidx; Tue,  4 Mar 2025 09:56:02 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A1D238B763;
	Tue,  4 Mar 2025 09:56:02 +0100 (CET)
Message-ID: <8ba544e7-cf2a-4807-a056-683115805721@csgroup.eu>
Date: Tue, 4 Mar 2025 09:56:01 +0100
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
Subject: Re: Build Warnings at arch/powerpc/
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com>
 <47aa8b75-96b6-4e37-bb62-ad758b414076@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <47aa8b75-96b6-4e37-bb62-ad758b414076@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 04/03/2025 à 07:13, Madhavan Srinivasan a écrit :
> 
> 
> On 3/4/25 10:42 AM, Venkat Rao Bagalkote wrote:
>> Greetings!!
>>
>>
>> Observing build warnings with linux-next and powerpc repo's. Issue is currently not seen on mainline yet.
>>
>> PPC Repo: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpowerpc%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C8e0f8501f09c48dbb43608dd5ae3c9bf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638766656585342184%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=e5BrJzcrtlITkLF31KltGExQ5Qe8fDVTMV6VfR4w9o8%3D&reserved=0 merge branch
>>
>> PPC Kernel Version: 6.14.0-rc4-g1304f486dbf1
>> next Repo: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C8e0f8501f09c48dbb43608dd5ae3c9bf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638766656585355246%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=meQyZfB75HhJFCL6AX93slsyVwnogGPYFabDXl%2FLzDA%3D&reserved=0 master branch
>>
>> next Kernel Version: 6.14.0-rc5-next-20250303
>>
>>
>> On linux-next kernel issue got introduced b/w next-20250227 and next-20250303
>>
>>
>> Build Warnings:
>>
>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xe84: intra_function_call not a direct call
>> arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: unannotated intra-function call
>> arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: intra_function_call not a direct call
>>
>>
> 
> Can you please specific the compiler and compiler version you found this issue with
> 

Can you also tell which defconfig you are using or provide your .config

It might also be helpfull if you can provide a disassembly of the three 
file.o around the warned address.

Christophe

