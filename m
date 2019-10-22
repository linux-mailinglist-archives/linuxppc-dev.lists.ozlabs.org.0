Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C996DFDBA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 08:31:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y3ZC23VbzDqBY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 17:31:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=bharata.rao@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kt8RFytr"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y3X23RldzDqKX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 17:29:50 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id 53so1594704otv.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 23:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kVuB3ZdcTD312TKFiKblRZFbqKpk6CiWqdGLygNSyYI=;
 b=Kt8RFytrfhZZoo4M+/oorpPr26q0SJUIGT1ad0V21N9+zN85w4W6+ckVjDTUBlPKem
 9BhJnufmd+S0x/PDNMwU/9jbEGeoBr17AF33tjrcAtsFL8hTKXat7oNMQfpdjaeuF/qK
 A4GWmf0dFMu3BdkLwtFCxcUAxu6Tv/ODrnhUKicGjSnD9EFLEkTj4Cb7PMJBTtKtWfTI
 8ozI+2RNmv2PINYhQrptvvBBrdW6ZxH7hTl6g/CwKdI2C4Ax2BrDfW6DMvfMAR55uNL4
 +J+D5iQNyIyLzsNdds/TaAC6+D3RLo4GiU+GeQkjh+GLv58y/RfXQWDqmX5f4rwzjMJx
 m/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kVuB3ZdcTD312TKFiKblRZFbqKpk6CiWqdGLygNSyYI=;
 b=FiHg2tPQlD7NaImj1eqsNxAHodHpvdOlu0nTvtYAeU1E3yrWVJONszCXZanPbr/yj9
 nA6Glg2pugb/a542CDxQZjl+y1kTzeY32SQNhSCv/wqI+RMSb5Vpkt+j52kNoxg45wlU
 qZV8ziM41MX01kIZdJMzPgKwCV6AM1/QEoHGUo8oQpg6XYIdCofu9eOtUiQ74B9xwrfW
 KrGZ/WOsGu1JdBGtWvxPygifV2mCQfkj1Z0ibIqjqXZpg1ueF+A/MISL4U+7qe1KEx+l
 jaXLMqordJpn/dT+lwtlRZO1hgvILFylHADtG8NS1XBOLdZpiIJlKi8i5FIn3RvWy/vY
 sbpA==
X-Gm-Message-State: APjAAAXVUPjLw1B8xJi0x9FXxfziL662BpinXCnbQwYkDLaHN4dc6j7i
 EsunOlXVu+73NExLbfGXq/Im41NyJeQqB+8lecU=
X-Google-Smtp-Source: APXvYqzaxJrbzIMlPV3k+T7wY+FXiNPnEDMD07rPiY7Uh9rrYJMtaW2RPKKderc1uhnmHj42l57t1SwrmQcjoiLDf8M=
X-Received: by 2002:a9d:1a5:: with SMTP id e34mr1442226ote.286.1571725786985; 
 Mon, 21 Oct 2019 23:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190925050649.14926-1-bharata@linux.ibm.com>
 <20190925050649.14926-3-bharata@linux.ibm.com>
 <20191018030049.GA907@oak.ozlabs.ibm.com>
In-Reply-To: <20191018030049.GA907@oak.ozlabs.ibm.com>
From: Bharata B Rao <bharata.rao@gmail.com>
Date: Tue, 22 Oct 2019 11:59:35 +0530
Message-ID: <CAGZKiBqoxAvix3wrF2wuxTrikVCjY6PzD22pHsasew-F=P3KSg@mail.gmail.com>
Subject: Re: [PATCH v9 2/8] KVM: PPC: Move pages between normal and secure
 memory
To: Paul Mackerras <paulus@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org, jglisse@redhat.com,
 Aneesh Kumar <aneesh.kumar@linux.vnet.ibm.com>, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 18, 2019 at 8:31 AM Paul Mackerras <paulus@ozlabs.org> wrote:
>
> On Wed, Sep 25, 2019 at 10:36:43AM +0530, Bharata B Rao wrote:
> > Manage migration of pages betwen normal and secure memory of secure
> > guest by implementing H_SVM_PAGE_IN and H_SVM_PAGE_OUT hcalls.
> >
> > H_SVM_PAGE_IN: Move the content of a normal page to secure page
> > H_SVM_PAGE_OUT: Move the content of a secure page to normal page
> >
> > Private ZONE_DEVICE memory equal to the amount of secure memory
> > available in the platform for running secure guests is created.
> > Whenever a page belonging to the guest becomes secure, a page from
> > this private device memory is used to represent and track that secure
> > page on the HV side. The movement of pages between normal and secure
> > memory is done via migrate_vma_pages() using UV_PAGE_IN and
> > UV_PAGE_OUT ucalls.
>
> As we discussed privately, but mentioning it here so there is a
> record:  I am concerned about this structure
>
> > +struct kvmppc_uvmem_page_pvt {
> > +     unsigned long *rmap;
> > +     struct kvm *kvm;
> > +     unsigned long gpa;
> > +};
>
> which keeps a reference to the rmap.  The reference could become stale
> if the memslot is deleted or moved, and nothing in the patch series
> ensures that the stale references are cleaned up.

I will add code to release the device PFNs when memslot goes away. In
fact the early versions of the patchset had this, but it subsequently
got removed.

>
> If it is possible to do without the long-term rmap reference, and
> instead find the rmap via the memslots (with the srcu lock held) each
> time we need the rmap, that would be safer, I think, provided that we
> can sort out the lock ordering issues.

All paths except fault handler access rmap[] under srcu lock. Even in
case of fault handler, for those faults induced by us (shared page
handling, releasing device pfns), we do hold srcu lock. The difficult
case is when we fault due to HV accessing a device page. In this case
we come to fault hanler with mmap_sem already held and are not in a
position to take kvm srcu lock as that would lead to lock order
reversal. Given that we have pages mapped in still, I assume memslot
can't go away while we access rmap[], so think we should be ok here.

However if that sounds fragile, may be I can go back to my initial
design where we weren't using rmap[] to store device PFNs. That will
increase the memory usage but we give us an easy option to have
per-guest mutex to protect concurrent page-ins/outs/faults.

Regards,
Bharata.
-- 
http://raobharata.wordpress.com/
