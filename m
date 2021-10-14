Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A2C42D4A2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 10:16:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVMfn1s0Xz2ynX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 19:16:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVMfH1ScMz2xY8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 19:15:33 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-25-ZAf48fDhNsWZHQ1kXJysiQ-1; Thu, 14 Oct 2021 09:15:25 +0100
X-MC-Unique: ZAf48fDhNsWZHQ1kXJysiQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Thu, 14 Oct 2021 09:15:23 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Thu, 14 Oct 2021 09:15:23 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Hari Bathini' <hbathini@linux.ibm.com>, "naveen.n.rao@linux.ibm.com"
 <naveen.n.rao@linux.ibm.com>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net"
 <daniel@iogearbox.net>
Subject: RE: [RESEND PATCH v4 0/8] bpf powerpc: Add BPF_PROBE_MEM support in
 powerpc JIT compiler
Thread-Topic: [RESEND PATCH v4 0/8] bpf powerpc: Add BPF_PROBE_MEM support in
 powerpc JIT compiler
Thread-Index: AQHXv2X2sg2Hg8STAUWVvVtx4py8mavSKAQw
Date: Thu, 14 Oct 2021 08:15:23 +0000
Message-ID: <8091e1294ad343a88aa399417ff91aee@AcuMS.aculab.com>
References: <20211012123056.485795-1-hbathini@linux.ibm.com>
In-Reply-To: <20211012123056.485795-1-hbathini@linux.ibm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
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
Cc: "songliubraving@fb.com" <songliubraving@fb.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
 "andrii@kernel.org" <andrii@kernel.org>,
 "kpsingh@kernel.org" <kpsingh@kernel.org>,
 "paulus@samba.org" <paulus@samba.org>, "yhs@fb.com" <yhs@fb.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "kafai@fb.com" <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Hari Bathini=20
> Sent: 12 October 2021 13:31
>=20
> Patch #1 & #2 are simple cleanup patches. Patch #3 refactors JIT
> compiler code with the aim to simplify adding BPF_PROBE_MEM support.
> Patch #4 introduces PPC_RAW_BRANCH() macro instead of open coding
> branch instruction. Patch #5 & #7 add BPF_PROBE_MEM support for PPC64
> & PPC32 JIT compilers respectively. Patch #6 & #8 handle bad userspace
> pointers for PPC64 & PPC32 cases respectively.

I thought that BPF was only allowed to do fairly restricted
memory accesses - so WTF does it need a BPF_PROBE_MEM instruction?

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

