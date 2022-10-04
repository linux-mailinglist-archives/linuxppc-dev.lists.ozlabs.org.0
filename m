Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D495F3B02
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 03:28:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhKpn2Kzpz3dq3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 12:28:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HPNFOfyi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhKnr6kgzz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 12:27:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HPNFOfyi;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MhKnj3qpkz4xDn;
	Tue,  4 Oct 2022 12:27:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664846861;
	bh=dILIPkBSNiaMmuEgx2aZ/VK27RtnOYvEUacjVkijs74=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HPNFOfyi/pQutZwIwhl9fl4tsacR4hDZWC2YrVMONUfvmLO5pv/mIQSiaiDj293Vj
	 qDjrx+kFb5O4BRjKAFQiSUMoyki5soVCJW3RFUXOZWq8QZOFcauFpzaROuZUUCaZVT
	 RVxUOUcQuAyLEkSxNn60QjHxtWQuloChpMU+NUW0NgdV/QTXGvCtCfGNZAmBISvy5Y
	 M5Z9rpFqf6Pw9qDYvHYO2RFzBrFebkxJ7ZDEND8o9rLMks35MtA5ofZhL5KzRCnts5
	 mNZkDft0YVolHC1fX63JO3m1TWrQBor9b7Or9tYTRngCbk7AgDMptELDvaOoQi1/+e
	 jcCmCeuZdkc4Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sven Peter <sven@svenpeter.dev>, Arminder Singh
 <arminders208@outlook.com>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2] i2c-pasemi: PASemi I2C controller IRQ enablement
In-Reply-To: <5e89999e-5c9d-428c-a6c6-b454fb47aaa3@app.fastmail.com>
References: <Yzl16W6+poH8/8h4@shikoro>
 <MN2PR01MB5358FB185A18D2E6C22A45FE9F589@MN2PR01MB5358.prod.exchangelabs.com>
 <5e89999e-5c9d-428c-a6c6-b454fb47aaa3@app.fastmail.com>
Date: Tue, 04 Oct 2022 12:27:36 +1100
Message-ID: <87edvoped3.fsf@mpe.ellerman.id.au>
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Darren Stevens <darren@stevens-zone.net>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, asahi@lists.linux.dev, Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Sven Peter" <sven@svenpeter.dev> writes:
> On Sun, Oct 2, 2022, at 16:07, Arminder Singh wrote:
>> Hi,
>>
>>>  #define REG_MTXFIFO	0x00
>>>  #define REG_MRXFIFO	0x04
>>>  #define REG_SMSTA	0x14
>>> +#define REG_IMASK   0x18
>>
>>> This doesn't seem to be aligned correctly, this file seems to use a tab
>>> to separate the register name and the offset and you used spaces here.
>>
>>> @@ -15,7 +16,11 @@ struct pasemi_smbus {
>>>  	struct i2c_adapter	 adapter;
>>>  	void __iomem		*ioaddr;
>>>  	unsigned int		 clk_div;
>>> -	int			 hw_rev;
>>> +	int			         hw_rev;
>>> +	int                  use_irq;
>>> +	struct completion    irq_completion;
>>
>>> This doesn't seem to be aligned correctly and the hw_rev line
>>> doesn't have to be changed.
>>
>> I'm sorry for the alignment issues in the patch, I genuinely didn't notice
>> them as from the perspective of my primary editor (Visual Studio Code)
>> the entries were aligned. I just saw them when opening the files in
>> nano.
>
> No worries, it's just a small nit and quickly fixed after all! :)
>
>>
>> Does fixing the alignment issues and the commit description justify a v3
>> of the patch or should the minor fixes go out as a "resend"? Just not sure
>> in this particular case as the fixes seem to be very minor ones.
>
> I'd send a v3. I've only used resend when e.g. my previous mail provider
> messed up and silently converted all my outgoing mails to HTML.

If you've modified the patches then it's not a "resend":

  https://www.kernel.org/doc/html/latest/process/submitting-patches.html#don-t-get-discouraged-or-impatient

So yeah send a v3 in this case.

cheers
