Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA2E16085B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 03:54:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LT8P1JYqzDqKP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 13:53:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=free.fr
 (client-ip=212.27.42.3; helo=smtp3-g21.free.fr; envelope-from=dftxbs3e@free.fr;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=free.fr
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LT345FrkzDqft
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 13:49:18 +1100 (AEDT)
Received: from [IPv6:2a01:e0a:2a2:1590:3130:d4af:7a6d:562c] (unknown
 [IPv6:2a01:e0a:2a2:1590:3130:d4af:7a6d:562c])
 by smtp3-g21.free.fr (Postfix) with ESMTP id 7BD3013F85F;
 Mon, 17 Feb 2020 03:49:09 +0100 (CET)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org, Greg Kurz <groug@kaod.org>
References: <7544eb90-71a6-3709-c530-9c83beb943a7@free.fr>
 <06cc1954-9bf5-0178-668e-130411ea1b13@kaod.org>
From: dftxbs3e <dftxbs3e@free.fr>
Autocrypt: addr=dftxbs3e@free.fr; keydata=
 mDMEW0o6qRYJKwYBBAHaRw8BAQdAbzmHTymig5H3K1qe5lc6O1Xfij3iBbOBd6I3KJyEZSO0
 G2RmdHhiczNlIDxkZnR4YnMzZUBmcmVlLmZyPoiWBBMWCAA+FiEEKM08rOoS3GtxJLfLtx4S
 8Z+hqHsFAltKOqkCGwMFCQlmAYAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQtx4S8Z+h
 qHvjGAD+JgSjdZXX2K4hhsT9I2fbXbUfXm/QdIrZuYPsyv2PoP0A/RP5UIDWs5nhVq43AiF0
 TAm8nDyGol5naZ29BP85QAEKuDgEW0o6qRIKKwYBBAGXVQEFAQEHQB6eBz8MftqVte4x2lyG
 so13JoTSbSZ3iGlX6brVhkw+AwEIB4h+BBgWCAAmFiEEKM08rOoS3GtxJLfLtx4S8Z+hqHsF
 AltKOqkCGwwFCQlmAYAACgkQtx4S8Z+hqHuyPQD9FS4KPlZWunp51NWYGBAkqLM0pnhfGsNm
 gaW5YDQmWmgBALmWjkK7/SmreApokoV3TDKs4ACAKm1fEQuddUvKYogG
Subject: Re: QEMU/KVM snapshot restore bug
Message-ID: <49161ca3-941a-4f8b-f0ef-cce49ab0f9cd@free.fr>
Date: Mon, 17 Feb 2020 03:48:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <06cc1954-9bf5-0178-668e-130411ea1b13@kaod.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QTVk8I6gqh3r5ZoaRchFdxkDkB424mEom"
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QTVk8I6gqh3r5ZoaRchFdxkDkB424mEom
Content-Type: multipart/mixed; boundary="apjvUl1G9qEB38yotgm2WJuQgCST1jDnZ";
 protected-headers="v1"
From: dftxbs3e <dftxbs3e@free.fr>
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org, Greg Kurz <groug@kaod.org>
Message-ID: <49161ca3-941a-4f8b-f0ef-cce49ab0f9cd@free.fr>
Subject: Re: QEMU/KVM snapshot restore bug
References: <7544eb90-71a6-3709-c530-9c83beb943a7@free.fr>
 <06cc1954-9bf5-0178-668e-130411ea1b13@kaod.org>
In-Reply-To: <06cc1954-9bf5-0178-668e-130411ea1b13@kaod.org>

--apjvUl1G9qEB38yotgm2WJuQgCST1jDnZ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 2/16/20 7:16 PM, C=C3=A9dric Le Goater wrote:
>
> I think this is fixed by commit f55750e4e4fb ("spapr/xive: Mask the EAS=
 when=20
> allocating an IRQ") which is not in QEMU 4.1.1. The same problem should=
 also=20
> occur with LE guests.=20
>
> Could you possibly regenerate the QEMU rpm with this patch ?=20
>
> Thanks,
>
> C.

Hello!

I applied the patch and reinstalled the RPM then tried to restore the
snapshot I created previously and it threw the same error.

Do I need to re-create the snapshot and/or restart the machine? I have
important workloads running so that'll be possible only in a few days if
needed.

Thanks



--apjvUl1G9qEB38yotgm2WJuQgCST1jDnZ--

--QTVk8I6gqh3r5ZoaRchFdxkDkB424mEom
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQQozTys6hLca3Ekt8u3HhLxn6GoewUCXkn/JQAKCRC3HhLxn6Go
e8zWAP437YQ4BoFV4R96iIb2VlG/IZGxhJrSUqM9aOkDzwB3xQD/WzHme2r6uQTQ
QzHQpUTvGluhlTL0PqeCF/e1Jha9awE=
=GC/4
-----END PGP SIGNATURE-----

--QTVk8I6gqh3r5ZoaRchFdxkDkB424mEom--
