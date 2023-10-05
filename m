Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 724D57BA2C6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 17:46:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1bWR3rMvz3vp4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 02:46:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1bVr2mZGz3c5F
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 02:45:37 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-79-v8EnXri1O82uYGWoVdPKWQ-1; Thu, 05 Oct 2023 16:45:32 +0100
X-MC-Unique: v8EnXri1O82uYGWoVdPKWQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 5 Oct
 2023 16:45:31 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 5 Oct 2023 16:45:30 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Athira Rajeev' <atrajeev@linux.vnet.ibm.com>, "'acme@kernel.org'"
	<acme@kernel.org>, "'jolsa@kernel.org'" <jolsa@kernel.org>,
	"'adrian.hunter@intel.com'" <adrian.hunter@intel.com>, "'irogers@google.com'"
	<irogers@google.com>, "'namhyung@kernel.org'" <namhyung@kernel.org>
Subject: RE: [PATCH 1/3] perf tests test_arm_coresight: Fix the shellcheck
 warning in latest test_arm_coresight.sh
Thread-Topic: [PATCH 1/3] perf tests test_arm_coresight: Fix the shellcheck
 warning in latest test_arm_coresight.sh
Thread-Index: AQHZ8otO1Cm02Mw9rEODc38+gtl1Z7A7ApdAgABeJuA=
Date: Thu, 5 Oct 2023 15:45:30 +0000
Message-ID: <5d79ca77e4ca4f6c895e26384655563f@AcuMS.aculab.com>
References: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com>
 <20230929041133.95355-2-atrajeev@linux.vnet.ibm.com>
 <3b7b34e74bdb4b05b6b21edd81af59d0@AcuMS.aculab.com>
In-Reply-To: <3b7b34e74bdb4b05b6b21edd81af59d0@AcuMS.aculab.com>
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
Cc: "'linux-perf-users@vger.kernel.org'" <linux-perf-users@vger.kernel.org>, "'kjain@linux.ibm.com'" <kjain@linux.ibm.com>, "'maddy@linux.ibm.com'" <maddy@linux.ibm.com>, "'linuxppc-dev@lists.ozlabs.org'" <linuxppc-dev@lists.ozlabs.org>, "'disgoel@linux.vnet.ibm.com'" <disgoel@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Laight
> Sent: 05 October 2023 11:16
...
> > -=09cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name c=
pu* -print -quit)
> > +=09cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name '=
cpu*' -print -quit)
>=20
> Isn't the intention to get the shell to expand "cpu* ?
> So quoting it completely breaks the script.

Complete brain-fade :-(

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

