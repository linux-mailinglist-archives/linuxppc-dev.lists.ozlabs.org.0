Return-Path: <linuxppc-dev+bounces-12516-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0BDB924AD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 18:47:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVptT2v6Sz2yrQ;
	Tue, 23 Sep 2025 02:47:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758559633;
	cv=none; b=erMLhXdnS9emBaI4ET/bYPeA99ZWXlKtVk2oW41FvLFl9bhtQ3IZOxqjDrjWUD16G/ntE/Kp/cizimXSHCJR2oFdOjgWdEFeYY2FFSkfhmoRcdAtPD2ZHEAc7d3RzqpJG0l2tphe/EHZS+HOlbu0PEpNYa/rvNBTUC7qdlKAHsLv+F/1n9nIEDJUGAJ/kirReXbR8xOVIlrwhFZnvoYhQ2ZbydSuwhsqDO9Gbqf8AaTmOdWrk3TF9cm3H6m8NR3r2YEhdgcs4f1ikippacZNk5kO6xqkA6E7Ay6mjO4fcKDEmaQk/85SYqnaUdamxtre5OblSkFM9DggPEKBiufZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758559633; c=relaxed/relaxed;
	bh=fRdA7nsQf+ROdRRV/X8F80rPVzMRc7WYaZxeLJaoIjA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QsZpkcmbN4uAnuwgVkpvh4GwCpNTgcPEIMBAAjRq+ZlKqRDxwkJu95lBO55b+E6bgzOFlr1XNxS9z5ma2y8tPe4o6HgJhqzG11nPQUDPgXguEKz8rXTuf9LgSB9XcdJ1zT7TaFwYC7QpHjmINUAgzlJVZV/Scdm/xIG03QdLgwMHzzF0Tv3sVeXomRr3G487QgXKkae7/clN63eXEE/4WH7flRWzn6X818w9l4q386QOw+e+nUIwPfSXcyCjk0/HOQNqAnLPOEqIJdR1uwLibHY7fb8e4wa1E8u/XPkqxsrk3e0BSmuMn1bQHDNssz6GYRTPk4D9fFZffIsryxZuHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CRnQgE0m; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CRnQgE0m; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CRnQgE0m;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CRnQgE0m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVptQ1LBnz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 02:47:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758559625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fRdA7nsQf+ROdRRV/X8F80rPVzMRc7WYaZxeLJaoIjA=;
	b=CRnQgE0mfUmlA62y1D2mdbEGP+B7JczMzn91jb7oVg48dDj1+q4PaJFS/Sg6uIvptyn99R
	3Q/F+QZXATm+FCQzYMLRNDVSYr6UyU80DwqNUe6FcxqYRkgttEt8G3APn0seMRsEKOVfSP
	JjuWLXPkrOnQCIiap+/jJ1+lWj1PBFg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758559625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fRdA7nsQf+ROdRRV/X8F80rPVzMRc7WYaZxeLJaoIjA=;
	b=CRnQgE0mfUmlA62y1D2mdbEGP+B7JczMzn91jb7oVg48dDj1+q4PaJFS/Sg6uIvptyn99R
	3Q/F+QZXATm+FCQzYMLRNDVSYr6UyU80DwqNUe6FcxqYRkgttEt8G3APn0seMRsEKOVfSP
	JjuWLXPkrOnQCIiap+/jJ1+lWj1PBFg=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-RoIrtCGNNx2Lx3ooFkKfog-1; Mon, 22 Sep 2025 12:47:03 -0400
X-MC-Unique: RoIrtCGNNx2Lx3ooFkKfog-1
X-Mimecast-MFC-AGG-ID: RoIrtCGNNx2Lx3ooFkKfog_1758559622
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-8935214d60bso106419739f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 09:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758559622; x=1759164422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRdA7nsQf+ROdRRV/X8F80rPVzMRc7WYaZxeLJaoIjA=;
        b=qVJ+8NCc9qslDn/5Zk45dJj1Csg9fHqjkZlkB/aaYEN5al4ctrfvdjz+IOKpbT3Bkx
         Gu5eWgIyO5l1bLdXdvGU4JDEhCNOzEN/M68hKkzQyMtjs8T87ijAdcjKHjtcv2sMxgQJ
         iX+Gq9qkcp7WphUzy2X3tOeH104UcdZmoF6FdOKeI8XYEJ9DBIrsQAepg17mY63GJ4PQ
         zygHBO026D6IBKAoLSdvaSzYNKMHXaa0qTurJbWjf09svOz4/5fTJQe9OcYmzv3APOik
         +a7OXszlsAyi1iagwgTULa57EIBLjXTs1XlGf9T0uTtJq2fc0BWDI0Hk0UW5I12mMhG1
         K2Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUFnzUAdIbzJS7AVp1E3nLR9EUmb46FLXP8MKAPAokrew3hq4HkKB8AR/O94XpL+OfrC6GIdzUxItT1zgA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyOl3b2n7wHvTJeQXoYcdWzDl6lZoJ9ABTS9qFnNM7IEMy0Q8Nb
	WOpuXN8+9a9kCZfFHgNuqTuYL9x3Hz1vzR+vaL+TcD89BLf58J7xKsLN9Bd1AuE107Jzw+KUiw/
	ouGqNtYlB6o7mpZLZ90YSe2xzyk7tG3havsmQmbCKJQBgjPyPl2pbELwCiAOCu0+yW7Q=
