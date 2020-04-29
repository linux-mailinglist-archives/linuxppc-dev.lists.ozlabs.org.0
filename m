Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A99FD1BD4FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:46:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bpvt5qhTzDr43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:46:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p00-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5300::5;
 helo=mo6-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=kZekB7JM; 
 dkim-atps=neutral
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bpnw0J77zDqJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:41:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1588142490;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=yQIW7CdxCm1nZ34EyW5UqRtDKqPhYxjf49XAnI4L+GU=;
 b=kZekB7JMD1c8RZUkqTIs5HIF1ncLczIcPvbUWJdOnAXBbt/YOKOEAaDXOjuXzeK/oz
 4YUNwukSGAWgtVbREbJnhd99Hiqxsmy+LMgr0i+nMhF1Gbtbo0PDunYTXYuEXgKCbz/E
 4krQYmfGRR56SINxvWEG2SVcCuVndKQBDg27YeXLEhFvSqUgbtuO21bWTtMirzXbJ1zQ
 xw9LAjBIGMq81szq3P2vSSZPDnDfA8Ces0DLBI5CLmOiNnWqRD/1iC7PPpbC6J409L1d
 2RrirVp5f85GSHVOjXf9HV6AW4LEcGB4tUBalXdMx7yz/Eq2eyR5iCkCG90MR8otOhf/
 aaKA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhUJ75BWFoEZCQ5Q07Tlj1hNt/jTQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:71ad:77cc:45a0:8302]
 by smtp.strato.de (RZmta 46.6.2 AUTH) with ESMTPSA id I01247w3T6fRXfE
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 29 Apr 2020 08:41:27 +0200 (CEST)
Subject: Re: Section mismatch in reference from the function .early_init_mmu()
 to the function .init.text:.radix__early_init_mmu() after PowerPC
 updates 5.7-1
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <mailman.127.1586355379.11283.linuxppc-dev@lists.ozlabs.org>
 <fa2aba7e-ef63-da43-8348-314bf8525161@xenosoft.de>
 <865a35c1-1eed-cd39-9645-06eedbe61b4b@xenosoft.de>
 <24c8f0fb-6e40-3546-a33e-1a4c9643e9f7@xenosoft.de>
 <0fffa44f-db23-cd9e-5bd5-4012e2398e34@xenosoft.de>
 <1588136973.mf0j03tcz0.astroid@bobo.none>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <e57a563d-f3af-c66c-0865-754a527578ed@xenosoft.de>
Date: Wed, 29 Apr 2020 08:41:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588136973.mf0j03tcz0.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 "contact@a-eon.com" <contact@a-eon.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29 April 2020 at 07:13 am, Nicholas Piggin wrote:
> Excerpts from Christian Zigotzky's message of April 29, 2020 2:53 pm:
>> Hi All,
>>
>> The issue still exists in the RC3. (kernel config attached)
>>
>> Please help me to fix this issue.
> Huh, looks like maybe early_init_mmu() got uninlined because the
> compiler decided it was unlikely.
>
> Does this fix it?
>
> Thanks,
> Nick
> --

Hi Nick,

Many thanks for your patch! It solved the issue.

Have a nice day!

Cheers,
Christian

>
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index bb3deb76c951..3ffe5f967483 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -208,7 +208,7 @@ void hash__early_init_devtree(void);
>   void radix__early_init_devtree(void);
>   extern void hash__early_init_mmu(void);
>   extern void radix__early_init_mmu(void);
> -static inline void early_init_mmu(void)
> +static inline void __init early_init_mmu(void)
>   {
>   	if (radix_enabled())
>   		return radix__early_init_mmu();
>

