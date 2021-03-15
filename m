Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F29ED33AE15
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 09:59:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzVhm75kjz3017
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 19:59:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=thalesgroup.com header.i=@thalesgroup.com header.a=rsa-sha256 header.s=xrt20181201 header.b=ez0wUFY3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=thalesgroup.com (client-ip=192.54.144.131;
 helo=thsbbfxrt01p.thalesgroup.com;
 envelope-from=christoph.plattner@thalesgroup.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=thalesgroup.com header.i=@thalesgroup.com header.a=rsa-sha256
 header.s=xrt20181201 header.b=ez0wUFY3; 
 dkim-atps=neutral
X-Greylist: delayed 167 seconds by postgrey-1.36 at boromir;
 Mon, 15 Mar 2021 19:58:40 AEDT
Received: from thsbbfxrt01p.thalesgroup.com (thsbbfxrt01p.thalesgroup.com
 [192.54.144.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzVhJ1QxGz2yRC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 19:58:39 +1100 (AEDT)
Received: from thsbbfxrt01p.thalesgroup.com (localhost [127.0.0.1])
 by localhost (Postfix) with SMTP id 4DzVcx25Zhz466m;
 Mon, 15 Mar 2021 09:55:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thalesgroup.com;
 s=xrt20181201; t=1615798545;
 bh=CEcbGr+YCKnFXAfof14yzdOmyvXMYVWwN86bTpugi84=;
 h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
 Content-Transfer-Encoding:MIME-Version:From;
 b=ez0wUFY3ZEWMwre815DtHVyvhPu/7mUJhykxep7ES3by+KWUklOx+j59h1MZDLgQM
 Dl2LBArZO7SwK7Xynhdq6X2VRr2in+e6HFmhd9AMPo9oX0gdKUT65mYNuJa7W6i8XV
 Yjw2GuMdZbpJl7wYi7YuwJUmt1vA+vs/+AbNtL3eHgBjrb+f3MAlbiWjElSmqNn3kd
 apFWRIfUCBpMiszczcO5zBAVZVcu1eE2UthqXHB3JKts5MwS3Pw3tesRKbnRMPWWjj
 7CAod++6LrG5fWQKt5Zd3whbf7c5TCAGcOgGttHsyG6nDTEXzBbrZrRg+a6wx5cFh6
 36k5v+uvYuWaQ==
From: PLATTNER Christoph <christoph.plattner@thalesgroup.com>
To: Michael Ellerman <patch-notifications@ellerman.id.au>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: RE: [PATCH] powerpc/603: Fix protection of user pages mapped with
 PROT_NONE
Thread-Topic: [PATCH] powerpc/603: Fix protection of user pages mapped with
 PROT_NONE
Thread-Index: AQHW+GOl2yWYuEbTpkiT/C3KqD+6EaqDcGkAgAGQiOA=
Date: Mon, 15 Mar 2021 08:55:39 +0000
Message-ID: <921d9e7e-6680-4f83-8652-a88ebb64650f@THSDC1IRIMBX11P.iris.infra.thales>
References: <4a0c6e3bb8f0c162457bf54d9bc6fd8d7b55129f.1612160907.git.christophe.leroy@csgroup.eu>
 <161571587047.138988.3119931595106306211.b4-ty@ellerman.id.au>
In-Reply-To: <161571587047.138988.3119931595106306211.b4-ty@ellerman.id.au>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-pmwin-version: 4.0.3, Antivirus-Engine: 3.80.1, Antivirus-Data: 5.82
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: PLATTNER Christoph <christoph.plattner@thalesgroup.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Thank you for maintenance and for following this request.

Regards
Christoph

-----Original Message-----
From: Michael Ellerman <patch-notifications@ellerman.id.au>=20
Sent: Sonntag, 14. M=E4rz 2021 11:01
To: Michael Ellerman <mpe@ellerman.id.au>; Paul Mackerras <paulus@samba.org=
>; Benjamin Herrenschmidt <benh@kernel.crashing.org>; PLATTNER Christoph <c=
hristoph.plattner@thalesgroup.com>; Christophe Leroy <christophe.leroy@csgr=
oup.eu>
Cc: linux-kernel@vger.kernel.org; linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/603: Fix protection of user pages mapped with =
PROT_NONE

On Mon, 1 Feb 2021 06:29:50 +0000 (UTC), Christophe Leroy wrote:
> On book3s/32, page protection is defined by the PP bits in the PTE=20
> which provide the following protection depending on the access keys=20
> defined in the matching segment register:
> - PP 00 means RW with key 0 and N/A with key 1.
> - PP 01 means RW with key 0 and RO with key 1.
> - PP 10 means RW with both key 0 and key 1.
> - PP 11 means RO with both key 0 and key 1.
>=20
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/603: Fix protection of user pages mapped with PROT_NONE
      https://git.kernel.org/powerpc/c/c119565a15a628efdfa51352f9f6c5186e50=
6a1c

cheers
