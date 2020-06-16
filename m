Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6421FC007
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 22:30:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mfwP4BPhzDqsN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 06:30:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hansenpartnership.com (client-ip=66.63.167.143;
 helo=bedivere.hansenpartnership.com;
 envelope-from=james.bottomley@hansenpartnership.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=HansenPartnership.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com
 header.a=rsa-sha256 header.s=20151216 header.b=W1sBeQ80; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=hansenpartnership.com header.i=@hansenpartnership.com
 header.a=rsa-sha256 header.s=20151216 header.b=MYUprjVW; 
 dkim-atps=neutral
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [66.63.167.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mftD5bttzDqdV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 06:28:52 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id C71AB8EE1E9;
 Tue, 16 Jun 2020 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1592321671;
 bh=ajob1nvDrla9Bt+f3LFtU00Hic0WFbZIYozt4cm3MGM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=W1sBeQ80o/S7QYGmkg7NPKLODl9DIayewfvNHRL0KXkV4cKwIIId31zNmJSXEAOn8
 PmIczVXVyJ+XHkmj/F4XEVAvG601VQw6E+e3d1SlKbqVhn8CvXKJZo57Nbz5w9m9k9
 Fk0B2hGn7EnmgCplAjGFyBu8ncCam1gBtEW7wy9I=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id e-XsTU0ZWdDv; Tue, 16 Jun 2020 08:34:30 -0700 (PDT)
Received: from jarvis (unknown [216.116.10.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 4FE348EE188;
 Tue, 16 Jun 2020 08:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1592321670;
 bh=ajob1nvDrla9Bt+f3LFtU00Hic0WFbZIYozt4cm3MGM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=MYUprjVWr66NFNYQM4jxBy/5blzUQem+8Me7nmbSL8D6xUxpHQ1bYjYJWGDOSQFMP
 0TrdM6NHXmZUCNnf60cYcNDgiCRbFbF2pklcj6OPtPybkwoQ7Zez969xlVSVJzMk5+
 XhrYEFkvrYKP8ysOE/5zvYdq13fP6HbGfoQDNx8k=
Message-ID: <1592321667.4394.5.camel@HansenPartnership.com>
Subject: Re: [PATCH] scsi: target/sbp: remove firewire SBP target driver
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>, Bart Van Assche
 <bvanassche@acm.org>, Finn Thain <fthain@telegraphics.com.au>, Chris Boot
 <bootc@boo.tc>
Date: Tue, 16 Jun 2020 08:34:27 -0700
In-Reply-To: <SN4PR0401MB35982D889857E3C03E96E49D9B9D0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <01020172acd3d10f-3964f076-a820-43fc-9494-3f3946e9b7b5-000000@eu-west-1.amazonses.com>
 <alpine.LNX.2.22.394.2006140934520.15@nippy.intranet>
 <7ad14946-5c25-fc49-1e48-72d37a607832@boo.tc>
 <alpine.LNX.2.22.394.2006150919110.8@nippy.intranet>
 <8da0c285-d707-a3d2-063e-472af5cc560f@boo.tc>
 <alpine.LNX.2.22.394.2006161929380.8@nippy.intranet>
 <8cbab988-fba7-8e27-7faf-9f7aa36ca235@acm.org>
 <SN4PR0401MB35982D889857E3C03E96E49D9B9D0@SN4PR0401MB3598.namprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Chuhong Yuan <hslester96@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Bellinger <nab@linux-iscsi.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-06-16 at 14:13 +0000, Johannes Thumshirn wrote:
> On 16/06/2020 16:09, Bart Van Assche wrote:
> > On 2020-06-16 02:42, Finn Thain wrote:
> > > Martin said, "I'd appreciate a patch to remove it"
> > > 
> > > And Bart said, "do you want to keep this driver in the kernel
> > > tree?"
> > > 
> > > AFAICT both comments are quite ambiguous. I don't see an
> > > actionable request, just an expression of interest from people
> > > doing their jobs.
> > > 
> > > Note well: there is no pay check associated with having a
> > > MAINTAINERS file 
> > > entry.
> > 
> > Hi Finn,
> > 
> > As far as I know the sbp driver only has had one user ever and that
> > user is no longer user the sbp driver. So why to keep it in the
> > kernel tree? Restoring a kernel driver can be easy - the first step
> > is a "git revert".
> 
> Why not move the driver to drivers/staging for 2 or 3 kernel releases
> and if noone steps up, delete it?

Because that's pretty much the worst of all worlds: If the driver is
simply going orphaned it can stay where it is to avoid confusion.  If
it's being removed, it's better to remove it from where it is because
that makes the patch to restore it easy to find.

Chris, the thing is this: if this driver has just one user on a stable
distro who complains about its removal six months to two years from
now, Linus will descend on us from a great height (which won't matter
to you, since you'll be long gone).  This makes everyone very wary of
outright removal.  If you're really, really sure it has no users, it
can be deleted, but if there's the slightest chance it has just one, it
should get orphaned.

James

