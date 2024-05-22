Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id C175D8CC8DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 00:11:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EyAZPkbn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f98ofxC5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vl51f4RBYz78fS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 08:04:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EyAZPkbn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f98ofxC5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vl50s4hK7z3gHX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 08:03:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716415417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B4hXJ6JIsSVK9s0rSIg6c+3f6ReWIevwF2URwvf4CAk=;
	b=EyAZPkbnwMMpLVdIhZR0oiTg/LhyUJYXcBgHQ83BhVmYfhsmkkhhFdnS6S9e4egjl0epml
	a0p/hv5qpxY4cyNTjEBJwS9qHVBSU4mRYEw5c43+PnrNIboCA7TcP68VzzXI4LJGMfdULd
	XSnKqL/Czf4tdvZPyStYYIoqcKOogEE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716415418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B4hXJ6JIsSVK9s0rSIg6c+3f6ReWIevwF2URwvf4CAk=;
	b=f98ofxC5ZKyBMIzg+UVWA2R4Y4ha6TZMNYXePKksOaB2plYcL3un3BhoZbxu7jcbRjtXef
	/A1IHD6dFVXVXUYGPtm5FqZ2s+GPYlyKNcLZ3BQv0tiebcU7pwaBCadEG/3FYW5hRTE2av
	olN06MOme20RGIhDLD7BEpM8ZCY2apk=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-SFu9LIu6MFKaiCKvfo5qVw-1; Wed, 22 May 2024 18:03:36 -0400
X-MC-Unique: SFu9LIu6MFKaiCKvfo5qVw-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-5b2aed7f9daso151322eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 15:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716415415; x=1717020215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4hXJ6JIsSVK9s0rSIg6c+3f6ReWIevwF2URwvf4CAk=;
        b=EnwoIel4dXZccQVnfrfHo9zqUd3Ma56b4GUuy1CPrffKwKhJtLnwEWOiIaqD/RFNsy
         piuKkEXtozsYipB4NsvGTAALS+2z7YQ14xutcNvJT0YUVM3sUz/Cn/KiXq/wWcEXpZjl
         93xuQdDvmxPoY+F7eEUhZqL9nse8rRWjQYKetpez3gcG0yjIi8oWAF9v/virPl1nbIVC
         86l7lvBhyu0h9bAasqoxKRx7iCl7iaqToxN141VPxgD4U90NrDXc5wdEfXg3jcjvYPoS
         C0INDk7T6LtFND2GGRaDS2jdLOkX+xi1LmgtDb082WGG21kelPGXTxcjRv7FIFN+hfB9
         3+Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWbZRyV1d6hq9zd0PYL3A2VtBasx9JT15b3XJurAJgY4h6k6ITXK/d0UN6gdOnqHv19BmgkZy4MRayONlK9NVBguW+aNTHGpRYfbDa2dw==
X-Gm-Message-State: AOJu0YxJPVLi8AyuWWTU2vAFwqqJdl76PHahFnjlUMWnEEAOy7UspxZU
	+vbY+ijZFjN34n/KxjwugOdjI9Ga8kBbhnGQDlNcGwbCquQaDqzIUCb48M39ilZ4sOzG5FESAH1
	PAe2ZDpm+eG9Re+u220SWziGMnRn9i4NI6iA6ZVtTlhfYW4pVGCquBiCQOy13sW8=
X-Received: by 2002:a05:6358:998a:b0:190:f30c:3856 with SMTP id e5c5f4694b2df-1979215b528mr285580855d.2.1716415415141;
        Wed, 22 May 2024 15:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlZSZyKnZdnEG0+pNanazMyIfCqIlp5QZYYe1QG8gY0ave2/OHUyQlsME1+uHDBoxePLQG5g==
X-Received: by 2002:a05:6358:998a:b0:190:f30c:3856 with SMTP id e5c5f4694b2df-1979215b528mr285573755d.2.1716415414181;
        Wed, 22 May 2024 15:03:34 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1cd266sm136937796d6.80.2024.05.22.15.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 15:03:33 -0700 (PDT)
Date: Wed, 22 May 2024 18:03:30 -0400
From: Peter Xu <peterx@redhat.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker
 poison errors
Message-ID: <Zk5rsvMs6qVPAw52@x1n>
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com>
 <20240515104142.GBZkSRZsa3cxJ3DKVy@fat_crate.local>
 <ZkSUaVx3uCIPkpkJ@localhost.localdomain>
 <CAJHvVchGGJkEX=qroW=+N-RJDMDGuxM4xoGe7iOtRu9YcfxEEw@mail.gmail.com>
 <20240515183222.GCZkT_tvEffgYtah4T@fat_crate.local>
 <CAJHvVcj+YBpLbjLy+M+b8K7fj0XvFSZLpsuY-RbCCn9ouV1WjQ@mail.gmail.com>
 <20240515201831.GDZkUYlybfejSh79ix@fat_crate.local>
MIME-Version: 1.0
In-Reply-To: <20240515201831.GDZkUYlybfejSh79ix@fat_crate.local>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, Oscar Salvador <osalvador@suse.de>, Liu Shixin <liushixin2@huawei.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2024 at 10:18:31PM +0200, Borislav Petkov wrote:
> So if I were to design this, I'd do it this way:
> 
> 0. guest gets hw poison injected
> 
> 1. it runs memory_failure() and it kills the processes using the page.
> 
> 2. page is marked poisoned on the host so no other guest gets it.
> 
> That's it. No second accesses whatsoever. At least this is how it works
> on baremetal.
> 
> This hw poisoning emulation is just silly and unnecessary.

We (QEMU) haven't yet consumed this.. but I think it makes sense to have
such emulation, as it's slightly different from a real hwpoison.

I think the important bit that's missing in this picture is migration, that
the VM can migrate from one host to another, carrying that poisoned PFN.

Let's assume we have two hosts: src and dst.  Currently VM runs on src
host.

Before migration, there is a real PFN that is bad, MCE injected. When
accesssed by either guest vcpu or host cpu / hypervisor, VM gets killed.
This is so far the same to any process that has a bad page.

However it's possible a VM got migrated _before_ that bad PFN accessed, in
this case the VM is still legal to run, the hypervisor will not migrate
that bad PFN data knowing that its data is invalid.  What it does is it'll
tell dst that "this guest PFN is bad, if guest access it let's crash it".
Then what dst host needs is a way to describe "this guest PFN is bad": the
easiest way is to describe "this VA of the process is bad", meanwhile
there'll be no real page backing that VA anyway, and also no real poisoned
pages.  We want to poison a VA only. That's why an emulation is needed.
Besides that we want to get exactly whatever we'll get for a real hwpoison,
e.g. SIGBUS with the address encoded, then KVM work naturally with that
just like a real MCE.

One other thing we can do is to inject-poison to the VA together with the
page backing it, but that'll pollute a PFN on dst host to be a real bad PFN
and won't be able to be used by the dst OS anymore, so it's less optimal.

Thanks,

-- 
Peter Xu

