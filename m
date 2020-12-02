Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4A12CBC6F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 13:08:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmHmt41m8zDr0l
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 23:08:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=hare@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmHg62kwhzDqnv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 23:03:22 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF2A5AB63;
 Wed,  2 Dec 2020 12:03:18 +0000 (UTC)
Subject: Re: [PATCH 00/13] ibmvfc: initial MQ development
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201126014824.123831-1-tyreld@linux.ibm.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <90e9a8ac-d2b9-bb64-7c7d-607adaea0f26@suse.de>
Date: Wed, 2 Dec 2020 13:03:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126014824.123831-1-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/26/20 2:48 AM, Tyrel Datwyler wrote:
> Recent updates in pHyp Firmware and VIOS releases provide new infrastructure
> towards enabling Subordinate Command Response Queues (Sub-CRQs) such that each
> Sub-CRQ is a channel backed by an actual hardware queue in the FC stack on the
> partner VIOS. Sub-CRQs are registered with the firmware via hypercalls and then
> negotiated with the VIOS via new Management Datagrams (MADs) for channel setup.
> 
> This initial implementation adds the necessary Sub-CRQ framework and implements
> the new MADs for negotiating and assigning a set of Sub-CRQs to associated VIOS
> HW backed channels. The event pool and locking still leverages the legacy single
> queue implementation, and as such lock contention is problematic when increasing
> the number of queues. However, this initial work demonstrates a 1.2x factor
> increase in IOPs when configured with two HW queues despite lock contention.
> 
Why do you still hold the hold lock during submission?
An initial check on the submission code path didn't reveal anything 
obvious, so it _should_ be possible to drop the host lock there.
Or at least move it into the submission function itself to avoid lock 
contention. Hmm?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer
