Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D5D5A3130
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 23:38:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDtVL0fphz3c7D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 07:38:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eDfsmGrE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eDfsmGrE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eDfsmGrE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eDfsmGrE;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDtTZ4y4Qz305p
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Aug 2022 07:37:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661549837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KrAZmGrG6kDDNuHo11ICMD83hxyjEivX/cg1A87nKw=;
	b=eDfsmGrEaii37QWWfsz/Vty7cHjlikpKY1TkM3JJhPWrNke2XmpVTwWJIFoTuUtFQjl3yi
	8DxsyeyUqki4apAsbOC5DbDi8sbS6OR7vc3RNMZI+VUaBrk17iKvZy1FQNjGPw85t2dV3s
	9r/tH7pC2kYumgwYY8MNZWYRK0h3KlI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661549837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KrAZmGrG6kDDNuHo11ICMD83hxyjEivX/cg1A87nKw=;
	b=eDfsmGrEaii37QWWfsz/Vty7cHjlikpKY1TkM3JJhPWrNke2XmpVTwWJIFoTuUtFQjl3yi
	8DxsyeyUqki4apAsbOC5DbDi8sbS6OR7vc3RNMZI+VUaBrk17iKvZy1FQNjGPw85t2dV3s
	9r/tH7pC2kYumgwYY8MNZWYRK0h3KlI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-168-j3NmtdzaOBKeBZJ0YqyiaQ-1; Fri, 26 Aug 2022 17:37:15 -0400
X-MC-Unique: j3NmtdzaOBKeBZJ0YqyiaQ-1
Received: by mail-qk1-f197.google.com with SMTP id w17-20020a05620a425100b006b97978c693so2189485qko.19
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 14:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=2KrAZmGrG6kDDNuHo11ICMD83hxyjEivX/cg1A87nKw=;
        b=g991GLZVlBLg3siVl0dYdjgpQ+el1rQ1HyfwozyiV7madg690rN/40Jo69u8PwG5O4
         Hk5Dt/XowG+xrLFV7UUdEPqt/5cDN3GgO44TwL8TVXTYRda/9FhY2ZDDO5lforcQ0aaF
         PRsA8HY7iO18Q4VE7k4jLjARoVzhyhLdderLLWbanyDC5D5ODGIFv1N/2sU/NskF6dG/
         km0JDBSdzjuRb9Q1m6BZwQIAGGq5pQyvbpfZikrGF+TF6yyrLDekvmrH1CPJNw5R0RF4
         2I9sBmz6GzbCdNIaFnrgH+7ii57VzNk/WIKAxSnMcVOq9IxoxugL2bRqRBrVAxfm9+zN
         7Tew==
X-Gm-Message-State: ACgBeo3Gpg0iEA/wcklgXThVuO1/8t3HGasI7T5OWzctBXzdp24PWbem
	xfBOetc/feGOarwjoa7IMYGU38rcQiBOYnhHqfmSpFPFhGeMN/Y43vAFzORcPTxrEy/YGU4V6P1
	Deu9qy55yoCtwRszJn4VYBWeCKA==
X-Received: by 2002:a05:6214:e6c:b0:476:a4bd:2b95 with SMTP id jz12-20020a0562140e6c00b00476a4bd2b95mr1312602qvb.25.1661549835160;
        Fri, 26 Aug 2022 14:37:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR53is4ixbz7h41Wx5XIm184jiaZL8HsGwhTwAJEHRIbbpDPLRMqX963knWH+clH/uGR3aknhA==
X-Received: by 2002:a05:6214:e6c:b0:476:a4bd:2b95 with SMTP id jz12-20020a0562140e6c00b00476a4bd2b95mr1312571qvb.25.1661549834906;
        Fri, 26 Aug 2022 14:37:14 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id h1-20020a05620a400100b006bbe7ded98csm554339qko.112.2022.08.26.14.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 14:37:14 -0700 (PDT)
