Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 825CE24FF7C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 16:04:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZv533lCfzDq5b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 00:04:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=balbi@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=IRlJ+6fE; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZtyP4l5XzDq7d
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Aug 2020 23:58:53 +1000 (AEST)
Received: from saruman (unknown [194.34.132.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CAA27207CD;
 Mon, 24 Aug 2020 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598277531;
 bh=o9BlmvcB5Gr+9lF+n5O9P3SYHUi+Nkxe6s9/2q78T9o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=IRlJ+6fEFRNWh7fO5RWDUEsjPBW/gE2Zqf6TkWcxeELMFccPEsNlM1rdpKna3i407
 UB7P/OwwzrYz4OiB0ZGDJ1LBR4HxlTCFWy+WHVwXBy7gF4jbwvwn+636w2J6deEe42
 n1qmjG4SdQcnvo+3fqHsXtKhn72zR6YKevnbjcJc=
From: Felipe Balbi <balbi@kernel.org>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, "yebin10@huawei.com"
 <yebin10@huawei.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: gadget: fsl: Fix unsigned expression compared with
 zero in fsl_udc_probe
In-Reply-To: <f61f4bc3916f852799edb6af9740afb2118ec84f.camel@infinera.com>
References: <20200824080437.229826-1-yebin10@huawei.com>
 <20200824082122.GA336539@kroah.com>
 <f61f4bc3916f852799edb6af9740afb2118ec84f.camel@infinera.com>
Date: Mon, 24 Aug 2020 16:58:43 +0300
Message-ID: <87d03gjgbw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
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
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Joakim Tjernlund <Joakim.Tjernlund@infinera.com> writes:

> On Mon, 2020-08-24 at 10:21 +0200, Greg KH wrote:
>>=20
>> On Mon, Aug 24, 2020 at 04:04:37PM +0800, Ye Bin wrote:
>> > Signed-off-by: Ye Bin <yebin10@huawei.com>
>>=20
>> I can't take patches without any changelog text, sorry.
>
> Still taking patches for fsl_udc_core.c ?
> I figured this driver was obsolete and should be moved to one of the Chip=
idea drivers.

Nobody sent any patches to switch over the users of this driver to
chipidea. I would love to delete this driver :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9Dx5QRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQawPA/8CqHT6zk1S2J+/qkvq8DEZIXlhm8dbpcE
CqIW15+nNeGyk6JCrLhtG/q2ySPZgkZzfArbcEznTLWBXHf+XUHZiWKsL4FRj0It
mUX4ScgBErd66faiF448UBfTFiVCUUMGJVaU5L896C/haxmlIebZSlPID7MBOyYI
ouJLXSrwIbU+QDhQfFUhSLwqwKK/ayHD02nsRBaWG12WDImuXZ5w3FlKzKzCYDII
Rsic7GjlUj6hBmHrbyt2beOG9k8Z2EDMI96SddAz+wFzQu9nIlqZPNbNK2qFrI0S
N99f58xP1K+cC+tqn0YI3fEFz2HLb6S31PbcWd2slokfgB5DkJt05J2mRMGF04UF
dDs+5Ab/RRGO+ZZFnIDQcI9hdNSdXggZAhH7XVB/LnBgfJwRyiudAt8zaj0/RJO1
KTMJ7O2xjqalazXVAzqiOGPbPqNi6c4Oougsu1Pwoe5PzXOtr+p5i7Jx7yoPwMzg
yamHoVfdtIy2lwD8wcC3Qdx/hzYf0y4sqMgb4cop5YyMFRBFhwlMbEB2zj6rtzz/
NDa4ToWs+azhCchZz4Ow3FjPs/4Ssyy5oyJg7LT2ZzgxaOKU8XRDrHFR0NKnt12a
vcvUkS+MV6snaygCncLFujM1co6zQ5KlD6Olm4q3IlguQidDM7raX2/YO/3It/oN
9HR27WCDbjE=
=BdBv
-----END PGP SIGNATURE-----
--=-=-=--
