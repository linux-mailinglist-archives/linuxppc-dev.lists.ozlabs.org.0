Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC00932E2C9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 08:07:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsJhQ5WcTz3dd1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 18:07:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Inac1/Pd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.12.15; helo=m12-15.163.com; envelope-from=angkery@163.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=Inac1/Pd; dkim-atps=neutral
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsJgr6Hckz30LT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 18:06:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=1CrzQ
 K1FiZQ6UWshLPUj3+3c3rlvZ+x61jdocF6Jma8=; b=Inac1/PdOL9Oi2sDMH0WD
 uOHyrLIK+aIUzdARMwf9vqeP7SOGpcj6EplN2U0F0JT65LhLE55uleZF+8CAywvh
 Iqi86yjKeIZfuD4M/Ry+gs7+lsR+S/M6mSGbHEV72O9Zq3CQGwHRi+ON63cHLcVc
 Fxa8dNZCQijfkmZuo3iibQ=
Received: from localhost (unknown [119.137.55.151])
 by smtp11 (Coremail) with SMTP id D8CowAC3vhKx10Fgj6uHDw--.63S2;
 Fri, 05 Mar 2021 15:03:22 +0800 (CST)
Date: Fri, 5 Mar 2021 15:03:25 +0800
From: angkery <angkery@163.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] ibmvnic: remove excessive irqsave
Message-ID: <20210305150325.0000286b.angkery@163.com>
In-Reply-To: <67215668-0850-a0f3-06e1-49db590b8fcc@csgroup.eu>
References: <20210305014350.1460-1-angkery@163.com>
 <67215668-0850-a0f3-06e1-49db590b8fcc@csgroup.eu>
Organization: yulong
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowAC3vhKx10Fgj6uHDw--.63S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJryfXrW5Jr1DGrWxuw45ZFb_yoW8trWkpF
 srWFy3C3Wvqr1jgwsrXw10yFsrC3yDtry8WrykC3Wfuas8Zr1Fqr1rKFy29FWDJ3yfKan0
 yF15Z3s3ZFn8C3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UzKZXUUUUU=
X-Originating-IP: [119.137.55.151]
X-CM-SenderInfo: 5dqjyvlu16il2tof0z/1tbiLQFMI1SIlLiOnAABsg
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
Cc: Junlin Yang <yangjunlin@yulong.com>, linux-kernel@vger.kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, ljp@linux.ibm.com, drt@linux.ibm.com,
 paulus@samba.org, sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 5 Mar 2021 06:49:14 +0100
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 05/03/2021 à 02:43, angkery a écrit :
> > From: Junlin Yang <yangjunlin@yulong.com>
> > 
> > ibmvnic_remove locks multiple spinlocks while disabling interrupts:
> > spin_lock_irqsave(&adapter->state_lock, flags);
> > spin_lock_irqsave(&adapter->rwi_lock, flags);
> > 
> > there is no need for the second irqsave,since interrupts are
> > disabled at that point, so remove the second irqsave:  
> 
> The problème is not that there is no need. The problem is a lot more
> serious: As reported by coccinella, the second _irqsave() overwrites
> the value saved in 'flags' by the first _irqsave, therefore when the
> second _irqrestore comes, the value in 'flags' is not valid, the
> value saved by the first _irqsave has been lost. This likely leads to
> IRQs remaining disabled, which is _THE_ problem really.
> 

Thank you for explaining the real problem.
I will update the commit information with your description.


> > spin_lock_irqsave(&adapter->state_lock, flags);
> > spin_lock(&adapter->rwi_lock);
> > 
> > Generated by: ./scripts/coccinelle/locks/flags.cocci
> > ./drivers/net/ethernet/ibm/ibmvnic.c:5413:1-18:
> > ERROR: nested lock+irqsave that reuses flags from line 5404.
> > 
> > Signed-off-by: Junlin Yang <yangjunlin@yulong.com>
> > ---
> >   drivers/net/ethernet/ibm/ibmvnic.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/ibm/ibmvnic.c
> > b/drivers/net/ethernet/ibm/ibmvnic.c index 2464c8a..a52668d 100644
> > --- a/drivers/net/ethernet/ibm/ibmvnic.c
> > +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> > @@ -5408,9 +5408,9 @@ static void ibmvnic_remove(struct vio_dev
> > *dev)
> >   	 * after setting state, so __ibmvnic_reset() which is
> > called
> >   	 * from the flush_work() below, can make progress.
> >   	 */
> > -	spin_lock_irqsave(&adapter->rwi_lock, flags);
> > +	spin_lock(&adapter->rwi_lock);
> >   	adapter->state = VNIC_REMOVING;
> > -	spin_unlock_irqrestore(&adapter->rwi_lock, flags);
> > +	spin_unlock(&adapter->rwi_lock);
> >   
> >   	spin_unlock_irqrestore(&adapter->state_lock, flags);
> >   
> >   


