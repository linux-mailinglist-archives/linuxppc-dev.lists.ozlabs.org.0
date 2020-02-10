Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C6C1571A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 10:27:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GLCV0jqMzDqNS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 20:27:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GL9L3tCkzDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 20:25:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=bXVscC3V; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 48GL9C1PZJz9sRL;
 Mon, 10 Feb 2020 20:25:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1581326719;
 bh=4uDBFJJ4rD6iQqPeYJedk6hgI0D6XwtFgiUFtN9oYbQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=bXVscC3Vjk9U+7SCuUAU2zGIizqRUKrTFvGytsfuRkZnZtOyIbmkEyZaddu1i+3jr
 7ZEDwDH73xWBnd6yInWILFCp9nc35qKmLoOs/j8e+m4Io5Rn1H4mX6cf7vf9R6V55T
 PNvcnDYfU7MMo+YJE1KvbUdKlkiOzTy2+jPpOSbHMlBwmQoCKGf8vG22i8wrJEpME0
 PTkEm7yQfc24BbwJi+MqPrZiBNF2rfp1NRB/iKl8Rt/lPvqJST7lnx7PgVuCb4s1++
 M51NRAQLC3nwloC2dutNkgFvlVV6fP8xNAHQqFlwjecNZm9bXPvDWNVA2OI9IvRix4
 XkmNj+vjs0L8Q==
Received: by neuling.org (Postfix, from userid 1000)
 id E14602C0196; Mon, 10 Feb 2020 20:25:18 +1100 (AEDT)
Message-ID: <88f43b386972d4dcbb3c9c6f5a8fb1d138299408.camel@neuling.org>
Subject: Re: [PATCH V5 09/14] powerpc/vas: Update CSB and notify process for
 fault CRBs
From: Michael Neuling <mikey@neuling.org>
To: Haren Myneni <haren@linux.ibm.com>
Date: Mon, 10 Feb 2020 20:25:18 +1100
In-Reply-To: <1581311569.18705.18.camel@hbabu-laptop>
References: <1579679802.26081.6.camel@hbabu-laptop>
 <1579681061.26081.48.camel@hbabu-laptop>
 <67467b52ddd8fcd6ccd8390f9b1f0ed7c09bb3bf.camel@neuling.org>
 <1581311569.18705.18.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
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
Cc: herbert@gondor.apana.org.au, npiggin@gmail.com, hch@infradead.org,
 oohall@gmail.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> > > +
> > > +	csb.cc =3D CSB_CC_TRANSLATION;
> > > +	csb.ce =3D CSB_CE_TERMINATION;
> > > +	csb.cs =3D 0;
> > > +	csb.count =3D 0;
> > > +
> > > +	/*
> > > +	 * Returns the fault address in CPU format since it is passed with
> > > +	 * signal. But if the user space expects BE format, need changes.
> > > +	 * i.e either kernel (here) or user should convert to CPU format.
> > > +	 * Not both!
> > > +	 */
> > > +	csb.address =3D be64_to_cpu(crb->stamp.nx.fault_storage_addr);
> >=20
> > This looks wrong and I don't understand the comment. You need to conver=
t
> > this
> > back to be64 to write it to csb.address. ie.
> >=20
> >   csb.address =3D cpu_to_be64(be64_to_cpu(crb->stamp.nx.fault_storage_a=
ddr));
> >=20
> > Which I think you can just avoid the endian conversion all together.
>=20
> NX pastes fault CRB in big-endian, so passing this address in CPU format
> to user space, otherwise the library has to convert.=20

OK, then please change the definition in struct coprocessor_status_block to=
 just
__u64.

struct coprocessor_status_block {
	u8 flags;
	u8 cs;
	u8 cc;
	u8 ce;
	__be32 count;
	__be64 address;
} __packed __aligned(CSB_ALIGN);

Big but....

I thought "struct coprocessor_status_block" was also written by hardware. I=
f
that's the case then it needs to be __be64 and you need the kernel to synth=
esize
exactly what the hardware is doing. Hence the struct definition is correct =
and
the kernel needs to convert to _be64 on writing.=20

> What is the standard way for passing to user space?=20

CPU endian.

> > > +	 * process will be polling on csb.flags after request is sent to
> > > +	 * NX. So generally CSB update should not fail except when an
> > > +	 * application does not follow the process properly. So an error
> > > +	 * message will be displayed and leave it to user space whether
> > > +	 * to ignore or handle this signal.
> > > +	 */
> > > +	rcu_read_lock();
> > > +	rc =3D kill_pid_info(SIGSEGV, &info, pid);
> > > +	rcu_read_unlock();
> >=20
> > why the rcu_read_un/lock() here?
>=20
> Used same as in kill_proc_info()/kill_something_info()

Please document.

Mikey
