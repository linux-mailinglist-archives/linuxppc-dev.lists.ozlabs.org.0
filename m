Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E427510DFDE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Dec 2019 00:45:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47QSfm1r9pzDqsp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Dec 2019 10:45:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="b7JD4xzY"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47QScs2kPdzDqB3
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Dec 2019 10:43:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575157415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jkl7KGiguLG2F2BNGBb2tCWJx8nARmQpwG0BJG6w1/w=;
 b=b7JD4xzY/1F5lqNSCaX8MjI1tzOdiKpouz/aFyMRKcEpmzAXh9bBRcR7xTDUJ2vHoLruc2
 Jdc4eW1KwBoGH/RfqIRXeJH9QgUeE54m0CB1M+D+HpeT5kmrFfK3JRicucoWIJ3cKfzgQJ
 js7ZKHK3NL7FDBPaXO86uV5+uRlq9Wo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-Wxh3FJrTM_SGni-Ex07_PA-1; Sat, 30 Nov 2019 18:43:34 -0500
Received: by mail-wr1-f70.google.com with SMTP id h7so17980262wrb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 15:43:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=GZtujzr0l0+mKSoRZKHKqRZOXhPQIgHRHg2+rgQiq6o=;
 b=N6V6LXcb5CWjVFFz7nsTx4HlnNPJlDDjmygZInQBBwskMUAhSvduAs67Tr98ETBxj0
 Knkq5cWMesbGTYhPZk751yVrdWVJ4u809k0RCVokBnWr6PiVTlDdkylwNvfwC73g5VO+
 S111hh6pM5jqb95o4EbZe1RkbEoQxvmCg20EozAAAFLeMGqws2s6D/ULaUM/bD237IMn
 dWCGKqE6k0iNCbAkI/vGGCCcmXPtjluukKpPWtTZOAeyveP/27FtPy/cXJ2tstxqZj7L
 lwKbSahPlh9a4TmUC2vsVimUmyOoRbP4u5cNMK0kQ7HpYmm+noO5gy8/i/XW1d40ziYo
 ZDlA==
X-Gm-Message-State: APjAAAUzwtWJcfJd/yN0cKkYfaGYAdeJLBYX3C4XSULhU65uNFkpLKU3
 t/PvqwLARBcLQcmxH2xTPfj6E1jzYbFPPC421eHK3Q9Kj6mMe0d39+UIIrxKAZ054WYPSDgvzMU
 mjxRIbS3fWy37MOJiDy9PuGdVRg==
X-Received: by 2002:a5d:5273:: with SMTP id l19mr62419054wrc.175.1575157413048; 
 Sat, 30 Nov 2019 15:43:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqzSznnfN+3jmLsZgY+C1kSYwtDFwpK47WvO/djSbfp+Zc7QAq2qTE6nSthP6YL+9QmjpK9WrA==
X-Received: by 2002:a5d:5273:: with SMTP id l19mr62419011wrc.175.1575157412819; 
 Sat, 30 Nov 2019 15:43:32 -0800 (PST)
Received: from ?IPv6:2a01:598:b90d:a4d5:5c22:7a2e:3224:745f?
 ([2a01:598:b90d:a4d5:5c22:7a2e:3224:745f])
 by smtp.gmail.com with ESMTPSA id s65sm2523329wmf.48.2019.11.30.15.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Nov 2019 15:43:32 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v6 05/10] mm/memory_hotplug: Shrink zones when offlining
 memory
Date: Sun, 1 Dec 2019 00:43:31 +0100
Message-Id: <E48391B4-79AC-49BD-8C46-E3F711AC402C@redhat.com>
References: <20191130152159.258fa331542fc693e24723eb@linux-foundation.org>
In-Reply-To: <20191130152159.258fa331542fc693e24723eb@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: iPhone Mail (17A878)
X-MC-Unique: Wxh3FJrTM_SGni-Ex07_PA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Halil Pasic <pasic@linux.ibm.com>,
 linux-sh@vger.kernel.org, x86@kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Jun Yao <yaojun8558363@gmail.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Ira Weiny <ira.weiny@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>, Tony Luck <tony.luck@intel.com>,
 Steve Capper <steve.capper@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> Am 01.12.2019 um 00:22 schrieb Andrew Morton <akpm@linux-foundation.org>:
>=20
> =EF=BB=BFOn Sun, 27 Oct 2019 23:45:52 +0100 David Hildenbrand <david@redh=
at.com> wrote:
>=20
>> I think I just found an issue with try_offline_node().=20
>> try_offline_node() is pretty much broken already (touches garbage=20
>> memmaps and will not considers mixed NIDs within sections), however,=20
>> relies on the node span to look for memory sections to probe. So it=20
>> seems to rely on the nodes getting shrunk when removing memory, not when=
=20
>> offlining.
>>=20
>> As we shrink the node span when offlining now and not when removing,=20
>> this can go wrong once we offline the last memory block of the node and=
=20
>> offline the last CPU. We could still have memory around that we could=20
>> re-online, however, the node would already be offline. Unlikely, but=20
>> possible.
>>=20
>> Note that the same is also broken without this patch in case memory is=
=20
>> never onlined. The "pfn_to_nid(pfn) !=3D nid" can easily succeed on the=
=20
>> garbage memmap, resulting in  no memory being detected as belonging to=
=20
>> the node. Also, resize_pgdat_range() is called when onlining memory, not=
=20
>> when adding it. :/ Oh this is so broken :)
>>=20
>> The right fix is probably to walk over all memory blocks that could=20
>> exist and test if they belong to the nid (if offline, check the=20
>> block->nid, if online check all pageblocks). A fix we can then move in=
=20
>> front of this patch.
>>=20
>> Will look into this this week.
>=20
> And this series shows almost no sign of having been reviewed.  I'll hold
> it over for 5.6.
>=20

Makes sense, can=E2=80=98t do anything about it. Btw, this one is the last =
stable patch to fix access of uninitialized memmaps that is not upstream ye=
t... so it has to remain broken for some longer.

