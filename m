Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 406E4674FCD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 09:52:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NytYL1bhGz3fJ7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 19:52:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NytXl5KBFz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 19:52:06 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-313--Lfi9qISPHGbgb-YRNfUNQ-1; Fri, 20 Jan 2023 08:52:01 +0000
X-MC-Unique: -Lfi9qISPHGbgb-YRNfUNQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 20 Jan
 2023 08:51:59 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.044; Fri, 20 Jan 2023 08:51:59 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnaldo Carvalho de Melo' <acme@kernel.org>
Subject: RE: [PATCH V3] tools/perf/tests: Fix string substitutions in build id
 test
Thread-Topic: [PATCH V3] tools/perf/tests: Fix string substitutions in build
 id test
Thread-Index: AQHZLBIrp7uRxIXInkOHsORdTF5RZK6l4s+wgAAT9YCAAQmokA==
Date: Fri, 20 Jan 2023 08:51:59 +0000
Message-ID: <8c433a543cda48e5b736312903355918@AcuMS.aculab.com>
References: <20230119142719.32628-1-atrajeev@linux.vnet.ibm.com>
 <1a2f988593a4403db2a043ff42886ced@AcuMS.aculab.com>
 <Y8l3C8LOohZvQOKH@kernel.org>
In-Reply-To: <Y8l3C8LOohZvQOKH@kernel.org>
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
Cc: "irogers@google.com" <irogers@google.com>, "ak@linux.intel.com" <ak@linux.intel.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "rnsastry@linux.ibm.com" <rnsastry@linux.ibm.com>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 'Athira Rajeev' <atrajeev@linux.vnet.ibm.com>, "james.clark@arm.com" <james.clark@arm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "namhyung@kernel.org" <namhyung@kernel.org>, "disgoel@linux.ibm.com" <disgoel@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnaldo Carvalho de Melo
> Sent: 19 January 2023 17:00
>=20
> Em Thu, Jan 19, 2023 at 03:49:15PM +0000, David Laight escreveu:
> > From: Athira Rajeev
> > > Sent: 19 January 2023 14:27
> > ...
> > > The test script "tests/shell/buildid.sh" uses some of the
> > > string substitution ways which are supported in bash, but not in
> > > "sh" or other shells. Above error on line number 69 that reports
> > > "Bad substitution" is:
> >
> > Looks better - assuming it works :-)
>=20
> :-)
>=20
> Can I take this as an:
>=20
> Acked-by: David Laight <David.Laight@ACULAB.COM>

I'm not sure that is worth anything.
You can add a Reviewed-by

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

