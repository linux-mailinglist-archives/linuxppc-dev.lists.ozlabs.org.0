Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 020B57FEA3A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 09:09:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=V7yqPMrR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=T4DazNjb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgpkQ3HtCz3cVF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 19:09:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=V7yqPMrR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=T4DazNjb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgpjS2qT7z3cC3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 19:08:27 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 3DF3B3200A6E;
	Thu, 30 Nov 2023 03:08:21 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 30 Nov 2023 03:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1701331700; x=1701418100; bh=cXqOxfayD3DDbeHiducc4o9ejw78L8ckT+W
	hYBSEvbY=; b=V7yqPMrR7/WzWt36nUyoeyzYur/Jfhx4ZYoG76fP1+EFixIg6a7
	He4phwpOo48SQczO30sFUuLMMthDelIxd0srrf1GIEc8fy2t6hSuPkEMgOSMIOX1
	StyJWWxvAjskrbgXwKp5fZXh1lq6pAqnZkiy4ANhzJNS6mArKxIw4UbS8SQJpuzZ
	wdbTFmspEtYrqsHi8tPxyDDfLiS1OYIqqItHlwFkiOJ9UFKqL8IOYSgUaqN3HGP8
	8ErZtSB6g/iOq9/aXIlHnUaHQeKVBDHmjFCDU/aM/md4/N99EmEjJohWZ9GRWZU+
	cUNjXpurdPEp03rM0SCZKON4whAG5fPDeUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1701331700; x=
	1701418100; bh=cXqOxfayD3DDbeHiducc4o9ejw78L8ckT+WhYBSEvbY=; b=T
	4DazNjbNrhB7ucmf5E0lx94GtSXcI+tBMA3awrS6MwpXII79MV16HRUTdCt0Q91C
	Y9327QhMkfsuC8Gv1TIjZ7rwg/hhbNZs63YFBM1mkohUNFkYGpwyNqZ01OW7aFfJ
	BY9JGsSFehq4KO46GZwkEbgA/WI/D8uaOv3Zhx3h+6VypunHNCU77hTWYtfJR8Me
	0Xa1t4n3darholF7QqXdrtbSDzVNGi53BuHsC2o5+O60PZxX7SC+yNNK7n/X3Qcr
	Mr393KEQrdvmU30aS28fexL0xc5nZw2L+QnfFRNYcy7Ff5qSiEQ4+DTQcgEyLC7D
	fwQPEviGw8vzswqcETR2g==
X-ME-Sender: <xms:9EJoZfEYOw22ys9E6eo_dooGvEpNNBjVr0wbY2yNHdT8PI_47qfjEg>
    <xme:9EJoZcVAtP7XjIaezzRsqnEixsu29D36HCa0ofY94DivqXR-cp0xycIR5yS9VXoiQ
    Dx7ZFHKqkzsKVLzfg4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiiedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgse
    htqhertderreejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgu
    segrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnhepjeeghfeutdejjeehudevgeehve
    duffejkefhveefgfettdehgeeiledufeeuvdfhnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:9EJoZRLq7OdDoraQgwzWqmRIbPmcbHbEW9jBNXH-0QNx_3LoMuac1w>
    <xmx:9EJoZdFBp0Pf2eZsXZcfXMJDLcEllzTE-M-Lsbn_u1RK5AlMKz--rw>
    <xmx:9EJoZVWQSDpAnBo5spzo_mmotdjCkcicIMVPtYW1nyQF3ZGh6YizvA>
    <xmx:9EJoZUDns_C5U4yypW31hXTT-IX66n-4EISjbpsWQi9vopuhy3MY1Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 649DBB60089; Thu, 30 Nov 2023 03:08:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1238-g6cccb1fa34-fm-20231128.002-g6cccb1fa
MIME-Version: 1.0
Message-Id: <462cf182-2d46-4a6d-86bc-f8b54e787a49@app.fastmail.com>
In-Reply-To: <87v89j212y.fsf@mail.lhotse>
References: <20231129131919.2528517-1-mpe@ellerman.id.au>
 <20231129131919.2528517-5-mpe@ellerman.id.au>
 <f85d34dc-e310-4766-9161-deae7acb340e@app.fastmail.com>
 <87v89j212y.fsf@mail.lhotse>
Date: Thu, 30 Nov 2023 09:07:59 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/5] powerpc/64s: Fix CONFIG_NUMA=n build
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 30, 2023, at 07:43, Michael Ellerman wrote:
> "Arnd Bergmann" <arnd@arndb.de> writes:
>> On Wed, Nov 29, 2023, at 14:19, Michael Ellerman wrote:
>>> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
>>> index 7f9ff0640124..72341b9fb552 100644
>>> --- a/arch/powerpc/mm/mmu_decl.h
>>> +++ b/arch/powerpc/mm/mmu_decl.h
>>> +
>>> +#ifdef CONFIG_MEMORY_HOTPLUG
>>> +int create_section_mapping(unsigned long start, unsigned long end,
>>> +			   int nid, pgprot_t prot);
>>> +#endif
>>
>> This one should probably go next to the remove_section_mapping()
>> declaration in arch/powerpc/include/asm/sparsemem.h for consistency.
>=20
> That doesn't work due to:
>
> In file included from ../include/linux/numa.h:26,
>                  from ../include/linux/async.h:13,
>                  from ../init/initramfs.c:3:
> ../arch/powerpc/include/asm/sparsemem.h:19:44: error: unknown type nam=
e=20
> =E2=80=98pgprot_t=E2=80=99
>    19 |                                   int nid, pgprot_t prot);
>       |                                            ^~~~~~~~
>
> Which might be fixable, but I'd rather just move
> remove_section_mapping() into mmu_decl.h as well.

Ok, makes sense.

     Arnd
