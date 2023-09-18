Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C907A48B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 13:49:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=c+1628BD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rq33s1jJSz3c2x
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 21:49:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=c+1628BD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xry111.site (client-ip=2001:470:683e::1; helo=xry111.site; envelope-from=xry111@xry111.site; receiver=lists.ozlabs.org)
X-Greylist: delayed 346 seconds by postgrey-1.37 at boromir; Mon, 18 Sep 2023 21:48:25 AEST
Received: from xry111.site (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rq32x5N4lz307y
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 21:48:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1695037353;
	bh=jqS8JLnAplA7wzw9w6SIovBfK8W1tPXmfz+C/kfKmkw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=c+1628BDhEVW5L4JFN+JqKOqBHPi+bHKBC2PgAJCpr3kEHhNS4v8TDZbfcDxBo7K1
	 PsHabXmh/J9zHKnzLWjnFQdHUkTkXHPxSFi/dpQULP9v/IylyJyLIg3P4OhB9Nc9Tw
	 Fl71I+qznqTNamdOQuWEayuTAYxJ+fp+u7b1dd/Y=
Received: from [127.0.0.1] (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 35F36659AC;
	Mon, 18 Sep 2023 07:42:32 -0400 (EDT)
Message-ID: <3c3f9a2ee7f9effe7cf9d1077652e85de0eae66c.camel@xry111.site>
Subject: Re: [PATCHv3 pci-next 1/2] PCI/AER: correctable error message as
 KERN_INFO
From: Xi Ruoyao <xry111@xry111.site>
To: Grant Grundler <grundler@chromium.org>
Date: Mon, 18 Sep 2023 19:42:30 +0800
In-Reply-To: <CANEJEGt-6+AGGSdZb9OTv3UrBn1fFFqk=A6TdYjBsq4SqTTxsA@mail.gmail.com>
References: <20230606035442.2886343-1-grundler@chromium.org>
	 <4fa1e0fe-eec4-4e5c-8acd-274a039c048a@ixit.cz>
	 <CANEJEGt-6+AGGSdZb9OTv3UrBn1fFFqk=A6TdYjBsq4SqTTxsA@mail.gmail.com>
Autocrypt: addr=xry111@xry111.site; prefer-encrypt=mutual;
 keydata=mDMEYnkdPhYJKwYBBAHaRw8BAQdAsY+HvJs3EVKpwIu2gN89cQT/pnrbQtlvd6Yfq7egugi0HlhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPoiTBBMWCgA7FiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQrKrSDhnnEOPHFgD8D9vUToTd1MF5bng9uPJq5y3DfpcxDp+LD3joA3U2TmwA/jZtN9xLH7CGDHeClKZK/ZYELotWfJsqRcthOIGjsdAPuDgEYnkdPhIKKwYBBAGXVQEFAQEHQG+HnNiPZseiBkzYBHwq/nN638o0NPwgYwH70wlKMZhRAwEIB4h4BBgWCgAgFiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwwACgkQrKrSDhnnEOPjXgD/euD64cxwqDIqckUaisT3VCst11RcnO5iRHm6meNIwj0BALLmWplyi7beKrOlqKfuZtCLbiAPywGfCNg8LOTt4iMD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0 
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
Cc: rajatja@chromium.org, rajat.khandelwal@linux.intel.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, mahesh@linux.ibm.com, oohall@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2023-08-14 at 08:40 -0700, Grant Grundler wrote:
> On Sat, Aug 12, 2023 at 5:45=E2=80=AFPM David Heidelberg <david@ixit.cz>
> wrote:
> >=20
> > Tested-by: David Heidelberg <david@ixit.cz>
>=20
> Thanks David!
>=20
> > For PATCH v4 please fix the typo reported by the bot :)
>=20
> Sorry - I'll do that today.

Hi Grant,

Is there an update of this series?

My workstation suffers from too much correctable AER reporting as well
(related to Intel's errata "RPL013: Incorrectly Formed PCIe Packets May
Generate Correctable Errors" and/or the motherboard design, I guess).

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
