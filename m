Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFCD4B64D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 08:55:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyYKV1j3Xz3cVq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 18:55:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=kPBYG8bn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=kPBYG8bn; 
 dkim-atps=neutral
X-Greylist: delayed 401 seconds by postgrey-1.36 at boromir;
 Tue, 15 Feb 2022 18:54:32 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyYJm670rz3bT5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 18:54:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644911661;
 bh=Gg0eXtIflg4YSdhde6TPBD88ytt9vELXByFDX1EvH5o=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=kPBYG8bnQEYNfEzzjFUlGQ4cQrkUiRTfVmugepyhjTzI5nN4Pwv8hYBPSqdpybtHI
 UftGck5f9UX83yswz2rcNNFQv0WPwceG5VlXiuckV/8nDt+75Uff/POcVl7fxKeATw
 fuTquD0sTcXntpn92fUVEDngyf/cZM8VUv2azb2w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.185.100]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8obG-1oOVrh0Ttm-015uP2; Tue, 15
 Feb 2022 08:46:19 +0100
Message-ID: <215c0ddc-54b1-bcb1-c5aa-bd17c6b100a8@gmx.de>
Date: Tue, 15 Feb 2022 08:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 14/14] uaccess: drop set_fs leftovers
Content-Language: en-US
To: Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@kernel.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-15-arnd@kernel.org>
 <YgsYD2nW9GjWJtn5@zeniv-ca.linux.org.uk>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YgsYD2nW9GjWJtn5@zeniv-ca.linux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YbVX8I9McP/aOoptX/QU6xXsMUxj5l3eWtWKIf3O+jL0xku9qtG
 Zvd7JXlVOTeAkMcrw4ura0jf9AQkk5D8MaemK64qHhWPazHfq3pPTRp36Jgwt+Bz560jUXw
 EnyWRjxioFtmKG1I+4nkiaSRoRlQJJpM92uIMgDane+QxlF3STQpbB16Ci0R4wmVz76au1k
 fLV9rswEGC1K4sHhia8eg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P4e6BRe1usY=:D/svW4Ax9VSc/pC/kQ0+0g
 awJRo8eoA/2RUIeNE4xPPi/lprmmcb4m+CMK3AMK7q+HH7b1AhCSiHaFqW9OwN0LzFxBI76Tj
 XJDhTNuW3jUp9Rbt4rJOuzDA5tD+rmoLLDa6IlZt8Uw45KbPXjfZ7WkAHTi8oDeJDGV1SDuNE
 YLgVmDFXhO4WGfkYaAMjuCg1f2DfeTUMnv6Rs8GGusvWMgiE7lLMbGwKsQDcKS4ir1gqkaKGu
 b27jhvzC76mVm6FfiWjwoeoGHh7RJfmMrHCOjmdlqCQrv0rV2Y+Hjk78trdJ45w9FeVxyRSRs
 EPsrohvOkGVJ84buUMiUGR+F/AC6zSMWm6aZ5+2/63xTZyZw3Brjibc9y/1XxWBmOII9LgKtC
 6Dw/jhR8EnAFTHSsNwEtqv56WV5XZENEBUf2EIT33ScEQXTJcn6hTAVE9w9a137ABx7Y+V2uN
 tJhRmXOE4Nvt3+1NpJROrHvX0NyHlq0E29/AkIHbZLNQ5kK2lPDv+mSCl2ejXBpKVZ8ytMvbJ
 F3nr/r/JlUJj4C4KgI9BS1NzqGztKkxSqdyHWVdLYgKRtcwhLhny+fTNn4COaVC4ZNY1oXKzt
 Y3V1nVURKOrexflPa21nv0V3TsFqV4yfFKOqZV2wT7QK2g/EClNBFaJrPhM24x+kDY8w3OiM9
 y+Ay+nVgJ0fUgBX10BWoXtKc6gaKhsEGcyoOcR2cEVfIl5I9QIRc2eg7EItCVe0s2OOB7CJNF
 +IxiF4Ql/Bf2rNvGF0fuM8ZWhmsG9mSGQTpBlvPxZldgbISRBzX6VuFkb2EEol73ayAIbA0rT
 GuztP4/5R7he1NNkbmP0sI4/nje3hlps+I/5TXK9JQdVS2qt8Dw0x+RBi5NaYKBEHlSzoHnAO
 EDVt9VEiDB7kvCQM+hfs6QS/2Y01o3H05pS0zgJPmfxz7/VvnpAIvj3RLDumoSyXIsY8L6oB5
 PA67ZJty56FkdaynuRmaEG2VoHSoekxHaxakwK6yoIJxxiepgeoLPpTXdL7fBj4582Nn1MWtZ
 njv0TPKJn0Zf9scyENd67n+5PqTqyYO9jjKy6NLa7AKAW5HE3ntnPsp3aMwUGM1z3IRH+r0TS
 otTG86uVwd3+EM=
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, x86@kernel.org,
 linux@armlinux.org.uk, linux-csky@vger.kernel.org, ardb@kernel.org,
 mingo@redhat.com, geert@linux-m68k.org, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, arnd@arndb.de, hca@linux.ibm.com,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com, shorne@gmail.com,
 linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 jcmvbkbc@gmail.com, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 dinguyen@kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/15/22 04:03, Al Viro wrote:
> On Mon, Feb 14, 2022 at 05:34:52PM +0100, Arnd Bergmann wrote:
>> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/=
futex.h
>> index b5835325d44b..2f4a1b1ef387 100644
>> --- a/arch/parisc/include/asm/futex.h
>> +++ b/arch/parisc/include/asm/futex.h
>> @@ -99,7 +99,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *=
uaddr,
>>  	/* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
>>  	 * our gateway page, and causes no end of trouble...
>>  	 */
>> -	if (uaccess_kernel() && !uaddr)
>> +	if (!uaddr)
>>  		return -EFAULT;
>
> 	Huh?  uaccess_kernel() is removed since it becomes always false now,
> so this looks odd.
>
> 	AFAICS, the comment above that check refers to futex_detect_cmpxchg()
> -> cmpxchg_futex_value_locked() -> futex_atomic_cmpxchg_inatomic() call =
chain.
> Which had been gone since commit 3297481d688a (futex: Remove futex_cmpxc=
hg
> detection).  The comment *and* the check should've been killed off back
> then.
> 	Let's make sure to get both now...

Right. Arnd, can you drop this if() and the comment above it?

Thanks,
Helge
