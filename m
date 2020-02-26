Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3AE1702EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 16:44:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SKpp4pb7zDqkd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 02:44:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=Rw6O4cXA; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SKmq523yzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 02:42:15 +1100 (AEDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 00FA222F99;
 Wed, 26 Feb 2020 16:42:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1582731726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OybAC1ie3ULLOgfyed6GVmBGKTLvuJmNw8c9juOBYDc=;
 b=Rw6O4cXAi1oD1WapLdBFR3Pi64r6hDmgb5fE678jG7yk2FS49u3p/ME/MERVE4hgqqVKZ7
 Q4PyevRoNtLJJiP8SamwzQVw7nK1cOo20vWjkL/ixZqrIFSzKDDlPgtJz9+FSoT9ljxfZJ
 dPcneue9tDlgdJl43mgt/vnhStzQ6s0=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 26 Feb 2020 16:42:05 +0100
From: Michael Walle <michael@walle.cc>
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: Re: [PATCH v6 2/3] arm64: dts: ls1028a: Add PCIe controller DT nodes
In-Reply-To: <DB8PR04MB67474FF5451A647C4495526F84EC0@DB8PR04MB6747.eurprd04.prod.outlook.com>
References: <20190902034319.14026-2-xiaowei.bao@nxp.com>
 <20200224081105.13878-1-michael@walle.cc> <20200224084307.GD27688@dragon>
 <a3aeabddc82ca86e3dca9c26081a0077@walle.cc>
 <DB8PR04MB67474FF5451A647C4495526F84EC0@DB8PR04MB6747.eurprd04.prod.outlook.com>
Message-ID: <e4a8b5e17d9778080f836ad8523f70ff@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: +
X-Spam-Level: *
X-Rspamd-Server: web
X-Spam-Status: No, score=1.40
X-Spam-Score: 1.40
X-Rspamd-Queue-Id: 00FA222F99
X-Spamd-Result: default: False [1.40 / 15.00]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TAGGED_RCPT(0.00)[dt]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 NEURAL_HAM(-0.00)[-0.401]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com,
 Xiaowei Bao <xiaowei.bao@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Leo Li <leoyang.li@nxp.com>,
 "M.h. Lian" <minghuan.lian@nxp.com>, robh+dt@kernel.org,
 Mingkai Hu <mingkai.hu@nxp.com>, bhelgaas@google.com,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 2020-02-24 10:22, schrieb Z.q. Hou:
> Hi Michael and Shawn,
> 
> I'll update the patch with iommu-map property.

friendly ping :)

-michael

> 
> Thanks,
> Zhiqiang
> 
>> -----Original Message-----
>> From: Michael Walle <michael@walle.cc>
>> Sent: 2020年2月24日 16:54
>> To: Shawn Guo <shawnguo@kernel.org>
>> Cc: Xiaowei Bao <xiaowei.bao@nxp.com>; Z.q. Hou
>> <zhiqiang.hou@nxp.com>; bhelgaas@google.com;
>> devicetree@vger.kernel.org; Leo Li <leoyang.li@nxp.com>;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>> linux-pci@vger.kernel.org; linuxppc-dev@lists.ozlabs.org;
>> lorenzo.pieralisi@arm.com; mark.rutland@arm.com; M.h. Lian
>> <minghuan.lian@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>;
>> robh+dt@kernel.org; Roy Zang <roy.zang@nxp.com>
>> Subject: Re: [PATCH v6 2/3] arm64: dts: ls1028a: Add PCIe controller 
>> DT
>> nodes
>> 
>> Hi Shawn, all,
>> 
>> Am 2020-02-24 09:43, schrieb Shawn Guo:
>> > On Mon, Feb 24, 2020 at 09:11:05AM +0100, Michael Walle wrote:
>> >> Hi Xiaowei, Hi Shawn,
>> >>
>> >> > LS1028a implements 2 PCIe 3.0 controllers.
>> >>
>> >> Patch 1/3 and 3/3 are in Linus' tree but nobody seems to care about
>> >> this patch anymore :(
>> >>
>> >> This doesn't work well with the IOMMU, because the iommu-map property
>> >> is missing. The bootloader needs the &smmu phandle to fixup the
>> >> entry.
>> >> See
>> >> below.
>> >>
>> >> Shawn, will you add this patch to your tree once its fixed,
>> >> considering it just adds the device tree node for the LS1028A?
>> >
>> > The patch/thread is a bit aged.  You may want to send an updated patch
>> > for discussion.
>> 
>> So should I just pick up the patch add my two fixes and send it again?
>> What about
>> the Signed-off-by tags? Leave them? Replace them? Add mine?
>> 
>> -michael
