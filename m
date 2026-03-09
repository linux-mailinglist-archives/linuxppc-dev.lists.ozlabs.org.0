Return-Path: <linuxppc-dev+bounces-17910-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN1oGszirmmoJgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17910-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 16:10:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7778023B51D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 16:10:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV0mn0HB6z3bnm;
	Tue, 10 Mar 2026 02:10:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773069000;
	cv=none; b=VGWwRPlKcuJiTVy5LuWRlX077og6wUSGKVIdOlxtdN3s43txGj1wTF/dKp8BY/2CptCwCdwZQ7Hr94rNOe1Q2p8GuYLq1UA4HbtsWGlm7w1/a3HOnG1tD+1pSJ6nrzbwp1vNLsxwxwhl5QeQoT8PAD29SkHZ1LYQT9yNkLNxSu7e+ftylx11c8i/ZwwqpCukKzhg6lBH6yqyPfMz7R21vGDjMpAtkSZ3MJ33iLx+RJs0isgQeEO9WWVLDJxBTpckdJLq5iwYoqvzS1fssgExXm2AsKMyoB22TC94LbhTaEZ42d24+ebIJcHzJK6ChvnDGMJyVXcf/8VikEWG8kAOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773069000; c=relaxed/relaxed;
	bh=woFLTl4MQININgn1l26aXv8v4wFqzDNApNaqLAUyjBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfBbqQVepokx1ST9sP7+RrDCBGwyDGtPEX0WU5sRwBCU+EWB2ceoa2fhR1CsZ6jNx+zY6+4AJakneg8kQHfvPCLkoL8s3DM2nGc/7PbxErSnjcVRt1QmqSg0l+2XVlNwCj1OOnE0DMi8E9mt8FqBy0LgxIeUBP7ohrKOh7RCkxxIKLRdWuuVLJNapii++X+RYl3DE/tpiiNGxYg7YWBRTU4mSgBlicyZenMhKj4odEG7ML1BIRXBNTw5jKzXvZDNKI802/OcfrwdrZWZQIywHeQs2AxoXt81rj7/n4QEsn4g84Qg6ra6XiUiU1yAmeJI1WS6uulmBYTEZue6rO1mEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FJwabNsA; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HXUiD4wJ; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=npache@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FJwabNsA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HXUiD4wJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=npache@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV0ml72DVz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 02:09:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773068995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=woFLTl4MQININgn1l26aXv8v4wFqzDNApNaqLAUyjBk=;
	b=FJwabNsA/zZi5bd/zdcjzjkaftW5QWldXPxAcv5Tm68j7X9YmAmlVKC0w42eg6IlgV7PCi
	fq/wKaRdu8m9FPv4vJZvydAdJ8bonsTEWZvToAc7pw4R51kwZwuNrxJj2KBTFHPcynuUI4
	SIIs5Ct498lIlhG/IWvUurg4tE2hkLk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773068996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=woFLTl4MQININgn1l26aXv8v4wFqzDNApNaqLAUyjBk=;
	b=HXUiD4wJGspCX84729s6vmVTKDibt2w9IXfFOl+3QnB7fe140KImyGcV7N5QY1tthkg025
	MvsWRXSq/gz9/F0USkI+RHRgDjpOZVvzf1hl+WcYyW5RcsfzaA4PSd5RpRNxO4M9rHYHUa
	ioXw+nvHbgitebFybQGhSUsc58g8fyM=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-gbEqvedZMZWkHdacNQRoCQ-1; Mon, 09 Mar 2026 11:09:54 -0400
X-MC-Unique: gbEqvedZMZWkHdacNQRoCQ-1
X-Mimecast-MFC-AGG-ID: gbEqvedZMZWkHdacNQRoCQ_1773068994
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6445cf02fcbso18624013d50.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 08:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068994; x=1773673794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=woFLTl4MQININgn1l26aXv8v4wFqzDNApNaqLAUyjBk=;
        b=oXZsvHNScJQtByFGaxJQnrXp0uuIsQCHBfGz9z7URzMS4cbibK8NhTT9vaZgjWMgqJ
         cFFWoQEMhuM2rR6uP+1kU/fWA7gYSixjogipIDeGtpIJ1OYK8yVOgRLKaaXAK2snvnbS
         XGHxdfQrsE6mwVipd2QpI+S2XQIeFFFbHLRB47jdKwIs39FynFiWuv4/211zbw8ajOM2
         Wl+4wloptRAuI/zVssN7pefAV7XrZVOkNKdHyL9ER8NPcas4crut32oVpjOPkCdbk2Os
         1+j60XN5HwYc4X8r4GhcwrmHSpyImsNqsX5F12mG5OBwVyUr1u0Q/oGPcsE+2X/ORiiU
         tsPA==
