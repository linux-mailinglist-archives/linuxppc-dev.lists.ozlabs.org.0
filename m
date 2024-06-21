Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3D2912B7D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 18:37:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=NLF35Nkx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5NLq5BHdz3cjt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 02:37:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=NLF35Nkx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 377 seconds by postgrey-1.37 at boromir; Sat, 22 Jun 2024 02:37:03 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5NL711lYz3cXk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 02:37:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1718987811; x=1719592611; i=deller@gmx.de;
	bh=TaVSF8Wo6axT8++84WQ+MyVXhldB4MqulOKt1aiG610=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NLF35Nkx4gHH1ZGpmyQ1VNeMh4C/hY7iVIfFP2aUXqfyqBj48iHf9PPJLMWKcbCe
	 7Wo8h1OKOJcouDU2Do0MvQlNtKepE2cuCSu1jSIashmtdSbzjHwupSwJAYpjtAgMV
	 PzQME/o8An2YmYXCpLJJvQ44Fj9kd4j28+1T1s0HYZuHjwdAWHzLV3777KgLP8nL2
	 80FvDwSFJEU9JMJiUDgWqKkE/bHEV7C4HIzAQ8Q2/J27ZIHZ62VH53CCzyzix0oww
	 MI/Oi2Wfls0SLnrvAFh7Kb2l1lnHKr7060vgEMoU7YtTbHpgM10MZIaZI4qJHNvev
	 44bcpKytxu9wJWD9Zw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.133]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfHEJ-1srq1Z2d4N-00ddIK; Fri, 21
 Jun 2024 18:29:06 +0200
Message-ID: <cd7fdd76-8da0-4d43-9d1c-c93aed4c0f5d@gmx.de>
Date: Fri, 21 Jun 2024 18:28:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] parisc: use generic sys_fanotify_mark
 implementation
To: Arnd Bergmann <arnd@arndb.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Arnd Bergmann <arnd@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-kernel@vger.kernel.org
References: <20240620162316.3674955-1-arnd@kernel.org>
 <20240620162316.3674955-8-arnd@kernel.org>
 <e80809ba-ee81-47a5-9b08-54b11f118a78@gmx.de>
 <1537113c4396cd043a08a72bdca80cccfa2d54d9.camel@physik.fu-berlin.de>
 <ba14c4fb-e6a7-46b3-a030-081482264a99@app.fastmail.com>
 <a623c1979ac494d01977abe6dfc22e8381dc6e4f.camel@physik.fu-berlin.de>
 <83613d85-53f9-4644-be68-4f438abe2e52@app.fastmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <83613d85-53f9-4644-be68-4f438abe2e52@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qzcGugqMcbMY+YWYJmVsNMJLSzXL1IFC+qPqRPEqwIjeHu1j8dW
 eKrd9zTKO8WqTBd1atZ9gk73fhgOsLFzmyt55jQz2EE0lv7OLTEi8eH1tERMhO+XealwSx1
 UGgBBAPSpMfKRXJChZsTA9t/N/bEd9WMNnHEwTU1TsTs3cyh1vRWNfUsERYHddYMxe16B2C
 4cE95QxNZt3dO/ZdT1fcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xm15frDlopQ=;auC+tksU5177LyG9dSkFO8l+ohE
 OX5SUCreM/JMydccO3JU9pzcPim0ydHutqGRaaq/rBSju3j0IJYl2ocTpxnrBdzJFK9VpdFYq
 C/QHUNsuLr3M8vvTjMrgL+rhIxs+cqp3yDfpdFG095BDvj8fNn0V+PBoF7wDsE8pQtHR/xyGH
 7/qL+Y1pUnnH91FddgbNgz+NCznHajdxINcJZVUt/QuroemUnoVmGLCVop2ndA2moAwR73oV8
 Al2aTw5alHycrWTWgdpzDdRhyf5GCNz/BjQ5ScZajPosPJVjLO++DctEvfx2kKVBb3E1Tb6Qp
 LDbHZJ6HS17m0sOTFDUg+Gm+fL34oXGge7ri3ELoBSKVRJUCWf5DPlFBStoorPl8ZjNF0xyij
 Fs9EoY4yUC85Ea4TY8ahxxniMMUcxlm2rXAx4ufJp/67ErqbLv/HGqvs86gwPW20YDAIRogzH
 y/AIyCdHeEm2n3LEFbQnaESCZ6qpFfKLTzy4JpTy50x++lCye6qHFDUH4J6lpZ6u0nekxzHnO
 KG26eNX9lyDZXTBhEZIzO9LXKYMsmoicIw/RKkV6YOo6WOSVb8TCWqQjfQSZQuRddOaTZsbHM
 FLmTRfyaShFjTxVSxZw7OsSeDodnaj/GzNZATFIqpWGvwZEHjwAwJRfsVllfKCqNrHG3Ui39Z
 SpVzq4KXE61OSmR4OyMYlr0Tt/S9pxvDRkadD6lrLI9yrGMRCMbgt/LRGyvC4VRJj+9o6qAgN
 bWhzUxOi5KB7gDl3vux+BmKK1QQ/7+BTOKmdQQnCpayptvymeuUW9+XgFMtsKYSNsRlxx7ouK
 2nMqL5yPQZ+1I8OWQlYIi7N5QbOjfBGfs4FZmC28e7YVs=
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, guoren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, "musl@lists.openwall.com" <musl@lists.openwall.com>, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, LTP List <ltp@lists.linux.it>, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Xi Ruoyao <libc-alpha@sourceware.org>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/21/24 11:52, Arnd Bergmann wrote:
> On Fri, Jun 21, 2024, at 11:03, John Paul Adrian Glaubitz wrote:
>> On Fri, 2024-06-21 at 10:56 +0200, Arnd Bergmann wrote:
>>> Feel free to pick up the sh patch directly, I'll just merge whatever
>>> is left in the end. I mainly want to ensure we can get all the bugfixe=
s
>>> done for v6.10 so I can build my longer cleanup series on top of it
>>> for 6.11.
>>
>> This series is still for 6.10?
>
> Yes, these are all the bugfixes that I think we want to backport
> to stable kernels, so it makes sense to merge them as quickly as
> possible. The actual stuff I'm working on will come as soon as
> I have it in a state for public review and won't need to be
> backported.

Ah, OK.... in that case would you please keep the two parisc
patches in your git tree? I didn't plan to send a new pull
request during v6.10, so it's easier for me if you keep them
and send them together with your other remaining patches.
(I'll drop them now from the parisc tree)

I tested both patches, so you may add:
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>

Thank you!
Helge
