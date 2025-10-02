Return-Path: <linuxppc-dev+bounces-12631-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F04BB2A2F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 02 Oct 2025 08:40:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cchy143Q2z30Pg;
	Thu,  2 Oct 2025 16:40:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.24 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759387241;
	cv=pass; b=cLmY2IrAY7dci9z5t/8qB9wn8cnRMFkTCZ3k8oygWc8428AszbY32T5UlwgJevfuH6dIUnyVcoV5dxOezso/mdkVRjI3tcvkga2ZfaJPes8CFUDSN1WNW+aApoay5uQRfoE2TKTvx5e2VzVB6Tq94b7E7JzuYCSKjsjbkgUJqcjSAxaIc218K+B4Zcjqd8szihruIVBcAirp/nOp0uNYsJDoMjLILeAANGqf6d/BdCbdTy6pnXcsg/7YC5o4qzfCD9n2DaDwZjrYbXnPbKvcZnt0hafTaVdIfdiKmnQcJLZ9L3zSsm8vhvS4eEVsAXc8VuysBmciW66wnc/9U4lBAg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759387241; c=relaxed/relaxed;
	bh=eAw6AzpT5Dfyjz23xQyF8aSCvloexJ85vyRwx6CtPL4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=FSqOlEzfIVJpLYf9F+Q8SEyZYRW7JthgZuXNWusT+iNfEkNpNxKcCQTjO0oQHtgkEU0b7cQ3a27smpKwygJcb+V3QhOWprtzCAsxO5WSayI1Foe+7I9Q8haa+K6B6whi05WAqMiCZHygtBYK5+96rHA8Fgsxb+a5VardeiHH6t97kxSfDJZmmGaYEvbRxIOZ8J+DSty8TKP5H2OWzBPejr/zL00g1qcpP3rkp1WUKy18ENAY5DcOWt5tZvjoiqQZVElrErP3MlIT0YqpSBOoQGWeOovKfwMrqaRqkq03cEPyCOykvEyex3VwbQ6BJHK98CeJVXzxlHu4QMBuPHTtfg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Lph8GhWK; dkim-atps=neutral; spf=pass (client-ip=85.215.255.24; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Lph8GhWK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.24; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 168 seconds by postgrey-1.37 at boromir; Thu, 02 Oct 2025 16:40:38 AEST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cchxy1VMLz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Oct 2025 16:40:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1759387043; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VDLN02juceYMv7Cmgv7Htd2wG0IwU9Raeq1HOLTsvnwSjPGZMtBniZqSYMMV7irZke
    MxqPdv2QFfBBso9bVoiK4qMqYWPBndsNqzs5oUtMVnqQSikkjoKedasHKhIZP4k55Sh6
    AwKo/+q4FY5mxITOX1U0htP/j3roB0XW9OxVO8kjE06cRyqCBJCylwhrEBurUfhkyw7Z
    Q3thTAQieRmj5VshNRKHHLAWXZgyxT7d95xkjd4gtt5CWah6rG7IvNJ0Es3mudP1XmMM
    0lBN7x9TqLnguOS+OT78bLQudjLKOl+vrQvdfw69VE1KFPtuFE/nsw7Llk9t04KXG8rC
    tiDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1759387043;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=eAw6AzpT5Dfyjz23xQyF8aSCvloexJ85vyRwx6CtPL4=;
    b=ay+/uQRZ3Qrs/BzBHFqPgOlCobv3/ozAmIcTcRa+4f2LEDWdv+5akzbnD/agpcReRZ
    5neSNpMd1v+iuekJg3qSBtCGXhv+jGeMRF7Vm7YXd89ot8SCAhrfI+8JyGAFroOJ70Pl
    KJ5jR+bhIan73kEVOM8+S6XFtnKZRfG/PQ3Fs9K1bnYAW+v++zvGB+Zge18IrnlNnaSo
    qWHmDVhU93aYD5m0IbREUS7q0XXl0+sS4J/WkEuq/KwKUjG8VDEa/0x1w+XwF3Yu/MIS
    LGCx0jmHSE6SfrBwxcOb9B81gjvjvWwaJUlFCCnOjAZ7GNe0d7yQYjGdYN4+zlAI+qRu
    fyLA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1759387043;
    s=strato-dkim-0002; d=xenosoft.de;
    h=Cc:Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=eAw6AzpT5Dfyjz23xQyF8aSCvloexJ85vyRwx6CtPL4=;
    b=Lph8GhWKkS8Z7QUtXqv8anE3IAoSGKkgvECsKoW4GY+CctcyBKF6K/Ooy/nRyX+oab
    Cwzlsnpmv3uBIOadq80OjLXPrLJbvZMsAjMKohAEoXQnvU56y/NgkQxDWrG0QdKthLDq
    hAg0yGl1svQez1lLW4x5SGNM6q1XRupJ8MkiZEgkAIvetHgH0NVD6cJSxe269lmjfS7l
    iDjhexfTWH9mIcwDtQff5v7JIjLfRoP/+bvaw4vEQVUogMoo22A+Y5IrVcoKhKnhAq6W
    scL/q4SuxTRqV6p7kTxODl+QwYwi6ixHiLHHWK+eDmYdxY4NuyiXeTEISk5Uv9sAzSIO
    ecVQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIC+m6B7g"
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 53.3.2 DYNA|AUTH)
    with ESMTPSA id e9e0a61926bMgCP
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 2 Oct 2025 08:37:22 +0200 (CEST)
Message-ID: <cfd779d6-9440-46b2-9ed5-752f1ae6b5d1@xenosoft.de>
Date: Thu, 2 Oct 2025 08:37:22 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kvm@vger.kernel.org,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: KVM-PR no longer works when compiled with new GCC compilers
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 mad skateman <madskateman@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

KVM-PR (-enable-kvm) doesn't work anymore on our PA Semi Nemo boards [1] 
if we compiled it with new GCC compilers.
The VM can't boot. There aren't any messages on the serial console of QEMU.

It boots without KVM-PR.

Kernel config with new GCC compiler [2]:

- CONFIG_CC_VERSION_TEXT="powerpc64-suse-linux-gcc (SUSE Linux) 11.5.0"
- CONFIG_TARGET_CPU="power4"
- CONFIG_TUNE_CPU="-mtune=power10"

It works if I compile it with an old GCC compiler [3]:

- CONFIG_CC_VERSION_TEXT="powerpc-linux-gnu-gcc (Ubuntu 
9.4.0-1ubuntu1~20.04.1) 9.4.0"
- CONFIG_TARGET_CPU="power4"
- CONFIG_TUNE_CPU="-mtune=power9"

Mtune changes to power9 automatically if I compiled it with an old GCC 
compiler. If I compile it with a new GCC compiler again it changes 
automatically to mtune=power10.

Is mtune the reason of the KVM-PR issue? I think the issue is the new 
GCC. [4]

Could you please check whether KVM-PR is compatible with new versions of 
GCC compilers?

Thanks in advance,

Christian



[1] https://en.wikipedia.org/wiki/AmigaOne_X1000

[2] 
https://github.com/chzigotzky/kernels/blob/45186997e6f347fd092f9ab629d62d6041426227/configs/x1000_defconfig

[3] 
https://github.com/chzigotzky/kernels/blob/bc7a3e27b3fcdee52a8135435f02cf807a43872a/configs/x1000_defconfig

[4] KVM-PR no longer works on an X1000 if the kernel has been compiled 
with a new GCC: 
https://forum.hyperion-entertainment.com/viewtopic.php?p=57146#p57146