X-Forwarded-Encrypted: i=1; AJvYcCWtcaHa4VtAxA/PdVZaFIJP7sqQAx86VxC6IY5cwLv1tFZ+dktpHBK/wo5zcqfy8ulsHVuCPTRwDbxxgdE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzaekivNCy5nkN1IgE5W/ZHJuORuANDEZ9TbG5OZcL+LckMkezn
	Vmw1DjtWRQWdyGYWJkp4GsZwh6Lkl+2K2O7ywFoWK1/2sgj+ZWWC3T50eH1j0maBidDJh1bnqPZ
	lCK9ooQ9ZgkH8gFkZzBA+UwtKa+1n0pdUbhpRCwOhtp/2LReNBAqhhF4uNPjOj8XfdbKTxgTJ2w
	oBJ7b675BmSn/S02jp9plCphZyCXLwFEk9p7T7/2w0zQ==
X-Gm-Gg: ATEYQzwEM3XXx+F6aNEGwH34ih+9loxC+L8xM7b8onbmGgFHEq0+1kGAxqlD5DGrWAz
	27foLF0tPSI7Nw/b4WefYLfCDxRPQ4I5IwucD4UJ7b3r5krsUn2gR3qYqu/8Iz0ZhUXSSjc+uP0
	zPWLcLJRz9Wwfo1bP96YqAYXE7yDVOWyXWTkgxWpTWuCzwtZmwZhgaCXtjHm9lrxjb8kvs32bki
	HEf
X-Received: by 2002:a53:858a:0:b0:646:7062:22ad with SMTP id 956f58d0204a3-64d1427cc45mr8678494d50.46.1773068993934;
        Mon, 09 Mar 2026 08:09:53 -0700 (PDT)
X-Received: by 2002:a53:858a:0:b0:646:7062:22ad with SMTP id
 956f58d0204a3-64d1427cc45mr8678430d50.46.1773068993292; Mon, 09 Mar 2026
 08:09:53 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20260226113233.3987674-1-usama.arif@linux.dev>
 <20260226113233.3987674-13-usama.arif@linux.dev> <CAA1CXcDyqPPwf_-W7B+PFQtL8HdoJGCEqVsVxq7DhOUB=L4PQA@mail.gmail.com>
 <6982e9fc-cc17-4d4f-b26e-83997c4bf070@linux.dev>
