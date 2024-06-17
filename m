Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8958590B13A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 16:14:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NOdlDlbs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2sLv1Ydxz3fyh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 00:13:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NOdlDlbs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::bc; helo=out-188.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-188.mta1.migadu.com (unknown [IPv6:2001:41d0:203:375::bc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2sL83Lvdz30Ts
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 00:13:19 +1000 (AEST)
X-Envelope-To: npiggin@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1718633561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mGVZ/fpAR5i+VcfVDT6mwjpbS1ceLk+ZlfTHTPGpCUg=;
	b=NOdlDlbsCSppAuUtgRw7mfSfoS0QjgJr+7+3n6dgwVKcNFHzSfdutlZroMKD7e6/wnT7JO
	sBnotj2Cb9o42JTxBGqu+CnMupqsqfF+WLcfbtGoGO0/25zAysiaaEdWGw2mtbopmNd/Px
	gmmFGbEtkti4c4RpC/kU2Tuv251coQA=
X-Envelope-To: thuth@redhat.com
X-Envelope-To: lvivier@redhat.com
X-Envelope-To: linuxppc-dev@lists.ozlabs.org
X-Envelope-To: kvm@vger.kernel.org
Date: Mon, 17 Jun 2024 16:12:36 +0200
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v10 12/15] scripts/arch-run.bash: Fix
 run_panic() success exit status
Message-ID: <20240617-99b0652588f6bd62f04f34c2@orel>
References: <20240612052322.218726-1-npiggin@gmail.com>
 <20240612052322.218726-13-npiggin@gmail.com>
 <20240612-eef98a649a0764215ea0d91f@orel>
 <D1ZBXH42OY9O.3N6I0DBO4UF3J@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D1ZBXH42OY9O.3N6I0DBO4UF3J@gmail.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 14, 2024 at 10:56:02AM GMT, Nicholas Piggin wrote:
> On Wed Jun 12, 2024 at 5:26 PM AEST, Andrew Jones wrote:
> > On Wed, Jun 12, 2024 at 03:23:17PM GMT, Nicholas Piggin wrote:
> > > run_qemu_status() looks for "EXIT: STATUS=%d" if the harness command
> > > returned 1, to determine the final status of the test. In the case of
> > > panic tests, QEMU should terminate before successful exit status is
> > > known, so the run_panic() command must produce the "EXIT: STATUS" line.
> > > 
> > > With this change, running a panic test returns 0 on success (panic),
> > > and the run_test.sh unit test correctly displays it as PASS rather than
> > > FAIL.
> > > 
> > > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > > ---
> > >  scripts/arch-run.bash | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> > > index 8643bab3b..9bf2f0bbd 100644
> > > --- a/scripts/arch-run.bash
> > > +++ b/scripts/arch-run.bash
> > > @@ -378,6 +378,7 @@ run_panic ()
> > >  	else
> > >  		# some QEMU versions report multiple panic events
> > >  		echo "PASS: guest panicked"
> > > +		echo "EXIT: STATUS=1"
> > >  		ret=1
> > >  	fi
> > >  
> > > -- 
> > > 2.45.1
> > >
> >
> > Do we also need an 'echo "EXIT: STATUS=3"' in the if-arm of this if-else?
> 
> In that case we don't need it because run_panic() returns 3 in that
> case. run_qemu_status() only checks guest status if harness said
> QEMU ran successfully.

Ah, yes.

> 
> Arguably this is a bit hacky because "EXIT: STATUS" should really be
> a guest-printed status, and we would have a different success code
> for expected-QEMU-crash type of tests where guest can't provide status.
> I can do that incrementally after this if you like, but it's a bit
> more code.

Just this patch for now works for me.

Thanks,
drew
