Return-Path: <linuxppc-dev+bounces-5390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B658AA16A78
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 11:09:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc5fy1K3Jz3028;
	Mon, 20 Jan 2025 21:09:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=162.240.238.73
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737367786;
	cv=none; b=bbfvcKQVuiiMsk4J8BMde975eGIKyrleHY1dmcnUx+dv4FLfsXYSPWztHzfPxY+Xc7rDE0pYxEGJTXUATfGg5Kkpa5Xn0oX1AYxa5q0l5cUjLvbXJtmkigqNTaBiQt6eME2rAOhZDGZ1nYHmVkUpfAgrZwsWNatNysfts6Qm2MvEhWYUI9dYt5gg9l00SQiraFYV6UAJyvYouUTEwoMwn3Lk4GNQnwhWDOa5R++1g37Qc+BISkFAIrIGKv04DGbe1pVGh9PkwG4rgD0/G5kOZdXHlYw85Ywh4r67mImKaFbNEb+VGkawRJa6qpi2G4uFb6st5ao1ytl7afKLyvvzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737367786; c=relaxed/relaxed;
	bh=2iwlxkHCLjw7pnyg/Gmn0XOtcQ5sJydvHz4YYonPATw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=N+uPKtOeruXP49y3ddyBmlVgNj8OjcWH/hGc1A8HTAqpc6Pqtrh7SgB1sw9wKK6kw2wxoRL2x9NlM37diX+X3jQT7eNUoENW71vrJnDZ+2Ld6zg+xZwra7ele94b56veqCFvRTNgxIeXwwK22lWJh6NDsFZPHAiThEVBlwmxb4jFZ0boS6mGKZAeYO2cBM08gr1MZzC6yVT0ZVM+PbsZxIFK7e+vTmOaVnD0eKPktlaneN+yY9R0gWylE/HrlcJcjfdj54v/b2RwHIsuG85+RPyQSd3q04dGq6PBz4cEOafFSJTb8O1/z/8pfdBtSS1hsiKh/aZaz0+k7D8Jmz0CHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=couthit.com; dkim=pass (2048-bit key; unprotected) header.d=couthit.com header.i=@couthit.com header.a=rsa-sha256 header.s=default header.b=Cktqd/df; dkim-atps=neutral; spf=pass (client-ip=162.240.238.73; helo=server.wki.vra.mybluehostin.me; envelope-from=basharath@couthit.com; receiver=lists.ozlabs.org) smtp.mailfrom=couthit.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=couthit.com header.i=@couthit.com header.a=rsa-sha256 header.s=default header.b=Cktqd/df;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=couthit.com (client-ip=162.240.238.73; helo=server.wki.vra.mybluehostin.me; envelope-from=basharath@couthit.com; receiver=lists.ozlabs.org)
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yc5fw3MvGz2yyR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 21:09:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2iwlxkHCLjw7pnyg/Gmn0XOtcQ5sJydvHz4YYonPATw=; b=Cktqd/dfFLUryNsIF+Rkz5csyz
	eO8knNj2/XM689eUpVZO4KyBj4hGHmgigvxqmtJ/yVe1XfGdCelreZRL7CxUlP1ik9XcTs2ZBm3gx
	ChcWbxvq8t/SVWXVGgWQxrXU/5xemW7BUc/VEFGBTogmudlOW48eMVY/AuPwpQ5f1u0VUDZKI43un
	3WKbyJVwUUwzeEJ6bjHDkfzJ8Yo5/GNjuIo+k6WicIJrG9B5zMX0MGrdpjct3xVV6wR2ZilY3/Q0s
	kfspUHqQrfl8yoNzK5UwPU1TXQD+mWHyuaCOfVM3Zk4ZQvWuDjrmiyxthEQ65tr4IiswfyT2UAdrN
	Hm4Ci7uA==;
