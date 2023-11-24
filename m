Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CB37F6E9F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 09:42:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc7ky3V3Gz3vcx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 19:42:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=ke.zhao@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc7jq3y2bz3dTr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 19:41:03 +1100 (AEDT)
X-QQ-mid: bizesmtp75t1700815181tn312kbv
Received: from [127.0.0.1] ( [125.94.202.196])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Nov 2023 16:39:39 +0800 (CST)
X-QQ-SSF: 01400000000000B0B000000A0000000
X-QQ-FEAT: 7YFKcddXagjsJLt4wZABMUUDAYXCRnXo8g21GUIbQbqARChcnMawpeCfxN5Fh
	FAL082/zTRzsvaYPmnb+ltvg7D100sX+qcklM2YJd+L8vMbcjpY9OqL2eOqhW1p8Cvdc6+S
	n3X0wLAhgXvnScdmZmMjoMswETTFn/mVftkuT6WEGmZxAeP176I2oNHLa56qSaBNY2zkPnV
	LG/ekKJr+W8uKDUe2TsrZtHezH3aWd6GKL0a1CrjhNx7iIrqc9e/TJPwUWvJ+S/sGB+QBnN
	+VOvetNSVcAibP8cry0np7W6aAPaNzNIzGK3LUZ0PIax9d30jQgBbSUxYORpDCQMzSpElHf
	oBn4V0aQ3rzyd4jviheIVNYpbQbGapXJhrdHfQNsxs4A+bcu9hddYlMiC3/u3vCkz4UNtbs
	2bdxPaOa/uyDJUbaeEZ7rw==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 14761653264302342047
Message-ID: <F19DC40ACB796694+78dfb71e-a2db-473d-a9fc-fa35c5e61a27@shingroup.cn>
Date: Fri, 24 Nov 2023 16:39:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] powerpc: Add PVN support for HeXin C2000 processor
To: Michael Ellerman <mpe@ellerman.id.au>, gregkh@linuxfoundation.org
References: <20231123093611.98313-1-ke.zhao@shingroup.cn>
 <2023112317-ebook-dreamless-0cfe@gregkh> <871qcgspf8.fsf@mail.lhotse>
Content-Language: en-US
From: =?UTF-8?B?WmhhbyBLZSDotbUg5Y+v?= <ke.zhao@shingroup.cn>
In-Reply-To: <871qcgspf8.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
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
Cc: luming.yu@shingroup.cn, ajd@linux.ibm.com, arnd@arndb.de, dawei.li@shingroup.cn, linux-kernel@vger.kernel.org, shenghui.qu@shingroup.cn, npiggin@gmail.com, kvm@vger.kernel.org, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael and Greg,

On 2023/11/23 19:02, Michael Ellerman wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
>> On Thu, Nov 23, 2023 at 05:36:11PM +0800, Zhao Ke wrote:
>>> HeXin Tech Co. has applied for a new PVN from the OpenPower Community
>>> for its new processor C2000. The OpenPower has assigned a new PVN
>>> and this newly assigned PVN is 0x0066, add pvr register related
>>> support for this PVN.
>>>
>>> Signed-off-by: Zhao Ke <ke.zhao@shingroup.cn>
>>> Link: https://discuss.openpower.foundation/t/how-to-get-a-new-pvr-for-processors-follow-power-isa/477/10
>>> ---
>>> 	v0 -> v1:
>>> 	- Fix .cpu_name with the correct description
>>> ---
>>> ---
>>>   arch/powerpc/include/asm/reg.h            |  1 +
>>>   arch/powerpc/kernel/cpu_specs_book3s_64.h | 15 +++++++++++++++
>>>   arch/powerpc/kvm/book3s_pr.c              |  1 +
>>>   arch/powerpc/mm/book3s64/pkeys.c          |  3 ++-
>>>   arch/powerpc/platforms/powernv/subcore.c  |  3 ++-
>>>   drivers/misc/cxl/cxl.h                    |  3 ++-
>>>   6 files changed, 23 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
>>> index 4ae4ab9090a2..7fd09f25452d 100644
>>> --- a/arch/powerpc/include/asm/reg.h
>>> +++ b/arch/powerpc/include/asm/reg.h
>>> @@ -1361,6 +1361,7 @@
>>>   #define PVR_POWER8E	0x004B
>>>   #define PVR_POWER8NVL	0x004C
>>>   #define PVR_POWER8	0x004D
>>> +#define PVR_HX_C2000	0x0066
>>>   #define PVR_POWER9	0x004E
>>>   #define PVR_POWER10	0x0080
>>>   #define PVR_BE		0x0070
>> Why is this not in sorted order?
> It's semantically sorted :D
> ie. HX_C2000 is most similar to POWER8, but is newer than it.
Yes. This is what I mean. If you prefer to sort in another order, please 
tell me and I will update this.
>
> PVR_BE is out of place, I'll fix that.
>
> cheers
>

