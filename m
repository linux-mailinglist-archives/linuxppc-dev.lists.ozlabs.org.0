Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A37792B9A7C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 19:20:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcSdY5bWCzDqpG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 05:20:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=PU5FcaLo; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=PU5FcaLo; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcSbd3SxDzDqkq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 05:18:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605809897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REJOcYJm1HuEasvL8M7Bb1y/jfMw6RKMEKdfka8jXq0=;
 b=PU5FcaLoxj3ZWDBZQZJm+GB0CE8w1729+p/ho5FM4Ko+/HRVBMhPy66e0FQBtMGLg2StTa
 9dcJoDcH2Z1C8IkYz/w0uSSwWHALWghTL+MLB2pfgSSomiScd42rUWjaHszbuAl7c8NImk
 Cgm5tCr6a4H/NBPcxZzuI9FbzL2Zn/E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605809897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REJOcYJm1HuEasvL8M7Bb1y/jfMw6RKMEKdfka8jXq0=;
 b=PU5FcaLoxj3ZWDBZQZJm+GB0CE8w1729+p/ho5FM4Ko+/HRVBMhPy66e0FQBtMGLg2StTa
 9dcJoDcH2Z1C8IkYz/w0uSSwWHALWghTL+MLB2pfgSSomiScd42rUWjaHszbuAl7c8NImk
 Cgm5tCr6a4H/NBPcxZzuI9FbzL2Zn/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-EeAH8zqlMkSHrFVA4tBZ-w-1; Thu, 19 Nov 2020 13:18:15 -0500
X-MC-Unique: EeAH8zqlMkSHrFVA4tBZ-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63A6610B9CBD;
 Thu, 19 Nov 2020 18:18:13 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.164])
 by smtp.corp.redhat.com (Postfix) with SMTP id 6765D60C0F;
 Thu, 19 Nov 2020 18:18:05 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Thu, 19 Nov 2020 19:18:13 +0100 (CET)
Date: Thu, 19 Nov 2020 19:18:04 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 1/2] powerpc/ptrace: simplify gpr_get/tm_cgpr_get
Message-ID: <20201119181804.GA5138@redhat.com>
References: <20201119160154.GA5183@redhat.com>
 <20201119160221.GA5188@redhat.com>
 <94c56c46-e336-f61c-3623-1b2014fcbb2e@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94c56c46-e336-f61c-3623-1b2014fcbb2e@csgroup.eu>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Jan Kratochvil <jan.kratochvil@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/19, Christophe Leroy wrote:
>
>
> Le 19/11/2020 à 17:02, Oleg Nesterov a écrit :
> >gpr_get() does membuf_write() twice to override pt_regs->msr in between.
>
> Is there anything wrong with that ?

Nothing wrong, but imo the code and 2/2 looks simpler after this patch.
I tried to explain this in the changelog.

> >  int tm_cgpr_get(struct task_struct *target, const struct user_regset *regset,
> >  		struct membuf to)
> >  {
> >+	struct membuf to_msr = membuf_at(&to, offsetof(struct pt_regs, msr));
> >+
> >  	if (!cpu_has_feature(CPU_FTR_TM))
> >  		return -ENODEV;
> >@@ -97,17 +99,12 @@ int tm_cgpr_get(struct task_struct *target, const struct user_regset *regset,
> >  	flush_altivec_to_thread(target);
> >  	membuf_write(&to, &target->thread.ckpt_regs,
> >-			offsetof(struct pt_regs, msr));
> >-	membuf_store(&to, get_user_ckpt_msr(target));
> >+				sizeof(struct user_pt_regs));
>
> This looks mis-aligned. But it should fit on a single line, now we allow up to 100 chars on a line.

OK, I can change this.

> >-	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
> >-		     offsetof(struct pt_regs, msr) + sizeof(long));
> >+	membuf_store(&to_msr, get_user_ckpt_msr(target));
> >-	membuf_write(&to, &target->thread.ckpt_regs.orig_gpr3,
> >-			sizeof(struct user_pt_regs) -
> >-			offsetof(struct pt_regs, orig_gpr3));
> >  	return membuf_zero(&to, ELF_NGREG * sizeof(unsigned long) -
> >-			sizeof(struct user_pt_regs));
> >+				sizeof(struct user_pt_regs));
>
> I can't see any change here except the alignment. Can you leave it as is ?

I just tried to make tm_cgpr_get() and gpr_get() look similar.

Sure, I can leave it as is.

Better yet, could you please fix this problem somehow so that I could forget
about the bug assigned to me?

I know nothing about powerpc, and personally I do not care about this (minor)
bug, I agree with any changes.

> >-	membuf_write(&to, target->thread.regs, offsetof(struct pt_regs, msr));
> >-	membuf_store(&to, get_user_msr(target));
> >+	membuf_write(&to, target->thread.regs,
> >+				sizeof(struct user_pt_regs));
>
> This should fit on a single line.
>
> >  	return membuf_zero(&to, ELF_NGREG * sizeof(unsigned long) -
> >-				 sizeof(struct user_pt_regs));
> >+				sizeof(struct user_pt_regs));
>
> This should not change, it's not part of the changes for this patch.

See above, I can leave it as is.

> >--- a/include/linux/regset.h
> >+++ b/include/linux/regset.h
> >@@ -46,6 +46,18 @@ static inline int membuf_write(struct membuf *s, const void *v, size_t size)
> >  	return s->left;
> >  }
> >+static inline struct membuf membuf_at(const struct membuf *s, size_t offs)
> >+{
> >+	struct membuf n = *s;
>
> Is there any point in using a struct membuf * instaed of a struct membuf as parameter ?

This matches other membuf_ helpers.

Oleg.

