Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D101BBE2E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 14:51:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BM2W75XTzDqq0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 22:50:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.15.14; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=Ub28NzMS; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BM090PFYzDqC9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 22:48:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1588078121;
 bh=cVRxkewCwLbyGmT+e+SDme+h7qxwhmCuxLtN1DGzOx8=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=Ub28NzMS2FRTeoViFQirC6cYlXTEBtDYvz7s2g0jiJoeu5lGOaebPeRegnFJ9OSv4
 1oqggg4pubTcVb/lLkM65jlMtIoCshmDWSUY6G/jzwnvwFEofJJD8reOAkdsSQSIln
 U0gFYACB4EQ74hegSNV1o4k5seVN0pH5H0aES8ME=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.179.255]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M09eO-1jAvRM3dcK-00uK2a; Tue, 28
 Apr 2020 14:48:40 +0200
To: Raghavendra Rao Ananta <rananta@codeaurora.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] tty: hvc: Fix data abort due to race in hvc_open
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <831bf548-a461-6160-f878-ee0f4c5c311b@web.de>
Date: Tue, 28 Apr 2020 14:48:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MMV+XvpaLIeRZ2eZZYodlSVmMQSZbSkKlQhZbckuLNjsHQNTRXN
 yrzo6yoJrUfsms49+ojGNJ8NPsb948KRzoPpV60VnsUDtuSdJPLk1bePk+O3nQbfVS9W6q3
 Ukz3nyz2HArTli7LWdhA8Kz4uQU5+IbTAeMh5jzAC19h7yCJl9LFh3VEwAxTdUj2QKGrwoL
 EtVZNnELnM41TAr/A8KBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NqLrGmxt7C4=:DNfRtqesgPfJMm0w887iik
 2WcPVD5XtsOqqj+8nLVXocTFRIG/JN5430GowEHjXX9c5lN30OZ4m7YzgpzMrzaSg7wKeB56j
 ShSKF62/srEDPRksjK0V7FAg5lx3YD7br9i06q8vCKzy0R6Hbnd8ZGibq56Y4NqUPSD7+JXq9
 FB5eWGuY4vArc0xAw4/q+OhoEwo/gUbCMoUTarixDGJFsNhNXq8zN8Muj0fmpRvBhgbZmSr1A
 nh6pnuc8jQPClinBH1RhapgGbffw+MZgUbgQNxzd1VE1EqlEXbOfmmnUHct61E3cG7GAD58ci
 Dx1b1f1g898NrvpFUo3MnDaVSeUnwsaKljS+wYf/9z8AJCwMAtQqdTLukicmSLvKQWsfKt/d7
 rcFNWSXio/vZOiS5RLePe7k6aoesDtpnNsS/OPJ8dRl3XZUrMZxgDzbea3qKztS0qHpv72QPt
 MhZJtlcZvdQi2U9QDDxQXHh/K/ZoyJyPkpbDjNHRLG/xvCcfuxwOT7PUlzP1GtK0YrB7DWPlx
 fjnGLpDKzxJwtI47cG42iMMu8THLI6flHi7B+rLHqvR6Nxh7zkcfwJu9XuB+CiJ4qQSsusDTR
 IELtmv/AoAlnT+4S47BX/gRAzz7NGj4HHXliNzZTNcbo9c+X0v/PMVyhK0l2lcpY92HVn5RMy
 KXCTMudALM7Y4LCy/g548LCMoT0a+oZUU8mC7OkIuX3RwfDE1uVcW9pEyu2srNGfaXGMaSkQX
 XmqA6ze+2dMfXdCW4ZQCtVVeZlHqWJiHVglo4twMTn7SVFu0wR+RKQ7VTe8fFm3dvbqX55nK0
 UULXEwYQYfqmGAteiVa1kV6rsO/xk162wYdd/O9S5jE4nuzqEJdQ7OfMO/mBZPaQwXMpXqgbF
 bOTwQoNKk163APhX38R4JVx3gmpXE6j7wAEsqKQwD0kh2XlE8H9blFQbszvWROjKKpr7CNjrt
 5s8FBKhfAxWwHqE9DCDvMIjC31DZdIJr1JdXYE/j220DnSNkaZ+No/San8gE18X60EpYWyKtt
 SlbMDOfSR+i400kAjN2jEX45k2yq8U3gORt11Uzmh6wlez4ux5xurBbCbO1/GJT+QFxRK6mk/
 BdlQPbbZGwCnlfWZXM982JgKCdcrb+LMLBplQfqTozwMiQ/baJzz1MHn5PBoHCFotYauEg5xc
 DAaoo79aneMvxB4PC0l5WGsxx5SrvELkHMEVn8vXWNfgqPtD/UJYwJXZihWL2a5TBlF42r1tn
 EaPoWRPC/Wg7MoaIH
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Melnychenko <andrew@daynix.com>, linux-kernel@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Hence, serialize hvc_open and check if tty->private_data is NULL before
> proceeding ahead.

How do you think about to add the tag =E2=80=9CFixes=E2=80=9D because of a=
djustments
for the data synchronisation?


=E2=80=A6
> +++ b/drivers/tty/hvc/hvc_console.c
=E2=80=A6
@@ -384,6 +394,8 @@ static int hvc_open(struct tty_struct *tty, struct fil=
e * filp)
=E2=80=A6
> +out:
> +	mutex_unlock(&hvc_open_mutex);
>  	return rc;
>  }

I suggest to use the label =E2=80=9Cunlock=E2=80=9D instead.

Regards,
Markus
