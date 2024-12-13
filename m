Return-Path: <linuxppc-dev+bounces-4108-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF389F09BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 11:39:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8m6p6430z30jZ;
	Fri, 13 Dec 2024 21:39:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734086370;
	cv=none; b=WW+S72iOzcP+1v3C2vQNc7W/yVq60/kTw1UfghK2afa92FwnqcyDLEWrDrUsmNVoU2+7BiBoQNZj8LiNzB3Pomi2dVVYbWxIvxlRqcWh+c/xG0iygpplQpF1EUHHEm1UqyhIHdSmLRdq2eXFMPst+ScmjGbSfrXNR+a3S+bWtegG0mbFfoqItHWCrVTCDa90oHyin6BtRRLKUBlk5uItwcDcPcPfDDv2OzOtctSkqgRgewDNhoRE4ty00SA4BvvGjxFXoRRZbYN8kKP2G/m6pEmz6GzgiZAGYEL5aHo1ZaqEt+2r4T0xeS2dtHTwPxZR48IaZy/1aiaqI0Eqw9YezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734086370; c=relaxed/relaxed;
	bh=Wpmvv7rOIASgAsPA9YY0CjRAOWqGE5dKTI6oeaAjQsA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HF0PqisKjuGFhRLYr+YKe3qJ1P3/RdZhefZPh0yMS2qodNMTT3at9k+Enr/juluy3dWBJgROW+gXTc3S39l0a4YflyIwUk2ykpr46ganE9erCXuL7r/SD6VIXHkQcN0mzwfRRXI2/rQP/CvJ18JOFQO1imbmDkoFTP1xZ7jc7mXaNoSFKrSMn9h6xAUNIfV6OciTNWIPM5WmPiEEn+zSepCC5FGifuQoqaEjZxDQnCQx4ZLdywDknDj1CduLIqhENfCpJEWLXBB3KGQ4EGgi0oOQ4vwin27Mxx6t4Ed5mDPqty6mzk3V5DapbNZgxeB63sBTUbU/5x2COpg7ztffDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=svmWQJ3j; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YuknyNOf; dkim-atps=neutral; spf=pass (client-ip=202.12.124.149; helo=fout-b6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=svmWQJ3j;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YuknyNOf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.149; helo=fout-b6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8m6k4DwKz30Wd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 21:39:25 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 22A071140122;
	Fri, 13 Dec 2024 05:39:23 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Dec 2024 05:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734086362;
	 x=1734172762; bh=Wpmvv7rOIASgAsPA9YY0CjRAOWqGE5dKTI6oeaAjQsA=; b=
	svmWQJ3jUDwyTjtvXgDTfNmPiFm/sT6IfG+8CWL+e1E0AInZhl8p5UKax+wMo35f
	myLPtmB+5yYfSbfyj/qCO006nYOR+kuinLYz6+aoskK3zRfSb85JV0l3V96uAnET
	pUL5M8Qr0xxtZp9+220BHt5P+bvvJjUXpvVzk0kyMdohGdFBKcYoj1yFTAghWPC1
	ESCWm4oC8k7SSnHv/cpM350JLvJEcywzFGM4V3iJTjoFf46WHGRY9e29q7MHCYXX
	f2+l7EHyVfT5KDk9XUHcLA9TdOR+02PGMrSoAqoLlANb3hfm6iQIuIvl1tWOebbn
	OAVZtM7/kB57Am1sK824eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734086362; x=
	1734172762; bh=Wpmvv7rOIASgAsPA9YY0CjRAOWqGE5dKTI6oeaAjQsA=; b=Y
	uknyNOfW5x3i4eadPgo0/13SZlOVNBORH13Qea0h68nPo6kac9sVqMg0ipDBnEK+
	MFQITm+eCAlqVHbKJPcqrHEmpfLdUo7pQdjyvwFcpooo7Rvdg+oyJtD9fMZcCin4
	8q1nD8oBrdb4/gMQ/VXQONjCpAv9VJ9bbuyA74xt/rLuyEFP5MzOTsJukoPFb6+u
	wn9PcMaCe5SPCviK6l721qmzQvUGBRMTzD5EWRHZtKNpC87Cgdc2426/OXc2dC77
	3k+RgWkuaG6uj1CG5T4sWtSseDZQxYpf3m575iLl7aUHqNlvl3YyKkUHXTu5dFIK
	NjexF9Xq3oNico1L01Eig==
X-ME-Sender: <xms:2Q5cZ4IbLlfncl3aMEXOK6HmHI6nOUC12FcfLP7-OJjTC4cLykmlVg>
    <xme:2Q5cZ4KeJuscIBl3EXG99ecoSIJTTJYgTogDH5OBBqKxEEtFsgFJyxH5T-Jr7NyC4
    vJxk7jfSfY_Bnb9JO0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeejgddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeej
    vdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefgedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtg
    hpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphht
    thhopehgrhgrfhesrghmrgiiohhnrdgtohhmpdhrtghpthhtoheprghtihhshhhpsegrth
    hishhhphgrthhrrgdrohhrghdprhgtphhtthhopegrnhhuphessghrrghinhhfrghulhht
    rdhorhhgpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouh
    hprdgvuhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphht
    thhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepmhhpvg
    esvghllhgvrhhmrghnrdhiugdrrghu
X-ME-Proxy: <xmx:2Q5cZ4uhEqVwIWmlKABp7YxiWheuNKHklS06rgYgOG5WSbWzSRIdpQ>
    <xmx:2Q5cZ1YWGcG-BZPfYCyspFMyqrkAxbBQc5OhRUdLbZAkQnYR1BMsCw>
    <xmx:2Q5cZ_aKSykWyn1pThE9bHU1SqW6iK2dJnoNTxOIw5XrXs1C4jtuDQ>
    <xmx:2Q5cZxDLsWPmWnp45hCYSbYnVQtJ8mnJdnHhHdy6giGcNrT_ZE5f6Q>
    <xmx:2g5cZ3p36DdJF2lZIuxBVJ6f0_C5j-FvB7wonKJ7qVVUxqJ-OQlXJnSV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A9A6A2220072; Fri, 13 Dec 2024 05:39:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
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
Date: Fri, 13 Dec 2024 11:39:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Arnd Bergmann" <arnd@kernel.org>, kvm@vger.kernel.org
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Alexander Graf" <graf@amazon.com>, "Crystal Wood" <crwood@redhat.com>,
 "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Sean Christopherson" <seanjc@google.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>,
 "David Woodhouse" <dwmw2@infradead.org>, "Paul Durrant" <paul@xen.org>,
 "Marc Zyngier" <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Message-Id: <e5b03a9f-332f-4a13-84c6-6b739cd5aa25@app.fastmail.com>
In-Reply-To: <3a2fadc3-f594-492f-805a-148043436995@csgroup.eu>
References: <20241212125516.467123-1-arnd@kernel.org>
 <20241212125516.467123-4-arnd@kernel.org>
 <2809dcce-3405-430e-b43d-d75f35bdb7d5@csgroup.eu>
 <3380464f-5db4-487d-936f-1b5503905793@app.fastmail.com>
 <3a2fadc3-f594-492f-805a-148043436995@csgroup.eu>
Subject: Re: [RFC 3/5] powerpc: kvm: drop 32-bit book3s
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Dec 13, 2024, at 11:27, Christophe Leroy wrote:
> Le 13/12/2024 =C3=A0 11:04, Arnd Bergmann a =C3=A9crit=C2=A0:
>> diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head=
_32.h
>> index 9cba7dbf58dd..24e89dadc74d 100644
>> --- a/arch/powerpc/kernel/head_32.h
>> +++ b/arch/powerpc/kernel/head_32.h
>> @@ -172,7 +172,6 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
>>   #define	START_EXCEPTION(n, label)		\
>>   	__HEAD;					\
>>   	. =3D n;					\
>> -	DO_KVM n;				\
>>   label:
>>  =20
>>   #else
>
> Then the complete macro should go away because both versions are now=20
> identical:
>
> -#ifdef CONFIG_PPC_BOOK3S
> -#define	START_EXCEPTION(n, label)		\
> -	__HEAD;					\
> -	. =3D n;					\
> -label:
> -
> -#else
>   #define	START_EXCEPTION(n, label)		\
>   	__HEAD;					\
>   	. =3D n;					\
>   label:
>

Thanks, I've folded that change into my patch now.

      Arnd