Received: from [122.175.9.182] (port=6930 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tZoix-0002AD-0z;
	Mon, 20 Jan 2025 15:39:39 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 9812C17821F2;
	Mon, 20 Jan 2025 15:39:34 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 7D14217825C6;
	Mon, 20 Jan 2025 15:39:34 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id l5Op1yfdr7Lr; Mon, 20 Jan 2025 15:39:34 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 302BE17821F2;
	Mon, 20 Jan 2025 15:39:34 +0530 (IST)
Date: Mon, 20 Jan 2025 15:39:33 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: thomas weissschuh <thomas.weissschuh@linutronix.de>
Cc: basharath <basharath@couthit.com>, Rob Herring <robh@kernel.org>, 
	mpe <mpe@ellerman.id.au>, devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	saravanak <saravanak@google.com>, danishanwar <danishanwar@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>, 
	parvathi <parvathi@couthit.com>, pmohan <pmohan@couthit.com>
Message-ID: <165808392.352842.1737367773938.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250117134255-bee95a37-250c-437a-a101-938800cba218@linutronix.de>
References: <87mskbqher.fsf@mail.lhotse> <20250108140414.13530-1-basharath@couthit.com> <CAL_JsqLLGW_o9i6a5wcUj=Z=4nL-GhzHwAQMFtQkb9OSHuSgTA@mail.gmail.com> <2089813158.341858.1737096833060.JavaMail.zimbra@couthit.local> <20250117134255-bee95a37-250c-437a-a101-938800cba218@linutronix.de>
Subject: Re: [PATCH] of: address: Unify resource bounds overflow checking
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF133 (Linux)/8.8.15_GA_3968)
Thread-Topic: address: Unify resource bounds overflow checking
Thread-Index: r1Fx9DjhxRAnmh6XhWLvfeEJyFQshg==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


