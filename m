Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8843226113A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 14:22:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bm4635MywzDqSB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 22:22:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bm4335Td7zDqN9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 22:19:42 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 618B668AFE; Tue,  8 Sep 2020 14:19:37 +0200 (CEST)
Date: Tue, 8 Sep 2020 14:19:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/dma: Fix dma_map_ops::get_required_mask
Message-ID: <20200908121937.GA31559@lst.de>
References: <20200908015106.79661-1-aik@ozlabs.ru>
 <20200908054416.GA13585@lst.de>
 <94353228-2262-cfa1-7177-7eed2288ca63@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94353228-2262-cfa1-7177-7eed2288ca63@ozlabs.ru>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 08, 2020 at 10:06:56PM +1000, Alexey Kardashevskiy wrote:
> On 08/09/2020 15:44, Christoph Hellwig wrote:
>> On Tue, Sep 08, 2020 at 11:51:06AM +1000, Alexey Kardashevskiy wrote:
>>> What is dma_get_required_mask() for anyway? What "requires" what here?
>>
>> Yes, it is a really odd API.  It comes from classic old PCI where
>> 64-bit addressing required an additional bus cycle, and various devices
>> had different addressing schemes, with the smaller addresses beeing
>> more efficient.  So this allows the driver to request the "required"
>> addressing mode to address all memory.  "preferred" might be a better
>> name as we'll bounce buffer if it isn't met.  I also don't really see
>> why a driver would ever want to use it for a modern PCIe device.
>
>
> a-ha, this makes more sense, thanks. Then I guess we need to revert that 
> one bit from yours f1565c24b596, do not we?

Why?  The was the original intent of the API, but now we also use
internally to check the addressing capabilities.
