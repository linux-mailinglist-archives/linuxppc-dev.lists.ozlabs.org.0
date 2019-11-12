Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E52CF8DC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 12:15:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C4sb43CWzF44m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 22:15:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="eUwvgUmr"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C4pp4qDTzF4vb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 22:12:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573557167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W3PEu9PMd6wjgZQNkF16X/qfYEYHiI0Z6LSjl5AT7m0=;
 b=eUwvgUmr11vdSwuTT9RUxbxbS2vw+czJZAFLc8o6iR8IogjaqZLxrtJdxor6C/EIVo29oD
 xYo/4TqrbsEYaO9KJ6mMw3PIi9TKXQ8rSCfieG5Bqwd8AsFt+Rksgjjvk98F5/FaSPuTHT
 pInvBn+3dmQUOGq76EfS7npr10LnClQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-oSJ5nlNEOHm2NUCwYyxvlA-1; Tue, 12 Nov 2019 06:12:43 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 941C6800C72;
 Tue, 12 Nov 2019 11:12:40 +0000 (UTC)
Received: from [10.36.117.126] (ovpn-117-126.ams2.redhat.com [10.36.117.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6141600C4;
 Tue, 12 Nov 2019 11:12:34 +0000 (UTC)
Subject: Re: [PATCH v1 08/12] powerpc/pseries: CMM: Implement balloon
 compaction
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
References: <20191031142933.10779-1-david@redhat.com>
 <20191031142933.10779-9-david@redhat.com>
 <be7c1424-f240-b72c-8d6d-310ebbd816e1@redhat.com>
 <87blth2wyk.fsf@mpe.ellerman.id.au>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <8e46b1c5-f52b-0155-4d4f-e3bbdea95384@redhat.com>
Date: Tue, 12 Nov 2019 12:12:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <87blth2wyk.fsf@mpe.ellerman.id.au>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: oSJ5nlNEOHm2NUCwYyxvlA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
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
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Oliver O'Halloran <oohall@gmail.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Gao Xiang <xiang@kernel.org>,
 Greg Hackmann <ghackmann@google.com>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Arun KS <arunks@codeaurora.org>,
 Paul Mackerras <paulus@samba.org>, Allison Randal <allison@lohutok.net>,
 Christian Brauner <christian@brauner.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrew Morton <akpm@linux-foundation.org>, Todd Kjos <tkjos@google.com>,
 linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12.11.19 11:46, Michael Ellerman wrote:
> David Hildenbrand <david@redhat.com> writes:
>> On 31.10.19 15:29, David Hildenbrand wrote:
>>> We can now get rid of the cmm_lock and completely rely on the balloon
>>> compaction internals, which now also manage the page list and the lock.
> ...
>>> +
>>> +static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
>>> +=09=09=09   struct page *newpage, struct page *page,
>>> +=09=09=09   enum migrate_mode mode)
>>> +{
>>> +=09unsigned long flags;
>>> +
>>> +=09/*
>>> +=09 * loan/"inflate" the newpage first.
>>> +=09 *
>>> +=09 * We might race against the cmm_thread who might discover after ou=
r
>>> +=09 * loan request that another page is to be unloaned. However, once
>>> +=09 * the cmm_thread runs again later, this error will automatically
>>> +=09 * be corrected.
>>> +=09 */
>>> +=09if (plpar_page_set_loaned(newpage)) {
>>> +=09=09/* Unlikely, but possible. Tell the caller not to retry now. */
>>> +=09=09pr_err_ratelimited("%s: Cannot set page to loaned.", __func__);
>>> +=09=09return -EBUSY;
>>> +=09}
>>> +
>>> +=09/* balloon page list reference */
>>> +=09get_page(newpage);
>>> +
>>> +=09spin_lock_irqsave(&b_dev_info->pages_lock, flags);
>>> +=09balloon_page_insert(b_dev_info, newpage);
>>> +=09balloon_page_delete(page);
>>
>> I think I am missing a b_dev_info->isolated_pages-- here.
>=20
> I don't know this code at all, but looking at other balloon drivers they
> do seem to do that in roughly the same spot.
>=20
> I'll add it, how can we test that it's correct?

It's certainly correct. We increment when we isolate=20
(balloon_page_isolate()) and decrement when we un-isolate.

Un-isolate happens when we putback a isolated page=20
(balloon_page_putback() - migration aborted) or when we successfully=20
migrate it (via balloon_page_migrate()).

The issue is that we cannot decrement in balloon_page_migrate(), as we=20
have to hold the b_dev_info->pages_lock. That's why we have to do it in=20
the registered callback under lock.

Please note that b_dev_info->isolated_pages is only needed for a sanity=20
check in balloon_page_dequeue(). That's why I didn't notice during=20
testing. I wonder if we should at some point rip out that sanity check ...

Thanks and cheers!

>=20
> cheers
>=20


--=20

Thanks,

David / dhildenb