> On Fri, Jan 17, 2025 at 12:23:53PM +0530, Basharath Hussain Khaja wrote:
>> >> >> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de> writes:
>> >> >> > The members "start" and "end" of struct resource are of type
>> >> >> > "resource_size_t" which can be 32bit wide.
>> >> >> > Values read from OF however are always 64bit wide.
>> >> >> >
>> >> >> > Refactor the diff overflow checks into a helper function.
>> >> >> > Also extend the checks to validate each calculation step.
>> >> >> >
>> >> >> > Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutron=
ix.de>
>> >> >> > ---
>> >> >> >  drivers/of/address.c | 45 ++++++++++++++++++++++++++-----------=
--------
>> >> >> >  1 file changed, 26 insertions(+), 19 deletions(-)
>> >> >> >
>> >> >> > diff --git a/drivers/of/address.c b/drivers/of/address.c
>> >> >> > index 7e59283a4472..df854bb427ce 100644
>> >> >> > --- a/drivers/of/address.c
>> >> >> > +++ b/drivers/of/address.c
>> >> >> > @@ -198,6 +198,25 @@ static u64 of_bus_pci_map(__be32 *addr, con=
st __be32
>> >> >> > *range, int na, int ns,
>> >> >> >
>> >> >> >  #endif /* CONFIG_PCI */
>> >> >> >
>> >> >> > +static int __of_address_resource_bounds(struct resource *r, u64=
 start, u64
>> >> >> > size)
>> >> >> > +{
>> >> >> > +     u64 end =3D start;
>> >> >> > +
>> >> >> > +     if (overflows_type(start, r->start))
>> >> >> > +             return -EOVERFLOW;
>> >> >> > +     if (size =3D=3D 0)
>> >> >> > +             return -EOVERFLOW;
>> >> >> > +     if (check_add_overflow(end, size - 1, &end))
>> >> >> > +             return -EOVERFLOW;
>> >> >> > +     if (overflows_type(end, r->end))
>> >> >> > +             return -EOVERFLOW;
>> >> >>
>> >> >> This breaks PCI on powerpc qemu. Part of the PCI probe reads a res=
ource
>> >> >> that's zero sized, which used to succeed but now fails due to the =
size
>> >> >> check above.
>> >> >>
>> >> >> The diff below fixes it for me.
>> >> >
>> >> > I fixed it up with your change.
>> >>
>> >>
>> >> This commit is breaking Ethernet functionality on the TI AM57xx platf=
orm due to
>> >> zero byte SRAM block size allocation during initialization. Prior to =
this
>> >> patch, zero byte block sizes were handled properly.
>> >=20
>> > What driver and where exactly?
>>=20
>> We found an issue while developing the driver [1] and more
>> specifically in [2] (lines 313-327), but it looks like this is a
>> generic issue which can block 1 byte of memory, when a zero size
>> request has been initiated for the reserved region.
>>
>> static int __of_address_resource_bounds(struct resource *r, u64 start, u=
64 size)
>> {
>>     u64 end =3D start;
>>=20
>>     if (overflows_type(start, r->start))
>>         return -EOVERFLOW;
>>     if (size && check_add_overflow(end, size - 1, &end))
>>         return -EOVERFLOW;
>>     if (overflows_type(end, r->end))
>>         return -EOVERFLOW;
>>=20
>>     r->start =3D start;
>>     r->end =3D end;
>>=20
>>     return 0;
>> }
>>=20
>> Though we have the start address handling already in place above, we
>> do see an issue with the end address, because there is an
>> unconditional +1 afterwards in resource_size() API below which is
>> responsible for reserving the extra byte
>>=20
>> static inline resource_size_t resource_size(const struct resource *res)
>> {
>>         return res->end - res->start + 1;
>> }
>=20
> Now the report makes more sense.
>=20
>> We have 4 ways of fixing it.
>>=20
>> Option 1: Modify the function to handle the size zero case
>>=20
>> diff --git a/drivers/of/address.c b/drivers/of/address.c
>> index c1f1c810e810..8db6ae9a12b8 100644
>> --- a/drivers/of/address.c
>> +++ b/drivers/of/address.c
>> @@ -204,6 +204,12 @@ static int __of_address_resource_bounds(struct reso=
urce *r,
>> u64 start, u64 size)
>> =20
>>         if (overflows_type(start, r->start))
>>                 return -EOVERFLOW;
>> +       if (!size) {
>> +               r->start =3D start;
>> +               r->end =3D end - 1;
>> +
>> +               return 0;
>> +       }
>>         if (size && check_add_overflow(end, size - 1, &end))
>>                 return -EOVERFLOW;
>>         if (overflows_type(end, r->end))
>>=20
>> This seems to be the simplest solution.
>=20
> Fixing it in __of_address_resource_bounds() looks correct to me.
> The proposed solution doesn't look as clean as I'd like though,
> this is highly subjective, though.
>=20
> What about the following (untested)?
>=20
> static int __of_address_resource_bounds(struct resource *r, u64 start, u6=
4 size)
> {
>=09if (overflows_type(start, r->start))
>=09=09return -EOVERFLOW;
>=20
>=09r->start =3D start;
>=09r->end =3D start;
>=20
>=09if (!size)
>=09=09r->end -=3D 1; /* May underflow for empty resources. */
>=09else if (check_add_overflow(r->end, size - 1, &r->end))
>=09=09return -EOVERFLOW;
>=20
>=09return 0;
> }
>=20
> A kunit test looks to be in order in any case, to make sure all the
> edgecases are handled.
>=20
We have tested with your suggested changes as below for our functionality i=
t is working as expected. To be on safe side we ran through patch verificat=
ion tools, we found no issues.

diff --git a/drivers/of/address.c b/drivers/of/address.c
index c1f1c810e810..6e581187c122 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -200,17 +200,16 @@ static u64 of_bus_pci_map(__be32 *addr, const __be32 =
*range, int na, int ns,
=20
 static int __of_address_resource_bounds(struct resource *r, u64 start, u64=
 size)
 {
-       u64 end =3D start;
-
        if (overflows_type(start, r->start))
                return -EOVERFLOW;
-       if (size && check_add_overflow(end, size - 1, &end))
-               return -EOVERFLOW;
-       if (overflows_type(end, r->end))
-               return -EOVERFLOW;
=20
        r->start =3D start;
-       r->end =3D end;
+       r->end =3D start;
+
+       if (!size)
+               r->end -=3D 1; /* May underflow for empty resources. */
+       else if (check_add_overflow(r->end, size - 1, &r->end))
+               return -EOVERFLOW;
=20
        return 0;
 }

Thanks & Best Regards,
Basharath

