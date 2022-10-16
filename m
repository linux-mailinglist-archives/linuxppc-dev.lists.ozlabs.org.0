Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8B1600274
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Oct 2022 19:33:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mr6fN2pS9z3cCx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 04:33:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=VkQ+hBN1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=VkQ+hBN1;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mr6dR56KYz2x9L
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 04:32:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1665941537;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=752ooR9vgXUCNtdp/3Rm/1FRVS3PuidaRu/HwQRYDBE=;
    b=VkQ+hBN1ZtfccZGlRb5cWKdeA258rgf8EAeBou6OR/oWMOB1dRcTQa9phMB/BKWnWP
    EdJad5A5BoQk6jiJAnq0Bec5eLVbKEBu+5BsRZlAiBq1lBqtqX7bhS6XWScYJBV8lzkL
    rjC8lh2BZr7fDlUP7q+q06FsWfKiX9HMjdkwnKw8poQl71tgABqgvzpF01D649CNp5xd
    8KexBf3pw6m1Blzh6a8Mab7W/2F5oKJbuEJTMGoKqFZmsi2cJjNmTtOcdUcx65/T+vKP
    V1k6P/wNpn2sRZkTCrgEYVPe0sEKiDl68VcsR69t/tw2E7P7Fq3z7M5IYxXoRbbtQYyW
    e/GA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr7gZzRF4Fu6EsCAhrq2bV"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 48.2.0 AUTH)
    with ESMTPSA id j7449ey9GHWGWVl
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 16 Oct 2022 19:32:16 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
Date: Sun, 16 Oct 2022 19:32:16 +0200
Message-Id: <C4072BA4-BF73-41B8-A109-8062C4F051DD@xenosoft.de>
References: <20221016164654.GH25951@gate.crashing.org>
In-Reply-To: <20221016164654.GH25951@gate.crashing.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
X-Mailer: iPhone Mail (19H12)
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
Cc: Darren Stevens <darren@stevens-zone.net>, Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, npiggin@gmail.com, rmclure@linux.ibm.com, mad skateman <madskateman@gmail.com>, Olof Johansson <olof@lixom.net>, Trevor Dickinson <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No, it=E2=80=99s not fine. We used the POWER4 CPU config before.

=E2=80=94 Christian

> On 16. Oct 2022, at 18:51, Segher Boessenkool <segher@kernel.crashing.org>=
 wrote:
>=20
> =EF=BB=BFOn Fri, Oct 14, 2022 at 06:11:21PM +0200, Christian Zigotzky wrot=
e:
>> make oldconfig has asked because of the CPU family. I choosed GENERIC for=
 my P.A. Semi PWRficient PA6T-1682M. Is this correct? Maybe this is the prob=
lem.
>>=20
>> config GENERIC_CPU
>> -    bool "Generic (POWER4 and above)"
>> +    bool "Generic (POWER5 and PowerPC 970 and above)"
>>    depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
>>    select PPC_64S_HASH_MMU
>>=20
>> There isn=E2=80=99t a POWER4 anymore and I used it via CONFIG_GENERIC_CPU=
=3Dy before.
>=20
> PA6T is ISA 2.04, just like POWER5+.  It should be fine.
>=20
>=20
> Segher

