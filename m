Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E553D48F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 19:50:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ncwv05rnzDqvP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 03:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nefkom.net
 (client-ip=2001:a60:0:28:0:1:25:1; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NctN1j3XzDqtl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 03:48:28 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45Nct32KfCz1rXhY;
 Tue, 11 Jun 2019 19:48:10 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45Nct20nSjz1rxRG;
 Tue, 11 Jun 2019 19:48:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 2BFHBsK6aqSo; Tue, 11 Jun 2019 19:48:09 +0200 (CEST)
X-Auth-Info: HG913dC6nI3QeXdDWZOlZYfrTig6dgohUmdEi80BbIbGuJfv0F142LduSvY+GpMv
Received: from igel.home (ppp-46-244-178-52.dynamic.mnet-online.de
 [46.244.178.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 11 Jun 2019 19:48:09 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id C6AC72C0D1D; Tue, 11 Jun 2019 19:48:06 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <20190607172902.GA8183@lst.de>
 <30000803-3772-3edf-f4a9-55122d504f3f@lwfinger.net>
 <20190610081825.GA16534@lst.de>
 <153c13f5-a829-1eab-a3c5-fecfb84127ff@lwfinger.net>
X-Yow: Hello...  IRON CURTAIN?  Send over a SAUSAGE PIZZA!
 World War III?  No thanks!
Date: Tue, 11 Jun 2019 19:48:06 +0200
In-Reply-To: <153c13f5-a829-1eab-a3c5-fecfb84127ff@lwfinger.net> (Larry
 Finger's message of "Mon, 10 Jun 2019 11:09:47 -0500")
Message-ID: <87ftogau95.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Jun 10 2019, Larry Finger <Larry.Finger@lwfinger.net> wrote:

> I do not understand why the if statement returns true as neither of the
> values is zero.

That's because the format string does not make any sense.  You are
printing garbage.

> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index f7afdad..ba2489d 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -317,9 +317,12 @@ int dma_supported(struct device *dev, u64 mask)
>
>  int dma_set_mask(struct device *dev, u64 mask)
>  {
> +       pr_info("mask 0x%llx, dma_mask 0x%llx, dma_supported 0x%llx\n",
> mask, dev->dma_mask,
> +               dma_supported(dev, mask));

None of the format directives match the type of the arguments.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
