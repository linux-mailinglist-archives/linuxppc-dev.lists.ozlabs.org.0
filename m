Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D3F93869F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 01:08:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=sZYt+xRX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WRzcR5bHDz3cY0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 09:08:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=sZYt+xRX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 1058 seconds by postgrey-1.37 at boromir; Mon, 22 Jul 2024 09:08:18 AEST
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WRzbk1kjwz3bZ3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2024 09:08:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=Z6+tcN90xgP1nrdUqmcA2EVQqwgriS18uB284QzrNV8=; b=sZYt+xRXyyak1MyM
	64csFKH7xecno+beGEc3djBlikJSVwnhgbgvf+1f0Ta76xnsjo8cTH3QbN0n3yNNZ9PH+qsB1vT+p
	zoXd5duXuwev5q18Dr8EElP6ISUxu18cV0jc1PdQIxgte5dLFA0TBi//kDkHyJFRXgUjwBm7hoISb
	HJBYpDqeFY8jtPSRGKIKEJMGyE14QFvdJObCfoRIoSGCsbsoxD90HrnmYoey3QdaQ6a0b0ENuYB7+
	M3logoeTMaXttN+dxlZdVUSY7lfQJMv15FoUL2ol8DXA3f78rEmE4HUaKwwI9Tu1u0tMYTY1Sclcq
	sm0HmC6wFAR1okcupQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1sVfNt-00CdQr-04;
	Sun, 21 Jul 2024 22:50:29 +0000
Date: Sun, 21 Jul 2024 22:50:28 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH] soc/fsl/qbman: remove unused struct 'cgr_comp'
Message-ID: <Zp2QtPET9649y9pA@gallifrey>
References: <20240528231123.136664-1-linux@treblig.org>
 <336239e6-4369-44ea-a60c-d300cf6e6f81@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <336239e6-4369-44ea-a60c-d300cf6e6f81@linux.dev>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 22:49:30 up 74 days, 10:03,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Cc: linuxppc-dev@lists.ozlabs.org, camelia.groza@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Sean Anderson (sean.anderson@linux.dev) wrote:
> On 5/28/24 19:11, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > 'cgr_comp' has been unused since
> > commit 96f413f47677 ("soc/fsl/qbman: fix issue in
> > qman_delete_cgr_safe()").
> > 
> > Remove it.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  drivers/soc/fsl/qbman/qman.c | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> > index 7e9074519ad2..4dc8aba33d9b 100644
> > --- a/drivers/soc/fsl/qbman/qman.c
> > +++ b/drivers/soc/fsl/qbman/qman.c
> > @@ -2546,11 +2546,6 @@ int qman_delete_cgr(struct qman_cgr *cgr)
> >  }
> >  EXPORT_SYMBOL(qman_delete_cgr);
> >  
> > -struct cgr_comp {
> > -	struct qman_cgr *cgr;
> > -	struct completion completion;
> > -};
> > -
> >  static void qman_delete_cgr_smp_call(void *p)
> >  {
> >  	qman_delete_cgr((struct qman_cgr *)p);
> 
> Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

Hi Sean,
  Do you know who will pick this one up?
  I got a notification a while ago from a patchwork at
  linuxppc-dev marked 'Handled elsewhere' - but I'm not
sure where.

Thanks,

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
