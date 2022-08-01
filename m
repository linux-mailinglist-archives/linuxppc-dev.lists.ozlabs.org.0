Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C855874C0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 02:15:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lxb8q5xGmz3c6D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 10:14:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxBM32GmRz2xHN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 18:37:17 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-60-CksiPPRtPA6w1mXQckakNQ-1; Mon, 01 Aug 2022 09:37:09 +0100
X-MC-Unique: CksiPPRtPA6w1mXQckakNQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Mon, 1 Aug 2022 09:37:04 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Mon, 1 Aug 2022 09:37:04 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Stephen Hemminger' <stephen@networkplumber.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: RE: [RFC] Remove DECNET support from kernel
Thread-Topic: [RFC] Remove DECNET support from kernel
Thread-Index: AQHYpREB8DXx1AZd/0ac5Son0/agPK2ZuBOg
Date: Mon, 1 Aug 2022 08:37:03 +0000
Message-ID: <c43f221d8e824cd2bf9746596423befc@AcuMS.aculab.com>
References: <20220731190646.97039-1-stephen@networkplumber.org>
In-Reply-To: <20220731190646.97039-1-stephen@networkplumber.org>
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
X-Mailman-Approved-At: Tue, 02 Aug 2022 10:14:30 +1000
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
Cc: "open list:NETFILTER" <netfilter-devel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, Alexei Starovoitov <ast@kernel.org>, "open
 list:MIPS" <linux-mips@vger.kernel.org>, Wang Qing <wangqing@vivo.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>, Yajun Deng <yajun.deng@linux.dev>, Suma
 Hegde <suma.hegde@amd.com>, Paolo
 Abeni <pabeni@redhat.com>, Victor Erminpour <victor.erminpour@oracle.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Soheil Hassas Yeganeh <soheil@google.com>, Menglong Dong <imagedong@tencent.com>, Xin Long <lucien.xin@gmail.com>, Chen Yu <yu.c.chen@intel.com>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, Xie Yongji <xieyongji@bytedance.com>, "open list:NETFILTER" <coreteam@netfilter.org>, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Borislav Petkov <bp@suse.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pablo Neira
 Ayuso <pablo@netfilter.org>, Stefano Garzarella <sgarzare@redhat.com>, Jens Axboe <axboe@kernel.dk>, "open list:LINUX FOR POWERPC \(32-BIT
 AND        64-BIT\)" <linuxppc-dev@lists.ozlabs.org>, Kees Cook <keescook@chromium.org>, "Paul E.
 McKenney" <paulmck@kernel.org>, Benjamin Poirier <bpoirier@nvidia.com>, Yu Zhe <yuzhe@nfschina.com>, "GONG, Ruiqi" <gongruiqi1@huawei.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Scott Wood <oss@buserror.net>, Hans de Goede <hdegoede@redhat.com>, Kuniyuki
 Iwashima <kuniyu@amazon.com>, Shakeel Butt <shakeelb@google.com>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, Yuwei Wang <wangyuweihx@gmail.com>, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Akhmat
 Karakotov <hmukos@yandex-team.ru>, Petr Machata <petrm@nvidia.com>, Antoine Tenart <atenart@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Florian Westphal <fw@strlen.de>, open list <linux-kernel@vger.kernel.org>, David Ahern <dsahern@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Arnd
 Bergmann <arnd@arndb.de>, Jeff Layton <jlayton@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, =?iso-8859-1?Q?Pali_Roh=E1r?= <pali@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Stephen Hemminger
> Sent: 31 July 2022 20:06
> To: netdev@vger.kernel.org
>=20
> Decnet is an obsolete network protocol that receives more attention
> from kernel janitors than users. It belongs in computer protocol
> history museum not in Linux kernel.
>=20
> It has been Orphaned in kernel since 2010.
> And the documentation link on Sourceforge says it is abandoned there.

It was pretty much obsolete when I was writing ethernet drivers
in the early 1990's.
Sort of surprising support ever got into Linux in the first place!

Remember it requires the ethernet MAC address be set to a
locally assigned value that is the machine's 'node number'.

Does this remove some/most/all of the [gs]et_sockopt() calls
where the length is ignored/

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

