Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C8990BBB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 22:06:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=UqRpU7in;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=aj3xVHnM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W319K53bYz3gDr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 06:06:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=UqRpU7in;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=aj3xVHnM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hansenpartnership.com (client-ip=2607:fcd0:100:8a00::2; helo=bedivere.hansenpartnership.com; envelope-from=james.bottomley@hansenpartnership.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1373 seconds by postgrey-1.37 at boromir; Tue, 18 Jun 2024 06:05:36 AEST
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [IPv6:2607:fcd0:100:8a00::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W318c6tGRz3gC7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 06:05:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718654736;
	bh=nwFq+sPhvFKh+jCEwBDyH0vZaK9puv1f3y/cW68qSo8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=UqRpU7inD90FGwbcg1MZsp2/6N5JJtnmm8fMmrXJSvZldG2tKHJzXHBUylpdIUM/i
	 cYvlHZusBJb0eyv5n8DjPjPHMcOZGccCZN4oUkLuHZJfBF1Sh3gez0V4Zsb4tHc1iT
	 m46POmxnYxnW0d0S7BjT+5fEWBUY+sZ0F3XDIvhk=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 2E74C128730B;
	Mon, 17 Jun 2024 16:05:36 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id IdLBw6pe5wtl; Mon, 17 Jun 2024 16:05:36 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718654735;
	bh=nwFq+sPhvFKh+jCEwBDyH0vZaK9puv1f3y/cW68qSo8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=aj3xVHnMuQNGzVaL8QYNnvq3VYfGdMq1CUHd4NmXRrzEGzvsC5MFlEdpVAaLtZYiC
	 KCiG6TYq5rTV7QRflQVljULMdy1TghZ9vrihhIxFHAiuQRGQ6saxj5WFdeHk3Z4Y0T
	 Kb45SyJBHXpTmgZmH8+PJq9QmNUg5MoT/QrZ+6Qk=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 4FAB412872CF;
	Mon, 17 Jun 2024 16:05:35 -0400 (EDT)
Message-ID: <1302b413a2d7bf3b275133e7fdb04b44bfe2d5e3.camel@HansenPartnership.com>
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Stefan Berger <stefanb@linux.ibm.com>, linux-integrity@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, jarkko@kernel.org
Date: Mon, 17 Jun 2024 16:05:33 -0400
In-Reply-To: <5bd68636-ece6-4ba5-a4c0-c0535afc33c8@linux.ibm.com>
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
	 <dfc4feaef0d63d616bab8cdec5d409369f9dacf1.camel@HansenPartnership.com>
	 <5bd68636-ece6-4ba5-a4c0-c0535afc33c8@linux.ibm.com>
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
Cc: naveen.n.rao@linux.ibm.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2024-06-17 at 15:56 -0400, Stefan Berger wrote:
> 
> 
> On 6/17/24 15:42, James Bottomley wrote:
> > On Mon, 2024-06-17 at 15:34 -0400, Stefan Berger wrote:
> > > Fix the following type of error message caused by a missing call
> > > to
> > > tpm2_sessions_init() in the IBM vTPM driver:
> > > 
> > > [    2.987131] tpm tpm0: tpm2_load_context: failed with a TPM
> > > error
> > > 0x01C4
> > > [    2.987140] ima: Error Communicating to TPM chip, result: -14
> > > 
> > > Fixes: d2add27cf2b8 ("tpm: Add NULL primary creation")
> > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > ---
> > >   drivers/char/tpm/tpm_ibmvtpm.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/char/tpm/tpm_ibmvtpm.c
> > > b/drivers/char/tpm/tpm_ibmvtpm.c
> > > index d3989b257f42..1e5b107d1f3b 100644
> > > --- a/drivers/char/tpm/tpm_ibmvtpm.c
> > > +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> > > @@ -698,6 +698,10 @@ static int tpm_ibmvtpm_probe(struct vio_dev
> > > *vio_dev,
> > >                  rc = tpm2_get_cc_attrs_tbl(chip);
> > >                  if (rc)
> > >                          goto init_irq_cleanup;
> > > +
> > > +               rc = tpm2_sessions_init(chip);
> > > +               if (rc)
> > > +                       goto init_irq_cleanup;
> > 
> > This looks wrong: the whole thing is designed to occur in the
> > bootstrap
> > phase from tpm_chip_register() (which tpm_ibmvtpm.c definitely
> > calls),
> > so why isn't it happening?
> 
> Because flags = TPM_OPS_AUTO_STARTUP has not been set for this
> driver.
> 

In that case, wouldn't the fix be to move tpm_sessions_init() to
somewhere in tpm_chip_register() that would then be called by this
driver?  Having to special case it for every driver that doesn't set
this flag is going to be a huge pain.

I think the only reason it's down that far is that it should only be
called for TPM2 code so it was avoiding doing the check twice, so
something like this?

James

---

diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index 5da134f12c9a..4280cbb0f0b1 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -347,6 +347,12 @@ int tpm_auto_startup(struct tpm_chip *chip)
 {
 	int rc;
 
+	if (chip->flags & TPM_CHIP_FLAG_TPM2) {
+		rc = tpm2_sessions_init(chip);
+		if (rc)
+			return rc;
+	}
+
 	if (!(chip->ops->flags & TPM_OPS_AUTO_STARTUP))
 		return 0;
 
diff --git a/drivers/char/tpm/tpm2-cmd.c b/drivers/char/tpm/tpm2-cmd.c
index 1e856259219e..b4f85c8cdbb6 100644
--- a/drivers/char/tpm/tpm2-cmd.c
+++ b/drivers/char/tpm/tpm2-cmd.c
@@ -773,11 +773,6 @@ int tpm2_auto_startup(struct tpm_chip *chip)
 		rc = 0;
 	}
 
-	if (rc)
-		goto out;
-
-	rc = tpm2_sessions_init(chip);
-
 out:
 	/*
 	 * Infineon TPM in field upgrade mode will return no data for the number

