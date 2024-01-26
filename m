Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABFE83D5A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 10:12:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLsR754zGz3dRW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 20:12:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLsQc50jQz3d9g
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 20:12:07 +1100 (AEDT)
X-UUID: 460be78cba3e40d0890baf0c874365d0-20240126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:2c2a72b2-8f7f-4010-ad7a-03412aec4111,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.35,REQID:2c2a72b2-8f7f-4010-ad7a-03412aec4111,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:677bc97f-4f93-4875-95e7-8c66ea833d57,B
	ulkID:2401261428140T0ET36M,BulkQuantity:5,Recheck:0,SF:17|19|44|64|66|38|2
	4|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 460be78cba3e40d0890baf0c874365d0-20240126
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1222685538; Fri, 26 Jan 2024 17:11:50 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id C449FE000EB9;
	Fri, 26 Jan 2024 17:11:49 +0800 (CST)
X-ns-mid: postfix-65B37755-723417383
Received: from [172.20.15.234] (unknown [172.20.15.234])
	by mail.kylinos.cn (NSMail) with ESMTPA id 897DCE000EB9;
	Fri, 26 Jan 2024 17:11:40 +0800 (CST)
Message-ID: <fafa4a25-d940-443a-a5d0-9ceff3fb1648@kylinos.cn>
Date: Fri, 26 Jan 2024 17:11:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc/cell: Code cleanup for spufs_mfc_flush
To: Arnd Bergmann <arnd@arndb.de>, Jeremy Kerr <jk@ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, aneesh.kumar@kernel.org,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
References: <20240126021258.574916-1-chentao@kylinos.cn>
 <fbae8c8e-6788-4749-b7e0-b64c9fffe85a@app.fastmail.com>
Content-Language: en-US
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <fbae8c8e-6788-4749-b7e0-b64c9fffe85a@app.fastmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024/1/26 14:27, Arnd Bergmann wrote:
> On Fri, Jan 26, 2024, at 03:12, Kunwu Chan wrote:
>> This part was commented from commit a33a7d7309d7
>> ("[PATCH] spufs: implement mfc access for PPE-side DMA")
>> in about 18 years before.
>>
>> If there are no plans to enable this part code in the future,
>> we can remove this dead code.
>>
>> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
>> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Nobody is actively working on this code, so it clearly won't
> be needed in the future.
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> On the other hand there is probably little use in removing
> the dead code either. It looks you sent a lot of these
> patches with identical changelog texts to remove blocks
> of dead code, which does not seem productive to me as
> these were clearly all left in the code to document
> something.
Yes, I was doing some cleanup of useless code the other day.
The previous patches were submitted to remove some code that had been 
unused for a long time and was ineffective.
I didn't remove the comments in the header file and the 
debugging-related parts. Because these parts may be used later.

Thank you very much for the reminder.I'll pay attention to whether it 
has a document feature later.
> 
>        Arnd
-- 
Thanks,
   Kunwu

