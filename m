Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BACC2F55C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 02:30:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGRZH5x2JzDrnR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 12:29:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=ming.lei@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Ix30eIUO; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=dtccLygh; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGRXC46fczDqmq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 12:28:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610587675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HUOvlaCkrm/U0Zg0GZ+mc9xEDctf6SlBoM2x9QYlFlc=;
 b=Ix30eIUO2VtDE/RBLO6mtKbG4bnZK2y8oAJQHp+trpvdif8EdKtxzMNiiQ14yTsij7ft/K
 2mr8djAVHAzhL3z1tG67LVIPnvNN2MHS5eANB9PNXH5d2uiTEywKopG7s6pHEgXQOPuTcR
 uK9MtbcNe1GE2SyA8V/2nf57qqj82JY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610587676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HUOvlaCkrm/U0Zg0GZ+mc9xEDctf6SlBoM2x9QYlFlc=;
 b=dtccLyghkQ6fgdUaEEgGDnJ8FNRxaDEcwp+cVoTx733f9Y/xe4PVrokHxSHuW2ZrEh/Dpn
 4+BYtDcrvEK3M5CJgIel88Y089C0y7Y5iqckKwZYUJlQ6tiyrhE79if8oWPRAYLBxLLEo6
 rPKzz6F/+kfu+b3Lymj/vNSBoAQa4Aw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-QnMTOfp_N76wQ8VrFfkD4w-1; Wed, 13 Jan 2021 20:27:53 -0500
X-MC-Unique: QnMTOfp_N76wQ8VrFfkD4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CDE8C28A;
 Thu, 14 Jan 2021 01:27:51 +0000 (UTC)
Received: from T590 (ovpn-13-18.pek2.redhat.com [10.72.13.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3134100AE3B;
 Thu, 14 Jan 2021 01:27:42 +0000 (UTC)
Date: Thu, 14 Jan 2021 09:27:38 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Brian King <brking@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 01/21] ibmvfc: add vhost fields and defaults for MQ
 enablement
Message-ID: <20210114012738.GA237540@T590>
References: <20210111231225.105347-1-tyreld@linux.ibm.com>
 <20210111231225.105347-2-tyreld@linux.ibm.com>
 <0525bee7-433f-dcc7-9e35-e8706d6edee5@linux.vnet.ibm.com>
 <a8623705-6d49-2056-09bb-80190e0b6f52@linux.ibm.com>
 <51bfc34b-c2c4-bf14-c903-d37015f65361@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51bfc34b-c2c4-bf14-c903-d37015f65361@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 james.smart@broadcom.com, james.bottomley@hansenpartnership.com,
 brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 13, 2021 at 11:13:07AM -0600, Brian King wrote:
> On 1/12/21 6:33 PM, Tyrel Datwyler wrote:
> > On 1/12/21 2:54 PM, Brian King wrote:
> >> On 1/11/21 5:12 PM, Tyrel Datwyler wrote:
> >>> Introduce several new vhost fields for managing MQ state of the adapter
> >>> as well as initial defaults for MQ enablement.
> >>>
> >>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> >>> ---
> >>>  drivers/scsi/ibmvscsi/ibmvfc.c | 8 ++++++++
> >>>  drivers/scsi/ibmvscsi/ibmvfc.h | 9 +++++++++
> >>>  2 files changed, 17 insertions(+)
> >>>
> >>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> >>> index ba95438a8912..9200fe49c57e 100644
> >>> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> >>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> >>> @@ -3302,6 +3302,7 @@ static struct scsi_host_template driver_template = {
> >>>  	.max_sectors = IBMVFC_MAX_SECTORS,
> >>>  	.shost_attrs = ibmvfc_attrs,
> >>>  	.track_queue_depth = 1,
> >>> +	.host_tagset = 1,
> >>
> >> This doesn't seem right. You are setting host_tagset, which means you want a
> >> shared, host wide, tag set for commands. It also means that the total
> >> queue depth for the host is can_queue. However, it looks like you are allocating
> >> max_requests events for each sub crq, which means you are over allocating memory.
> > 
> > With the shared tagset yes the queue depth for the host is can_queue, but this
> > also implies that the max queue depth for each hw queue is also can_queue. So,
> > in the worst case that all commands are queued down the same hw queue we need an
> > event pool with can_queue commands.
> > 
> >>
> >> Looking at this closer, we might have bigger problems. There is a host wide
> >> max number of commands that the VFC host supports, which gets returned on
> >> NPIV Login. This value can change across a live migration event.
> > 
> > From what I understand the max commands can only become less.
> > 
> >>
> >> The ibmvfc driver, which does the same thing the lpfc driver does, modifies
> >> can_queue on the scsi_host *after* the tag set has been allocated. This looks
> >> to be a concern with ibmvfc, not sure about lpfc, as it doesn't look like
> >> we look at can_queue once the tag set is setup, and I'm not seeing a good way
> >> to dynamically change the host queue depth once the tag set is setup. 
> >>
> >> Unless I'm missing something, our best options appear to either be to implement
> >> our own host wide busy reference counting, which doesn't sound very good, or
> >> we need to add some API to block / scsi that allows us to dynamically change
> >> can_queue.
> > 
> > Changing can_queue won't do use any good with the shared tagset becasue each
> > queue still needs to be able to queue can_queue number of commands in the worst
> > case.
> 
> The issue I'm trying to highlight here is the following scenario:
> 
> 1. We set shost->can_queue, then call scsi_add_host, which allocates the tag set.
> 
> 2. On our NPIV login response from the VIOS, we might get a lower value than we
> initially set in shost->can_queue, so we update it, but nobody ever looks at it
> again, and we don't have any protection against sending too many commands to the host.
> 
> 
> Basically, we no longer have any code that ensures we don't send more
> commands to the VIOS than we are told it supports. According to the architecture,
> if we actually do this, the VIOS will do an h_free_crq, which would be a bit
> of a bug on our part.
> 
> I don't think it was ever clearly defined in the API that a driver can
> change shost->can_queue after calling scsi_add_host, but up until
> commit 6eb045e092efefafc6687409a6fa6d1dabf0fb69, this worked and now
> it doesn't. 

Actually it isn't related with commit 6eb045e092ef, because blk_mq_alloc_tag_set()
uses .can_queue to create driver tag sbitmap and request pool.

So even thought without 6eb045e092ef, the updated .can_queue can't work
as expected because the max driver tag depth has been fixed by blk-mq already.

What 6eb045e092ef does is just to remove the double check on max
host-wide allowed commands because that has been respected by blk-mq
driver tag allocation already.

> 
> I started looking through drivers that do this, and so far, it looks like the
> following drivers do: ibmvfc, lpfc, aix94xx, libfc, BusLogic, and likely others...
> 
> We probably need an API that lets us change shost->can_queue dynamically.

I'd suggest to confirm changing .can_queue is one real usecase.


Thanks,
Ming

