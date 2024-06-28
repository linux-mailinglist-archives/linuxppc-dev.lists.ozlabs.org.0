Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 573AA91C3E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 18:40:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=kKuqxZ2F;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=kKuqxZ2F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9h4K5XF4z3cXF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2024 02:40:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=kKuqxZ2F;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=kKuqxZ2F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hansenpartnership.com (client-ip=2607:fcd0:100:8a00::2; helo=bedivere.hansenpartnership.com; envelope-from=james.bottomley@hansenpartnership.com; receiver=lists.ozlabs.org)
Received: from bedivere.hansenpartnership.com (unknown [IPv6:2607:fcd0:100:8a00::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9h3c0BSYz30WJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2024 02:39:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1719592751;
	bh=ThX3VkL4XqWltRAEAJcGz6lQ6bV8PCB4b3rThe7Ub8w=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=kKuqxZ2FfOivHhDKfZ2gxeX2q4n3qtKW39/16cd8rcoGQsFyHuVsnaEd1SbW0pBK/
	 a1BCnaGsetnT8G30ly+oTBaaY6RMsOse5J55tv3ZkbK1Vpt/eX30UWLXgUYiILV9EX
	 OZbMPQOmX94Qz9MlEuSe+lBRRB9g+Y3J8kFzh7qc=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 89CD41280F5E;
	Fri, 28 Jun 2024 12:39:11 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id YjhWdUbX6P9N; Fri, 28 Jun 2024 12:39:11 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1719592751;
	bh=ThX3VkL4XqWltRAEAJcGz6lQ6bV8PCB4b3rThe7Ub8w=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=kKuqxZ2FfOivHhDKfZ2gxeX2q4n3qtKW39/16cd8rcoGQsFyHuVsnaEd1SbW0pBK/
	 a1BCnaGsetnT8G30ly+oTBaaY6RMsOse5J55tv3ZkbK1Vpt/eX30UWLXgUYiILV9EX
	 OZbMPQOmX94Qz9MlEuSe+lBRRB9g+Y3J8kFzh7qc=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 4EF451280728;
	Fri, 28 Jun 2024 12:39:10 -0400 (EDT)
Message-ID: <4108938158d888cc6ec371bb151e7ac35d3b4cb0.camel@HansenPartnership.com>
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Michael Ellerman <mpe@ellerman.id.au>, regressions@lists.linux.dev
Date: Fri, 28 Jun 2024 12:39:08 -0400
In-Reply-To: <87pls1lwe0.fsf@mail.lhotse>
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
	 <87pls1lwe0.fsf@mail.lhotse>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, jarkko@kernel.org, naveen.n.rao@linux.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2024-06-28 at 10:54 +1000, Michael Ellerman wrote:
> Stefan Berger <stefanb@linux.ibm.com> writes:
> > Fix the following type of error message caused by a missing call to
> > tpm2_sessions_init() in the IBM vTPM driver:
> > 
> > [    2.987131] tpm tpm0: tpm2_load_context: failed with a TPM error
> > 0x01C4
> > [    2.987140] ima: Error Communicating to TPM chip, result: -14
> > 
> > Fixes: d2add27cf2b8 ("tpm: Add NULL primary creation")
> > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > ---
> >  drivers/char/tpm/tpm_ibmvtpm.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/char/tpm/tpm_ibmvtpm.c
> > b/drivers/char/tpm/tpm_ibmvtpm.c
> > index d3989b257f42..1e5b107d1f3b 100644
> > --- a/drivers/char/tpm/tpm_ibmvtpm.c
> > +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> > @@ -698,6 +698,10 @@ static int tpm_ibmvtpm_probe(struct vio_dev
> > *vio_dev,
> >                 rc = tpm2_get_cc_attrs_tbl(chip);
> >                 if (rc)
> >                         goto init_irq_cleanup;
> > +
> > +               rc = tpm2_sessions_init(chip);
> > +               if (rc)
> > +                       goto init_irq_cleanup;
> >         }
> >  
> >         return tpm_chip_register(chip);
> 
> #regzbot ^introduced: d2add27cf2b8 

Could you please test out the patch I proposed for this:

https://lore.kernel.org/linux-integrity/1302b413a2d7bf3b275133e7fdb04b44bfe2d5e3.camel@HansenPartnership.com/

Because it's not just tmp_ibmvtpm that doesn't call autostart.  From
inspection xen-tpmfront, tmp_nsc, tpm_infineon and tpm_atmel also
don't, so it would be better to fix this for everyone rather than just
for you and have to do a separate fix for each of them.

James

