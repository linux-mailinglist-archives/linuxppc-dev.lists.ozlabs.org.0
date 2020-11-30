Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 397252C7C31
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 02:00:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ckn3K3bZCzDr1K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 12:00:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com;
 envelope-from=linyunsheng@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckn1C2TG5zDqyX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 11:58:53 +1100 (AEDT)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Ckn0f6CFTzhkT4;
 Mon, 30 Nov 2020 08:58:26 +0800 (CST)
Received: from [10.74.191.121] (10.74.191.121) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Mon, 30 Nov 2020 08:58:38 +0800
Subject: Re: [PATCH] powerpc: fix the allyesconfig build
To: Jakub Kicinski <kuba@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20201128122819.32187696@canb.auug.org.au>
 <20201127175642.45502b20@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
 <20201128162054.575aea29@canb.auug.org.au>
 <20201128113654.4f2dcabe@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <cfdea690-9866-7eda-904c-c097ea89a0ed@huawei.com>
Date: Mon, 30 Nov 2020 08:58:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20201128113654.4f2dcabe@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
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
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Huazhong Tan <tanhuazhong@huawei.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Joel Stanley <joel@jms.id.au>,
 netdev@vger.kernel.org, PowerPC <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020/11/29 3:36, Jakub Kicinski wrote:
> On Sat, 28 Nov 2020 16:20:54 +1100 Stephen Rothwell wrote:
>> On Fri, 27 Nov 2020 17:56:42 -0800 Jakub Kicinski <kuba@kernel.org> wrote:
>>>
>>> What's the offending structure in hisilicon? I'd rather have a look
>>> packing structs with pointers in 'em sounds questionable.
>>>
>>> I only see these two:
>>>
>>> $ git grep packed drivers/net/ethernet/hisilicon/
>>> drivers/net/ethernet/hisilicon/hns/hnae.h:struct __packed hnae_desc {
>>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.h:struct __packed hns3_desc {  
>>
>> struct hclge_dbg_reg_type_info which is 28 bytes long due to the
>> included struct struct hclge_dbg_reg_common_msg (which is 12 bytes
>> long).  They are surrounded by #pragma pack(1)/pack().
>>
>> This forces the 2 pointers in each second array element of
>> hclge_dbg_reg_info[] to be 4 byte aligned (where pointers are 8 bytes
>> long on PPC64).
> 
> Ah! Thanks, I don't see a reason for these to be packed. 
> Looks  like an accident, there is no reason to pack anything 
> past struct hclge_dbg_reg_common_msg AFAICT.
> 
> Huawei folks, would you mind sending a fix if the analysis is correct?

Yes, will send a patch to fix that. Thanks for the analysis.

> .
> 
