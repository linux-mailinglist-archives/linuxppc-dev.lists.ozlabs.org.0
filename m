Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B18D21228D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 13:49:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yGc32lSfzDqym
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 21:49:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yGZ75yy7zDqwF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 21:48:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=R9FJPS1K; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49yGZ74MgNz8td7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 21:48:15 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49yGZ73j41z9sR4; Thu,  2 Jul 2020 21:48:15 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=dyoung@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=R9FJPS1K; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49yGZ64wRdz9sPF
 for <linuxppc-dev@ozlabs.org>; Thu,  2 Jul 2020 21:48:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593690490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XjmPmaD/IooVKYdxRZ/9YWrdivHE5lwEHMPYLDdNJ+Y=;
 b=R9FJPS1KufovJZcypeVB5a9nV4gGoikjdfjmju/Nnb2gsMWcfXCuhYVwASDrLHQctbok9i
 5EMU1zciEzTzJjn6taZca4932ThzokZRNhtoTI0SL2im/8bqvEYl8ZbG12Uqj1FIJJLqg/
 /oLW4+HCmc61TNPx6+PKSMsT7jQVdgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-H_w9jTJWOV6KaVp1n8h7fg-1; Thu, 02 Jul 2020 07:48:08 -0400
X-MC-Unique: H_w9jTJWOV6KaVp1n8h7fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC89E107ACF2;
 Thu,  2 Jul 2020 11:48:06 +0000 (UTC)
Received: from dhcp-128-65.nay.redhat.com (ovpn-13-96.pek2.redhat.com
 [10.72.13.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5D0419D7F;
 Thu,  2 Jul 2020 11:48:01 +0000 (UTC)
Date: Thu, 2 Jul 2020 19:47:58 +0800
From: Dave Young <dyoung@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH 01/11] kexec_file: allow archs to handle special regions
 while locating memory hole
Message-ID: <20200702114758.GA21026@dhcp-128-65.nay.redhat.com>
References: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
 <159319828304.16351.6990340111766605842.stgit@hbathini.in.ibm.com>
 <20200629133933.0787f562@ezekiel.suse.cz>
 <7981ae61-26c6-000c-9ee4-382dab3eecab@linux.ibm.com>
 <20200701074659.GA3878@dhcp-128-65.nay.redhat.com>
 <0e145e84-a6cf-4da3-1a1a-331a7e1ac1fa@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e145e84-a6cf-4da3-1a1a-331a7e1ac1fa@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Pingfan Liu <piliu@redhat.com>, Petr Tesarik <ptesarik@suse.cz>,
 Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07/02/20 at 12:01am, Hari Bathini wrote:
> 
> 
> On 01/07/20 1:16 pm, Dave Young wrote:
> > On 06/29/20 at 05:26pm, Hari Bathini wrote:
> >> Hi Petr,
> >>
> >> On 29/06/20 5:09 pm, Petr Tesarik wrote:
> >>> Hi Hari,
> >>>
> >>> is there any good reason to add two more functions with a very similar
> >>> name to an existing function? AFAICS all you need is a way to call a
> >>> PPC64-specific function from within kexec_add_buffer (PATCH 4/11), so
> >>> you could add something like this:
> >>>
> >>> int __weak arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
> >>> {
> >>> 	return 0;
> >>> }
> >>>
> >>> Call this function from kexec_add_buffer where appropriate and then
> >>> override it for PPC64 (it roughly corresponds to your
> >>> kexec_locate_mem_hole_ppc64() from PATCH 4/11).
> >>>
> >>> FWIW it would make it easier for me to follow the resulting code.
> >>
> >> Right, Petr.
> >>
> >> I was trying out a few things before I ended up with what I sent here.
> >> Bu yeah.. I did realize arch_kexec_locate_mem_hole() would have been better
> >> after sending out v1. Will take care of that in v2.
> > 
> > Another way is use arch private function to locate mem hole, then set
> > kbuf->mem, and then call kexec_add_buf, it will skip the common locate
> > hole function.
> 
> Dave, I did think about it. But there are a couple of places this can get
> tricky. One is ima_add_kexec_buffer() and the other is kexec_elf_load().
> These call sites could be updated to set kbuf->mem before kexec_add_buffer().
> But the current approach seemed like the better option for it creates a
> single point of control in setting up segment buffers and also, makes adding
> any new segments simpler, arch-specific segments or otherwise.
> 

Ok, thanks for the explanation.

