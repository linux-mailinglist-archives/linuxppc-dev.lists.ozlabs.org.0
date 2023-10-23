Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9247D336B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 13:30:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDXzf09b6z3cZn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 22:30:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDVtW26mTz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Oct 2023 20:55:29 +1100 (AEDT)
X-UUID: 641349a9b8234a0bafd20e544043455d-20231023
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:0f1cefd1-43b8-469e-80dc-403f59fb093e,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-4
X-CID-INFO: VERSION:1.1.32,REQID:0f1cefd1-43b8-469e-80dc-403f59fb093e,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-4
X-CID-META: VersionHash:5f78ec9,CLOUDID:76b48594-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:2310231755074GDH39NP,BulkQuantity:0,Recheck:0,SF:64|66|24|17|19|45|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 641349a9b8234a0bafd20e544043455d-20231023
X-User: chentao@kylinos.cn
Received: from [172.21.13.26] [(116.128.244.171)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1671895899; Mon, 23 Oct 2023 17:55:05 +0800
Message-ID: <678a679a-eebf-46e4-b189-cecc7ced2a72@kylinos.cn>
Date: Mon, 23 Oct 2023 17:55:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH] treewide: Spelling fix in comment
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20231020093156.538856-1-chentao@kylinos.cn>
 <CAMuHMdUo8tEBQa6soZm=MUWLy2AnkL6Vszt7vzbs-peb20=myQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdUo8tEBQa6soZm=MUWLy2AnkL6Vszt7vzbs-peb20=myQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Oct 2023 22:29:43 +1100
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
Cc: jeff@garzik.org, mokuno@sm.sony.co.jp, kunwu.chan@hotmail.com, dcbw@redhat.com, linville@tuxdriver.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, edumazet@google.com, netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Geert,
Thank you very much for your advice, I am a rookie, I am not familiar 
with many aspects, and I need to learn more.  I'll modify the patch.

On 2023/10/20 19:07, Geert Uytterhoeven wrote:
> Hi Kunwu,
> 
> Thanks for your patch!
> 
> This is not a treewide change. Hence the oneline-summary should be
> something prefixed by "[net-next] ps3_gelic"
> 
> On Fri, Oct 20, 2023 at 11:32 AM Kunwu Chan <chentao@kylinos.cn> wrote:
>> reques -> request
>>
>> Fixes: 09dde54c6a69 ("PS3: gelic: Add wireless support for PS3")
> 
> No need for a Fixes tag for a spelling fix in a comment.
> 
>> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>> --- a/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c
>> +++ b/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c
>> @@ -1217,7 +1217,7 @@ static int gelic_wl_set_encodeext(struct net_device *netdev,
>>                  key_index = wl->current_key;
>>
>>          if (!enc->length && (ext->ext_flags & IW_ENCODE_EXT_SET_TX_KEY)) {
>> -               /* reques to change default key index */
>> +               /* request to change default key index */
>>                  pr_debug("%s: request to change default key to %d\n",
>>                           __func__, key_index);
>>                  wl->current_key = key_index;
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
