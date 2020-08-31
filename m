Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DA9257A2F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 15:16:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bg9gn3F2hzDqTx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 23:16:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bg9d00scqzDqQ1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 23:13:39 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9BF91B8FD;
 Mon, 31 Aug 2020 13:13:35 +0000 (UTC)
Subject: Re: KVM on POWER8 host lock up since 10d91611f426 ("powerpc/64s:
 Reimplement book3s idle code in C")
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20200830201145.GA29521@kitsune.suse.cz>
 <1598835313.5688ngko4f.astroid@bobo.none>
 <50693d7e-6c8b-4908-d003-25b99a867850@suse.de>
 <87v9gz0y5y.fsf@mpe.ellerman.id.au>
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
Message-ID: <a6469ba3-36ac-9e59-df4c-e8ee657647b4@suse.de>
Date: Mon, 31 Aug 2020 15:13:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87v9gz0y5y.fsf@mpe.ellerman.id.au>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="q9yhtfAJ3u6bsFfqkSE188itn9m8rlRYJ"
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
--q9yhtfAJ3u6bsFfqkSE188itn9m8rlRYJ
Content-Type: multipart/mixed; boundary="xzeqa8skyzNMH4xh5rDAu3E0vxemOiLyF"

--xzeqa8skyzNMH4xh5rDAu3E0vxemOiLyF
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Am 31.08.20 um 14:58 schrieb Michael Ellerman:
[...]
>> The machines are running in OPAL/PowerNV mode, with "ppc64_cpu --smt=3D=
off".
>> The number of VMs varies across the machines:
>> obs-power8-01: 18 instances, "-smp 16,threads=3D8"
>> obs-power8-02: 20 instances, "-smp 8,threads=3D8"
>> obs-power8-03: 30 instances, "-smp 8,threads=3D8"
>> obs-power8-04: 20 instances, "-smp 8,threads=3D8"
>=20
> Can you send us the output of:
>=20
> # grep . /sys/module/kvm_hv/parameters/*

of course, the current values are:

/sys/module/kvm_hv/parameters/dynamic_mt_modes:6
/sys/module/kvm_hv/parameters/h_ipi_redirect:1
/sys/module/kvm_hv/parameters/indep_threads_mode:Y
/sys/module/kvm_hv/parameters/kvm_irq_bypass:1
/sys/module/kvm_hv/parameters/nested:Y
/sys/module/kvm_hv/parameters/one_vm_per_core:N
/sys/module/kvm_hv/parameters/target_smt_mode:0

(actually identical on all 5 above)

--=20
with kind regards (mit freundlichem Grinsen),
  Ruediger Oertel (ro@suse.com,ro@suse.de,bugfinder@t-online.de)
--------Do-Not-Accept-Binary-Blobs.----Ever.----From-Anyone.------------
Key fingerprint   =3D   17DC 6553 86A7 384B 53C5  CA5C 3CE4 F2E7 23F2 B41=
7
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=

  Germany, (HRB 36809, AG N=C3=BCrnberg), Gesch=C3=A4ftsf=C3=BChrer: Feli=
x Imend=C3=B6rffer


--xzeqa8skyzNMH4xh5rDAu3E0vxemOiLyF--

--q9yhtfAJ3u6bsFfqkSE188itn9m8rlRYJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQX3GVThqc4S1PFylw85PLnI/K0FwUCX0z3cgAKCRA85PLnI/K0
F+RfAKCDjWt8EKmcGbO4JTpIeEWDOQj63ACfXcED1N6a51x8oozEauqkbt/B05s=
=wbx7
-----END PGP SIGNATURE-----

--q9yhtfAJ3u6bsFfqkSE188itn9m8rlRYJ--
