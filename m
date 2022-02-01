Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD2D4A633E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 19:08:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpCbk1YXgz3bPS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 05:08:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F9Dj3Poh;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bg03rr/b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=dgilbert@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=F9Dj3Poh; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bg03rr/b; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpCZx6C8Mz30jP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 05:07:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643738868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WbBlRRySTSYfyiFCmjcFdtwLEhU3rffLIxhLq8iPqzY=;
 b=F9Dj3PohgOi1IolFwY3vNwIpr8JQPW/iIzkunf12z8TkMY2uDKGja89qOdsGyLQrjBjLu9
 6z2JaGaryIaVYI8UPGBF/bi5+abSmn9ucB4rS92m1PEYwANj8unJ4Pikl1M7WR7I3cgEea
 69tpgvCWptlOl+/ugljRE3QTwu0JFzE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643738869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WbBlRRySTSYfyiFCmjcFdtwLEhU3rffLIxhLq8iPqzY=;
 b=Bg03rr/bnAfcb46AjxD49Hb6HG/SRJgkRIdvcsLvAnYm5FWwxH3FWZ1/NPO/b9RNBoZYny
 mlv59w17ApwtXigYXNnw/kpprS2ZpNTxyT9Wr7uNv9Oc+FLWtXm+ooL7xqcyqG8ftOJDA5
 4oLE4nweUFQqgC9ncn9dSG58kyxRW48=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-wkjVkCnvOnao1-JH3ilGXw-1; Tue, 01 Feb 2022 13:07:46 -0500
X-MC-Unique: wkjVkCnvOnao1-JH3ilGXw-1
Received: by mail-wm1-f71.google.com with SMTP id
 s1-20020a1ca901000000b0034ece94dd8cso2042134wme.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 10:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WbBlRRySTSYfyiFCmjcFdtwLEhU3rffLIxhLq8iPqzY=;
 b=H5rh8Lu8gP9Dlp7mzedyw8DGPEUuxjMzIsAmAKrMP/9VNCmwM1VUduFxyzYwrPEQ9H
 hSSufZeh8X1Xp0pvteE4EoXlRiJPGqg7BxHN9ZxlVWo5W8WAQ9LGH536XmnLtGMMH8ba
 oYsxYqYqlzPEw0mDT0zz5H+mJOUBkKOrSnARNwos0CWCpEI7gChyPyhnyBldR/F+fy4Z
 IY3Nj4MPlYPFmoZa31rAQEvsbh6CT0XVBE6trWUkfcSIvFfDp373BqI4eQl864w072Ck
 wWo6U07LlFC1cXRb7xT6soYHqMIO7SQNkErrBuE5yGXLnsgB/6PwBco1xhTR4NVp+3oE
 JiUA==
X-Gm-Message-State: AOAM531lMaC40+HaIv6nWhTBwYfjzmfltGfNyfM+McjZnUiLHvuYkdpU
 FnkKE/13LX9DTaZDYxyAGwdvP3zB4YjBgHqM6Vm+Lfjp/3PRCqgesSSV581mK/nrmTYHfDfKL2Y
 UmSeqsY6sZcIIa3f1umLApB55rA==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr2411056wro.413.1643738865327; 
 Tue, 01 Feb 2022 10:07:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEMGb5gkaJl9q84gkPJPKSY0nbPh9TUR5tTp3lEGzAv+bm64PK8deuOj2kLWisFBBgOydY2Q==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr2411018wro.413.1643738864991; 
 Tue, 01 Feb 2022 10:07:44 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o14sm17659694wry.104.2022.02.01.10.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:07:44 -0800 (PST)
Date: Tue, 1 Feb 2022 18:07:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH v7 0/5] Allow guest access to EFI confidential computing
 secret area
