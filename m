Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A379D2C6E84
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 03:37:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjbJH0vtnzDsS0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 13:37:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=linyunsheng@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjbGd1TC9zDsPb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 13:36:15 +1100 (AEDT)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CjbFs0wC4zhcHy;
 Sat, 28 Nov 2020 10:35:45 +0800 (CST)
Received: from [10.74.191.121] (10.74.191.121) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Sat, 28 Nov 2020 10:36:00 +0800
Subject: Re: [PATCH] powerpc: fix the allyesconfig build
To: Jakub Kicinski <kuba@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20201128122819.32187696@canb.auug.org.au>
 <20201127175642.45502b20@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <382701ba-c50e-18cf-83be-60eeab228372@huawei.com>
Date: Sat, 28 Nov 2020 10:36:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20201127175642.45502b20@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 linux-renesas-soc@vger.kernel.org, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Joel Stanley <joel@jms.id.au>, netdev@vger.kernel.org,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020/11/28 9:56, Jakub Kicinski wrote:
> On Sat, 28 Nov 2020 12:28:19 +1100 Stephen Rothwell wrote:
>> There are 2 drivers that have arrays of packed structures that contain
>> pointers that end up at unaligned offsets.  These produce warnings in
>> the PowerPC allyesconfig build like this:
>>
>> WARNING: 148 bad relocations
>> c00000000e56510b R_PPC64_UADDR64   .rodata+0x0000000001c72378
>> c00000000e565126 R_PPC64_UADDR64   .rodata+0x0000000001c723c0
>>
>> They are not drivers that are used on PowerPC (I assume), so mark them
>> to not be built on PPC64 when CONFIG_RELOCATABLE is enabled.
> 
> 😳😳
> 
> What's the offending structure in hisilicon? I'd rather have a look
> packing structs with pointers in 'em sounds questionable.
> 
> I only see these two:
> 
> $ git grep packed drivers/net/ethernet/hisilicon/
> drivers/net/ethernet/hisilicon/hns/hnae.h:struct __packed hnae_desc {
> drivers/net/ethernet/hisilicon/hns3/hns3_enet.h:struct __packed hns3_desc {

I assmue "struct __packed hnae_desc" is the offending structure, because
flag_ipoffset field is defined as __le32 and is not 32 bit aligned.

struct __packed hnae_desc {
	__le64 addr;							//0
	union {
		struct {						//64
			union {
				__le16 asid_bufnum_pid;
				__le16 asid;
			};
			__le16 send_size;				//92
			union {
				__le32 flag_ipoffset;			//*108*
				struct {
					__u8 bn_pid;
					__u8 ra_ri_cs_fe_vld;
					__u8 ip_offset;
					__u8 tse_vlan_snap_v6_sctp_nth;
				};
			};
			__le16 mss;
			__u8 l4_len;
			__u8 reserved1;
			__le16 paylen;
			__u8 vmid;
			__u8 qid;
			__le32 reserved2[2];
		} tx;

		struct {
			__le32 ipoff_bnum_pid_flag;
			__le16 pkt_len;
			__le16 size;
			union {
				__le32 vlan_pri_asid;
				struct {
					__le16 asid;
					__le16 vlan_cfi_pri;
				};
			};
			__le32 rss_hash;
			__le32 reserved_1[2];
		} rx;
	};
};

> .
> 