Date: Fri, 26 Aug 2022 17:37:12 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 2/3] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <Ywk9CKIJMX3z6WIq@xz-m1.local>
References: <3b01af093515ce2960ac39bb16ff77473150d179.1661309831.git-series.apopple@nvidia.com>
 <ffbc824af5daa2c44b91c66834a341894fba4ce6.1661309831.git-series.apopple@nvidia.com>
 <YwZGHyYJiJ+CGLn2@xz-m1.local>
 <8735dkeyyg.fsf@nvdebian.thelocal>
 <YwgFRLn43+U/hxwt@xz-m1.local>
 <8735dj7qwb.fsf@nvdebian.thelocal>
 <YwjZamk4n/dz+Y/M@xz-m1.local>
 <72146725-3d70-0427-50d4-165283a5a85d@redhat.com>
 <Ywjs/i4kIVlxZwpb@xz-m1.local>
 <140e7688-b66d-2f6d-fed8-e39da5045420@redhat.com>
MIME-Version: 1.0
In-Reply-To: <140e7688-b66d-2f6d-fed8-e39da5045420@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Huang Ying <ying.huang@intel.com>, Ralph Campbell <rcampbell@nvidia.com>, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 26, 2022 at 06:46:02PM +0200, David Hildenbrand wrote:
> On 26.08.22 17:55, Peter Xu wrote:
> > On Fri, Aug 26, 2022 at 04:47:22PM +0200, David Hildenbrand wrote:
> >>> To me anon exclusive only shows this mm exclusively owns this page. I
> >>> didn't quickly figure out why that requires different handling on tlb
> >>> flushs.  Did I perhaps miss something?
> >>
> >> GUP-fast is the magic bit, we have to make sure that we won't see new
> >> GUP pins, thus the TLB flush.
> >>
> >> include/linux/mm.h:gup_must_unshare() contains documentation.
> > 
> > Hmm.. Shouldn't ptep_get_and_clear() (e.g., xchg() on x86_64) already
> > guarantees that no other process/thread will see this pte anymore
> > afterwards?
> 
> You could have a GUP-fast thread that just looked up the PTE and is
> going to pin the page afterwards, after the ptep_get_and_clear()
> returned. You'll have to wait until that thread finished.

IIUC the early tlb flush won't protect concurrent fast-gup from happening,
but I think it's safe because fast-gup will check pte after pinning, so
either:

  (1) fast-gup runs before ptep_get_and_clear(), then
      page_try_share_anon_rmap() will fail properly, or,

  (2) fast-gup runs during or after ptep_get_and_clear(), then fast-gup
      will see that either the pte is none or changed, then it'll fail the
      fast-gup itself.

> 
> Another user that relies on this interaction between GUP-fast and TLB
> flushing is for example mm/ksm.c:write_protect_page()
> 
> There is a comment in there explaining the interaction a bit more detailed.
> 
> Maybe we'll be able to handle this differently in the future (maybe once
> this turns out to be an actual performance problem). Unfortunately,
> mm->write_protect_seq isn't easily usable because we'd need have to make
> sure we're the exclusive writer.
> 
> 
> For now, it's not too complicated. For PTEs:
> * try_to_migrate_one() already uses ptep_clear_flush().
> * try_to_unmap_one() already conditionally used ptep_clear_flush().
> * migrate_vma_collect_pmd() was the one case that didn't use it already
>  (and I wonder why it's different than try_to_migrate_one()).

I'm not sure whether I fully get the point, but here one major difference
is all the rest handles one page, so a tlb flush alongside with the pte
clear sounds reasonable.  Even if so try_to_unmap_one() was modified to use
tlb batching, but then I see that anon exclusive made that batching
conditional.  I also have question there on whether we can keep using the
tlb batching even with anon exclusive pages there.

In general, I still don't see how stall tlb could affect anon exclusive
pages on racing with fast-gup, because the only side effect of a stall tlb
is unwanted page update iiuc, the problem is fast-gup doesn't even use tlb,
afaict..

Thanks,

-- 
Peter Xu

