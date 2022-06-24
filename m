Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FFA559D72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 17:38:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV1Vx4FDsz3cjQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 01:38:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gonehiking.org (client-ip=64.68.200.34; helo=mailout.easymail.ca; envelope-from=khalid@gonehiking.org; receiver=<UNKNOWN>)
Received: from mailout.easymail.ca (mailout.easymail.ca [64.68.200.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV1VV3K56z3c00
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 01:38:25 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mailout.easymail.ca (Postfix) with ESMTP id 36ABB61F0C;
	Fri, 24 Jun 2022 15:38:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at emo09-pco.easydns.vpn
Received: from mailout.easymail.ca ([127.0.0.1])
	by localhost (emo09-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E8sVpuImiYNQ; Fri, 24 Jun 2022 15:38:22 +0000 (UTC)
Received: from mail.gonehiking.org (unknown [38.15.45.1])
	by mailout.easymail.ca (Postfix) with ESMTPA id E956B61EFC;
	Fri, 24 Jun 2022 15:38:21 +0000 (UTC)
Received: from [192.168.1.4] (internal [192.168.1.4])
	by mail.gonehiking.org (Postfix) with ESMTP id 146083EE4C;
	Fri, 24 Jun 2022 09:38:21 -0600 (MDT)
Message-ID: <c955bf95-838f-cc0a-8496-322b831e5648@gonehiking.org>
Date: Fri, 24 Jun 2022 09:38:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/3] scsi: BusLogic remove bus_to_virt
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-3-arnd@kernel.org>
 <7a6df2da-95e8-b2fd-7565-e4b7a51c5b63@gonehiking.org>
 <CAK8P3a0t_0scofn_2N1Q8wgJ4panKCN58AgnsJSVEj28K614oQ@mail.gmail.com>
From: Khalid Aziz <khalid@gonehiking.org>
In-Reply-To: <CAK8P3a0t_0scofn_2N1Q8wgJ4panKCN58AgnsJSVEj28K614oQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: khalid@gonehiking.org
Cc: linux-arch <linux-arch@vger.kernel.org>, Miquel van Smoorenburg <mikevs@xs4all.net>, linux-scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Matt Wang <wwentao@vmware.com>, Parisc List <linux-parisc@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/23/22 08:47, Arnd Bergmann wrote:
> 
> 
> Can you test it again with this patch on top?
> 
> diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
> index d057abfcdd5c..9e67f2ee25ee 100644
> --- a/drivers/scsi/BusLogic.c
> +++ b/drivers/scsi/BusLogic.c
> @@ -2554,8 +2554,14 @@ static void blogic_scan_inbox(struct
> blogic_adapter *adapter)
>          enum blogic_cmplt_code comp_code;
> 
>          while ((comp_code = next_inbox->comp_code) != BLOGIC_INBOX_FREE) {
> -               struct blogic_ccb *ccb = blogic_inbox_to_ccb(adapter,
> adapter->next_inbox);
> -               if (comp_code != BLOGIC_CMD_NOTFOUND) {
> +               struct blogic_ccb *ccb = blogic_inbox_to_ccb(adapter,
> next_inbox);
> +               if (!ccb) {
> +                       /*
> +                        * This should never happen, unless the CCB list is
> +                        * corrupted in memory.
> +                        */
> +                       blogic_warn("Could not find CCB for dma
> address 0x%x\n", adapter, next_inbox->ccb);
> +               } else if (comp_code != BLOGIC_CMD_NOTFOUND) {
>                          if (ccb->status == BLOGIC_CCB_ACTIVE ||
>                                          ccb->status == BLOGIC_CCB_RESET) {

Hi Arnd,

Driver works with this change. next_inbox is the correct pointer to pass.

Thanks,
Khalid
