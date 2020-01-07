Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EBB13214D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 09:22:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sQND3ynQzDqJg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 19:22:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zytor.com (client-ip=198.137.202.136; helo=mail.zytor.com;
 envelope-from=hpa@zytor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=zytor.com
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sQLP2W7BzDqHx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 19:20:45 +1100 (AEDT)
Received: from [IPv6:2601:646:8600:3281:c17a:5ef:6afe:4c48]
 ([IPv6:2601:646:8600:3281:c17a:5ef:6afe:4c48]) (authenticated bits=0)
 by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id 0078K3ZN3264752
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 7 Jan 2020 00:20:03 -0800
Authentication-Results: mail.zytor.com;
 dkim=permerror (bad message/signature format)
From: "H. Peter Anvin" <hpa@zytor.com>
Message-Id: <202001070820.0078K3ZN3264752@mail.zytor.com>
Date: Tue, 07 Jan 2020 00:19:53 -0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAK8P3a17GshP1KmCpvCkWGDGJLC_JrGUFQZTLbfe5+sSwTjyxw@mail.gmail.com>
References: <20200102145552.1853992-1-arnd@arndb.de>
 <20200102145552.1853992-3-arnd@arndb.de> <87woa410nx.fsf@mpe.ellerman.id.au>
 <CAK8P3a17GshP1KmCpvCkWGDGJLC_JrGUFQZTLbfe5+sSwTjyxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 02/22] compat: provide compat_ptr() on all architectures
To: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 Paul Burton <paulburton@kernel.org>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 linuxppc-dev@zytor.com, Robert Richter <rric@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<linuxppc-dev@lists.ozlabs.org>,oprofile-list@lists.sf.net,linux-s390 <linux-s390@vger.kernel.org>,sparclinux <sparclinux@vger.kernel.org>
From: hpa@zytor.com
Message-ID: <41625F06-D755-4C82-86DF-A9415FEEE13D@zytor.com>

On January 7, 2020 12:08:31 AM PST, Arnd Bergmann <arnd@arndb=2Ede> wrote:
>On Tue, Jan 7, 2020 at 3:05 AM Michael Ellerman <mpe@ellerman=2Eid=2Eau>
>wrote:
>> Arnd Bergmann <arnd@arndb=2Ede> writes:
>> > +
>> > +static inline compat_uptr_t ptr_to_compat(void __user *uptr)
>> > +{
>> > +     return (u32)(unsigned long)uptr;
>> > +}
>>
>> Is there a reason we cast to u32 directly instead of using
>compat_uptr_t?
>
>Probably Al found this to be more explicit at the time when he
>introduced
>it on all the architectures in 2005=2E I just moved it here and kept the
>definition=2E
>
>       Arnd

Did compat_uptr_t exist back then?
--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