X-Gm-Gg: ASbGnct5/myqTEpF9r1b8PTTrr5B+5U3yp/dZJLP9dvoLiPp5R91d7Pd/A4WK0Qc4ZU
	jtne35/NS5dv1T35jkJB3S6s/4ak8x4dKIMiUv7I0Ph68Al8BGMlJb1m0dvc8ei9/KIyytsvNoD
	49SOxZ2igiswHuZ3DZI5IC/YU5prnnrvd1uiehm2L8mSxGRtHEcifr/F+HiX+UvsiHy0CxD3cM7
	3OKWvWX9LYM1jJCyB433mhrTDCfThxZ/T7U1o1skC/KT1+AG5aCqPvjtvWj9RouxxfW9qi9E+LA
	+3iP4rR6SpCwWnMes/Ck4BdoxSD9qv8JG4+4Oj8ukTQ=
X-Received: by 2002:a05:6602:1492:b0:886:b1ad:5926 with SMTP id ca18e2360f4ac-8ade85dce23mr773714139f.4.1758559622319;
        Mon, 22 Sep 2025 09:47:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkFiz0OlFYWl2yJOU/iZB/JsOzK1cROcUGrsewO7Eh+2ZzvoGxAdaxPxrlYTqdudrZ2m5WLA==
X-Received: by 2002:a05:6602:1492:b0:886:b1ad:5926 with SMTP id ca18e2360f4ac-8ade85dce23mr773711839f.4.1758559621755;
        Mon, 22 Sep 2025 09:47:01 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a483230f4dsm467144739f.25.2025.09.22.09.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:47:01 -0700 (PDT)
Date: Mon, 22 Sep 2025 10:46:58 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: kvm <kvm@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI
 devices
Message-ID: <20250922104658.7c2b775e.alex.williamson@redhat.com>
In-Reply-To: <456215532.1742889.1758558863369.JavaMail.zimbra@raptorengineeringinc.com>
References: <663798478.1707537.1757450926706.JavaMail.zimbra@raptorengineeringinc.com>
	<20250919125603.08f600ac.alex.williamson@redhat.com>
	<1916735949.1739694.1758315074669.JavaMail.zimbra@raptorengineeringinc.com>
	<20250919162721.7a38d3e2.alex.williamson@redhat.com>
	<537354829.1740670.1758396303861.JavaMail.zimbra@raptorengineeringinc.com>
	<20250922100143.1397e28b.alex.williamson@redhat.com>
	<456215532.1742889.1758558863369.JavaMail.zimbra@raptorengineeringinc.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lM8k2cA7YPPKT0LHppprTMAM01QR9vJUxC_bqToomGQ_1758559622
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 22 Sep 2025 11:34:23 -0500 (CDT)
Timothy Pearson <tpearson@raptorengineering.com> wrote:

> ----- Original Message -----
> > From: "Alex Williamson" <alex.williamson@redhat.com>
> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
> > Cc: "kvm" <kvm@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> > Sent: Monday, September 22, 2025 11:01:43 AM
> > Subject: Re: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI devices  
> 
> > On Sat, 20 Sep 2025 14:25:03 -0500 (CDT)
> > Timothy Pearson <tpearson@raptorengineering.com> wrote:  
> >> Personally, I'd argue that such old devices were intended to work
> >> with much slower host systems, therefore the slowdown probably
> >> doesn't matter vs. being more correct in terms of interrupt handling.
> >>  In terms of general kernel design, my understanding has always been
> >> is that best practice is to always mask, disable, or clear a level
> >> interrupt before exiting the associated IRQ handler, and the current
> >> design seems to violate that rule.  In that context, I'd personally
> >> want to see an argument as to why echewing this traditional IRQ
> >> handler design is beneficial enough to justify making the VFIO driver
> >> dependent on platform-specific behavior.  
> > 
> > Yep, I kind of agree.  The unlazy flag seems to provide the more
> > intended behavior.  It moves the irq chip masking into the fast path,
> > whereas it would have been asynchronous on a subsequent interrupt
> > previously, but the impact is only to ancient devices operating in INTx
> > mode, so as long as we can verify those still work on both ppc and x86,
> > I don't think it's worth complicating the code to make setting the
> > unlazy flag conditional on anything other than the device support.
> > 
> > Care to send out a new version documenting the actual sequence fixed by
> > this change and updating the code based on this thread?  Note that we
> > can test non-pci2.3 mode for any device/driver that supports INTx using
> > the nointxmask=1 option for vfio-pci and booting a linux guest with
> > pci=nomsi.  Thanks,
> > 
> > Alex  
> 
> Sure, I can update the commit message easily enough, but I must have
> missed something in regard to a needed code update.  The existing
> patch only sets unlazy for non-PCI 2.3 INTX devices, and as I
> understand it that's the behavior we have both agreed on at this
> point?

I had commented[1] that testing the interrupt type immediately after
setting the interrupt type is redundant.  Also, looking again, if we
set the flag before request_irq, it seems logical that we'd clear the
flag after free_irq.  I think there are also some unaccounted error
paths where we can set the flag without clearing it that need to be
considered.

> I've tested this on ppc64el and it works quite well, repairing the
> broken behavior where the guest would receive exactly one interrupt
> on the legacy PCI device per boot.  I don't have amd64 systems
> available to test on, however.

Noted, I'll incorporate some targeted testing here.  Thanks,

Alex

[1]https://lore.kernel.org/all/20250919125603.08f600ac.alex.williamson@redhat.com/