In-Reply-To: <6982e9fc-cc17-4d4f-b26e-83997c4bf070@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Mon, 9 Mar 2026 09:09:26 -0600
X-Gm-Features: AaiRm50M7EsyVTjUp3ZumpjEiav95f1tL1iFQKYgAgTcPXxEsX1_R8rjMYvu9Fs
Message-ID: <CAA1CXcCb6aZnjgtunEuwL380S-2re9N-AEjZUB+XO9G6gkrHQw@mail.gmail.com>
Subject: Re: [RFC v2 12/21] mm: thp: handle split failure in device migration
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, lorenzo.stoakes@oracle.com, 
	willy@infradead.org, linux-mm@kvack.org, fvdl@google.com, hannes@cmpxchg.org, 
	riel@surriel.com, shakeel.butt@linux.dev, kas@kernel.org, baohua@kernel.org, 
	dev.jain@arm.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, 
	ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>, lance.yang@linux.dev, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, linux-s390@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pTLAlmoq-Vpe5TTPc6lgsIjL1cKX44oCV0HZMu84wA8_1773068994
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 7778023B51D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:usama.arif@linux.dev,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@kernel.org,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[npache@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-17910-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[npache@redhat.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.dev:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 9:55=E2=80=AFAM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
>
>
> On 02/03/2026 21:20, Nico Pache wrote:
> > On Thu, Feb 26, 2026 at 4:34=E2=80=AFAM Usama Arif <usama.arif@linux.de=
v> wrote:
> >>
> >> Device memory migration has two call sites that split huge PMDs:
> >>
> >> migrate_vma_split_unmapped_folio():
> >>   Called from migrate_vma_pages() when migrating a PMD-mapped THP to a
> >>   destination that doesn't support compound pages.  It splits the PMD
> >>   then splits the folio via folio_split_unmapped().
> >>
> >>   If the PMD split fails, folio_split_unmapped() would operate on an
> >>   unsplit folio with inconsistent page table state.  Propagate -ENOMEM
> >>   to skip this page's migration. This is safe as folio_split_unmapped
> >>   failure would be propagated in a similar way.
> >>
> >> migrate_vma_insert_page():
> >>   Called from migrate_vma_pages() when inserting a page into a VMA
> >>   during migration back from device memory.  If a huge zero PMD exists
> >>   at the target address, it must be split before PTE insertion.
> >>
> >>   If the split fails, the subsequent pte_alloc() and set_pte_at() woul=
d
> >>   operate on a PMD slot still occupied by the huge zero entry.  Use
> >>   goto abort, consistent with other allocation failures in this functi=
on.
> >>
> >> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> >> ---
> >>  mm/migrate_device.c | 16 ++++++++++++++--
> >>  1 file changed, 14 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> >> index 78c7acf024615..bc53e06fd9735 100644
> >> --- a/mm/migrate_device.c
> >> +++ b/mm/migrate_device.c
> >> @@ -909,7 +909,13 @@ static int migrate_vma_split_unmapped_folio(struc=
t migrate_vma *migrate,
> >>         int ret =3D 0;
> >>
> >>         folio_get(folio);
> >
> > Should we be concerned about this folio_get? Are we incrementing a
> > reference that was already held if we back out of the split?
> >
> > -- Nico
>
>
>
> Hi Nico,
>
> Thanks for pointing this out. It spun out to an entire investigation for =
me [1].

Hey Usama,

I'm sorry my question lead you down a rabbit hole but I'm glad you did
the proper investigation and found the correct answer :) Thanks for
looking into it and for clearing that up via a comment!

Cheers,
-- Nico

>
> Similar to [1], I inserted trace prints [2] and created a new __split_hug=
e_pmd2
> that always returns -ENOMEM. Without folio_put on error [3], we get a ref=
count of 2.
>
>        hmm-tests-129     [000] .l...     1.485514: __migrate_device_final=
ize: FINALIZE[0]: src=3Dffb48827440e8000 dst=3Dffb48827440e8000 src=3D=3Dds=
t=3D1 refcount_src=3D2 mapcount_src=3D0 order_src=3D9 migrate=3D0 BEFORE re=
move_migration_ptes
>        hmm-tests-129     [000] .l...     1.485517: __migrate_device_final=
ize: FINALIZE[0]: src=3Dffb48827440e8000 refcount=3D3 mapcount=3D1 AFTER re=
move_migration_ptes
>        hmm-tests-129     [000] .l...     1.485518: __migrate_device_final=
ize: FINALIZE[0]: src=3Dffb48827440e8000 refcount=3D2 AFTER folio_put(src)
>
>
> With folio_put on error [4], we get a refcount of 1.
>
>        hmm-tests-129     [001] .....     1.492216: __migrate_device_final=
ize: FINALIZE[0]: src=3Dfff7b8be840f0000 dst=3Dfff7b8be840f0000 src=3D=3Dds=
t=3D1 refcount_src=3D1 mapcount_src=3D0 order_src=3D9 migrate=3D0 BEFORE re=
move_migration_ptes
>        hmm-tests-129     [001] .....     1.492219: __migrate_device_final=
ize: FINALIZE[0]: src=3Dfff7b8be840f0000 refcount=3D2 mapcount=3D1 AFTER re=
move_migration_ptes
>        hmm-tests-129     [001] .....     1.492220: __migrate_device_final=
ize: FINALIZE[0]: src=3Dfff7b8be840f0000 refcount=3D1 AFTER folio_put(src)
>
>
> So we need folio_put for split_huge_pmd_address failure, but NOT for
> folio_split_unmapped.
>
>
> [1] https://lore.kernel.org/all/332c9e16-46c3-4e1c-898e-2cb0a87ba1fc@linu=
x.dev/
> [2] https://gist.github.com/uarif1/6abe4bedb85814e9be8d48a4fe742b41
> [3] https://gist.github.com/uarif1/f718af2113bc1a33484674b61b9dafcc
> [4] https://gist.github.com/uarif1/03c42f2549eaf2bc555e8b03e07a63c8
>


