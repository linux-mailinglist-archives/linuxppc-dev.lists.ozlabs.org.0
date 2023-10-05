Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6407B9C74
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 12:16:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1SBj1JVWz3vn0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 21:16:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1SB76X6Mz3cPf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 21:15:42 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-2-GM7lnwnRNXe6RSBHU-iNMQ-1; Thu, 05 Oct 2023 11:15:33 +0100
X-MC-Unique: GM7lnwnRNXe6RSBHU-iNMQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 5 Oct
 2023 11:15:32 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 5 Oct 2023 11:15:32 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Athira Rajeev' <atrajeev@linux.vnet.ibm.com>, "acme@kernel.org"
	<acme@kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>,
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "irogers@google.com"
	<irogers@google.com>, "namhyung@kernel.org" <namhyung@kernel.org>
Subject: RE: [PATCH 1/3] perf tests test_arm_coresight: Fix the shellcheck
 warning in latest test_arm_coresight.sh
Thread-Topic: [PATCH 1/3] perf tests test_arm_coresight: Fix the shellcheck
 warning in latest test_arm_coresight.sh
Thread-Index: AQHZ8otO1Cm02Mw9rEODc38+gtl1Z7A7ApdA
Date: Thu, 5 Oct 2023 10:15:31 +0000
Message-ID: <3b7b34e74bdb4b05b6b21edd81af59d0@AcuMS.aculab.com>
References: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com>
 <20230929041133.95355-2-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230929041133.95355-2-atrajeev@linux.vnet.ibm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "disgoel@linux.vnet.ibm.com" <disgoel@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev
> Sent: 29 September 2023 05:12
>=20
> Running shellcheck on tests/shell/test_arm_coresight.sh
> throws below warnings:
>=20
> =09In tests/shell/test_arm_coresight.sh line 15:
> =09cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name cpu*=
 -print -quit)
>                   ^--^ SC2061: Quote the parameter to -name so the shell =
won't interpret it.
>=20
> =09In tests/shell/test_arm_coresight.sh line 20:
> =09=09if [ $archhver -eq 5 -a "$(printf "0x%X\n" $archpart)" =3D "0xA13" =
] ; then
>                 =09             ^-- SC2166: Prefer [ p ] && [ q ] as [ p =
-a q ] is not well defined
>=20
> This warning is observed after commit:
> "commit bb350847965d ("perf test: Update cs_etm testcase for Arm ETE")"
>=20
> Fixed this issue by using quoting 'cpu*' for SC2061 and
> using "&&" in line number 20 for SC2166 warning
>=20
> Fixes: bb350847965d ("perf test: Update cs_etm testcase for Arm ETE")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/shell/test_arm_coresight.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/perf/tests/shell/test_arm_coresight.sh
> b/tools/perf/tests/shell/test_arm_coresight.sh
> index fe78c4626e45..f2115dfa24a5 100755
> --- a/tools/perf/tests/shell/test_arm_coresight.sh
> +++ b/tools/perf/tests/shell/test_arm_coresight.sh
> @@ -12,12 +12,12 @@
>  glb_err=3D0
>=20
>  cs_etm_dev_name() {
> -=09cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name cpu=
* -print -quit)
> +=09cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name 'cp=
u*' -print -quit)

Isn't the intention to get the shell to expand "cpu* ?
So quoting it completely breaks the script.

>  =09trcdevarch=3D$(cat ${cs_etm_path}/mgmt/trcdevarch)
>  =09archhver=3D$((($trcdevarch >> 12) & 0xf))
>  =09archpart=3D$(($trcdevarch & 0xfff))
>=20
> -=09if [ $archhver -eq 5 -a "$(printf "0x%X\n" $archpart)" =3D "0xA13" ] =
; then
> +=09if [ $archhver -eq 5 ] && [ "$(printf "0x%X\n" $archpart)" =3D "0xA13=
" ] ; then

The only issue I see there is that $archhver could be in "".
IIRC test is required to parse the 5 part expression "a op b -a c op d"
in the 'expected' manner even if any of a/b/c/d look like operators.
In any case '(' and ')' can be used to force the ordering.
Or, more usually, prepend an x as in:

if [ "x$archhver" =3D x5 -a "$(printf "0x%X\n" $archpart)" =3D "0xA13" ] ; =
then

=09David

>  =09=09echo "ete"
>  =09else
>  =09=09echo "etm"
> --
> 2.31.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

