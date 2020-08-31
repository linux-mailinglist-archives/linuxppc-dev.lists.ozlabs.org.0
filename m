Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5CF2576EA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 11:53:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bg5BR2vQFzDqCs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 19:53:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=ro@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bg44x3hktzDqHg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 19:04:01 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9B45AC6F;
 Mon, 31 Aug 2020 09:04:32 +0000 (UTC)
Subject: Re: KVM on POWER8 host lock up since 10d91611f426 ("powerpc/64s:
 Reimplement book3s idle code in C")
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20200830201145.GA29521@kitsune.suse.cz>
 <1598835313.5688ngko4f.astroid@bobo.none>
From: Ruediger Oertel <ro@suse.de>
Autocrypt: addr=ro@suse.de; prefer-encrypt=mutual; keydata=
 xsDiBDt+kCkRBADQ0wJSOQmW5oI8mdaLGd8eVOO27KfSVmVmswqqg6387sSWcuHdHgT9197a
 HUAL+rJ0mq+raR+zhbmC8WTxwQbBOufDcedGdPj+ueviSoW8ouDx5OJSg7QnMeiTsewU1JoG
 Wwfmavvh1vUCQvqXeLR7f3MHuRcdQkBdF+JxFC5cRwCg3k/JthNqkWXj59VokaHUDaRuq/0D
 /2/5UxV9cPVGgPczVsjOaHzp7Fw0aQtprqqylAcDbHuS2TPd2Uz+2jAqo9A2+u6q25ZVhWME
 9P2F7DeI7s+FPdSwI74JWWpq3vKQ7k0zV9sD/HGK3YWpAcMnSErqdw6SVn/1selb3pK3Qzkp
 6WeQlNbxAYGDKVjSVlzlDvdUosvRA/0YzmJZofVgtB2VDx1vaECXV//NWHOrOYmPWLVZ8INu
 0wIwa/DA1FajCNt5LvyK4hEmrHKU4McqKIXE48g609Ukm7VR9TuGv3W47oDlOEpGaQTiebJr
 GdhAoRfwMoZc3wknevDCf1ORzU9QsFlrnZ/lBHKlwfmHOoOeMOXXmgsFpc0cUnVlZGlnZXIg
 T2VydGVsIDxyb0BzdXNlLmRlPsKOBBMRAgA3BQsHCgMEAxUDAgMWAgECF4ACGQEWIQQX3GVT
 hqc4S1PFylw85PLnI/K0FwUCXIG1fgUJKIfzVQAhCRA85PLnI/K0FxYhBBfcZVOGpzhLU8XK
 XDzk8ucj8rQXspIAnRc8obSdLDbkae9gww7ThdezsdhfAJ92sp0zGaZP0Wkd5q1p5h/iu4sG
 8s7BTQRU7Qd+ARAA20INyzAu6fSz3kwXtBxoe8uEJANmpQQrYdBiNN0DpoWE/oBbo8UA0ntV
 HxfLepM8wVT/KpnGAeT4wFhyNrowWvQ6wODLl7t1/dyV/o8i6MNy713x5cZrn7uQS5wxRKeh
 w3vGpz0Ub/n2g3ME2kYmWW2YdaB2rQX8omVdpfMvfp6nl8CiyoE7yAMelWc9gAYihaTULITl
 LuZiQK/a2ZJRhi1dc/CXHM2BeTj6pLXG1kY/9y+uj5IjmcvfXVZW3XBOCsIHhe+bBuLXVH7b
 lvF1fJFcNqBNztulB/n7Dbd2LsuYwp9R+6AYZr0P4TpFiwijvAJE5M4bTW2zNGfym0kkmaiN
 UAmpi1y2H7AIJr6SIhVHAi7pG659DuQMANeOdqER12rvVL8RP5K3f5IiLc9hT8/q8Ytm7Iza
 8+nyMJ84SY6DP+WKvlTil+Ka+vZyS+0pR3BI+Co6CW6mPobX82Vq/FWGXnlSp42Hge3EqnB5
 86e5cAvmkLiDDRk7fyKYRiJpXOCa93WcjzkHsaxxy2ws2es5nv96H27qqmEh8szo3oRKVSeS
 DYKNxac/xB5ohrx93MbptROVLID+qph5PrskSR/3i77Bc0EmTSUMlwlb4px2/IKceuUlNKyp
 lR4hBo4pZZo7nVza/8PuveJQWbE8lwpy80E74mYYs07oiAE/wg8AEQEAAcJ9BBgRCAAmAhsM
 FiEEF9xlU4anOEtTxcpcPOTy5yPytBcFAlyBs3IFCQ8ZefQAIQkQPOTy5yPytBcWIQQX3GVT
 hqc4S1PFylw85PLnI/K0Fxc8AKCHdFGQ2izXAozTL8h69GDcxTR/DgCeIvMsdG/Uhb3HnS4g
 p2dYyL7hZ88=
Organization: =?UTF-8?Q?SUSE_Linux_Products_GmbH=2c_GF=3a_Jeff_Hawn=2c_Jenni?=
 =?UTF-8?Q?fer_Guild=2c_Felix_Imend=c3=b6rffer=2c_HRB_21284_=28AG_N=c3=bcrnb?=
 =?UTF-8?Q?erg=29?=
Message-ID: <7573237a-9a1b-f707-ce43-3051dd587b1d@suse.de>
Date: Mon, 31 Aug 2020 11:03:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598835313.5688ngko4f.astroid@bobo.none>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="I9H6WOvu1YG8j7l92eyxHVmnsGmloBf1p"
X-Mailman-Approved-At: Mon, 31 Aug 2020 19:46:54 +1000
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
--I9H6WOvu1YG8j7l92eyxHVmnsGmloBf1p
Content-Type: multipart/mixed; boundary="odgtes13dwVecbhgxfUfhLbDVjEPI9FTh"

--odgtes13dwVecbhgxfUfhLbDVjEPI9FTh
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Am 31.08.20 um 03:14 schrieb Nicholas Piggin:

> So hwthread_state is never getting back to to HWTHREAD_IN_IDLE on
> those threads. I wonder what they are doing. POWER8 doesn't have a good=

> NMI IPI and I don't know if it supports pdbg dumping registers from the=

> BMC unfortunately.


> Do the messages always come in pairs of CPUs?

well,
- one problem is that at some point the machine just locks up completely,=

  so I can not tell if there were lines not printed any more and in some
  cases all I get is a single line
- looking at the stats in generally it's either one cpu printed several
  times or a pair ("not strictly") alternatingly

2020-07-30T03:16:16+00:00 obs-power8-03 kernel: [51284.029821] KVM: could=
n't grab cpu 92
2020-07-30T03:16:16+00:00 obs-power8-03 kernel: [51284.058630] KVM: could=
n't grab cpu 92
2020-07-30T03:16:16+00:00 obs-power8-03 kernel: [51284.108268] KVM: could=
n't grab cpu 92
2020-07-30T03:16:16+00:00 obs-power8-03 kernel: [51284.210206] KVM: could=
n't grab cpu 92
2020-07-30T03:16:16+00:00 obs-power8-03 kernel: [51284.323465] KVM: could=
n't grab cpu 92
2020-07-30T03:16:16+00:00 obs-power8-03 kernel: [51284.334420] KVM: could=
n't grab cpu 92
2020-07-30T03:16:16+00:00 obs-power8-03 kernel: [51284.345470] KVM: could=
n't grab cpu 92
2020-07-30T03:16:16+00:00 obs-power8-03 kernel: [51284.395185] KVM: could=
n't grab cpu 92
2020-07-30T03:16:16+00:00 obs-power8-03 kernel: [51284.517182] KVM: could=
n't grab cpu 92
2020-07-30T03:16:17+00:00 obs-power8-03 kernel: [51284.600716] KVM: could=
n't grab cpu 92
2020-07-30T03:16:18+00:00 obs-power8-03 kernel: [51286.201589] KVM: could=
n't grab cpu 92
2020-07-30T03:16:19+00:00 obs-power8-03 kernel: [51286.627273] KVM: could=
n't grab cpu 92

2020-07-30T16:44:16+00:00 obs-power8-04 kernel: [30099.726288] KVM: could=
n't grab cpu 61
2020-07-30T16:44:16+00:00 obs-power8-04 kernel: [30099.736843] KVM: could=
n't grab cpu 125
2020-07-30T16:44:17+00:00 obs-power8-04 kernel: [30099.747429] KVM: could=
n't grab cpu 125
2020-07-30T16:44:17+00:00 obs-power8-04 kernel: [30099.877138] KVM: could=
n't grab cpu 61
2020-07-30T16:44:17+00:00 obs-power8-04 kernel: [30099.916422] KVM: could=
n't grab cpu 125
2020-07-30T16:44:17+00:00 obs-power8-04 kernel: [30099.931755] KVM: could=
n't grab cpu 61
2020-07-30T16:44:17+00:00 obs-power8-04 kernel: [30100.029003] KVM: could=
n't grab cpu 61
2020-07-30T16:44:17+00:00 obs-power8-04 kernel: [30100.334895] KVM: could=
n't grab cpu 125
2020-07-30T16:44:17+00:00 obs-power8-04 kernel: [30100.392713] KVM: could=
n't grab cpu 61
2020-07-30T16:44:17+00:00 obs-power8-04 kernel: [30100.569011] KVM: could=
n't grab cpu 125
2020-07-30T16:44:17+00:00 obs-power8-04 kernel: [30100.617048] KVM: could=
n't grab cpu 125
2020-07-30T16:44:17+00:00 obs-power8-04 kernel: [30100.628107] KVM: could=
n't grab cpu 125
2020-07-30T16:44:18+00:00 obs-power8-04 kernel: [30100.809046] KVM: could=
n't grab cpu 125
2020-07-30T16:44:18+00:00 obs-power8-04 kernel: [30101.001097] KVM: could=
n't grab cpu 61
2020-07-30T16:44:19+00:00 obs-power8-04 kernel: [30102.109007] KVM: could=
n't grab cpu 125
2020-07-30T16:44:19+00:00 obs-power8-04 kernel: [30102.254470] KVM: could=
n't grab cpu 61



>=20
> I'm not sure where to start with reproducing, I'll have to try. How man=
y
> vCPUs in the guests? Do you have several guests running at once?
>=20
> Thanks,
> Nick
>=20


--=20
with kind regards (mit freundlichem Grinsen),
  Ruediger Oertel (ro@suse.com,ro@suse.de,bugfinder@t-online.de)
--------Do-Not-Accept-Binary-Blobs.----Ever.----From-Anyone.------------
Key fingerprint   =3D   17DC 6553 86A7 384B 53C5  CA5C 3CE4 F2E7 23F2 B41=
7
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=

  Germany, (HRB 36809, AG N=C3=BCrnberg), Gesch=C3=A4ftsf=C3=BChrer: Feli=
x Imend=C3=B6rffer


--odgtes13dwVecbhgxfUfhLbDVjEPI9FTh--

--I9H6WOvu1YG8j7l92eyxHVmnsGmloBf1p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQX3GVThqc4S1PFylw85PLnI/K0FwUCX0y89wAKCRA85PLnI/K0
F6+IAKDModNhTQHCFjxF+Tn5cMWbgOhFTQCfZVnYO+8PF9WWplR1wrglGCaiub0=
=fQuM
-----END PGP SIGNATURE-----

--I9H6WOvu1YG8j7l92eyxHVmnsGmloBf1p--