Message-ID: <Yfl27cDpAUYy59ss@work-vm>
References: <20220201124413.1093099-1-dovmurik@linux.ibm.com>
 <Yfk6vEuZFtgtA+G+@kroah.com>
 <37779659ca96ac9c1f11bcc0ac0665895c795b54.camel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <37779659ca96ac9c1f11bcc0ac0665895c795b54.camel@linux.ibm.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Cc: linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 mjg59@srcf.ucam.org, Lenny Szubowicz <lszubowi@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, gcwilson@linux.ibm.com,
 Ard Biesheuvel <ardb@kernel.org>, Daniele Buono <dbuono@linux.vnet.ibm.com>,
 Andi Kleen <ak@linux.intel.com>, Nayna Jain <nayna@linux.ibm.com>,
 James Morris <jmorris@namei.org>, Dov Murik <dovmurik@linux.ibm.com>,
 Jim Cadden <jcadden@ibm.com>, Peter Gonda <pgonda@google.com>,
 Borislav Petkov <bp@suse.de>, "Serge E. Hallyn" <serge@hallyn.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 dougmill@linux.vnet.ibm.com, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 linux-coco@lists.linux.dev, gjoyce@ibm.com, dja@axtens.net,
 Dave Hansen <dave.hansen@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Andrew Scull <ascull@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* James Bottomley (jejb@linux.ibm.com) wrote:
> [cc's added]
> On Tue, 2022-02-01 at 14:50 +0100, Greg KH wrote:
> > On Tue, Feb 01, 2022 at 12:44:08PM +0000, Dov Murik wrote:
> [...]
> > > # ls -la /sys/kernel/security/coco/efi_secret
> > > total 0
> > > drwxr-xr-x 2 root root 0 Jun 28 11:55 .
> > > drwxr-xr-x 3 root root 0 Jun 28 11:54 ..
> > > -r--r----- 1 root root 0 Jun 28 11:54 736870e5-84f0-4973-92ec-
> > > 06879ce3da0b
> > > -r--r----- 1 root root 0 Jun 28 11:54 83c83f7f-1356-4975-8b7e-
> > > d3a0b54312c6
> > > -r--r----- 1 root root 0 Jun 28 11:54 9553f55d-3da2-43ee-ab5d-
> > > ff17f78864d2
> > 
> > Please see my comments on the powerpc version of this type of thing:
> > 	
> > https://lore.kernel.org/r/20220122005637.28199-1-nayna@linux.ibm.com
> 
> If you want a debate, actually cc'ing the people on the other thread
> would have been a good start ...
> 
> For those added, this patch series is at:
> 
> https://lore.kernel.org/all/20220201124413.1093099-1-dovmurik@linux.ibm.com/
> 
> > You all need to work together to come up with a unified place for
> > this and stop making it platform-specific.
> 
> I'm not entirely sure of that.  If you look at the differences between
> EFI variables and the COCO proposal: the former has an update API
> which, in the case of signed variables, is rather complex and a UC16
> content requirement.  The latter is binary data with read only/delete. 
> Plus each variable in EFI is described by a GUID, so having a directory
> of random guids, some of which behave like COCO secrets and some of
> which are EFI variables is going to be incredibly confusing (and also
> break all our current listing tools which seems somewhat undesirable).
> 
> So we could end up with 
> 
> <common path prefix>/efivar
> <common path prefix>/coco
> 
> To achieve the separation, but I really don't see what this buys us. 
> Both filesystems would likely end up with different backends because of
> the semantic differences and we can easily start now in different
> places (effectively we've already done this for efi variables) and
> unify later if that is the chosen direction, so it doesn't look like a
> blocker.
> 
> > Until then, we can't take this.
> 
> I don't believe anyone was asking you to take it.

I have some sympathy in wanting some unification; (I'm not sure that
list of comparison even includes the TDX world).
But I'm not sure if they're the same thing - these are strictly
constants, they're not changable.

But it is a messy list of differences - especially things like the
UTF-16 stuff
I guess the PowerVM key naming contains nul and / can be ignored
- if anyone is silly enough to create keys with those names then they
can not access them; so at least that would solve that problem.

I don't really understand the talk of 32bit attributes in either the
uEFI or PowerVM key store case.

Is that GOOGLE_SMI stuff already there? If so I guess there's not much
we can do  - but it's a shame that there's the directory per variable.

Dave



> James
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

