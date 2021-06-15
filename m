Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 632E93A8BB5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 00:21:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4N7b0Wk7z3bVD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 08:20:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=lNlb786M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kovaleva@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=lNlb786M; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G48FM0hHkz307m
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:25:10 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 776B241277;
 Tue, 15 Jun 2021 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-transfer-encoding:content-id:content-type
 :content-type:content-language:accept-language:in-reply-to
 :references:message-id:date:date:subject:subject:from:from
 :received:received:received:received; s=mta-01; t=1623763502; x=
 1625577903; bh=VPg4e9ykFp+pSLE+PSB7uSyNnRMbjGWWqrfznQLvrUY=; b=l
 Nlb786MR4FYa8H/3O15ieupTBmwV8Hh1dO+8DCuBzxjuEmTKzoeBlEB/ckH+vZOQ
 QFvRdTcGuaoowFvTMNHzXmSp7rTa4hCIOR0zgyONmbcEaO0Cxd4+J09txfVB973b
 JAe0cuvx8l3zscS/Bli+lX+tizs/w+geCv+h70+4gM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5N_WbQJS9jdB; Tue, 15 Jun 2021 16:25:02 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1FCC741259;
 Tue, 15 Jun 2021 16:25:01 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (172.17.100.103) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 15 Jun 2021 16:25:01 +0300
Received: from T-EXCH-03.corp.yadro.com ([fe80::39f4:7b05:b1d3:5272]) by
 T-EXCH-03.corp.yadro.com ([fe80::39f4:7b05:b1d3:5272%14]) with mapi id
 15.01.0669.032; Tue, 15 Jun 2021 16:25:01 +0300
From: Anastasia Kovaleva <a.kovaleva@yadro.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Fix initrd corruption with relative jump labels
Thread-Topic: [PATCH] powerpc: Fix initrd corruption with relative jump labels
Thread-Index: AQHXYR9Jap/x7dc4r0OXmTPa78GZVKsU3yUA
Date: Tue, 15 Jun 2021 13:25:01 +0000
Message-ID: <DAE33CEF-AA7E-488A-B016-B6160671E9E9@yadro.com>
References: <20210614131440.312360-1-mpe@ellerman.id.au>
In-Reply-To: <20210614131440.312360-1-mpe@ellerman.id.au>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [10.199.0.89]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <428917BC0576F342A3A24F0E4CBE7E27@yadro.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Jun 2021 08:20:33 +1000
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "groug@kaod.org" <groug@kaod.org>, "dja@axtens.net" <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 14 Jun 2021, at 16:14, Michael Ellerman <mpe@ellerman.id.au> wrote:
>=20
> Commit b0b3b2c78ec0 ("powerpc: Switch to relative jump labels") switched
> us to using relative jump labels. That involves changing the code,
> target and key members in struct jump_entry to be relative to the
> address of the jump_entry, rather than absolute addresses.
>=20
> We have two static inlines that create a struct jump_entry,
> arch_static_branch() and arch_static_branch_jump(), as well as an asm
> macro ARCH_STATIC_BRANCH, which is used by the pseries-only hypervisor
> tracing code.
>=20
> Unfortunately we missed updating the key to be a relative reference in
> ARCH_STATIC_BRANCH.
>=20
> That causes a pseries kernel to have a handful of jump_entry structs
> with bad key values. Instead of being a relative reference they instead
> hold the full address of the key.
>=20
> However the code doesn't expect that, it still adds the key value to the
> address of the jump_entry (see jump_entry_key()) expecting to get a
> pointer to a key somewhere in kernel data.
>=20
> The table of jump_entry structs sits in rodata, which comes after the
> kernel text. In a typical build this will be somewhere around 15MB. The
> address of the key will be somewhere in data, typically around 20MB.
> Adding the two values together gets us a pointer somewhere around 45MB.
>=20
> We then call static_key_set_entries() with that bad pointer and modify
> some members of the struct static_key we think we are pointing at.
>=20
> A pseries kernel is typically ~30MB in size, so writing to ~45MB won't
> corrupt the kernel itself. However if we're booting with an initrd,
> depending on the size and exact location of the initrd, we can corrupt
> the initrd. Depending on how exactly we corrupt the initrd it can either
> cause the system to not boot, or just corrupt one of the files in the
> initrd.
>=20
> The fix is simply to make the key value relative to the jump_entry
> struct in the ARCH_STATIC_BRANCH macro.
>=20
> Fixes: b0b3b2c78ec0 ("powerpc: Switch to relative jump labels")
> Reported-by: Anastasia Kovaleva <a.kovaleva@yadro.com>
> Reported-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reported-by: Greg Kurz <groug@kaod.org>
> Reported-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
> arch/powerpc/include/asm/jump_label.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include=
/asm/jump_label.h
> index 2d5c6bec2b4f..93ce3ec25387 100644
> --- a/arch/powerpc/include/asm/jump_label.h
> +++ b/arch/powerpc/include/asm/jump_label.h
> @@ -50,7 +50,7 @@ static __always_inline bool arch_static_branch_jump(str=
uct static_key *key, bool
> 1098:	nop;					\
> 	.pushsection __jump_table, "aw";	\
> 	.long 1098b - ., LABEL - .;		\
> -	FTR_ENTRY_LONG KEY;			\
> +	FTR_ENTRY_LONG KEY - .;			\
> 	.popsection
> #endif
>=20
> --=20
> 2.25.1
>=20

This fixes the issue. Thank you a lot!

Tested-by: Anastasia Kovaleva <a.kovaleva@yadro.com>

Thanks,
Anastasia

